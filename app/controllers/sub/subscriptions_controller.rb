module Sub
  class SubscriptionsController < ApplicationController
    include AuthenticationHelper
    before_action :set_subscription, only: [:show, :update, :destroy, :cancel, :renew, :events]
    before_action :authenticate_request, only: [:show, :update, :destroy, :cancel, :renew, :events]

    def index
      @subscriptions = Subscription.all
      render json: @subscriptions
    end

    def show
      render json: @subscription
    end

    def create
      @subscription = Subscription.new(subscription_params)
      @subscription.payment_status = 'inactive'
      @subscription.expiration_date = Date.today

      if @subscription.save
        create_subscription_event('Subscription Created', 'New subscription created')
        render json: @subscription, status: :created
      else
        render json: @subscription.errors, status: :unprocessable_entity
      end
    end

    def cancel
      @subscription.update(payment_status: 'cancelled')
      create_subscription_event('Subscription Canceled', 'Subscription canceled')
      render json: { message: 'Subscription cancelled successfully' }
    end

    def renew
      months_to_renew = params[:months_to_renew].to_i.positive? ? params[:months_to_renew].to_i : 1
    
      if @subscription.payment_status == 'active'
        new_expiration_date = @subscription.expiration_date + months_to_renew.months
        @subscription.update(expiration_date: new_expiration_date)
        create_subscription_event('Subscription Renewed', "Subscription renewed for #{months_to_renew} months. New expiration date: #{new_expiration_date}")
        render json: { message: "Subscription renewed successfully for #{months_to_renew} months. New expiration date: #{new_expiration_date}" }
      else
        if @subscription.payment_status == 'expired' || @subscription.payment_status == 'inactive'
          new_expiration_date = Date.today + months_to_renew.months
          @subscription.update(payment_status: 'active', expiration_date: new_expiration_date)
          create_subscription_event('Subscription Renewed', "Subscription renewed for #{months_to_renew} months. New expiration date: #{new_expiration_date}")
          render json: { message: "Subscription renewed successfully for #{months_to_renew} months. New expiration date: #{new_expiration_date}" }
        else
          @subscription.update(payment_status: 'expired', expiration_date: Date.today)
          create_subscription_event('Subscription Expired', 'Subscription expired due to non-payment')
          render json: { message: 'Subscription expired due to non-payment' }
        end
      end
    end
    
    
    def update
      if @subscription.update(subscription_params)
        render json: @subscription
      else
        render json: @subscription.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @subscription.destroy
    end

    def events
      if @subscription
        subscription_events = @subscription.subscription_events
        render json: subscription_events
      else
        render json: { error: 'Subscription not found' }, status: :not_found
      end
    end

    private

    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:payment_status, :expiration_date, :user_id, :subscription_plan_id)
    end

    def create_subscription_event(name, description)
      SubscriptionEvent.create(
        name: name,
        description: description,
        subscription_id: @subscription.id,
        event_type: name.parameterize.underscore
      )
    end
  end
end

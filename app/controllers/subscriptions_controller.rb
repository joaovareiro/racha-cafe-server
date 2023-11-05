class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :update, :destroy]

  def index
    @subscriptions = Subscription.all
    render json: @subscriptions
  end

  def show
    render json: @subscription
  end

  def create_with_inactive_status
    @subscription = Subscription.new(subscription_params)
    @subscription.payment_status = 'inactive'
    @subscription.expiration_date = Date.today

    if @subscription.save
      render json: @subscription, status: :created
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  def cancel
    @subscription = Subscription.find(params[:id])
    @subscription.update(payment_status: 'cancelled')
    render json: { message: 'Subscription cancelled successfully' }
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
    render json: { message: 'Successfully deleted subscription' }, status: :ok
  end  

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:tuition_category, :payment_status, :expiration_date, :user_id)
  end
end
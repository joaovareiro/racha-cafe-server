module Sub
  class SubscriptionPlansController < ApplicationController
    before_action :set_subscription_plan, only: [:show, :update, :destroy]

    def index
      @subscription_plans = SubscriptionPlan.all
      render json: @subscription_plans
    end

    def show
      render json: @subscription_plan
    end

    def create
      @subscription_plan = SubscriptionPlan.new(subscription_plan_params)

      if @subscription_plan.save
        render json: @subscription_plan, status: :created
      else
        render json: @subscription_plan.errors, status: :unprocessable_entity
      end
    end

    def update
      if @subscription_plan.update(subscription_plan_params)
        render json: @subscription_plan
      else
        render json: @subscription_plan.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @subscription_plan.destroy
    end

    private

    def set_subscription_plan
      @subscription_plan = SubscriptionPlan.find(params[:id])
    end

    def subscription_plan_params
      params.require(:subscription_plan).permit(:name, :price, :description)
    end

  end
end
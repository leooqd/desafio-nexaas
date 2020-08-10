class StoresController < ApplicationController
  before_action :set_store, only: %i[show update destroy]

  def index
    @stores = Store.all.order('created_at desc')
    render json: @stores
  end

  def show
    render json: @store
  end

  def create
    store = Store.new(store_params)

    if store.save
      render json: store, status: :created
    else
      render json: store.errors, status: :unprocessable_entity
    end
  end

  def update
    if @store.update(store_params)
      render json: @store, status: :ok
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @store.destroy
    head 204
  end

  private

  def set_store
    @store = Store.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end

  def store_params
    params.require(:store).permit(
      :name,
      :address
    )
  end
end

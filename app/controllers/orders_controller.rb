class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action -> {check_permissions('admin', 'operator')}, except: [:show, :index]

  # GET /orders
  # GET /orders.json
  
  def search
    if params.has_key?('search')
      @orders = Order.search(params['search'])
    else
      @orders = []
    end
    params['search'] ||= {}
    @s_rate_name = params.has_key?('search') ? params[:search][:rate_name] : ""
    @s_rate_time_of_day = params.has_key?('search') ? params[:search][:times_of_day] : ""
    @s_rate_how_far = params.has_key?('search') ? params[:search][:rate_how_far] : ""
    @s_auto_model = params.has_key?('search') ? params[:search][:auto_model] : ""
    @s_auto_class = params.has_key?('search') ? params[:search][:auto_class] : ""
    @s_auto_color = params.has_key?('search') ? params[:search][:auto_color] : ""
    @s_date_from = params.has_key?('search') ? params[:search][:date_from] : ""
    @s_date_to = params.has_key?('search') ? params[:search][:date_to] : ""
    @s_time_from = params.has_key?('search') ? params[:search][:time_from] : ""
    @s_time_to = params.has_key?('search') ? params[:search][:time_to] : ""
    @s_adress_from = params.has_key?('search') ? params[:search][:adress_from] : ""
    @s_adress_to = params.has_key?('search') ? params[:search][:adress_to] : ""
  end
  
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: t('app.orders.create.success') }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: t('app.orders.update.success') }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    message = @order.destroy ? t('app.orders.destroy.success') : "#{@order.errors[:base].first.to_s}"
    respond_to do |format|
      format.html { redirect_to orders_url, notice: message }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:date, :time, :from_adress, :to_adress, :passangers_count, :lenght_of_the_route, :driver_id, :rate_id,:remove_rate, :remove_rate_id,
        rate_attributes: [:id, :name, :times_of_day, :how_far, :PPK]
        )
    end
end

class MoneyController < ApplicationController
  before_action :set_money, only: [:destroy]

  def lp
  end

  def index
    @money = Money.all
    @goal = Goal.all
    @bodies = Body.all
  end

  def show
    @money = Money.all
  end

  def new
    @money_body = MoneyBody.new
  end

  # def edit
  # end

  def create
    @money_body = MoneyBody.new(money_params)

    respond_to do |format|
      if @money_body.valid?
        @money_body.save
        format.html { redirect_to money_index_path, notice: 'Money was successfully created.' }
        format.json { render :show, status: :created, location: @money_body }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @money_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @money.update(money_params)
  #       format.html { redirect_to @money, notice: "Money was successfully updated." }
  #       format.json { render :show, status: :ok, location: @money }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @money.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @money.destroy
    respond_to do |format|
      format.html { redirect_to money_index_path, notice: 'Money was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_money
    @money = Money.find(params[:id])
  end

  def money_params
    params.require(:money_body).permit(:saving_amount, :text, :weight).merge(user_id: current_user.id)
  end
end

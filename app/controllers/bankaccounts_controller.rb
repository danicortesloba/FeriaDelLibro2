class BankaccountsController < ApplicationController
  before_action :set_bankaccount, only: [:show, :edit, :update, :destroy]

  # GET /bankaccounts
  # GET /bankaccounts.json
  def index
    @bankaccounts = Bankaccount.all
  end

  # GET /bankaccounts/1
  # GET /bankaccounts/1.json
  def show
  end

  # GET /bankaccounts/new
  def new
    @bankaccount = Bankaccount.new
  end

  # GET /bankaccounts/1/edit
  def edit
  end

  # POST /bankaccounts
  # POST /bankaccounts.json
  def create
    @bankaccount = Bankaccount.new(bankaccount_params)

    respond_to do |format|
      if @bankaccount.save
        format.html { redirect_to users_profile_path, notice: 'Bankaccount was successfully created.' }
        format.json { render :show, status: :created, location: @bankaccount }
      else
        format.html { render :new }
        format.json { render json: @bankaccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bankaccounts/1
  # PATCH/PUT /bankaccounts/1.json
  def update
    respond_to do |format|
      if @bankaccount.update(bankaccount_params)
        format.html { redirect_to users_profile_path, notice: 'Bankaccount was successfully updated.' }
        format.json { render :show, status: :ok, location: @bankaccount }
      else
        format.html { render :edit }
        format.json { render json: @bankaccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bankaccounts/1
  # DELETE /bankaccounts/1.json
  def destroy
    @bankaccount.destroy
    respond_to do |format|
      format.html { redirect_to users_profile_path, notice: 'Bankaccount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bankaccount
      @bankaccount = Bankaccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bankaccount_params
      params.require(:bankaccount).permit(:user_id, :name, :bank, :accounttype, :rut, :account, :email)
    end
end

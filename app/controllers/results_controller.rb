class ResultsController < ApplicationController
  before_action :set_bet
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /bets/1/results
  # GET /bets/1/results.json
  def index
    @results = @bet.results.all
  end

  # GET /bets/1/results/1
  # GET /bets/1/results/1.json
  def show
  end

  # GET /bets/1/results/new
  def new
    @result = @bet.results.new
  end

  # GET /bets/1/results/1/edit
  def edit
  end

  # POST /bets/1/results
  # POST /bets/1/results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to bet_result_path(@bet, @result),
                                  notice: 'Result was successfully created.'
        }
        format.json { render :show, status: :created,
                             location: bet_result_path(@bet, @result) }
      else
        format.html { render :new }
        format.json { render json: @result.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1/results/1
  # PATCH/PUT /bets/1/results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to bet_result_path(@bet, @result),
                                  notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok,
                             location: bet_result_path(@bet, @result) }
      else
        format.html { render :edit }
        format.json { render json: @result.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1/results/1
  # DELETE /bets/1/results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to bet_results_path(@bet),
                                notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_bet
    @bet = Bet.find(params[:bet_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_result
    @result = @bet.results.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def result_params
    params.require(:result).permit(:title, :description, :is_correct, :bet_id)
  end
end

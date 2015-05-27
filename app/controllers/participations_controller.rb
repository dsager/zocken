class ParticipationsController < ApplicationController
  before_action :set_player
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  # GET /players/1/participations
  # GET /players/1/participations.json
  def index
    @participations = @player.participations.all
  end

  # GET /players/1/participations/1
  # GET /players/1/participations/1.json
  def show
  end

  # GET /players/1/participations/new
  def new
    @participation = @player.participations.new
  end

  # GET /players/1/participations/1/edit
  def edit
  end

  # POST /players/1/participations
  # POST /players/1/participations.json
  def create
    @participation = @player.participations.new(participation_params)

    respond_to do |format|
      if @participation.save
        format.html { redirect_to player_participation_path(@player, @participation),
                                  notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created,
                             location: player_participation_path(@player, @participation) }
      else
        format.html { render :new }
        format.json { render json: @participation.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1/participations/1
  # PATCH/PUT /players/1/participations/1.json
  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to player_participation_path(@player, @participation),
                                  notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok,
                             location: player_participation_path(@player, @participation) }
      else
        format.html { render :edit }
        format.json { render json: @participation.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1/participations/1
  # DELETE /players/1/participations/1.json
  def destroy
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to player_participations_path(@player),
                                notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_player
    @player = Player.find(params[:player_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_participation
    @participation = @player.participations.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def participation_params
    params.require(:participation).permit(:player_id, :result_id, :bet_id)
  end
end

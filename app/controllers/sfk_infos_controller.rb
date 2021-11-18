class SfkInfosController < ApplicationController
  before_action :set_sfk_info, only: %i[show edit update destroy]

  # GET /sfk_infos or /sfk_infos.json
  def index
    @sfk_infos = SfkInfo.all
  end

  # GET /sfk_infos/1 or /sfk_infos/1.json
  def show; end

  # GET /sfk_infos/new
  def new
    @sfk_info = SfkInfo.new
  end

  # GET /sfk_infos/1/edit
  def edit; end

  # POST /sfk_infos or /sfk_infos.json
  def create
    @sfk_info = SfkInfo.new(sfk_info_params)

    respond_to do |format|
      if @sfk_info.save
        format.html { redirect_to @sfk_info, notice: 'Sfk info was successfully created.' }
        format.json { render :show, status: :created, location: @sfk_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sfk_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sfk_infos/1 or /sfk_infos/1.json
  def update
    respond_to do |format|
      if @sfk_info.update(sfk_info_params)
        format.html { redirect_to @sfk_info, notice: 'Sfk info was successfully updated.' }
        format.json { render :show, status: :ok, location: @sfk_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sfk_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sfk_infos/1 or /sfk_infos/1.json
  def destroy
    @sfk_info.destroy
    respond_to do |format|
      format.html { redirect_to sfk_infos_url, notice: 'Sfk info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sfk_info
    @sfk_info = SfkInfo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sfk_info_params
    params.require(:sfk_info).permit(:mission, :history, :ig_link)
  end
end

class CommetmsController < ApplicationController
  before_action :set_commetm, only: [:show, :edit, :update, :destroy]

  # GET /commetms
  # GET /commetms.json
  def index
    @commetms = Commetm.all
  end

  # GET /commetms/1
  # GET /commetms/1.json
  def show
  end

  # GET /commetms/new
  def new
    @commetm = Commetm.new
  end

  # GET /commetms/1/edit
  def edit
  end

  # POST /commetms
  # POST /commetms.json
  def create
    @commetm = Commetm.new(commetm_params)

    respond_to do |format|
      if @commetm.save
        format.html { redirect_to @commetm, notice: 'Commetm was successfully created.' }
        format.json { render :show, status: :created, location: @commetm }
      else
        format.html { render :new }
        format.json { render json: @commetm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commetms/1
  # PATCH/PUT /commetms/1.json
  def update
    respond_to do |format|
      if @commetm.update(commetm_params)
        format.html { redirect_to @commetm, notice: 'Commetm was successfully updated.' }
        format.json { render :show, status: :ok, location: @commetm }
      else
        format.html { render :edit }
        format.json { render json: @commetm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commetms/1
  # DELETE /commetms/1.json
  def destroy
    @commetm.destroy
    respond_to do |format|
      format.html { redirect_to commetms_url, notice: 'Commetm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commetm
      @commetm = Commetm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commetm_params
      params.require(:commetm).permit(:user_id, :microposts_id, :body)
    end
end

class PortraitsController < ApplicationController
  before_action :set_portrait, only: [:show, :edit, :update, :destroy, :crop]

  # GET /portraits
  # GET /portraits.json
  def index
    @portraits = Portrait.all
  end

  # GET /portraits/1
  # GET /portraits/1.json
  def show
  end
  
  def crop
  end

  # GET /portraits/new
  def new
    @portrait = Portrait.new(person_id: params[:person_id])
  end

  # GET /portraits/1/edit
  def edit
  end

  # POST /portraits
  # POST /portraits.json
  def create
    @portrait = Portrait.new(portrait_params)

    respond_to do |format|
      if @portrait.save
        format.html { redirect_to crop_portrait_path(@portrait), notice: 'Portrait was successfully created.' }
        format.json { render :show, status: :created, location: crop_portrait_path(@portrait) }
      else
        format.html { render :new }
        format.json { render json: @portrait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portraits/1
  # PATCH/PUT /portraits/1.json
  def update
    respond_to do |format|
      if @portrait.update(portrait_params)
        format.html { redirect_to edit_person_path(@portrait.person), notice: 'Portrait was successfully updated.' }
        format.json { render :show, status: :ok, location: edit_person_path( @portrait.person ) }
      else
        format.html { render :edit }
        format.json { render json: @portrait.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portraits/1
  # DELETE /portraits/1.json
  def destroy
    @portrait.destroy
    respond_to do |format|
      format.html { redirect_to @portrait.person, notice: 'Portrait was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portrait
      @portrait = Portrait.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portrait_params
      params.require(:portrait).permit(:img, :person_id, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end

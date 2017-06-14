class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  # GET /equipment
  # GET /equipment.json
  def index
    @equipment = Equipment.paginate(:page => params[:page], :per_page => 25)
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
  end
  
  def setup_params(p)
    e = p.to_h
    
    if e.has_key?(:desk)
      e[:desk] = Desk.find(e[:desk])
    end

    if e.has_key?(:user)
      if !e[:user].blank?
        e[:user] = User.find(e[:user])
      else
        e[:user] = nil
      end
    end
   
    e
  end

  # POST /equipment
  # POST /equipment.json
  def create
    e = setup_params(equipment_params)
    
    if e[:user] == nil
      @equipment.user = nil
      @equipment.save
    end
    
    @equipment = Equipment.new(e)

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Equipment was successfully created.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    e = setup_params(equipment_params)
    
    respond_to do |format|
      if @equipment.update(e)
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:model, :description, :tag, :serial, :desk, :user)
    end
end

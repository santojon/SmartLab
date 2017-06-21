class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :edit, :update, :destroy, :access, :release]

  # GET /desks
  # GET /desks.json
  def index
    @desks = Desk.paginate(:page => params[:page], :per_page => 25)
  end

  # GET /desks/1
  # GET /desks/1.json
  def show
  end
  
  # GET /desks/1/access
  # GET /desks/1/access.json
  def access
    #add this desk to user desks
    current_user.desks << @desk
    current_user.save
    
    #change desk status to occupied
    @desk.status = 1
    @desk.save
    
    #then
    redirect_to @desk, notice: 'Desk is now in use by you.'
  end
  
  # GET /desks/1/release
  # GET /desks/1/release.json
  def release
    #remove desk from user
    @desk.accesses[0].user.desks.delete(@desk)
    @desk.accesses[0].user.save
    
    #change desk status to free
    @desk.status = 0
    @desk.save
    #then
    redirect_to @desk, notice: 'Desk is now released.'
  end

  # GET /desks/new
  def new
    @desk = Desk.new
  end

  # GET /desks/1/edit
  def edit
  end
  
  def setup_params(p)
    d = p.to_h
    
    if d.has_key?(:lab)
      if !d[:lab].blank?
        d[:lab] = Lab.find(d[:lab])
      else
        d[:lab] = nil
      end
    end

    if d.has_key?(:users)
      if !d[:users].blank?
        u = User.find(d[:users])
        u.desks << @desk
        u.save
        
        d[:status] = 1
        d[:users] = [u]
      else
        d[:status] = 0
        d[:users] = nil
      end
    end
   
    d
  end

  # POST /desks
  # POST /desks.json
  def create
    d = setup_params(desk_params)
    
    @desk = Desk.new(d)

    respond_to do |format|
      if @desk.save
        format.html { redirect_to @desk, notice: 'Desk was successfully created.' }
        format.json { render :show, status: :created, location: @desk }
      else
        format.html { render :new }
        format.json { render json: @desk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desks/1
  # PATCH/PUT /desks/1.json
  def update
    status = desk_params[:status]
    d = setup_params(desk_params)
    
    if d[:users] == nil
      #remove desk from user
      u = @desk.users[0]
      if u != nil
        u.desks.delete(@desk)
        u.save
      end
      
      if status == '1'
        d[:status] = 0
      else
        d[:status] = status
      end
        
      d = d.except!(:users)
    end
    
    respond_to do |format|
      if @desk.update(d)
        if @desk.users.empty?
          format.html { redirect_to @desk, notice: 'Desk was successfully updated.' }
        else
          format.html { redirect_to @desk, notice: 'Desk is now in use.' }
        end
        
        format.json { render :show, status: :ok, location: @desk }
      else
        format.html { render :edit }
        format.json { render json: @desk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desks/1
  # DELETE /desks/1.json
  def destroy
    @desk.destroy
    respond_to do |format|
      format.html { redirect_to desks_url, notice: 'Desk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desk
      @desk = Desk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desk_params
      params.require(:desk).permit(:name, :status, :lab, :users)
    end
end

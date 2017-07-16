class UserResumesController < ApplicationController
  before_action :set_user_resume, only: [:show, :edit, :update, :destroy]
    skip_before_filter :verify_authenticity_token, :only => [:ajaxhandle]

  # GET /user_resumes
  # GET /user_resumes.json
  def index
    # @user_resumes = UserResume.all
    redirect_to '/'
  end

  # GET /user_resumes/1
  # GET /user_resumes/1.json
  def show
    redirect_to '/'
  end

  # GET /user_resumes/new
  def new
    @user_resume = UserResume.new
  end

  # GET /user_resumes/1/edit
  def edit
    redirect_to '/'
  end

  def ajaxhandle
    @ur = UserResume.where(["user_id = ? and template = ?", params['users_id'] , params['template']]).first
    p "121232333233223332"
    p @ur
    if @ur
      @ur.content = params[:content]
      @ur.save!
    else
      @user_resumes = UserResume.create(:user_id => params['users_id'], :template => params['template'], :content => params['content'])
    end
  end

  def resettemplate
    urd = UserResume.where(["user_id = ? and template = ?", "2" , "template1"]).first.content 
    urp = UserResume.where(["user_id = ? and template = ?", session[:user_id] , "template1"]).first 
    urp.content = urd 
    urp.save!
  end

  # POST /user_resumes
  # POST /user_resumes.json
  def create
    @user_resume = UserResume.new(user_resume_params)

    respond_to do |format|
      if @user_resume.save
        format.html { redirect_to @user_resume, notice: 'User resume was successfully created.' }
        format.json { render :show, status: :created, location: @user_resume }
      else
        format.html { render :new }
        format.json { render json: @user_resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_resumes/1
  # PATCH/PUT /user_resumes/1.json
  def update
    respond_to do |format|
      if @user_resume.update(user_resume_params)
        format.html { redirect_to @user_resume, notice: 'User resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_resume }
      else
        format.html { render :edit }
        format.json { render json: @user_resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_resumes/1
  # DELETE /user_resumes/1.json
  def destroy
    @user_resume.destroy
    respond_to do |format|
      format.html { redirect_to user_resumes_url, notice: 'User resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_resume
      @user_resume = UserResume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_resume_params
      params.require(:user_resume).permit(:user_id, :template, :content)
    end
end

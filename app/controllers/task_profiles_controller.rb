class TaskProfilesController < ApplicationController
  before_action :set_task_profile, only: [:show, :edit, :update, :destroy]

  # GET /task_profiles
  # GET /task_profiles.json
  def index
    if params[:category_id].nil?
      @task_profiles = TaskProfile.includes(:question_set).all
    else
      @category = Category.find(params[:category_id])
      @task_profiles = @category.task_profiles.order(:name)
    end
    render json: @task_profiles
  end

  # GET /task_profiles/1
  # GET /task_profiles/1.json
  def show
    render json: @task_profile.question_set
  end

  # GET /task_profiles/new
  def new
    @task_profile = TaskProfile.new
  end

  # GET /task_profiles/1/edit
  def edit
  end

  # POST /task_profiles
  # POST /task_profiles.json
  def create
    @task_profile = TaskProfile.new(task_profile_params)

    respond_to do |format|
      if @task_profile.save
        format.html { redirect_to @task_profile, notice: 'Task profile was successfully created.' }
        format.json { render :show, status: :created, location: @task_profile }
      else
        format.html { render :new }
        format.json { render json: @task_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_profiles/1
  # PATCH/PUT /task_profiles/1.json
  def update
    respond_to do |format|
      if @task_profile.update(task_profile_params)
        format.html { redirect_to @task_profile, notice: 'Task profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_profile }
      else
        format.html { render :edit }
        format.json { render json: @task_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_profiles/1
  # DELETE /task_profiles/1.json
  def destroy
    @task_profile.destroy
    respond_to do |format|
      format.html { redirect_to task_profiles_url, notice: 'Task profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_profile
      @task_profile = TaskProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_profile_params
      params.require(:task_profile).permit(:oid, :name, :description, :xm_descriptor, :matchable, :profileable, :es_score, :default_cost_guide_id, :keywords, :text_messaging_name, :rollover_long_desc, :rollover_short_desc, :sector_id, :meta_description, :html_title, :content_description, :pwc_id, :accept_goal, :multi_zip, :pre_match_type_id, :bridge_oid, :bridge_text, :bridge_link_text, :bridge_link_id, :bridge_active, :xm_name, :redirect_to_oid, :sp_display_name, :xm_header_descriptor, :url_name, :consideration_id, :search_keywords, :emc_category_oid, :primary_question_set_id, :location_specific, :commercial, :view_first_parent_task)
    end
end

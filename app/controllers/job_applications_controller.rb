class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[show edit update destroy mark_as_seen]
  before_action :set_job, only: %i[index show edit update destroy new create]
  before_action :authenticate_user!

  # GET /job_applications or /job_applications.json
  def index
    @job_applications = if @job.present?
                          JobApplication.where(job_id: @job.id)
                        else
                          JobApplication.all
                        end
  end

  # GET /job_applications/1 or /job_applications/1.json
  def show; end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /job_applications/1/edit
  def edit; end

  # POST /job_applications or /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)

    respond_to do |format|
      if @job_application.save
        if params[:job_application][:resume].present?
          uploaded_file = params[:job_application][:resume]
          filename = "#{@job_application.user.id}-#{@job.title}#{File.extname(uploaded_file.tempfile)}"
          File.open(Rails.root.join('public', filename), 'wb') do |file|
            file.write(uploaded_file.read)
          end
        end
        format.html do
          redirect_to job_job_application_path(@job, @job_application),
                      notice: 'Job application was successfully created.'
        end
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applications/1 or /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html do
          redirect_to job_application_url(@job_application), notice: 'Job application was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1 or /job_applications/1.json
  def destroy
    @job_application.destroy

    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_seen
    @job_application.update!(status: :seen)
    UserMailer.application_status(@job_application.user, @job_application.job.title).deliver_now
    redirect_to job_job_applications_path(job_id: params[:job_id]),
                notice: "Job application for #{@job_application.user.email} has been seen"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  # Only allow a list of trusted parameters through.
  def job_application_params
    params.require(:job_application).permit(:id, :name, :email, :phone, :resume, :cover_letter,
                                            :status, :user_id, :job_id, :created_at, :updated_at)
  end

  def job_params
    params.require(:job).permit(:id, :title, :description, :company, :location, :job_type,
                                :requirements, :published_at, :expires_at, :created_at, :updated_at)
  end
end

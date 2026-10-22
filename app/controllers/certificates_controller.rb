class CertificatesController < ApplicationController
  load_and_authorize_resource
  before_action :set_certificate, only: %i[ show edit update destroy ]

  # GET /certificates or /certificates.json
  def index
    @certificates = nil
   if ['admin', 'sysadmin'].include?(current_user.role)
    @certificates = Certificate.all
   else 
      respond_to do |format|
        format.json { render nothing: true, status: :not_found }
        format.html { redirect_to main_app.root_url, alert: "access denied" }
        format.js { render nothing: true, status: :not_found }
      end
   end
   return @certificates
  end

  # GET /certificates/1 or /certificates/1.json
  def show
  end

  # GET /certificates/new
  def new
    @certificate = Certificate.new
  end

  # GET /certificates/1/edit
  def edit
  end

  # POST /certificates or /certificates.json
  def create
    @certificate = Certificate.new(certificate_params)
    @certificate.operator_id = current_user.id

    respond_to do |format|
      if @certificate.save
        format.html { redirect_to @certificate, notice: "Certificate was successfully created." }
        format.json { render :show, status: :created, location: @certificate }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @certificate.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /certificates/1 or /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(certificate_params)
        format.html { redirect_to @certificate, notice: "Certificate was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @certificate }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @certificate.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /certificates/1 or /certificates/1.json
  def destroy
    @certificate.destroy!

    respond_to do |format|
      format.html { redirect_to certificates_path, notice: "Certificate was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate
      @certificate = Certificate.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def certificate_params
      params.expect(certificate: [ :first_name, :last_name, :company, :description, documents: [] ])
    end
end

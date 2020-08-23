module Api::V1
  class ComplaintsController < BaseController
    before_action :set_complaint, only: [:show, :update, :destroy]
    
    # GET /complaints
    def index
      @complaints = Complaint.all

      render json: @complaints
    end
    
    # GET /complaints/1
    def show
      render json: @complaint
    end

    # POST /complaints
    def create
      @complaint = Complaint.new(complaint_params)

      if @complaint.save
        render json: @complaint, status: :created
      else
        render json: @complaint.errors, status: :unprocessable_entity
      end

    end

    # PATCH/PUT ap1/v1/complaints/complaints/1
    def update
      if @complaint.update(complaint_params)
        render json: @complaint
      else
        render json: @complaint.errors, status: :unprocessable_entity
      end
    end

    # DELETE /complaints/1
    def destroy
      @complaint.destroy
    end

    private 

    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    def complaint_params
      params.require(:complaint).permit(:title, :description, :company, locale: [:city, :state])
    end

  end
end
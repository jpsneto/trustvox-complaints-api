module Api::V1
  class ComplaintsController < BaseController
    before_action :set_complaint, only: [:show, :update, :destroy]

    def index
      @complaints = Complaint.where(search_params).page(params[:page])
      render_object(@complaints)
    end

    def show
      render_object(@complaint)
    end

    # Counts search result
    # Example:
    # Request: /api/v1/complaints/count?q[company]=Submarino&q[locale.state=BA]&q[locale.city]=Salvador
    # Response: { data: 5 }
    # e.g Five Submarino complaints in Salvador, BA
    def count
      @complaints = Complaint.where(search_params)
      render json: { data: @complaints.count }
    end

    def create
      @complaint = Complaint.new(complaint_params)

      if @complaint.save
        render_object(@complaint, status: :created)
      else
        render_errors(@complaint.errors)
      end
    end

    def update
      if @complaint.update(complaint_params)
        render_object(@complaint)
      else
        render_errors(@complaint.errors)
      end
    end

    def destroy
      @complaint.destroy
    end

    private

    # Parse query param "q"
    # Return the hash of criteria or an empty hash the represents "no criteria"
    def search_params
      return {} unless params[:q]
      params.require(:q).permit!
    end

    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    def complaint_params
      params.require(:complaint).permit(:title, :description, :company, locale: [:city, :state])
    end
  end
end

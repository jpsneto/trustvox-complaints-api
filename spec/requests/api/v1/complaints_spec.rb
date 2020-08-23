require 'rails_helper'

RSpec.describe "Api::V1::Complaints", type: :request do  
 
  let(:valid_attributes) { FactoryBot.attributes_for(:complaint)}     
  let(:invalid_attributes) { FactoryBot.attributes_for(:complaint, :invalid) }

  it "GET /api/v1/complaints" 

  it "GET /api/v1/complaints/{:id}"

  describe "POST /api/v1/complaints" do    
    context "with valid parameters" do       

      before do 
        post api_v1_complaints_path, params: {complaint: valid_attributes}, as: :json
      end

      it "create a new complaint" do        
        expect change(Complaint, :count).by(1)
      end

      it "renders a JSON response with the new complaint" do 
        
        # expected_body = valid_attributes
        expect(response).to have_http_status(:created)        
        expect(response.content_type).to match(a_string_including("application/json"))
        # expect(json(response)["complaint"]).to include_json(expected_body)
      end

      # TODO: Test response body    
    end

    context "with invalid paramaters" do

      before do         
        post api_v1_complaints_path, params: {complaint: invalid_attributes}, as: :json
      end
      
      it "does not create a new complaint" do 
        expect change(Complaint, :count).by(0)
      end

      it "renders a JSON response with errors for the new complaint" do         
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end

      # TODO: Test response body

    end

  end 

  it "PUT /api/v1/complaints/{:id}"

  it "DELETE /api/v1/complaints/{:id}"

end

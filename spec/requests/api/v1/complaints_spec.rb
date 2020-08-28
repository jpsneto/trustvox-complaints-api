require 'rails_helper'

RSpec.describe "Api::V1::Complaints", type: :request do
 
  let(:valid_attributes) { FactoryBot.attributes_for(:complaint)}
  let(:invalid_attributes) { FactoryBot.attributes_for(:complaint, :invalid) }

  describe "GET api/v1/complaints" do
    before do 
      create_list(:complaint, 3)
      get api_v1_complaints_path, as: :json
    end

    it 'return some complaints' do
      expect(json(response)["data"].count).to eq(3) # TODO: remove root "complaints"
    end

    it 'has page metadata in response' do
      expected_meta = {"total" => 3, "page" => {"number" => 1, "size" => 25} }
      expect(json(response)["meta"]).to include(expected_meta) # TODO: remove root "complaints"
    end

    it { expect(response).to have_http_status(:ok) }

  end

  describe "GET api/v1/complaints?{query}" do
    it 'returns some complaints when query params assigned' do
      complaints = create_list(:complaint, 3, company: 'Submarino', locale: { state: 'BA', city: 'Salvador' })
      params = { 'q' => { 'company' => 'Submarino', 'locale.state' => 'BA', 'locale.city' => 'Salvador' } }

      get api_v1_complaints_path, params: params
      expect(json(response)["data"].count).to eq(complaints.size)
    end
  end

  describe 'GET api/v1/complaints/{:id}' do
    it "retrives a complaint" do
      complaint = create(:complaint)
      get api_v1_complaint_path(complaint.id)
      expect(json(response)["id"]).to eq(complaint.id.to_s)
    end

    it "responds with 404 when resource is not found" do
      patch api_v1_complaint_path('-1')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET ap1/v1/complaints/count?{query}' do
    it 'Counts complaints from a specific company in specific state and city' do
      create_list(:complaint, 3, company: 'Submarino', locale: {state: 'BA', city: 'Salvador'})
      params = {"q" => {"company" => "Submarino", "locale.state" => "BA", "locale.city" => "Salvador" } }

      get count_api_v1_complaints_path, params: params

      expect(json(response)["data"]).to eq(3)
    end
  end

  describe "POST api/v1/complaints" do
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

  describe "PATCH api/v1/complaints/{:id}" do
    let(:complaint) { create(:complaint, valid_attributes) }
    

    context "with valid parameters" do
      it "update the requested complaint" do
        valid_attributes["title"] = "Modified Title"
        patch api_v1_complaint_path(complaint), params: valid_attributes, as: :json
        expect(response).to have_http_status(:ok)
        expect(json(response)["title"]).to eq("Modified Title")
      end
    end

    context "with invalid parameters" do
      it "does not update the requested complaint" do         
        patch api_v1_complaint_path(complaint), params: invalid_attributes, as: :json
        expect(response).to have_http_status(:unprocessable_entity)        
      end
    end

    context "when resource is not found" do
      it "responds with 404" do
        patch api_v1_complaint_path('-1'), params: valid_attributes, as: :json
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  it "DELETE /api/v1/complaints/{:id}" do
    complaint = create(:complaint)
    delete api_v1_complaint_path(complaint)
    expect(response).to have_http_status(:no_content)
  end

end

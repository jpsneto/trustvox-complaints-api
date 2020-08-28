# frozen_string_literal: true
# require 'rails_helper'

# RSpec.describe Renderer, type: :controller do

#   # controller do
#   #   include Renderer

#   #   def action
#   #     @complaint = create(:complaint)
#   #   end
#   # end

#   controller(ApplicationController) do
#     include Renderer

#     def show
#       dummy = FactoryBot.create(:complaint)
#       render_object(dummy)
#     end

#     # def create
#     #   dummy = create(dummy_params)
#     #   render_errors(dummy.errors)
#     # end

#     private

#     def dummy_params
#       params.require(:dummy).permit(:name)
#     end
#   end

#   # before do
#   #   routes.draw {
#   #     get :action, to: "api/v1/anonymous#show"
#   #   }
#   # end

#   #testar se o collection e o objeto renderizam corretamente
#   describe 'GET show' do
#     let(:resource) { FactoryBot.create(:complaint) }

#     it 'renders resource with render_object method' do
#       get :show, params: { id: resource.id }

#       data_fields = { 'id' => resource.id.to_s, 'title' => resource.title }
#       meta_fields = { 'resource' => 'Dummy', 'count' => 1 }

#       expect(response.status).to eq(200)
#       expect(json_data(response)).to include(data_fields)
#       expect(json_meta(response)).to include(meta_fields)
#     end
#   end

#   describe 'POST create' do
#     it 'renders resource errors with render_errors method' do

#     end
#   end

# end

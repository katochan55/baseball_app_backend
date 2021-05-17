require 'rails_helper'

describe 'GET /api/teams' do
  include Requests::JsonHelpers

  before do
    create_list(:team, 3)
  end

  it 'gets all teams' do
    get '/api/teams'

    expect(response).to have_http_status :ok
    expect(json.dig('data').length).to eq 3
  end
end

describe 'GET /api/teams/:id' do
  include Requests::JsonHelpers

  let!(:team) { create(:team) }

  it 'gets the team' do
    get "/api/teams/#{team.id}"

    expect(response).to have_http_status :ok
    expect(json.dig('data', 'name')).to eq team.name
    expect(json.dig('data', 'founded_year')).to eq team.founded_year
  end
end

describe 'POST /api/teams' do
  include Requests::JsonHelpers

  let(:params) { { team: { name: 'hogehogeファイターズ', founded_year: 2000 } } }

  it 'creates the team' do
    post '/api/teams', params: params

    expect(response).to have_http_status :created
    expect(json.dig('data', 'name')).to eq 'hogehogeファイターズ'
    expect(json.dig('data', 'founded_year')).to eq 2000
  end
end

describe 'PUT /api/teams/:id' do
  include Requests::JsonHelpers

  let!(:team) { create(:team) }
  let(:params) { { team: { name: 'hogehogeファイターズ', founded_year: 2000 } } }

  it 'updates the team' do
    put "/api/teams/#{team.id}", params: params

    expect(response).to have_http_status :created
    expect(json.dig('data', 'name')).to eq 'hogehogeファイターズ'
    expect(json.dig('data', 'founded_year')).to eq 2000
  end
end

describe 'DELETE /api/teams/:id' do
  include Requests::JsonHelpers

  let!(:team) { create(:team) }

  it 'deletes the team' do
    delete "/api/teams/#{team.id}"

    expect(response).to have_http_status :ok
    expect(json.dig('data', 'name')).to eq team.name
    expect(json.dig('data', 'founded_year')).to eq team.founded_year
  end
end

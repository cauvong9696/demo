require 'google/apis/people_v1'
require 'google/api_client/client_secrets.rb'

class ApplicationController < ActionController::Base
  People = Google::Apis::PeopleV1
  def contacts
    secrets = Google::APIClient::ClientSecrets.new(
      {
        "web" =>
          {
            "client_id" => Rails.application.secrets["232819209990-utn23bbgvjip0hfbedge3s8f84kkjuv3.apps.googleusercontent.com"],
            "client_secret" => Rails.application.secrets["EslGuUwX6hVSepxtz5qgJ63a"]
          }
      }
    )
    service = People::PeopleServiceService.new
    service.authorization = secrets.to_authorization
    response = service.list_person_connections(
      'people/me',
       person_fields: ['names', 'emailAddresses']
    )
    render json: response
  end
end

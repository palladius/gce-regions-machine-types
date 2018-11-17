# BEFORE RUNNING:
# ---------------
# 1. If not already done, enable the Compute Engine API
#    and check the quota for your project at
#    https://console.developers.google.com/apis/api/compute
# 2. This sample uses Application Default Credentials for authentication.
#    If not already done, install the gcloud CLI from
#    https://cloud.google.com/sdk and run
#    `gcloud beta auth application-default login`.
#    For more information, see
#    https://developers.google.com/identity/protocols/application-default-credentials
# 3. Install the Ruby client library and Application Default Credentials
#    library by running `gem install google-api-client` and
#    `gem install googleauth`

require 'googleauth'
require 'google/apis/compute_v1'

service = Google::Apis::ComputeV1::ComputeService.new
service.authorization = Google::Auth.get_application_default(['https://www.googleapis.com/auth/cloud-platform'])

project = 'ric-cccwiki'
zone = 'europe-west1-d'

items = service.fetch_all do |token|
  service.list_machine_types(project, zone, page_token: token)
end

items.each do |machine_type|
  # TODO: Change code below to process each `machine_type` resource:
  puts machine_type.to_json
end


# frozen_string_literal: true

target :lib do
  signature "sig"
  check "lib"

  ignore "lib/anycable/rspec/*.rb"
  ignore "lib/anycable/grpc/rpc_services_pb.rb"
  ignore "lib/anycable/protos/*.rb"

  ignore "lib/anycable/cli.rb"

  # Splat args not supported
  ignore "lib/anycable/exceptions_handling.rb"
  ignore "lib/anycable/broadcast_adapters/http.rb"

  library "logger"
  library "monitor"
  library "json"
  library "uri"
  library "optparse"
  library "anyway_config"
end

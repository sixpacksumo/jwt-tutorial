module Api
  module AxJwt
    extend ActiveSupport::Concern

    KEY = '5d09d47029e9c59fdb4477e5f'
    HMAC_SECRET = '48f7e5c6d24cea223730a261bdeca25153f9ca15d5505257741ca561ce3d1eda32fcd6b06aab81a2804bc2803b89e0ed160602e912d1abfa75377d979e94ab92'

    def create_jwt(payload)
      payload[:key] = KEY
      JWT.encode(payload, HMAC_SECRET, 'HS256')
    end

    def extract_payload(token)
      JWT.decode(token, HMAC_SECRET, true, { algorithm: 'HS256' }).first
    end

    def extract_key(token, verify=true)
      payload = JWT.decode(token, HMAC_SECRET, verify, { algorithm: 'HS256' }).first.with_indifferent_access
      payload[:key]
    end
  end
end
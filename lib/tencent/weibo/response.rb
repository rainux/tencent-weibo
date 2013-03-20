OAuth2::Response.register_parser(:tencent_json, []) do |body|
  begin
    MultiJson.load(body)
  rescue MultiJson::LoadError => e
    if e.message.include?('lexical error: invalid bytes in UTF8 string.')
      valid_body = body.encode(Encoding::UTF_16BE, invalid: :replace).encode(Encoding::UTF_8)
      MultiJson.load(valid_body)
    else
      raise
    end
  end
end

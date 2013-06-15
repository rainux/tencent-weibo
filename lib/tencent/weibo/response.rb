OAuth2::Response.register_parser(:tencent_json, []) do |body|
  begin
    body_as_utf8 = body.force_encoding(Encoding::UTF_8)

    unless body_as_utf8.valid_encoding?
      body_as_utf8 = body.
        encode(Encoding::UTF_16BE, invalid: :replace).
        encode(Encoding::UTF_8)
    end

    MultiJson.load(body_as_utf8)
  end
end

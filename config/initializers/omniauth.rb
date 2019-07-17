Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "S5IMnuLPPhMKyZ7LdGi02AIVr", "WprUq5jCLDEDWD2L2KhuxrOXl36a0LmL9Eo0vFhykhrM8xqKEn"
  provider :google_oauth2, "291889273769-2olbb04p21jmago8gklifp3juo70a2b3.apps.googleusercontent.com", "M0RotaQnj9XfxarpQOT0-84a"
end
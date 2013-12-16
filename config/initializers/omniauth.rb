Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "786610081354504", "74acca43387246d638424aee5edd4911", :iframe => false
end
default_client = "jenny"

get '/' do
  client_name = params[:client]
  if client_name.nil?
      client_name = default_client
  end
  # Find these values at twilio.com/user/account
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  # This application sid will play a Welcome Message.
  demo_app_sid = ENV['TWILIO_APP_SID']
  capability = Twilio::Util::Capability.new account_sid, auth_token
  capability.allow_client_outgoing demo_app_sid
  capability.allow_client_incoming client_name
  token = capability.generate
  erb :index, :locals => {:token => token, :client_name => client_name}
end

# Add a Twilio phone number or number verified with Twilio as the caller ID
caller_id = ENV['TWILIO_NUMBER']

post '/voice' do
  number = params[:PhoneNumber]
  response = Twilio::TwiML::Response.new do |r|
    # Should be your Twilio Number or a verified Caller ID
    r.Dial :callerId => caller_id do |d|
      # Test to see if the PhoneNumber is a number, or a Client ID. In
      # this case, we detect a Client ID by the presence of non-numbers
      # in the PhoneNumber parameter.
      if /^[\d\+\-\(\) ]+$/.match(number)
        d.Number(CGI::escapeHTML number)
      else
        d.Client number
      end
    end
  end
  response.text
end

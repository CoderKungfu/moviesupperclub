RSpec.configure do |config|
  FactoryGirl.find_definitions
  config.before(:suite) do
    FactoryGirl.lint
  end
end

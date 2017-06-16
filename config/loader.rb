Dir[File.dirname(__FILE__) + '/../libs/**/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../models/**/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../helpers/**/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../controllers/**/*.rb'].each { |file| require file }

module Loader
  # Load controllers
  Dir[File.dirname(__FILE__) + '/../controllers/**/*.rb'].each do |controller|
    module_name = File.basename(controller).split('_')[0]
    Sinatra::Base.register Object.const_get("::Controllers::#{module_name.camelcase(:upper)}")
  end

end

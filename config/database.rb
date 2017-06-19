Sequel::Model.plugin(:schema)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("postgres://pihc_verp:pihc_verp@/pad_app_development", :loggers => [logger])
  when :production  then Sequel.connect("postgres://pihc_verp:pihc_verp@/pad_app_production",  :loggers => [logger])
  when :test        then Sequel.connect("postgres://pihc_verp:pihc_verp@/pad_app_test",        :loggers => [logger])
end

module Controllers
  module Home
    # def self.extended(mod)
      # private_method :index
    # end
    
    def self.registered(app)
      app.get '/' do
        haml :index, layout: :main_layout
      end
    end

    def index
      puts 'foo'
    end
  end
end

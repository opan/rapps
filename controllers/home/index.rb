module Controllers
  module Home
    module Index
      def self.registered(app)
        app.get '/' do
          haml :index, layout: :main_layout
        end
      end
    end
  end
end

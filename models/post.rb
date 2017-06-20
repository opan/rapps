class Post < Sequel::Model
  # Validations
  #
  def validate
    validates_presence :title
    validates_presence :content
  end

  # Callbacks
  #
  def before_save
    
  end
end

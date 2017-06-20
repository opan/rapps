class User < Sequel::Model
  # Additional attributes
  #
  attr_accessor :password, :password_confirmation

  # Validations
  #
  def validate
    validates_presence :username
    validates_unique :username
    validates_length_range 4..100, :username
    validates_format /\A[A-Za-z_-]+\z/, :username
    
    errors.add(:password, 'cannot be blank') if password.blank?
    errors.add(:password_confirmation, 'cannot be blank') if password_confirmation.blank?

    if password != password_confirmation
      errors.add(:password_confirmation, 'must confirm password')
    end

    validates_presence :email
    validates_unique :email
    validates_format       /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :email
  end

  # Callbacks
  #
  def before_save
    encrypt_password
  end

  # Additional methods
  #

  def valid_password?(typed_password)
    ::BCrypt::Password.new(self.encrypted_password) == typed_password
  end

  private

  def encrypt_password
    self.encrypted_password = ::BCrypt::Password.create(password, cost: 10)
  end

end

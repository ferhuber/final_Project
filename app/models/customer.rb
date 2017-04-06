class Customer < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
    has_secure_password

    has_many :orders
    has_many :productions, through: :orders

    geocoded_by :address
    after_validation :geocode


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
    validates :phone, presence: true
    validates :address, presence: true

    validates :password, presence: true
    # validates :password_confirmation, presence: true

    before_validation :downcase_email

    def full_name
      "#{first_name} #{last_name} ".strip.titleize
    end

    #######################PASSWORD RESET############################################

    def Customer.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def Customer.new_token
      SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = Customer.new_token
      update_attribute(:remember_digest, Customer.digest(remember_token))
    end


      # Sets the password reset attributes.
      def create_reset_digest
        self.reset_token = Customer.new_token
        update_attribute(:reset_token,  Customer.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
      end

      # Sends password reset email.
      def send_password_reset_email
        CustomersMailer.password_reset(self).deliver_now
      end

    private

    def downcase_email
      self.email&.downcase!
    end


    def create_activation_digest
      self.activation_token  = Customer.new_token
      self.activation_digest = Customer.digest(activation_token)
    end
  end

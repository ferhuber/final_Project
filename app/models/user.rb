class User < ApplicationRecord
  has_secure_password

  has_many :auctions, dependent: :nullify
  has_many :bidss, dependent: :nullify

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: true,
                    format: VALID_EMAIL_REGEX

  def self.search(query)
    where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?" ,
    "#{query}" ,"#{query}","#{query}")
  end

  def full_name
    "#{first_name} #{last_name} ".strip.titleize
  end

  private

  def downcase_email
    self.email&.downcase!
  end

end

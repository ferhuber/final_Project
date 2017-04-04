class Auction < ApplicationRecord

  belongs_to :user
  has_many :bids, lambda { order(created_at: :desc) }, dependent: :destroy

  include AASM

  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published, :canceled, :funded, :unfunded

    event :publish do
      transitions from: :draft, to: :published
    end

    event :cancel do
      transitions from: [:published, :funded, :unfunded], to: :canceled
    end

    event :fund do
      transitions from: :published, to: :funded
    end

    event :fail do
      transitions from: :published, to: :unfunded
    end

    event :redraft do
      transitions from: :canceled, to: :draft
    end

  end

end

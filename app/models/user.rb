class User < ApplicationRecord
    has_secure_password

    validates :email,
              format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ },
              uniqueness: true,
              presence: true

    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true

    def to_json(options = {})
        options[:except] ||= [:password_digest, :created_at, :updated_at, :email]
        super(options)
    end
end

class User < ApplicationRecord
  has_secure_password

  def to_json(options={})
    options[:except] ||= [:password_digest, :created_at, :updated_at, :email]
    super(options)
  end
  
end

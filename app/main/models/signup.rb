class Signup < Volt::Model
  field :email

  validate :email, email: true

  permissions(:read) do
    deny
  end
end

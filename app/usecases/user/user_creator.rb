class User::UserCreator

  def initialize(user_klass=User)
    @user_klass = user_klass
  end

  def create(args)
    email = args[:email]
    first_name = args[:first_name]
    last_name = args[:last_name]

    password = generate_password

    user = @user_klass.new(email: email, password: password, first_name: first_name,
                           last_name: last_name)
    user.save

    user
  end

  private

  def generate_password
    return Devise.friendly_token.first(8)
  end
end

# Using has_secure_password

Using has_secure_password will ensure that your password are not stored in plain text.

Here are some things to keep in mind when using has_secure_password:

- You need the include the bcrypt gem in your Gemfile

    gem 'bcrypt', '~> 3.1.7'

- Your users tables needs a password_digest column to your users table instead of a password column.

- When signing in a user, you will no longer look them up by their username/password combination. Instead you will find and authenticate users in separate steps.

```
    # find user by username
    user = User.find_by(username: params[:user][:username])

    # make sure the user entered the correct password
    user.authenticate(params[:user][:password])
```
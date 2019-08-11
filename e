
[1mFrom:[0m /app/app/controllers/users/registrations_controller.rb @ line 23 Users::RegistrationsController#tell:

    [1;34m18[0m: [32mdef[0m [1;34mtell[0m
    [1;34m19[0m:   @user = [1;34;4mUser[0m.new(user_params)
    [1;34m20[0m:   [32mif[0m @user.valid? && verify_recaptcha
    [1;34m21[0m:     binding.pry
    [1;34m22[0m:     session = user_params
 => [1;34m23[0m:     binding.pry
    [1;34m24[0m:   [32melse[0m
    [1;34m25[0m:     render [31m[1;31m'[0m[31mnew[1;31m'[0m[31m[0m
    [1;34m26[0m:   [32mend[0m
    [1;34m27[0m: [32mend[0m


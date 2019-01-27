module PatientsHelper

  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar.varient(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(@patient.email, size:size)
  end
end
end

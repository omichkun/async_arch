namespace :initial do
  desc 'Create initial data'
  task create: [:environment] do
    %w[administrator manager popug].each do |role|
      Role.find_or_create_by(name: role)
    end

    User.create(password: 'admin', password_confirmation: 'admin', username: 'popugadmin', role: Role.find_by(name: 'administrator')) if User.find_by_username('popugadmin').blank?
  end
end

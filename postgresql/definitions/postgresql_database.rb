define :postgresql_database do
  execute "create postgresql database #{params[:name]}" do
    command "sudo -u postgres createdb #{params[:name]}"
    not_if "sudo -u postgres psql -l | grep #{params[:name]}"
  end
end

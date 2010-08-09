define :postgresql_user do
  execute "create postgresql user #{params[:name]}" do
    command "sudo -u postgres createuser -s -d -r #{params[:name]}"
    not_if "sudo -u postgres psql -c 'select usename from pg_user' | grep #{params[:name]}"
  end
end

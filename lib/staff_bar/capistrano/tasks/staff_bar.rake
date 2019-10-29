namespace :staff_bar do
  desc "Place a BRANCH file with the current branch in the current release path"
  task :set_current_branch do
    on roles(:app) do
      within release_path do
        execute :echo, "\"#{fetch(:branch)}\" >> BRANCH"
      end
    end
  end
end

after 'deploy:finished', 'staff_bar:set_current_branch'

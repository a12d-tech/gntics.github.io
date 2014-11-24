require 'rake'

namespace :site do

  desc "deploy site to github pages"
  task :deploy => [:clean] do
    puts "Deploying to github pages..."
    sh "git checkout pre-release"
    sh "git pull origin pre-release"
    sh "git merge develop"
    Rake::Task['site:build'].execute
    sh "git add --all"
    sh "git commit -m 'build new release'"
    sh "git push origin pre-release"
    sh "git subtree push --prefix _site origin master"
    sh "git checkout develop"
    puts "Deploying to github pages... END"
  end

  desc "build site locally" 
  task :build do
    puts "Building site locally..."
    sh "bundle exec jekyll build"
  end

  desc "clean _site/ directory"
  task :clean do
    puts "Cleaning local _site directory..."
    sh "rm -R _site" if Dir.exists?("_site")
  end

  desc "jekyll serve --watch locally"
  task :serve_watch do
    sh "bundle exec jekyll serve --watch"
  end

end
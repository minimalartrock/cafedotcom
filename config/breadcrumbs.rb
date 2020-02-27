# frozen_string_literal: true

crumb :root do
  link 'HOME', root_path
end

crumb :show_shop do |shop|
	link shop.name, shop_path(shop_id:shop.id)
	parent :root
end

crumb :edit_shop do |shop|
	link '店編集', edit_shop_path(shop_id:shop.id)
	parent :show_shop, shop
end

crumb :new_shop do |shop|
	link '店登録', new_shop_path
	parent :root
end

crumb :index_user do
  link 'ユーザー一覧', users_path
end

crumb :show_user do
  link 'プロフィール', user_path
end

crumb :edit_user do
  link '編集', user_path
  parent :show_user
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

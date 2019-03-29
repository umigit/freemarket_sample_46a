crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :card do
  link "支払い方法", card_users_path
  parent :mypage
end


crumb :profile do
  link "プロフィール", edit_user_profile_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", edit_address_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

crumb :onsale do
  link "出品した商品", onsale_user_items_path(current_user)
  parent :mypage
end

crumb :phone do
  link "電話番号の確認", phone_users_path
  parent :mypage
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

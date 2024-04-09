# setting user.name and user.email per repository

bash´´´
git config --global user.name user.name
git config --global user.email user.email
cargo new project_name
cd project_name
cargo add crate
cargo add crate -F feature
´´´
# Dependency graph zeigen

bash´´´
cargo tree -e features
´´´


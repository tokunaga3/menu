Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "menu_lists#index"
  resources :menu_lists do
    get 'randam_menu', :on => :member
  end
  resources :families
  get "other/index" => "others#index"
end


# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#       users_guest_sign_in POST   /users/guest_sign_in(.:format)                                                           users/sessions#new_guest
#                      root GET    /                                                                                        menu_lists#index
#     randam_menu_menu_list GET    /menu_lists/:id/randam_menu(.:format)                                                    menu_lists#randam_menu
#                menu_lists GET    /menu_lists(.:format)                                                                    menu_lists#index
#                           POST   /menu_lists(.:format)                                                                    menu_lists#create
#             new_menu_list GET    /menu_lists/new(.:format)                                                                menu_lists#new
#            edit_menu_list GET    /menu_lists/:id/edit(.:format)                                                           menu_lists#edit
#                 menu_list GET    /menu_lists/:id(.:format)                                                                menu_lists#show
#                           PATCH  /menu_lists/:id(.:format)                                                                menu_lists#update
#                           PUT    /menu_lists/:id(.:format)                                                                menu_lists#update
#                           DELETE /menu_lists/:id(.:format)                                                                menu_lists#destroy
#                  families GET    /families(.:format)                                                                      families#index
#                           POST   /families(.:format)                                                                      families#create
#                new_family GET    /families/new(.:format)                                                                  families#new
#               edit_family GET    /families/:id/edit(.:format)                                                             families#edit
#                    family GET    /families/:id(.:format)                                                                  families#show
#                           PATCH  /families/:id(.:format)                                                                  families#update
#                           PUT    /families/:id(.:format)                                                                  families#update
#                           DELETE /families/:id(.:format)                                                                  families#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

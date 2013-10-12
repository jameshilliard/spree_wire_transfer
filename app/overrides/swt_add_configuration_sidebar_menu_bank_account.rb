Deface::Override.new(
  :virtual_path => "spree/admin/shared/_configuration_menu",
  :name => "swt_add_configuration_sidebar_menu_bank_account",
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => "<%= configurations_sidebar_menu_item(
                                            Spree.t(:bank_accounts),
                                            admin_bank_accounts_path)  %>"
)

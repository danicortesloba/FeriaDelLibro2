ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    panel "Gráfico" do
     render 'shared/chart'
    end

    columns do
       column do
         panel "Últimas editoriales" do
           ul do
             Publisher.last(5).map do |publisher|
               li link_to(publisher.name, admin_publisher_path(publisher))
               end
             end
           end
         end

         column do
           panel "Usuarios" do
             ul do
               li "Lectores registrados: #{Reader.count}"
               li "Editoriales registradas: #{Publisher.count}"
             end
           end
         end

         column do
           panel "Compras" do
           ul do
             li "Compras: #{Billing.count}"
             li "Membresías: #{Milling.count}"
             li "Libros: #{Book.count}"
           end
         end
       end
      end
    #     end
    #   end
    # end
  end # content
end

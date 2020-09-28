ActiveAdmin.register Question do
  active_admin_import template: 'admin/templates/questions'

  permit_params :text, :level_id, :topic_id, :question_type_id, answer_ids: []

  show do
    attributes_table do
      row :text
      row :level
      row :topic
      row :question_type
      panel "Answers" do
        table_for question.answers do
          column :text
        end
      end
    end
    active_admin_comments
  end
end

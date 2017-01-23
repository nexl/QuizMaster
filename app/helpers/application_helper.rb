module ApplicationHelper
  
  def list_quiz(user_id)
    Quizz.where(:created_by => user_id).collect { | quiz | [quiz.quiz_name, quiz.id]}
  end

  def feedback(message,type)
    if message.present?
      content_tag :div, :id => "feedback-msg" do
        type.eql?('success') ? bootstrap_alert(message, 'success') : bootstrap_alert(message, 'danger')
      end
    end
  end

  def bootstrap_alert(message, type)
    content_tag :div, :class => "alert alert-#{type}" do
      concat content_tag(:a, '&times;'.html_safe, :href => '#' , :class=> "close", :data => { :dismiss => 'alert' })
      concat(message.html_safe)
    end
  end

  def heading_title(message)
    content_tag:div, :class => "row" do
      concat content_tag(:h3, message, :class => "text-center")
    end
  end
end

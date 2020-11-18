module ApplicationHelper
  def bootstrap_paginate data
    will_paginate data, renderer: WillPaginate::ActionView::Bootstrap4LinkRenderer, class: 'my-4 justify-content-between'
  end

  def document_liked?(document)
    klass_name = document.class.name
    like = Like.find_by(user_id: current_user.id, likeable_id: document.id, likeable_type: klass_name)
    like.present? ? true : false    
  end
end

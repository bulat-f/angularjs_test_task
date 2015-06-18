class Post < ActiveRecord::Base
  scope :search, -> (request) do
    if request.blank?
      all
    else
      where('title LIKE ?', "%#{request}%")
    end
  end
end

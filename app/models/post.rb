class Post < ActiveRecord::Base
  validates :title, :body, presence: true

  scope :search, -> (request) do
    if request.blank?
      all
    else
      where('title LIKE ?', "%#{request}%")
    end
  end
end

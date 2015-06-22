class Post < ActiveRecord::Base
  validates :title, :body, :user_id, presence: true

  belongs_to :user

  scope :search, -> (request) do
    if request.blank?
      all
    else
      where('title LIKE ?', "%#{request}%")
    end
  end
end

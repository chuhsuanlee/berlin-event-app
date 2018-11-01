class Event < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 1 }

  def self.search(web_source, date, title)
    if web_source or date or title
      where('web_source LIKE ?', "%#{web_source}%").
      where('date LIKE ?', "%#{date}%").
      where('title LIKE ?', "%#{title}%").
      order('date ASC')
    else
      require 'date'
      where('date >= ?', Date.today).
      order('date ASC')
    end
  end
end

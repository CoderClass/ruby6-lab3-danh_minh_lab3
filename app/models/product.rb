class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true


  def self.alphabetical
    order(name: :asc)
  end

  def discount_amount
    if self.price_vnd > 800000
      (self.price_vnd *= 0.59).round
    elsif self.price_vnd > 200000
      (self.price_vnd *= 0.69).round
    elsif self.price_vnd > 100000
      (self.price_vnd *= 0.79).round
    end
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end
end

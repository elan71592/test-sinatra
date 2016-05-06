class PromoterUser < ActiveRecord::Base
  belongs_to :promoter
  belongs_to :user
end

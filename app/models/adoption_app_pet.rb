class AdoptionAppPet < ApplicationRecord
  belongs_to :adoption_app
  belongs_to :pet

  enum status: { pending: "Pending", approved: "Approved", rejected: "Rejected" }
end
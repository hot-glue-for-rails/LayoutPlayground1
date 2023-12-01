class Thing < ApplicationRecord
  belongs_to :user, optional: true

  enum persona: { admin: 'admin', user: "user" }
  enum expected_result: { success: 'success', failure: 'failure' }
end

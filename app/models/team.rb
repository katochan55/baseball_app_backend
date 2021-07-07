class Team < ApplicationRecord
  has_many :results, class_name: 'TeamResult'

  enum league: { central: 0, pacific: 1 }
end

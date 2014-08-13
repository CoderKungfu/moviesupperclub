class MovieNameLookup < ActiveRecord::Base
  def self.check_name(name)
    correct_name = self.find_by_misspelt(name).try(:name)
    return correct_name.nil? ? name : correct_name
  end
end

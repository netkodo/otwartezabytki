# == Schema Information
#
# Table name: versions
#
#  id             :integer          not null, primary key
#  item_type      :string(255)      not null
#  item_id        :integer          not null
#  event          :string(255)      not null
#  whodunnit      :string(255)
#  object         :text
#  created_at     :datetime
#  object_changes :text
#  comment        :string(255)
#
# Indexes
#
#  index_versions_on_item_type_and_item_id  (item_type,item_id)
#

class RelicVersion < Version
  self.table_name = :versions
  attr_accessible :comment
end

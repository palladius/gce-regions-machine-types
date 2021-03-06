class MachineType < ApplicationRecord
  belongs_to :gce_zone


  #creationTimestamp

  #validates :name,  :presence => true, format: { with: /\A[a-z]+-[a-z]+\d+-[a-z]\z/, 
  #  	message: "Use following format: $CONTINENT-$POSITION$DIGITS-$ALPHA (all lowercase), e.g. 'antarctica-west42-f'"}
  validates :name, uniqueness: { scope: :zone }


  def to_s
  	return "#{name} (#{description}) [#{gce_zone}]"
  end

end

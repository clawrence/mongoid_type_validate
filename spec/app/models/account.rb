class Account
  include Mongoid::Document

  field :name
  field :f_number, type: Float
  field :i_number, type: Integer
  field :t_time, type: Time
  field :dt_time, type: DateTime
end

class Log < ApplicationRecord
  belongs_to :user

  enum action: [
    :created, :updated, :deleted
  ]

  enum model: [
    :archive,
    :volume,
    :client,
    :job
  ]


  def to_s
    "#{user} #{action} on #{created_at}"
  end
end

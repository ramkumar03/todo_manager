class User < ApplicationRecord
  def to_display_user
    "\t |\t #{id}.\t | \t #{name}  \t |\t #{email}"
  end
end

require 'extlib'

class Object
  def present?
    !blank?
  end
end

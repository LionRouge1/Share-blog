module UsersHelper
  def can_be_show?(item)
    item == nil || item.count == 0
  end
end

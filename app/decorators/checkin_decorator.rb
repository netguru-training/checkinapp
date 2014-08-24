class CheckinDecorator < Draper::Decorator
  delegate_all

  def formatted
    "#{place.name}, at #{place.address}"
  end
end

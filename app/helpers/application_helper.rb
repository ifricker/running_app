module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | xRoute"
    end
  end
end

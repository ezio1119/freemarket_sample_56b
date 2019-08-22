module ApplicationHelper
  def simple_time(time)
    time.strftime("%m月%d日 %H:%M")
  end 
end

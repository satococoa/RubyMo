class CalendarController < KalViewController
  def viewDidLoad
    super
    self.title = 'RubyMotion Advent Calendar 2012'
    showAndSelectToday
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    p 'hoge'
  end
end
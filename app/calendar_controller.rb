class CalendarController < KalViewController
  def viewDidLoad
    super
    self.title = 'RubyMotion Advent Calendar 2012'
    showAndSelectToday
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    entry = App.delegate.entries_data_source.entry_at_index_path(index_path)
    @webview ||= NIWebController.new
    navigationController.pushViewController(@webview, animated:true)
    @webview.openURL(NSURL.URLWithString(entry.link))
  end
end
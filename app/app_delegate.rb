class AppDelegate
  attr_reader :entries_data_source
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(App.bounds)
    @entries_data_source = EntriesDataSource.new
    calendar = CalendarController.alloc.initWithDataSource(entries_data_source).tap do |cal|
      cal.tableView.delegate = cal
    end
    navigation = UINavigationController.alloc.initWithRootViewController(calendar)
    @window.rootViewController = navigation
    @window.makeKeyAndVisible
    true
  end
end

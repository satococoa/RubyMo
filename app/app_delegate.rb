class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(App.bounds)
    calendar = CalendarController.alloc.initWithNibName(nil, bundle:nil)
    navigation = UINavigationController.alloc.initWithRootViewController(calendar)
    @window.rootViewController = navigation
    @window.makeKeyAndVisible
    true
  end
end

class CalendarController < UIViewController
  def initWithNibName(nibNameOrNil, bundle:nibBundleOrNil)
    super
    @calendar = TKCalendarMonthView.new.tap do |cal|
      cal.delegate = self
      cal.dataSource = self
    end
    self
  end

  def viewDidLoad
    super
    self.title = 'RubyMotion Advent Calendar 2012'
    view.addSubview(@calendar)
  end
end
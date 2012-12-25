class EntriesDataSource
  FEED_URL = 'http://www.adventar.org/calendars/18.rss'

  def initialize
    @entries = {}
    @items = []
  end

  def fetch_feed(feed, &block)
    parser = BW::RSSParser.new(feed)
    parser.delegate = self
    parser.parse do |item|
      @entries[item.pubDate] = item
    end
  end

  def when_parser_is_done
    @delegate.loadedDataSource(self)
  end

  CELL_ID = 'entry'
  def tableView(table_view, cellForRowAtIndexPath:index_path)
    cell = table_view.dequeueReusableCellWithIdentifier(CELL_ID) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELL_ID)
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell.textLabel.font = UIFont.systemFontOfSize(12)
    cell.textLabel.text = @items[index_path.row].description
    cell
  end

  def tableView(table_view, numberOfRowsInSection:section)
    @items.count
  end

  def entry_at_index_path(index_path)
    @items[index_path.row]
  end

  def presentingDatesFrom(from_date, to:to_date, delegate:delegate)
    @delegate = delegate
    fetch_feed(FEED_URL)
  end

  def markedDatesFrom(from_date, to:to_date)
    @entries.map {|k, v|
      d, m, y = k.split(' ')
      Time.mktime(y, m, d)
    }.select {|t|
      t <= to_date && t >= from_date
    }
  end

  def loadItemsFromDate(from_date, toDate:to_date)
    @items = @entries.select {|k, v|
      d, m, y = k.split(' ')
      time = Time.mktime(y, m, d)
      time <= to_date && time >= from_date
    }.map {|k, v| v}
  end

  def removeAllItems
    @items = []
  end
end
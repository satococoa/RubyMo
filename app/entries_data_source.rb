class EntriesDataSource
  def initialize
    @entries = []
  end

  CELL_ID = 'entry'
  def tableView(table_view, cellForRowAtIndexPath:index_path)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELL_ID)
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell.textLabel.text = 'hogehoge'
    cell
  end

  def tableView(table_view, numberOfRowsInSection:section)
    @entries.count
  end

  def presentingDatesFrom(from_date, to:to_date, delegate:delegate)
    Dispatch::Queue.concurrent.async {
      Dispatch::Queue.main.async {
        delegate.loadedDataSource(self)
      }
    }
  end

  def markedDatesFrom(from_date, to:to_date)
    []
  end

  def loadItemsFromDate(from_date, toDate:to_date)
    []
  end

  def removeAllItems
  end
end
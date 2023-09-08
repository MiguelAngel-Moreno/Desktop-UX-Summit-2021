object AppData: TAppData
  Height = 487
  Width = 719
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 120
    Top = 288
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=\Data\Northwind_small.sqlite'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    LoginPrompt = False
    Left = 120
    Top = 244
  end
  object FullOrderWithDetail_: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      
        '  ord.Id                                        as '#39'OrderNo::int' +
        #39
      
        ', ord.OrderDate                                 as '#39'OrderDate::d' +
        'ate'#39
      
        ', ord.RequiredDate                              as '#39'RequireDate:' +
        ':date'#39
      
        ', ord.ShippedDate                               as '#39'ShippedDate:' +
        ':date'#39
      
        ', ord.CustomerId                                as '#39'CustomerNo::' +
        'char(10)'#39
      
        ', cst.CompanyName                               as '#39'CustomerName' +
        '::char(100)'#39
      
        ', ord.EmployeeId                                as '#39'EmployeeNo::' +
        'int'#39
      
        ', ( emp.FirstName || '#39' '#39' || emp.LastName )      as '#39'EmployeeName' +
        '::char(100)'#39
      
        ', odt.ProductId                                 as '#39'ProductNo::i' +
        'nt'#39
      
        ', prd.ProductName                               as '#39'ProductName:' +
        ':char(100)'#39
      
        ', spl.CompanyName                               as '#39'ProductSuppl' +
        'ier::char(100)'#39
      
        ', odt.Quantity                                  as '#39'Quantity::in' +
        't'#39
      
        ', odt.UnitPrice                                 as '#39'UnitPrice::c' +
        'urrency'#39
      
        ', odt.Discount                                  as '#39'Discount::cu' +
        'rrency'#39
      ', ( odt.Quantity * odt.UnitPrice * ( 1 - odt.Discount )'
      
        '  )                                             as '#39'Ammount::cur' +
        'rency'#39
      'from'
      '  '#39'Order'#39' ord'
      '  left join '#39'OrderDetail'#39' odt on ( odt.OrderId = ord.Id )'
      '  left join '#39'Product'#39' prd on ( prd.Id = odt.ProductId )'
      '  left join '#39'Supplier'#39' spl on ( spl.Id = prd.SupplierId )'
      '  left join '#39'Customer'#39' cst on ( cst.Id = ord.CustomerId )'
      '  left join '#39'Employee'#39' emp on ( emp.Id = ord.EmployeeId )'
      'order by'
      '  '#39'OrderNo::int'#39
      ', '#39'ProductNo::int'#39
      ';')
    Left = 120
    Top = 92
  end
  object dsrFullOrderWithDetail: TDataSource
    DataSet = FullOrderWithDetail_
    Left = 120
    Top = 140
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 292
    Top = 244
  end
end

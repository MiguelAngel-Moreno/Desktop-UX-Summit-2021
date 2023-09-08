object AppData: TAppData
  Height = 456
  Width = 717
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 104
    Top = 248
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=\Data\Northwind_small.sqlite'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    LoginPrompt = False
    Left = 104
    Top = 204
  end
  object Order_: TFDQuery
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
      'from'
      '  '#39'Order'#39' ord'
      '  left join '#39'Customer'#39' cst on ( cst.Id = ord.CustomerId )'
      '  left join '#39'Employee'#39' emp on ( emp.Id = ord.EmployeeId )'
      'order by'
      '  '#39'OrderNo::int'#39
      ';')
    Left = 104
    Top = 60
    object Order_OrderNo: TIntegerField
      FieldName = 'OrderNo'
      Origin = 'OrderNo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Order_OrderDate: TDateField
      FieldName = 'OrderDate'
      Origin = 'OrderDate'
    end
    object Order_RequireDate: TDateField
      FieldName = 'RequireDate'
      Origin = 'RequireDate'
    end
    object Order_ShippedDate: TDateField
      FieldName = 'ShippedDate'
      Origin = 'ShippedDate'
    end
    object Order_CustomerNo: TStringField
      FieldName = 'CustomerNo'
      Origin = 'CustomerNo'
      FixedChar = True
      Size = 10
    end
    object Order_CustomerName: TStringField
      FieldName = 'CustomerName'
      Origin = 'CustomerName'
      FixedChar = True
      Size = 100
    end
    object Order_EmployeeNo: TIntegerField
      FieldName = 'EmployeeNo'
      Origin = 'EmployeeNo'
      Required = True
    end
    object Order_EmployeeName: TStringField
      FieldName = 'EmployeeName'
      Origin = 'EmployeeName'
      FixedChar = True
      Size = 100
    end
  end
  object OrderDetail_: TFDQuery
    Indexes = <
      item
        Active = True
        Name = 'Order_Product_A'
        Fields = 'OrderNo:A;ProductNo:A'
      end
      item
        Active = True
        Name = 'Order_Product_D'
        Fields = 'OrderNo:A;ProductNo:D'
      end>
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      
        '  odt.OrderId                                   as '#39'OrderNo::int' +
        #39
      
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
      
        '  )                                             as '#39'ExtendedAmmo' +
        'unt::currency'#39
      'from'
      '  '#39'OrderDetail'#39' odt'
      '  left join '#39'Product'#39' prd on ( prd.Id = odt.ProductId )'
      '  left join '#39'Supplier'#39' spl on ( spl.Id = prd.SupplierId )'
      'order by'
      '  '#39'OrderNo::int'#39
      ', '#39'ProductNo::int'#39
      ';')
    Left = 176
    Top = 60
    object OrderDetail_OrderNo: TIntegerField
      FieldName = 'OrderNo'
      Origin = 'OrderNo'
      Required = True
    end
    object OrderDetail_ProductNo: TIntegerField
      FieldName = 'ProductNo'
      Origin = 'ProductNo'
      Required = True
    end
    object OrderDetail_ProductName: TStringField
      FieldName = 'ProductName'
      Origin = 'ProductName'
      FixedChar = True
      Size = 100
    end
    object OrderDetail_ProductSupplier: TStringField
      FieldName = 'ProductSupplier'
      Origin = 'ProductSupplier'
      FixedChar = True
      Size = 100
    end
    object OrderDetail_Quantity: TIntegerField
      FieldName = 'Quantity'
      Origin = 'Quantity'
      Required = True
    end
    object OrderDetail_UnitPrice: TCurrencyField
      FieldName = 'UnitPrice'
      Origin = 'UnitPrice'
      Required = True
    end
    object OrderDetail_Discount: TCurrencyField
      FieldName = 'Discount'
      Origin = 'Discount'
      Required = True
    end
    object OrderDetail_ExtendedAmmount: TCurrencyField
      FieldName = 'ExtendedAmmount'
      Origin = 'ExtendedAmmount'
    end
  end
  object dsrOrderDetail: TDataSource
    DataSet = OrderDetail_
    Left = 176
    Top = 108
  end
  object dsrOrder: TDataSource
    DataSet = Order_
    Left = 104
    Top = 108
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 276
    Top = 204
  end
end

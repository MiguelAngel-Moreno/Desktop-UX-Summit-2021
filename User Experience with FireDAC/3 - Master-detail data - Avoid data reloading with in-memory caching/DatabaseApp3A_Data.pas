unit DatabaseApp3A_Data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI;

type
  TAppData = class(TDataModule)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Order_: TFDQuery;
    Order_OrderNo: TIntegerField;
    Order_OrderDate: TDateField;
    Order_RequireDate: TDateField;
    Order_ShippedDate: TDateField;
    Order_CustomerNo: TStringField;
    Order_CustomerName: TStringField;
    Order_EmployeeNo: TIntegerField;
    Order_EmployeeName: TStringField;
    OrderDetail_: TFDQuery;
    OrderDetail_OrderNo: TIntegerField;
    OrderDetail_ProductNo: TIntegerField;
    OrderDetail_ProductName: TStringField;
    OrderDetail_ProductSupplier: TStringField;
    OrderDetail_Quantity: TIntegerField;
    OrderDetail_UnitPrice: TCurrencyField;
    OrderDetail_Discount: TCurrencyField;
    OrderDetail_Ammount: TCurrencyField;
    dsrOrderDetail: TDataSource;
    dsrOrder: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AppData: TAppData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

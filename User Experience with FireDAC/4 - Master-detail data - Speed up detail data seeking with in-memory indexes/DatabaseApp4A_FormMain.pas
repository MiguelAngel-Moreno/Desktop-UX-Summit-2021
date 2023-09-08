unit DatabaseApp4A_FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TAppFormMain = class(TForm)
    PanelTop: TPanel;
    StatusBar1: TStatusBar;
    PanelData: TPanel;
    DBGridOrderDetail: TDBGrid;
    DBNavigatorOrders: TDBNavigator;
    ActionList1: TActionList;
    ButtonLoadData: TSpeedButton;
    ActionLoadData: TAction;
    ActionCloseData: TAction;
    ButtonCloseData: TSpeedButton;
    ActionStartup: TAction;
    Splitter1: TSplitter;
    DBGridOrders: TDBGrid;
    DBNavigatorOrderDetail: TDBNavigator;
    ButtonToggleIndex: TSpeedButton;
    ActionToggleIndex: TAction;
    DataSourceOrderDetail: TDataSource;
    DataSourceOrders: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionLoadDataExecute(Sender: TObject);
    procedure ActionLoadDataUpdate(Sender: TObject);
    procedure ActionCloseDataExecute(Sender: TObject);
    procedure ActionCloseDataUpdate(Sender: TObject);
    procedure ActionStartupExecute(Sender: TObject);
    procedure ActionToggleIndexExecute(Sender: TObject);
    procedure ActionToggleIndexUpdate(Sender: TObject);
  private
    FTotalRecordCount: Integer;
    FLoadingData: Boolean;
    FStartLoadTime: TDateTime;
    FFinishLoadTime: TDateTime;
    procedure UpdateStatusBar;
  public
    { Public declarations }
  end;

var
  AppFormMain: TAppFormMain;

implementation

{$R *.dfm}

uses
  DateUtils,
  DatabaseApp4A_Data;

procedure TAppFormMain.ActionCloseDataExecute(Sender: TObject);
begin
  AppData.OrderDetail_.Close;
  AppData.OrderDetail_.MasterSource := nil;
  AppData.Order_.Close;
  FTotalRecordCount := 0;
  UpdateStatusBar;
end;

procedure TAppFormMain.ActionCloseDataUpdate(Sender: TObject);
begin
  ActionCloseData.Enabled := AppData.Order_.Active;
end;


const
  DatabasePath = '..\Data\Northwind_huge.sqlite';
  OrderDetail_Index_A = 'Order_Product_A';
  OrderDetail_Index_D = 'Order_Product_D';

procedure TAppFormMain.ActionLoadDataExecute(Sender: TObject);
begin
  FLoadingData := True;
  UpdateStatusBar;
  FStartLoadTime := Now;
  try
    AppData.FDConnection1.Params.Database := DatabasePath;
    AppData.FDConnection1.Open;
    AppData.Order_.Open;
    AppData.OrderDetail_.Open;
    AppData.OrderDetail_.IndexName := OrderDetail_Index_A;
    AppData.OrderDetail_.MasterFields := 'OrderNo';
    AppData.OrderDetail_.MasterSource := AppData.dsrOrder;
    FTotalRecordCount := AppData.Order_.RecordCount;
  finally
    FFinishLoadTime := Now;
    FLoadingData := False;
  end;
  UpdateStatusBar;
end;

procedure TAppFormMain.ActionLoadDataUpdate(Sender: TObject);
begin
  if ActionStartup.Enabled then
  begin
    ActionStartup.Enabled := False;
    ActionStartupExecute( nil );
  end;
  ActionLoadData.Enabled := not AppData.Order_.Active;
end;

procedure TAppFormMain.ActionStartupExecute(Sender: TObject);
begin
  ActionLoadDataExecute( nil );
end;

procedure TAppFormMain.ActionToggleIndexExecute(Sender: TObject);
begin
  if AppData.OrderDetail_.IndexName = OrderDetail_Index_A then
    AppData.OrderDetail_.IndexName := OrderDetail_Index_D
  else
    AppData.OrderDetail_.IndexName := OrderDetail_Index_A;
end;

procedure TAppFormMain.ActionToggleIndexUpdate(Sender: TObject);
begin
  ActionToggleIndex.Enabled := AppData.OrderDetail_.Active;
end;

procedure TAppFormMain.FormCreate(Sender: TObject);
begin
  FLoadingData := False;
  ActionStartup.Enabled := True;
end;

procedure TAppFormMain.FormShow(Sender: TObject);
begin
  FFinishLoadTime := Now;
  UpdateStatusBar;
end;

procedure TAppFormMain.UpdateStatusBar;
const
  StatusBarFmtNormal = ' Total Records:  %.0n   |   Time to load data: %.1f sec';
  StatusBarFmtLoading = ' Loading application data.  Please wait ...';
begin
  if FLoadingData then
    StatusBar1.SimpleText := StatusBarFmtLoading
  else
  begin
    var LTimeToLoad := SecondSpan( FFinishLoadTime, FStartLoadTime );
    StatusBar1.SimpleText := Format( StatusBarFmtNormal, [ Double( FTotalRecordCount ), LTimeToLoad ]);
  end;
  StatusBar1.Repaint;
end;

end.

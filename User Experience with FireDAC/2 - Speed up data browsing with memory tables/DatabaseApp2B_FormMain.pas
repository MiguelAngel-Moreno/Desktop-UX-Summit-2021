unit DatabaseApp2B_FormMain;

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
    DBGridFullOrderWithDetails: TDBGrid;
    DBNavigatorFullOrderWithDetails: TDBNavigator;
    ActionList1: TActionList;
    ButtonLoadData: TSpeedButton;
    ActionLoadData: TAction;
    ActionCloseData: TAction;
    ButtonCloseData: TSpeedButton;
    ActionStartup: TAction;
    DataSourceOrderWithDetail: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionLoadDataExecute(Sender: TObject);
    procedure ActionLoadDataUpdate(Sender: TObject);
    procedure ActionCloseDataExecute(Sender: TObject);
    procedure ActionCloseDataUpdate(Sender: TObject);
    procedure ActionStartupExecute(Sender: TObject);
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
  DatabaseApp2B_Data;

procedure TAppFormMain.ActionCloseDataExecute(Sender: TObject);
begin
  AppData.FullOrderWithDetail_.Close;
  FTotalRecordCount := 0;
  UpdateStatusBar;
end;

procedure TAppFormMain.ActionCloseDataUpdate(Sender: TObject);
begin
  ActionCloseData.Enabled := AppData.FullOrderWithDetail_.Active;
end;

procedure TAppFormMain.ActionLoadDataExecute(Sender: TObject);
const
  DatabasePath = '..\Data\Northwind_huge.sqlite';
begin
  FLoadingData := True;
  UpdateStatusBar;
  FStartLoadTime := Now;
  try
    AppData.FDConnection1.Params.Database := DatabasePath;
    AppData.FDConnection1.Open;
    AppData.FullOrderWithDetail_.Open;
    FTotalRecordCount := AppData.FullOrderWithDetail_.RecordCount;
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
  ActionLoadData.Enabled := not AppData.FullOrderWithDetail_.Active;
end;

procedure TAppFormMain.ActionStartupExecute(Sender: TObject);
begin
  ActionLoadDataExecute( nil );
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

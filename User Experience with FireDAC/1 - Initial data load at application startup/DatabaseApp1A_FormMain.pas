unit DatabaseApp1A_FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TAppFormMain = class(TForm)
    PanelTop: TPanel;
    StatusBar1: TStatusBar;
    PanelData: TPanel;
    DBGridFullOrderWithDetails: TDBGrid;
    DBNavigatorFullOrderWithDetails: TDBNavigator;
    DataSourceOrderWithDetail: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FTotalRecordCount: Integer;
    FStartTime: TDateTime;
    FShowOnScreenTime: TDateTime;
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
  DatabaseApp1A_Data;

procedure TAppFormMain.FormCreate(Sender: TObject);
const
  DatabasePath = '..\Data\Northwind_huge.sqlite';
begin
  FStartTime := Now;
  AppData.FDConnection1.Params.Database := DatabasePath;
  AppData.FDConnection1.Open;
  AppData.FullOrderWithDetail_.Open;
  FTotalRecordCount := AppData.FullOrderWithDetail_.RecordCount;
end;

procedure TAppFormMain.FormShow(Sender: TObject);
begin
  FShowOnScreenTime := Now;
  UpdateStatusBar;
end;

procedure TAppFormMain.UpdateStatusBar;
const
  StatusBarFmt = ' Total Records:  %.0n   |   Time to show on screen: %.1f sec';
begin
  var LTimeToShow := SecondSpan( FShowOnScreenTime, FStartTime );
  StatusBar1.SimpleText := Format( StatusBarFmt, [ Double( FTotalRecordCount ), LTimeToShow ]);
  StatusBar1.Repaint;
end;

end.

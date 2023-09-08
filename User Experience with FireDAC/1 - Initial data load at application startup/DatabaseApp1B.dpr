program DatabaseApp1B;

uses
  Vcl.Forms,
  DatabaseApp1B_FormMain in 'DatabaseApp1B_FormMain.pas' {AppFormMain},
  DatabaseApp1B_Data in 'DatabaseApp1B_Data.pas' {AppData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TAppFormMain, AppFormMain);
  Application.Run;
end.

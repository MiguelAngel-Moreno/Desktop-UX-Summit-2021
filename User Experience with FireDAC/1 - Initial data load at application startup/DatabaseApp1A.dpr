program DatabaseApp1A;

uses
  Vcl.Forms,
  DatabaseApp1A_FormMain in 'DatabaseApp1A_FormMain.pas' {AppFormMain},
  DatabaseApp1A_Data in 'DatabaseApp1A_Data.pas' {AppData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TAppFormMain, AppFormMain);
  Application.Run;
end.

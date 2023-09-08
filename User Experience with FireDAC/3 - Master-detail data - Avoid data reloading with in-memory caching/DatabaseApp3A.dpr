program DatabaseApp3A;

uses
  Vcl.Forms,
  DatabaseApp3A_FormMain in 'DatabaseApp3A_FormMain.pas' {AppFormMain},
  DatabaseApp3A_Data in 'DatabaseApp3A_Data.pas' {AppData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TAppFormMain, AppFormMain);
  Application.Run;
end.

program DatabaseApp4A;

uses
  Vcl.Forms,
  DatabaseApp4A_FormMain in 'DatabaseApp4A_FormMain.pas' {AppFormMain},
  DatabaseApp4A_Data in 'DatabaseApp4A_Data.pas' {AppData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TAppFormMain, AppFormMain);
  Application.Run;
end.

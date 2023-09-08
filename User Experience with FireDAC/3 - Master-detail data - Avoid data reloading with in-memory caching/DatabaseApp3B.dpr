program DatabaseApp3B;

uses
  Vcl.Forms,
  DatabaseApp3B_FormMain in 'DatabaseApp3B_FormMain.pas' {AppFormMain},
  DatabaseApp3B_Data in 'DatabaseApp3B_Data.pas' {AppData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TAppFormMain, AppFormMain);
  Application.Run;
end.

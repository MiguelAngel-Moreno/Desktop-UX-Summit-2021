program DatabaseApp2A;

uses
  Vcl.Forms,
  DatabaseApp2A_FormMain in 'DatabaseApp2A_FormMain.pas' {AppFormMain},
  DatabaseApp2A_Data in 'DatabaseApp2A_Data.pas' {AppData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TAppFormMain, AppFormMain);
  Application.Run;
end.

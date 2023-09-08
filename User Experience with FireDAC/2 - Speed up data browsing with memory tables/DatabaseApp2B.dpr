program DatabaseApp2B;

uses
  Vcl.Forms,
  DatabaseApp2B_FormMain in 'DatabaseApp2B_FormMain.pas' {AppFormMain},
  DatabaseApp2B_Data in 'DatabaseApp2B_Data.pas' {AppData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TAppFormMain, AppFormMain);
  Application.Run;
end.

program RugbyManager_p;

uses
  Forms,
  RugbyManager_u in 'RugbyManager_u.pas' {RugbyTeamManager};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRugbyTeamManager, RugbyTeamManager);
  Application.Run;
end.

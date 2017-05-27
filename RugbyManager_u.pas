unit RugbyManager_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, ADODB, Mask, DBCtrls, Grids,
  DBGrids, Buttons;

type
  TRugbyTeamManager = class(TForm)
    tcMain: TPageControl;
    WelcomePage: TTabSheet;
    LoginSignUp: TPanel;
    lblLogin: TLabel;
    lblSignup: TLabel;
    edtLoginName: TEdit;
    edtLoginPass: TEdit;
    edtSignUpPassword: TEdit;
    btnLogin: TButton;
    btnSignUp: TButton;
    dbConnect: TADOConnection;
    dbedtUserName: TDBEdit;
    dsUsers: TDataSource;
    tblTeams: TADOTable;
    tblUsers: TADOTable;
    tblPlayers: TADOTable;
    dsTeams: TDataSource;
    dsPlayers: TDataSource;
    dbedtEmail: TDBEdit;
    lblWelcome: TLabel;
    bmbLogout: TBitBtn;
    StatsPage: TTabSheet;
    gbUserInfo: TGroupBox;
    lblStats: TLabel;
    lblUsrName: TLabel;
    lblUsrEmail: TLabel;
    lblUsrPass: TLabel;
    btnPassChange: TButton;
    gpGlobalStats: TGroupBox;
    lblNumPlayers: TLabel;
    dbQuery: TADOQuery;
    lblNumTeams: TLabel;
    lblNumUsers: TLabel;
    lblGamesPlayedTotal: TLabel;
    lblLeadingTeam: TLabel;
    bmbRefresh: TBitBtn;
    ManagerPage: TTabSheet;
    lblManager: TLabel;
    btnEdtTeams: TButton;
    btnEdtPlayers: TButton;
    dbgManager: TDBGrid;
    dbnManager: TDBNavigator;
    NewGamePage: TTabSheet;
    lblAddGame: TLabel;
    lblStatLabel: TLabel;
    gbFirstTeam: TGroupBox;
    cbTeams: TComboBox;
    lblNameTeam: TLabel;
    Label2: TLabel;
    lblScoredLabel: TLabel;
    cbPlayerSelect: TComboBox;
    lblTries: TLabel;
    btnAddTries: TButton;
    cbLosingTeam: TComboBox;
    lblLosingTeam: TLabel;
    btnAddGame: TButton;
    AddTeamPage: TTabSheet;
    lblAddTeam: TLabel;
    btnStartWizzard: TButton;
    lblStartWizzard: TLabel;
    pnlAddPlayers: TPanel;
    Label3: TLabel;
    dbedtSurname: TDBEdit;
    dbedtTriesScored: TDBEdit;
    dbedtPlayerEmail: TDBEdit;
    dbedtCellphone: TDBEdit;
    dbedtName: TDBEdit;
    lblName: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    rbCaptain: TRadioButton;
    btnAddPlayer: TButton;
    btnDonePlayers: TButton;
    dtpPlayerDOB: TDateTimePicker;
    edtNumTriesScored: TEdit;
    lblEditorLabel: TLabel;
    gbPlayerInfo: TGroupBox;
    cbPlayerStatSelect: TComboBox;
    Label1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    lblPlayerInfoTeam: TLabel;
    lblIntro: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    reIntro: TRichEdit;
    procedure edtLoginNameClick(Sender: TObject);
    procedure edtLoginPassClick(Sender: TObject);
    procedure edtSignUpPasswordClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure dbedtUserNameClick(Sender: TObject);
    procedure dbedtEmailClick(Sender: TObject);
    procedure ResetForm;
    procedure bmbLogoutClick(Sender: TObject);
    procedure btnPassChangeClick(Sender: TObject);
    procedure GetStats;
    procedure btnEdtTeamsClick(Sender: TObject);
    procedure btnEdtPlayersClick(Sender: TObject);
    procedure bmbRefreshClick(Sender: TObject);
    procedure tcMainChange(Sender: TObject);
    procedure btnAddGameClick(Sender: TObject);
    procedure btnStartWizzardClick(Sender: TObject);
    procedure btnAddTriesClick(Sender: TObject);
    procedure btnAddPlayerClick(Sender: TObject);
    procedure btnDonePlayersClick(Sender: TObject);
    procedure cbPlayerStatSelectChange(Sender: TObject);
  private
    { Private declarations }
    sUserName, sEmail : String;
  public
    { Public declarations }
  end;

var
  RugbyTeamManager: TRugbyTeamManager;

implementation

{$R *.dfm}

procedure TRugbyTeamManager.ResetForm();
begin
  GetStats;
  LoginSignUp.Visible := True;
  tcMain.Visible := False;
  bmbLogout.Visible := False;
  RugbyTeamManager.Height := 387;
  RugbyTeamManager.Width := 667;
  with tblUsers do
    begin
      Cancel;
      Insert;
      FieldByName('LoginName').Value := 'User Name';
      FieldByName('Email').Value := 'E-Mail Address';
    end;
  edtLoginName.Text := 'User Name';
  edtLoginPass.Text := 'Password';
  edtSignUpPassword.Text := 'Password';
  tcMain.TabIndex := 0;
end;

function PasswordEncrypt(sNormalPassword: String) : String;
var
  sEncryptedPassword, sEncryptedCharValue : String;
  cPasswordChar: Char;
  iCharPtr : Integer;
begin
  sEncryptedPassword := '';
  for iCharPtr := 1 to Length(sNormalPassword) do
  begin
    cPasswordChar := sNormalPassword[iCharPtr];
    sEncryptedCharValue := IntToStr(Ord(cPasswordChar) * 5 + 14);
    sEncryptedPassword := sEncryptedPassword + sEncryptedCharValue;
    Result := sEncryptedPassword;
  end;
end;

procedure TRugbyTeamManager.edtLoginNameClick(Sender: TObject);
begin
  edtLoginName.Text := '';
end;

procedure TRugbyTeamManager.edtLoginPassClick(Sender: TObject);
begin
  edtLoginPass.Text := '';
end;

procedure TRugbyTeamManager.edtSignUpPasswordClick(Sender: TObject);
begin
  edtSignUpPassword.Text := '';
end;

procedure TRugbyTeamManager.FormCreate(Sender: TObject);
begin
  ResetForm;
  dbConnect.Connected := True;
  tblPlayers.Active := True;
  tblUsers.Active := True;
  tblTeams.Active := True;
end;

procedure TRugbyTeamManager.btnLoginClick(Sender: TObject);
begin
  tblUsers.Cancel;
  tblUsers.Filtered := True;
  tblUsers.Filter := 'LoginName = ''' + edtLoginName.Text + '''';
  try
    if (tblUsers.FieldByName('PasswordHash').Value) = (PasswordEncrypt(edtLoginPass.Text)) then
       begin
          LoginSignUp.Visible := False;
          sUserName := edtLoginName.Text;
          tcMain.Visible := True;
          lblWelcome.Caption := 'Welcome ' + sUserName + '!';
          bmbLogout.Visible := True;
          sEmail := tblUsers.FieldByName('Email').Value;
          lblUsrName.Caption := 'Username: ' + sUserName;
          lblUsrEmail.Caption := 'E-Mail: ' + sEmail;
        end
      else
        begin
          Showmessage('Wrong username or password!');
        end;
  except
    Showmessage('Wrong username or password!');
  end;
  tblUsers.Filtered := False;
end;

procedure TRugbyTeamManager.btnSignUpClick(Sender: TObject);
begin
  tblUsers.FieldByName('PasswordHash').Value := PasswordEncrypt(edtSignUpPassword.Text);
  try
    sUserName := tblUsers.FieldByName('LoginName').Value;
    tblUsers.Post;
    LoginSignUp.Visible := False;
    tcMain.Visible := True;
    lblWelcome.Caption := 'Welcome ' + sUserName + '!';
    bmbLogout.Visible := True;
  except
    Showmessage('Please fill in all the fields or try a different username.');
    ResetForm;
  end;
end;

procedure TRugbyTeamManager.dbedtUserNameClick(Sender: TObject);
begin
  tblUsers.FieldByName('LoginName').Value := '';
end;

procedure TRugbyTeamManager.dbedtEmailClick(Sender: TObject);
begin
  tblUsers.FieldByName('Email').Value := '';
end;

procedure TRugbyTeamManager.bmbLogoutClick(Sender: TObject);
begin
  ResetForm;
end;

procedure TRugbyTeamManager.btnPassChangeClick(Sender: TObject);
var
  sNewPass : String;
begin
  sNewPass := '';
  repeat
    sNewPass := InputBox('Enter New Password','Please enter your new password','');
  until NOT(sNewPass = '');
  tblUsers.Filtered := True;
  tblUsers.Filter := 'LoginName = ''' + sUserName + '''';
  tblUsers.Delete;
  tblUsers.Insert;
  tblUsers.FieldByName('LoginName').Value := sUserName;
  tblUsers.FieldByName('PasswordHash').Value := PasswordEncrypt(sNewPass);
  tblUsers.FieldByName('Email').Value := sEmail;
  tblUsers.Post;
end;

procedure TRugbyTeamManager.GetStats();
var
  iNum : Integer;
  sName : String;
begin
  dbQuery.SQL.Text := 'SELECT Count(*) FROM Players;';
  dbQuery.Open;
  dbQuery.ExecSQL;
  iNum := dbQuery.Fields[0].AsInteger;
  lblNumPlayers.Caption := 'Total Players: ' + IntToStr(iNum);
  dbQuery.Close;
  dbQuery.SQL.Text := 'SELECT Count(*) FROM Teams;';
  dbQuery.Open;
  dbQuery.ExecSQL;
  iNum := dbQuery.Fields[0].AsInteger;
  lblNumTeams.Caption := 'Total Teams: ' + IntToStr(iNum);
  dbQuery.Close;
  dbQuery.SQL.Text := 'SELECT Count(*) FROM Users;';
  dbQuery.Open;
  dbQuery.ExecSQL;
  iNum := dbQuery.Fields[0].AsInteger;
  lblNumUsers.Caption := 'Total Users: ' + IntToStr(iNum);
  tblTeams.Filtered := False;
  tblTeams.First;
  iNum := 0;
  repeat
    iNum := iNum + tblTeams.FieldByName('GamesPlayed').Value;
    tblTeams.Next;
  until tblTeams.Eof;
  lblGamesPlayedTotal.Caption := 'Total Games Played: ' + IntToStr(iNum);
  tblTeams.First;
  iNum := 0;
  repeat
    if tblTeams.FieldByName('GamesWon').Value > iNum then
      begin
        iNum := tblTeams.FieldByName('GamesWon').Value;
        sName := tblTeams.FieldByName('Name').Value;
      end;
    tblTeams.Next;
  until tblTeams.Eof;
  lblLeadingTeam.Caption := 'Leading Team: ' + sName;
end;

procedure TRugbyTeamManager.btnEdtTeamsClick(Sender: TObject);
var
  I : Integer;
begin
  btnEdtTeams.Enabled := False;
  btnEdtPlayers.Enabled := True;
  dbnManager.Enabled := True;
  dbgManager.Enabled := True;
  dbnManager.DataSource := dsTeams;
  dbgManager.DataSource := dsTeams;
  for I := 0 to dbgManager.Columns.Count - 1 do
    dbgManager.Columns[i].Width := 5 + dbgManager.Canvas.TextWidth(dbgManager.Columns[i].title.caption)
end;

procedure TRugbyTeamManager.btnEdtPlayersClick(Sender: TObject);
var
  I : Integer;
begin
  btnEdtTeams.Enabled := True;
  btnEdtPlayers.Enabled := False;
  dbnManager.Enabled := True;
  dbgManager.Enabled := True;
  dbnManager.DataSource := dsPlayers;
  dbgManager.DataSource := dsPlayers;
  for I := 0 to dbgManager.Columns.Count - 1 do
    dbgManager.Columns[i].Width := 5 + dbgManager.Canvas.TextWidth(dbgManager.Columns[i].title.caption)
end;

procedure TRugbyTeamManager.bmbRefreshClick(Sender: TObject);
begin
  GetStats;
end;

procedure TRugbyTeamManager.tcMainChange(Sender: TObject);
begin
  tblTeams.Filtered := False;
  tblPlayers.Filtered := False;
  tblTeams.First;
  cbTeams.Items.Clear;
  cbLosingTeam.Items.Clear;
  cbPlayerSelect.Items.Clear;
  cbPlayerStatSelect.Items.Clear;
  repeat
    cbTeams.AddItem(tblTeams.FieldByName('Name').Value, cbTeams);
    cbLosingTeam.AddItem(tblTeams.FieldByName('Name').Value, cbTeams);
    tblTeams.Next;
  until tblTeams.Eof;
  tblPlayers.First;
  repeat
    cbPlayerSelect.AddItem(tblPlayers.FieldByName('Name').Value, cbPlayerSelect);
    cbPlayerStatSelect.AddItem(tblPlayers.FieldByName('Name').Value, cbPlayerSelect);
    tblPlayers.Next;
  until tblPlayers.Eof;
end;

procedure TRugbyTeamManager.btnAddGameClick(Sender: TObject);
begin
  tblTeams.Filtered := True;
  tblTeams.Filter := 'Name = ''' + cbTeams.Text + '''';
  tblTeams.Edit;
  tblTeams.FieldByName('GamesPlayed').Value := tblTeams.FieldByName('GamesPlayed').Value + 1;
  tblTeams.FieldByName('GamesWon').Value := tblTeams.FieldByName('GamesWon').Value + 1;
  tblTeams.Post;
  tblTeams.Filter := 'Name = ''' + cbLosingTeam.Text + '''';
  tblTeams.Edit;
  tblTeams.FieldByName('GamesPlayed').Value := tblTeams.FieldByName('GamesPlayed').Value + 1;
  tblTeams.Post;
end;

procedure TRugbyTeamManager.btnStartWizzardClick(Sender: TObject);
begin
  Showmessage('Welcome to the ''Add Team'' Wizzard! Follow the instructions to add your team, click ok to continue.');
  with tblTeams do
    begin
      Insert;
      FieldByName('Name').Value := InputBox('Add Team Wizzard','What is the name of your team?','');
      FieldByName('GamesWon').Value := InputBox('Add Team Wizzard','How many games have your team won?','');
      FieldByName('GamesPlayed').Value := InputBox('Add Team Wizzard','How many games have your team played?','');
      FieldByName('City').Value := InputBox('Add Team Wizzard','In what city is your team located?','');
      FieldByName('Province').Value := InputBox('Add Team Wizzard','In what province is your team located?','');
      FieldByName('CaptainID').Value := 0;
      Post;
    end;
  tblTeams.Last;
  Showmessage('Please use the following form to add players to your team, click the done button whenyou are finished.');
  pnlAddPlayers.Visible := True;
  tblPlayers.Last;
  tblPlayers.Insert;
  rbCaptain.Visible := True;
end;

procedure TRugbyTeamManager.btnAddTriesClick(Sender: TObject);
begin
  tblPlayers.Filtered := True;
  tblPlayers.Filter := 'Name = ''' + cbPlayerSelect.Text + '''';
  tblPlayers.Edit;
  tblPlayers.FieldByName('TriesScored').Value := tblPlayers.FieldByName('TriesScored').Value + StrToInt(edtNumTriesScored.Text);
  tblPlayers.Post;
end;

procedure TRugbyTeamManager.btnAddPlayerClick(Sender: TObject);
begin
  tblTeams.Filtered := False;
  tblTeams.Last;
  tblPlayers.FieldByName('DateOfBirth').Value := dtpPlayerDOB.DateTime;
  tblPlayers.FieldByName('TeamID').Value := tblTeams.FieldByName('TeamID').Value;
  tblPlayers.Post;
  if rbCaptain.Checked then
    begin
      tblTeams.Edit;
      tblTeams.FieldByName('CaptainID').Value := tblPlayers.FieldByName('PlayerID').Value;
      tblTeams.Post;
      rbCaptain.Visible := False;
    end;
  tblPlayers.Insert;
end;

procedure TRugbyTeamManager.btnDonePlayersClick(Sender: TObject);
begin
  tblPlayers.Cancel;
  pnlAddPlayers.Visible := False;
  ShowMessage('Your team was successfully added!');
  tblPlayers.Filtered := False;
  tblTeams.Filtered := False;
end;

procedure TRugbyTeamManager.cbPlayerStatSelectChange(Sender: TObject);
begin
  tblPlayers.Filtered := True;
  tblPlayers.Filter := 'Name = ''' + cbPlayerStatSelect.Text + '''';
  tblTeams.Filtered := True;
  tblTeams.Filter := 'TeamID = ''' + FloatToStr(tblPlayers.FieldByName('TeamID').Value) + '''';
  lblPlayerInfoTeam.Caption := tblTeams.FieldByName('Name').Value;
end;

end.










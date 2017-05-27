object RugbyTeamManager: TRugbyTeamManager
  Left = 357
  Top = 166
  Width = 725
  Height = 388
  Caption = 'Rugby Team Manager'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    709
    349)
  PixelsPerInch = 96
  TextHeight = 13
  object Label15: TLabel
    Left = 40
    Top = 16
    Width = 38
    Height = 13
    Caption = 'Label15'
  end
  object LoginSignUp: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 349
    Align = alClient
    TabOrder = 1
    object lblLogin: TLabel
      Left = 136
      Top = 80
      Width = 30
      Height = 13
      Caption = 'Log In'
    end
    object lblSignup: TLabel
      Left = 361
      Top = 80
      Width = 38
      Height = 13
      Caption = 'Sign Up'
    end
    object edtLoginName: TEdit
      Left = 136
      Top = 112
      Width = 161
      Height = 21
      TabOrder = 0
      Text = 'User Name'
      OnClick = edtLoginNameClick
    end
    object edtLoginPass: TEdit
      Left = 136
      Top = 144
      Width = 161
      Height = 21
      TabOrder = 1
      Text = 'Password'
      OnClick = edtLoginPassClick
    end
    object edtSignUpPassword: TEdit
      Left = 361
      Top = 176
      Width = 161
      Height = 21
      TabOrder = 2
      Text = 'Password'
      OnClick = edtSignUpPasswordClick
    end
    object btnLogin: TButton
      Left = 136
      Top = 208
      Width = 115
      Height = 25
      Caption = 'Login'
      TabOrder = 3
      OnClick = btnLoginClick
    end
    object btnSignUp: TButton
      Left = 361
      Top = 208
      Width = 115
      Height = 25
      Caption = 'Sign Up'
      TabOrder = 4
      OnClick = btnSignUpClick
    end
    object dbedtUserName: TDBEdit
      Left = 360
      Top = 112
      Width = 161
      Height = 21
      DataField = 'LoginName'
      DataSource = dsUsers
      TabOrder = 5
      OnClick = dbedtUserNameClick
    end
    object dbedtEmail: TDBEdit
      Left = 361
      Top = 144
      Width = 161
      Height = 21
      DataField = 'Email'
      DataSource = dsUsers
      TabOrder = 6
      OnClick = dbedtEmailClick
    end
  end
  object tcMain: TPageControl
    Left = 0
    Top = 0
    Width = 709
    Height = 349
    ActivePage = WelcomePage
    Align = alClient
    TabOrder = 0
    Visible = False
    OnChange = tcMainChange
    object WelcomePage: TTabSheet
      Caption = 'Welcome'
      object lblWelcome: TLabel
        Left = 8
        Top = 8
        Width = 208
        Height = 46
        Caption = 'lblWelcome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblIntro: TLabel
        Left = 8
        Top = 48
        Width = 272
        Height = 13
        Caption = 'Welcome to The Rugby Team Manager by Kobus Kruger!'
      end
      object reIntro: TRichEdit
        Left = 8
        Top = 72
        Width = 681
        Height = 233
        Lines.Strings = (
          'Welcome to the Rugby Team Manager application by Kobus Kruger!'
          ''
          
            'This program aloows the user to manage rugby teams and players. ' +
            'The program includes an Add Team Wizzard to easily add teams and' +
            ' team '
          'members to the database.'
          
            'The Stats page also allows the user to quickly view various stat' +
            's from the database and for other situations the Editor page all' +
            'ows the user to '
          'edit the database directly.'
          ''
          'Click on one of the tabs above to get started.')
        TabOrder = 0
      end
    end
    object StatsPage: TTabSheet
      Caption = 'Stats'
      ImageIndex = 1
      object lblStats: TLabel
        Left = 8
        Top = 8
        Width = 161
        Height = 46
        Caption = 'Statistics'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 48
        Width = 242
        Height = 13
        Caption = 'Here you can view various stats from the database.'
      end
      object gbUserInfo: TGroupBox
        Left = 200
        Top = 72
        Width = 185
        Height = 105
        Caption = 'User Information'
        TabOrder = 0
        object lblUsrName: TLabel
          Left = 8
          Top = 16
          Width = 54
          Height = 13
          Caption = 'Username: '
        end
        object lblUsrEmail: TLabel
          Left = 8
          Top = 40
          Width = 35
          Height = 13
          Caption = 'E-Mail: '
        end
        object lblUsrPass: TLabel
          Left = 8
          Top = 64
          Width = 52
          Height = 13
          Caption = 'Password: '
        end
        object btnPassChange: TButton
          Left = 72
          Top = 64
          Width = 75
          Height = 17
          Caption = 'Change'
          TabOrder = 0
          OnClick = btnPassChangeClick
        end
      end
      object gpGlobalStats: TGroupBox
        Left = 8
        Top = 72
        Width = 185
        Height = 153
        Caption = 'Global Stats'
        TabOrder = 1
        object lblNumPlayers: TLabel
          Left = 8
          Top = 16
          Width = 67
          Height = 13
          Caption = 'Total Players: '
        end
        object lblNumTeams: TLabel
          Left = 8
          Top = 40
          Width = 65
          Height = 13
          Caption = 'Total Teams: '
        end
        object lblNumUsers: TLabel
          Left = 8
          Top = 64
          Width = 60
          Height = 13
          Caption = 'Total Users: '
        end
        object lblGamesPlayedTotal: TLabel
          Left = 8
          Top = 88
          Width = 101
          Height = 13
          Caption = 'Total Games Played: '
        end
        object lblLeadingTeam: TLabel
          Left = 8
          Top = 112
          Width = 74
          Height = 13
          Caption = 'Leading Team: '
        end
      end
      object bmbRefresh: TBitBtn
        Left = 184
        Top = 22
        Width = 75
        Height = 24
        Caption = '&Refresh'
        TabOrder = 2
        OnClick = bmbRefreshClick
        Kind = bkRetry
      end
      object gbPlayerInfo: TGroupBox
        Left = 392
        Top = 72
        Width = 289
        Height = 193
        Caption = 'Player Info'
        TabOrder = 3
        DesignSize = (
          289
          193)
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 65
          Height = 13
          Caption = 'Select Player:'
        end
        object Label9: TLabel
          Left = 8
          Top = 40
          Width = 48
          Height = 13
          Caption = 'Surname: '
        end
        object Label10: TLabel
          Left = 8
          Top = 64
          Width = 66
          Height = 13
          Caption = 'Tries Scored: '
        end
        object Label11: TLabel
          Left = 8
          Top = 88
          Width = 62
          Height = 13
          Caption = 'Date of Birth:'
        end
        object Label12: TLabel
          Left = 8
          Top = 112
          Width = 32
          Height = 13
          Caption = 'E-Mail:'
        end
        object Label13: TLabel
          Left = 8
          Top = 136
          Width = 47
          Height = 13
          Caption = 'Cellphone'
        end
        object Label14: TLabel
          Left = 8
          Top = 160
          Width = 30
          Height = 13
          Caption = 'Team:'
        end
        object DBText1: TDBText
          Left = 136
          Top = 40
          Width = 65
          Height = 17
          DataField = 'Surname'
          DataSource = dsPlayers
        end
        object DBText2: TDBText
          Left = 136
          Top = 64
          Width = 65
          Height = 17
          DataField = 'TriesScored'
          DataSource = dsPlayers
        end
        object DBText3: TDBText
          Left = 136
          Top = 88
          Width = 65
          Height = 17
          DataField = 'DateOfBirth'
          DataSource = dsPlayers
        end
        object DBText4: TDBText
          Left = 136
          Top = 112
          Width = 145
          Height = 17
          DataField = 'Email'
          DataSource = dsPlayers
        end
        object DBText5: TDBText
          Left = 136
          Top = 136
          Width = 65
          Height = 17
          DataField = 'Cellphone'
          DataSource = dsPlayers
        end
        object lblPlayerInfoTeam: TLabel
          Left = 136
          Top = 160
          Width = 30
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          Caption = 'TEAM'
        end
        object cbPlayerStatSelect: TComboBox
          Left = 136
          Top = 16
          Width = 121
          Height = 21
          ItemHeight = 0
          TabOrder = 0
          Text = '-PLAYER-'
          OnChange = cbPlayerStatSelectChange
        end
      end
    end
    object ManagerPage: TTabSheet
      Caption = 'Editor'
      ImageIndex = 2
      DesignSize = (
        701
        321)
      object lblManager: TLabel
        Left = 8
        Top = 8
        Width = 105
        Height = 46
        Caption = 'Editor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblEditorLabel: TLabel
        Left = 8
        Top = 48
        Width = 193
        Height = 13
        Caption = 'Here you can edit the databases directly:'
      end
      object btnEdtTeams: TButton
        Left = 312
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Edit Teams'
        TabOrder = 0
        OnClick = btnEdtTeamsClick
      end
      object btnEdtPlayers: TButton
        Left = 392
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Edit Players'
        TabOrder = 1
        OnClick = btnEdtPlayersClick
      end
      object dbgManager: TDBGrid
        Left = 8
        Top = 72
        Width = 681
        Height = 193
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbnManager: TDBNavigator
        Left = 192
        Top = 280
        Width = 240
        Height = 25
        Enabled = False
        TabOrder = 3
      end
    end
    object NewGamePage: TTabSheet
      Caption = 'New Game'
      ImageIndex = 3
      object lblAddGame: TLabel
        Left = 8
        Top = 8
        Width = 190
        Height = 46
        Caption = 'Add Game'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblStatLabel: TLabel
        Left = 8
        Top = 48
        Width = 181
        Height = 13
        Caption = 'Here you can add the stats of a game.'
      end
      object gbFirstTeam: TGroupBox
        Left = 8
        Top = 72
        Width = 369
        Height = 153
        Caption = 'First Team'
        TabOrder = 0
        object lblNameTeam: TLabel
          Left = 8
          Top = 16
          Width = 75
          Height = 13
          Caption = 'Winning Team: '
        end
        object Label2: TLabel
          Left = 8
          Top = 104
          Width = 89
          Height = 13
          Caption = 'Who scored tries?:'
        end
        object lblScoredLabel: TLabel
          Left = 152
          Top = 120
          Width = 35
          Height = 13
          Caption = 'scored '
        end
        object lblTries: TLabel
          Left = 224
          Top = 120
          Width = 19
          Height = 13
          Caption = 'tries'
        end
        object lblLosingTeam: TLabel
          Left = 8
          Top = 40
          Width = 67
          Height = 13
          Caption = 'Losing Team: '
        end
        object cbTeams: TComboBox
          Left = 104
          Top = 16
          Width = 249
          Height = 21
          ItemHeight = 0
          TabOrder = 0
          Text = '-SELECT TEAM-'
        end
        object cbPlayerSelect: TComboBox
          Left = 8
          Top = 120
          Width = 137
          Height = 21
          ItemHeight = 0
          TabOrder = 1
          Text = '-SELECT PLAYER-'
        end
        object btnAddTries: TButton
          Left = 248
          Top = 120
          Width = 75
          Height = 25
          Caption = 'Add.'
          TabOrder = 2
          OnClick = btnAddTriesClick
        end
        object cbLosingTeam: TComboBox
          Left = 104
          Top = 40
          Width = 249
          Height = 21
          ItemHeight = 0
          TabOrder = 3
          Text = '-SELECT TEAM-'
        end
        object btnAddGame: TButton
          Left = 280
          Top = 64
          Width = 75
          Height = 25
          Caption = 'Add Game!'
          TabOrder = 4
          OnClick = btnAddGameClick
        end
        object edtNumTriesScored: TEdit
          Left = 192
          Top = 120
          Width = 25
          Height = 21
          TabOrder = 5
        end
      end
    end
    object AddTeamPage: TTabSheet
      Caption = 'Add Team'
      ImageIndex = 4
      object lblAddTeam: TLabel
        Left = 8
        Top = 8
        Width = 221
        Height = 46
        Caption = 'Add A Team'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblStartWizzard: TLabel
        Left = 144
        Top = 120
        Width = 447
        Height = 25
        Caption = 'Click the button below to start the add team wizzard.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btnStartWizzard: TButton
        Left = 336
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Start Wizzard'
        TabOrder = 0
        OnClick = btnStartWizzardClick
      end
      object pnlAddPlayers: TPanel
        Left = 120
        Top = 56
        Width = 489
        Height = 217
        TabOrder = 1
        Visible = False
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 150
          Height = 13
          Caption = 'Add players to your team below:'
        end
        object lblName: TLabel
          Left = 24
          Top = 48
          Width = 31
          Height = 13
          Caption = 'Name:'
        end
        object Label4: TLabel
          Left = 8
          Top = 80
          Width = 45
          Height = 13
          Caption = 'Surname:'
        end
        object Label5: TLabel
          Left = 16
          Top = 112
          Width = 35
          Height = 13
          Caption = 'E-Mail: '
        end
        object Label6: TLabel
          Left = 288
          Top = 48
          Width = 53
          Height = 13
          Caption = 'Cellphone: '
        end
        object Label7: TLabel
          Left = 272
          Top = 80
          Width = 66
          Height = 13
          Caption = 'Tries Scored: '
        end
        object Label8: TLabel
          Left = 208
          Top = 112
          Width = 134
          Height = 13
          Caption = 'Date Of Birth (dd/mm/yyyy): '
        end
        object dbedtSurname: TDBEdit
          Left = 64
          Top = 80
          Width = 121
          Height = 21
          DataField = 'Surname'
          DataSource = dsPlayers
          TabOrder = 0
        end
        object dbedtTriesScored: TDBEdit
          Left = 344
          Top = 80
          Width = 121
          Height = 21
          DataField = 'TriesScored'
          DataSource = dsPlayers
          TabOrder = 1
        end
        object dbedtPlayerEmail: TDBEdit
          Left = 64
          Top = 112
          Width = 121
          Height = 21
          DataField = 'Email'
          DataSource = dsPlayers
          TabOrder = 2
        end
        object dbedtCellphone: TDBEdit
          Left = 344
          Top = 48
          Width = 121
          Height = 21
          DataField = 'Cellphone'
          DataSource = dsPlayers
          TabOrder = 3
        end
        object dbedtName: TDBEdit
          Left = 64
          Top = 48
          Width = 121
          Height = 21
          DataField = 'Name'
          DataSource = dsPlayers
          TabOrder = 4
        end
        object rbCaptain: TRadioButton
          Left = 64
          Top = 144
          Width = 113
          Height = 17
          Caption = 'This is the Captain'
          TabOrder = 5
        end
        object btnAddPlayer: TButton
          Left = 400
          Top = 184
          Width = 75
          Height = 25
          Caption = 'Add'
          TabOrder = 6
          OnClick = btnAddPlayerClick
        end
        object btnDonePlayers: TButton
          Left = 8
          Top = 184
          Width = 75
          Height = 25
          Caption = 'Done'
          TabOrder = 7
          OnClick = btnDonePlayersClick
        end
        object dtpPlayerDOB: TDateTimePicker
          Left = 344
          Top = 112
          Width = 121
          Height = 21
          Date = 42687.719647430550000000
          Time = 42687.719647430550000000
          TabOrder = 8
        end
      end
    end
  end
  object bmbLogout: TBitBtn
    Left = 629
    Top = 0
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Logout'
    TabOrder = 2
    OnClick = bmbLogoutClick
    Kind = bkCancel
  end
  object dbConnect: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Kobus\Desktop\PAT\Fase 3\Database.mdb;Mode=Share Deny None;P' +
      'ersist Security Info=False;Jet OLEDB:System database="";Jet OLED' +
      'B:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engi' +
      'ne Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Par' +
      'tial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:N' +
      'ew Database Password="";Jet OLEDB:Create System Database=False;J' +
      'et OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on C' +
      'ompact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet ' +
      'OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 960
    Top = 128
  end
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 1000
    Top = 200
  end
  object tblTeams: TADOTable
    Active = True
    Connection = dbConnect
    CursorType = ctStatic
    TableName = 'Teams'
    Left = 1064
    Top = 160
  end
  object tblUsers: TADOTable
    Active = True
    Connection = dbConnect
    CursorType = ctStatic
    TableName = 'Users'
    Left = 1072
    Top = 216
  end
  object tblPlayers: TADOTable
    Active = True
    Connection = dbConnect
    CursorType = ctStatic
    TableName = 'Players'
    Left = 1064
    Top = 272
  end
  object dsTeams: TDataSource
    DataSet = tblTeams
    Left = 1032
    Top = 288
  end
  object dsPlayers: TDataSource
    DataSet = tblPlayers
    Left = 960
    Top = 240
  end
  object dbQuery: TADOQuery
    Connection = dbConnect
    DataSource = dsPlayers
    Parameters = <>
    Left = 900
    Top = 192
  end
end

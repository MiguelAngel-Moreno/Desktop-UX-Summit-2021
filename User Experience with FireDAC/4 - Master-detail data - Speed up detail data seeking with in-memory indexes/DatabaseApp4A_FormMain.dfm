object AppFormMain: TAppFormMain
  Left = 0
  Top = 0
  Caption = 'Desktop First UX Summit 2021 - Database Application #4 ( A )'
  ClientHeight = 611
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 16
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelTop'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 980
    object ButtonLoadData: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 80
      Height = 43
      Action = ActionLoadData
      Align = alLeft
      Flat = True
    end
    object ButtonCloseData: TSpeedButton
      AlignWithMargins = True
      Left = 89
      Top = 3
      Width = 80
      Height = 43
      Action = ActionCloseData
      Align = alLeft
      Flat = True
    end
    object ButtonToggleIndex: TSpeedButton
      AlignWithMargins = True
      Left = 655
      Top = 3
      Width = 80
      Height = 43
      Action = ActionToggleIndex
      Align = alRight
      Flat = True
      ExplicitLeft = 541
      ExplicitTop = 0
    end
    object DBNavigatorOrders: TDBNavigator
      AlignWithMargins = True
      Left = 177
      Top = 5
      Width = 236
      Height = 39
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      DataSource = DataSourceOrders
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alLeft
      Flat = True
      TabOrder = 0
    end
    object DBNavigatorOrderDetail: TDBNavigator
      AlignWithMargins = True
      Left = 743
      Top = 5
      Width = 236
      Height = 39
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      DataSource = DataSourceOrderDetail
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alRight
      Flat = True
      TabOrder = 1
      ExplicitLeft = 739
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 583
    Width = 984
    Height = 28
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Panels = <>
    SimplePanel = True
    UseSystemFont = False
    ExplicitTop = 582
    ExplicitWidth = 980
  end
  object PanelData: TPanel
    Left = 0
    Top = 49
    Width = 984
    Height = 534
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelData'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 980
    ExplicitHeight = 533
    object Splitter1: TSplitter
      Left = 550
      Top = 0
      Width = 7
      Height = 534
      ExplicitLeft = 310
      ExplicitTop = -6
      ExplicitHeight = 512
    end
    object DBGridOrderDetail: TDBGrid
      Left = 557
      Top = 0
      Width = 427
      Height = 534
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSourceOrderDetail
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ProductNo'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ProductName'
          Title.Alignment = taCenter
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ProductSupplier'
          Title.Alignment = taCenter
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantity'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UnitPrice'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Discount'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Ammount'
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end>
    end
    object DBGridOrders: TDBGrid
      Left = 0
      Top = 0
      Width = 550
      Height = 534
      Align = alLeft
      BorderStyle = bsNone
      DataSource = DataSourceOrders
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OrderNo'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OrderDate'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RequireDate'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ShippedDate'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CustomerNo'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CustomerName'
          Title.Alignment = taCenter
          Width = 175
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EmployeeNo'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EmployeeName'
          Title.Alignment = taCenter
          Width = 175
          Visible = True
        end>
    end
  end
  object ActionList1: TActionList
    Left = 76
    Top = 444
    object ActionLoadData: TAction
      Caption = 'Load Data'
      OnExecute = ActionLoadDataExecute
      OnUpdate = ActionLoadDataUpdate
    end
    object ActionCloseData: TAction
      Caption = 'Close Data'
      OnExecute = ActionCloseDataExecute
      OnUpdate = ActionCloseDataUpdate
    end
    object ActionStartup: TAction
      Caption = 'ActionStartup'
      OnExecute = ActionStartupExecute
    end
    object ActionToggleIndex: TAction
      Caption = 'Toggle Index'
      OnExecute = ActionToggleIndexExecute
      OnUpdate = ActionToggleIndexUpdate
    end
  end
  object DataSourceOrderDetail: TDataSource
    DataSet = AppData.OrderDetail_
    Left = 608
    Top = 444
  end
  object DataSourceOrders: TDataSource
    DataSet = AppData.Order_
    Left = 148
    Top = 444
  end
end

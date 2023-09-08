object AppFormMain: TAppFormMain
  Left = 0
  Top = 0
  Caption = 'Desktop First UX Summit 2021 - Database Application #2 ( B )'
  ClientHeight = 611
  ClientWidth = 884
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
    Width = 884
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelTop'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 880
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
    object DBNavigatorFullOrderWithDetails: TDBNavigator
      AlignWithMargins = True
      Left = 177
      Top = 5
      Width = 252
      Height = 39
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      DataSource = DataSourceOrderWithDetail
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alLeft
      Flat = True
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 583
    Width = 884
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
    ExplicitWidth = 880
  end
  object PanelData: TPanel
    Left = 0
    Top = 49
    Width = 884
    Height = 534
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelData'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 880
    ExplicitHeight = 533
    object DBGridFullOrderWithDetails: TDBGrid
      Left = 0
      Top = 0
      Width = 884
      Height = 534
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSourceOrderWithDetail
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
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ProductNo'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ProductName'
          Title.Alignment = taCenter
          Width = 200
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
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Quantity'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'UnitPrice'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
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
  end
  object ActionList1: TActionList
    Left = 68
    Top = 424
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
  end
  object DataSourceOrderWithDetail: TDataSource
    DataSet = AppData.FullOrderWithDetail_
    Left = 148
    Top = 424
  end
end

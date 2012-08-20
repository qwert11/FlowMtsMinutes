unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DBGridEhGrouping, ExtCtrls, GridsEh, DBGridEh,
  ActnList, Menus, StdCtrls;

type
  TfrmMain = class(TForm)
    dbgrdh1: TDBGridEh;
    pnl1: TPanel;
    actlst1: TActionList;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    pm1: TPopupMenu;
    mniInsert: TMenuItem;
    mniEdit: TMenuItem;
    mniN1: TMenuItem;
    mniDelete: TMenuItem;
    mm1: TMainMenu;
    mniFile1: TMenuItem;
    mniRecord1: TMenuItem;
    mniInsert1: TMenuItem;
    mniEdit1: TMenuItem;
    mniN2: TMenuItem;
    mniDelete1: TMenuItem;
    btnNewRecord: TButton;
    btnEditRecord: TButton;
    btnDeleteRecord: TButton;
    btnFinance: TButton;
    btnTarifPlan: TButton;
    procedure FormCreate(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure btnFinanceClick(Sender: TObject);
    procedure btnTarifPlanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DM_, CustomerFunctions, EditingReportFrm, FinanceFrm, TarifPlanFrm;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  with DM do
    try
      WindowState := ReadIni('Window', 'WindowState', riInteger);
      if not DB.Connected then begin
        DB.DatabaseName := ReadIni('Base', 'Patch', riString);
        DB.Connected := True;
      end;
      
      if not pfbdtstView.Active then
        pfbdtstView.Open; 
    except
      on E: Exception do begin
        Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR);
        Halt;
      end;
    end;
end;

procedure TfrmMain.actEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not dbgrdh1.DataSource.DataSet.Eof
end;

procedure TfrmMain.actInsertExecute(Sender: TObject);
var
  EditingReport: TfrmEditingReport;
begin
  EditingReport := TfrmEditingReport.Create((Sender as TComponent), erInsert);
  try
    EditingReport.ShowModal;
    if EditingReport.ModalResult = mrOk then begin
      dbgrdh1.DataSource.DataSet.Close;
      dbgrdh1.DataSource.DataSet.Open;
    end;
  finally
    EditingReport.Free
  end;
end;

procedure TfrmMain.btnFinanceClick(Sender: TObject);
begin
  frmFinance.ShowModal
end;

procedure TfrmMain.btnTarifPlanClick(Sender: TObject);
begin
  frmTarifPlan.ShowModal
end;

end.

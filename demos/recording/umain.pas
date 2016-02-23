unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ACS_Audio, ComCtrls, StdCtrls, ACS_Misc,
  ACS_VolumeQuery, acs_mixer, ExtCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    cbDevice: TComboBox;
    Label5: TLabel;
    Mixer1: TACSMixer;
    AudioIn1: TACSAudioIn;
    Button1: TButton;
    cbRecordSource: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    NULLOut1: TACSNULLOut;
    ProgressBar: TProgressBar;
    Timer1: TTimer;
    VolumeQuery: TACSVolumeQuery;
    procedure Button1Click(Sender: TObject);
    procedure cbRecordSourceSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  fMain: TfMain;

implementation

{ TfMain }

procedure TfMain.Button1Click(Sender: TObject);
begin
  NULLOut1.Run;
end;

procedure TfMain.cbRecordSourceSelect(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Mixer1.Channelcount-1 do
    if Mixer1.ChannelName[i] = cbRecordSource.Text then
      Mixer1.RecordSource := i;
  for i := 0 to AudioIn1.DevcChannelcount-1 do
end;

procedure TfMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Mixer1.Channelcount-1 do
    //if Mixer1.IsRecordable(i) then
      cbRecordSource.Items.Add(Mixer1.ChannelName[i]);
  cbRecordSource.Text := Mixer1.ChannelName[Mixer1.RecordSource];
end;

procedure TfMain.Timer1Timer(Sender: TObject);
begin
  ProgressBar.Position := (round((VolumeQuery.dbLeft+VolumeQuery.dbRight)/2)+96);
end;

initialization
  {$I umain.lrs}

end.


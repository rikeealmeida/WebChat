class MessageModelList {
  String statusMessage;
  String username, profile_asset, time;
  StatusType status;
  String textMessage;
  bool haveFile;
  bool isVoice;
  int notif;
  bool isSelected;

  MessageModelList({
    this.statusMessage,
    this.time,
    this.status,
    this.profile_asset,
    this.textMessage,
    this.haveFile = false,
    this.isVoice = false,
    this.notif,
    this.isSelected = false,
  });
}

enum StatusType { RECORD, WRITE, LAST_AGO }

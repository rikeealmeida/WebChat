class MessageModelList {
  String messageContent;
  String username, profile_asset, time;
  MessageType type;
  MessageStatus status;
  String statusMessage;
  bool haveFile;
  bool isVoice;
  int notif;
  bool isSelected;
  bool isFile;
  bool isPhoto;
  bool isVideo;
  SelectedValue value;
  final Function(dynamic value) onChanged;

  MessageModelList(
      {this.messageContent,
      this.onChanged,
      this.value,
      this.type,
      this.time,
      this.status,
      this.profile_asset,
      this.statusMessage,
      this.isFile = false,
      this.isPhoto = false,
      this.isVideo = false,
      this.haveFile = false,
      this.isVoice = false,
      this.notif,
      this.isSelected = false,
      this.username});
}

enum MessageType { RECORD, WRITE, LAST_AGO, FILE, PHOTO, VIDEO }
enum MessageStatus { SEND, RECEIVED, READ, UNREAD, UNSEND }
enum SelectedValue { SELECTED, UNSELECTED }

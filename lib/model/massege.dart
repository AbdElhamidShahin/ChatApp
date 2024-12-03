class Message {
  final String? message;
  final String? id;
  final DateTime? datetime;
  Message(this.id, this.datetime, {this.message});

  factory Message.fromjson(jsonData) {
    return Message(
      message: jsonData["massege"],
      jsonData['id'],
      DateTime.parse(jsonData['datetime']), // تحويل datetime إلى كائن DateTime
    );
  }
}

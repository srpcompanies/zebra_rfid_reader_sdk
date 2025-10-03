class TagDataModel {
  final String tagId;
  final String lastSeenTime;

  TagDataModel({
    required this.tagId,
    required this.lastSeenTime,
  });

  factory TagDataModel.fromJson(Map<String, dynamic> json) {
    return TagDataModel(
      tagId: json['tagId'] as String,
      lastSeenTime: json['lastSeenTime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagId': tagId,
      'lastSeenTime': lastSeenTime,
    };
  }
}

class Tweet {
  final String id;
  final String userName;
  final String userHandle;
  final String tweetContent;

  Tweet({
    required this.id,
    required this.userName,
    required this.userHandle,
    required this.tweetContent,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      id: json['id'],
      userName: json['userName'],
      userHandle: json['userHandle'],
      tweetContent: json['tweetContent'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'userHandle': userHandle,
        'tweetContent': tweetContent,
      };
}

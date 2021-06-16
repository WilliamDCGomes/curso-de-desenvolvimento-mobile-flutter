class Video{
  String id;
  String title;
  String image;
  String channel;

  Video({this.id, this.title, this.image, this.channel});

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelId"],
    );
  }
}
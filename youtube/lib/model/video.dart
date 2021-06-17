class Video{
  String id;
  String title;
  String image;
  String channel;
  String channelTitle;
  String publishedAt;

  Video({this.id, this.title, this.image, this.channel, this.channelTitle, this.publishedAt});

  factory Video.fromJson(Map<String, dynamic> json){
    String dateVideo = json["snippet"]["publishedAt"].toString().substring(0, 10);
    DateTime date = DateTime(int.parse(dateVideo.substring(0, 4)), int.parse(dateVideo.substring(5,7)), int.parse(dateVideo.substring(8,10)));
    DateTime todayDate = DateTime.now();
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelId"],
      channelTitle: json["snippet"]["channelTitle"],
      publishedAt: todayDate.difference(date).inDays > 0 ? (todayDate.difference(date).inDays < 2 ? "Há 1 Dia" :
          "Há " + todayDate.difference(date).inDays.toString() + " Dias") :
          todayDate.difference(date).inHours > 0 ? (todayDate.difference(date).inHours < 2 ? "Há 1 Hora" :
          "Há " + todayDate.difference(date).inHours.toString() + " Horas") :
          todayDate.difference(date).inMinutes > 0 ? (todayDate.difference(date).inMinutes < 2 ? "Há 1 Minuto" :
          "Há " + todayDate.difference(date).inMinutes.toString() + " Minutos") :
          todayDate.difference(date).inSeconds < 2 ? "Há 1 Segundo" : "Há " + todayDate.difference(date).inSeconds.toString() + " Segundos",
    );
  }
}
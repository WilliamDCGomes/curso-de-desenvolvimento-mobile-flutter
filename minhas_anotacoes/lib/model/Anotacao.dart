class Anotacao {
  int id;
  String title;
  String description;
  String date;

  Anotacao(this.title, this.description, this.date);

  Map toMap(){
    Map<String, dynamic> map = {
      "title": title,
      "description": description,
      "data": date
    };
    if(id != null)
      map["id"] = id;
    return map;
  }

  Anotacao.fromMap(Map map){
    id = map["id"];
    title = map["title"];
    description = map["description"];
    date = map["data"];
  }
}
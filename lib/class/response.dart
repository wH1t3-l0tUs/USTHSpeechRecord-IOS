class RandomText {
  int id;
  String text;

  RandomText({this.id, this.text});
  
  factory RandomText.fromJson(Map<String, dynamic> json) {
    return RandomText(
      id: json['resp']['id'],
      text: json['resp']['text'],
    );
  }
 
}
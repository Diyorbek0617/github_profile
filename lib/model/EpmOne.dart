class EmpOne {
  String name;
  int id;
  String location;
  String company;
  String bio;
  int followers;
  int following;
  String image;

  EmpOne.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['avatar_url'] as String,
        name = json['name'],
        company = json['company'],
       location = json['location'],
       bio = json['bio'],
       followers = json['followers'],
       following = json['following'];

}
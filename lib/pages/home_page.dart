import 'package:flutter/material.dart';
import 'package:github_profile/services/http_service.dart';
import 'package:github_profile/model/EpmOne.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  int id = 0;
  String location = "";
  String company = "";
  String bio = "";
  int followers = 0;
  int following = 0;
  late EmpOne empone;
  String image = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
       empone = Network.parseEmpOne(response),
      _showResponse(response),
    });
  }
  void _showResponse(String response){
    setState(() {
      name = empone.name;
      id = empone.id;
      location = empone.location;
      bio = empone.bio;
      company = empone.company;
      following = empone.following;
      followers = empone.followers;
      image = empone.image;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            CircleAvatar(
              radius: 80,
              child: ClipOval(
                child: Image.network(
                  image,
                )
              ),
            ),
            SizedBox(height: 20),
            Text(
              (name != null ? name : "Mavjud emas"),
              style: TextStyle(
                color: Colors.black26,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "id : "+id.toString(),
              style: TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              child: Image.asset(
                'assets/img/fon.png',
                fit: BoxFit.cover,
              ),
              width: double.infinity,
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_outlined,
                color: Colors.black26,
              ),
              title: Text(
                "Location: "+(location != null ? location : "Mavjud emas"),
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_repair_service_rounded,
                color: Colors.black26,
              ),
              title: Text(
                "Company: "+(company != null ? company : "Mavjud emas"),
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.black26,
              ),
              title: Text(
                "Bio: "+(bio != null ? bio : "Mavjud emas"),
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline_sharp,
                color: Colors.black26,
              ),
              title: Text(
                "Followers: "+followers.toString(),
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person_search_outlined,
                color: Colors.black26,
              ),
              title: Text(
                "Following: "+following.toString(),
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

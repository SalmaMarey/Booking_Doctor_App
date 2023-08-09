import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'notiPage.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void initState() {
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
  }

  List<String> imgs = [
    "https://as1.ftcdn.net/v2/jpg/02/17/83/42/1000_F_217834275_PBRFs3Jdg2Uqi6Af5Ipi6QBqa9YxIbiY.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/97/98/13/1000_F_297981353_tpZC3gYQxgOcxyCUvGtvBjoKMRAJ3AIm.jpg",
    "https://as1.ftcdn.net/v2/jpg/03/28/55/92/1000_F_328559287_43MTMxxnymnumQ54HaI4s3bc6JJwwq0q.jpg",
  ];
  String Image1 =
      "https://as2.ftcdn.net/v2/jpg/03/07/37/27/1000_F_307372730_YewTvhcMncNhbFsYVnIIl1WWD8K8yBrM.jpg";
  String Image2 =
      "https://as1.ftcdn.net/v2/jpg/03/01/43/48/1000_F_301434885_SruL7Mc1t5yy4ecJI9Fgtml8uxDbEi9W.jpg";
  String Image3 =
      "https://as1.ftcdn.net/v2/jpg/03/03/37/20/1000_F_303372067_zjpx1MOmW4vpdmxFVcw7kzt60ybDSHfH.jpg";
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Noti.showBigTextNotification(
                    title: "New message ",
                    body: "Hello to our Health Care 🥰",
                    fln: flutterLocalNotificationsPlugin);
              },
              backgroundColor: Colors.blue.shade900,
              child: const Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
            backgroundColor: Colors.blue.shade50,
            body: ListView(children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                " MedLine for Health Care",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  viewportFraction: 0.9,
                ),
                items: imgs.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage(i))),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(color: Colors.indigo[900], height: 2.5),
              const SizedBox(
                height: 10,
              ),
              Text(
                ' Speciality:',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(Image1),
                          radius: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Physical Therapist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(Image2),
                          radius: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mental Therapist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(Image3),
                          radius: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Dentistry",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 101,
              ),
              Center(
                  child: SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Colors.white, //change background color of button
                          backgroundColor: Colors.blue.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                        ),
                        child: Text(
                          "Click me",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          player.play(AssetSource('song.mp3'));
                        },
                      )))
            ])));
  }
}

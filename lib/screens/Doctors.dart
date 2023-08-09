import 'package:flutter/material.dart';
import 'package:online_1/screens/booking/Doc1.dart';

import 'booking/Doc2.dart';
import 'booking/Doc3.dart';
import 'booking/Doc4.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 340,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.indigo.shade900,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search Doctors",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.indigo.shade900, width: 50.0),
                      ),
                      suffixIcon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.indigo.shade900,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          color: Colors.blue.shade50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Doc1Page()),
                        );
                      },
                      child: Container(
                        height: 105,
                        width: 155,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade900.withOpacity(0.4),
                              spreadRadius: 0.4,
                              blurRadius: 0.5,
                              offset: Offset(
                                0,
                                25,
                              ), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://t4.ftcdn.net/jpg/03/05/41/27/240_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg",
                            ),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Mental Therapist",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Text("4.5"),
                        Icon(Icons.star)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Doc2Page()),
                        );
                      },
                      child: Container(
                        height: 105,
                        width: 155,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade900.withOpacity(0.4),
                              spreadRadius: 0.4,
                              blurRadius: 0.5,
                              offset: Offset(
                                0,
                                25,
                              ), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://t3.ftcdn.net/jpg/01/72/18/66/240_F_172186647_e93OQdc8KSoBzIPqfKG0UoJSJhR15HLa.jpg",
                            ),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Neurologist",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Text("4.7"),
                        Icon(Icons.star)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Doc3Page()),
                        );
                      },
                      child: Container(
                        height: 105,
                        width: 155,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade900.withOpacity(0.4),
                              spreadRadius: 0.4,
                              blurRadius: 0.5,
                              offset: Offset(
                                0,
                                25,
                              ), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://t3.ftcdn.net/jpg/03/05/69/00/240_F_305690038_kio1DI7qtf1kMPT4z6keI3GwB0zP6Sch.jpg",
                            ),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Neurologist",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Text("4.5"),
                        Icon(Icons.star)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Doc4Page()),
                        );
                      },
                      child: Container(
                        height: 105,
                        width: 155,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade900.withOpacity(0.4),
                              spreadRadius: 0.4,
                              blurRadius: 0.5,
                              offset: Offset(
                                0,
                                25,
                              ), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://t3.ftcdn.net/jpg/01/30/45/54/240_F_130455409_fTuinPO1LXECv5hlk9VBREnL6yowYUo3.jpg",
                            ),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Dentist",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Text("4.5"),
                        Icon(Icons.star)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: 105,
                      width: 155,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade900.withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(
                              0,
                              25,
                            ), // changes position of shadow
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://t4.ftcdn.net/jpg/02/76/94/29/240_F_276942923_vRe2zKQBgaQj0MyNOjqD8f7eVMyKZ2eL.jpg",
                          ),
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Physical Therapist",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4.9"),
                        Icon(Icons.star)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      height: 105,
                      width: 155,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade900.withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(
                              0,
                              25,
                            ), // changes position of shadow
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://t4.ftcdn.net/jpg/03/21/23/37/240_F_321233723_3nSdORPnL4nPOfGEocyCGVCI0RoXuRVo.jpg",
                          ),
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Physical Therapist",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4.2"),
                        Icon(Icons.star)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: 105,
                      width: 155,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade900.withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(
                              0,
                              25,
                            ), // changes position of shadow
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://t4.ftcdn.net/jpg/02/65/13/75/240_F_265137512_Oh1Bwar4BE4N6nnsvgkIse8SMkYHSn1h.jpg",
                          ),
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Dentist",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4.1"),
                        Icon(Icons.star)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      height: 105,
                      width: 155,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade900.withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(
                              0,
                              25,
                            ), // changes position of shadow
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://t3.ftcdn.net/jpg/02/91/43/02/240_F_291430206_U1vohsIJWJvF3wb1a3uxfYLPCfXMRbum.jpg",
                          ),
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Physical Therapist",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4.5"),
                        Icon(Icons.star)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final catNames = ['brain', 'heart', 'lungs', 'kidney', 'ear'];
  final catImages = [
    'assets/brain.png',
    'assets/heart.png',
    'assets/lungs.png',
    'assets/kidney.png',
    'assets/ear.png',
  ];
  final docImg = [
    'assets/doctor.png',
    'assets/doctor.png',
    'assets/doctor.png',
    'assets/doctor.png',
    'assets/doctor.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //search bar
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black,
                        spreadRadius: 3,
                        blurRadius: 7,
                        //offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search for doctors',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

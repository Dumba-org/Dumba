import 'package:flutter/material.dart';
import 'package:rekhdekh/widgets/color.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final catNames = ['brain', 'heart', 'lungs', 'kidney', 'ear'];
  final catImages = [
    'assets/hospitals.png',
    'assets/hospitals.png',
    'assets/hospitals.png',
    'assets/hospitals.png',
    'assets/hospitals.png',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('RekhDekh', style: TextStyle(color: Colors.green)),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                    height: 47,
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
                          blurRadius: 5,
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

                  // card for doctor ,hospital and  blood bank
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: primaryColor,
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Video Consultation',
                                    style: TextStyle(fontSize: 20)),
                                const Text('Verified doctors',
                                    style: TextStyle(fontSize: 14)),
                                Flexible(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset('assets/hospitals.png',
                                          height: 150)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //card for hospital and blood bank
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: 180,
                                height:
                                    180, // Increased height to accommodate larger image
                                child: Card(
                                  color: primaryColor,
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, // Space between text and image
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, // Center vertically
                                      children: [
                                        // Left side: Text widgets
                                        const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Align text to start (left)
                                          children: [
                                            Text('Hospitals',
                                                style: TextStyle(fontSize: 16)),
                                            SizedBox(
                                                height:
                                                    5), // Spacing between text elements
                                            Text('only seat booking',
                                                style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                        // Right side: Image widget
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left:
                                                    10), // Margin between text and image
                                            height:
                                                120, // Set desired height for the image
                                            // Set desired width for the image
                                            child: Image.asset(
                                                'assets/hospitals.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: Container(
                                width: 180,
                                height:
                                    180, // Increased height to accommodate larger image
                                child: Card(
                                  color: primaryColor,
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, // Space between text and image
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, // Center vertically
                                      children: [
                                        // Left side: Text widgets
                                        const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Align text to start (left)
                                          children: [
                                            Text('Blood Bank',
                                                style: TextStyle(fontSize: 16)),
                                            SizedBox(
                                                height:
                                                    5), // Spacing between text elements
                                            Text('Request blood',
                                                style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                        // Right side: Image widget
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left:
                                                    10), // Margin between text and image
                                            height:
                                                120, // Set desired height for the image
                                            // Set desired width for the image
                                            child: Image.asset(
                                                'assets/images/blood.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  //feature doctors
                  Row(
                    children: [
                      const Text('Feature  Doctors',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text('View all',
                            style:
                                TextStyle(fontSize: 16, color: primaryColor)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //list videw usign card showing doctor name , image, price and rating
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(
                              8), // Added margin for spacing
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // CircleAvatar for the image
                                  const CircleAvatar(
                                    radius: 30, // Adjust the size of the avatar
                                    backgroundImage:
                                        AssetImage('assets/hospitals.png'),
                                  ),
                                  const SizedBox(
                                      height:
                                          10), // Spacing between image and text
                                  const Text(
                                    'Dr Ram Sherpa',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    'Heart Specialist',
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12),
                                  ),
                                  const Text(
                                    'Rs 500/hour',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //Services
                  const Text('Find Your Services',
                      style: TextStyle(fontSize: 20, color: Colors.black)),

                  const SizedBox(height: 20),

                  //GridView for services which contain image and text
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // CircleAvatar for the image
                              CircleAvatar(
                                radius: 20, // Adjust the size of the avatar
                                backgroundImage: AssetImage(catImages[index]),
                              ),
                              const SizedBox(
                                  height:
                                      10), // Spacing between image and text
                              Text(
                                catNames[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

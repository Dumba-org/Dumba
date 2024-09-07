import 'package:flutter/material.dart';
import 'package:rekhdekh/screens/hospital_availability';
import 'package:rekhdekh/widgets/color.dart';

class HospitalGridScreen extends StatelessWidget {
  final List<Map<String, String>> hospitals = [
    {
      "name": "Bir Hospital, Kantipath, Kathmandu",
      "imageUrl": "assets/hospitals.png"
    },
    {
      "name": "Teaching Hospital, Maharajgunj, Kathmandu",
      "imageUrl": "assets/hospitals.png"
    },
    {
      "name": "Kanti Children’s Hospital, Maharajgunj, Kathmandu",
      "imageUrl": "assets/hospitals.png"
    },
    {
      "name": "Nepal Cancer Hospital, Harisiddhi, Lalitpur",
      "imageUrl": "assets/hospitals.png"
    },
    {
      "name": "Grande Hospital, Tokha, Kathmandu",
      "imageUrl": "assets/hospitals.png"
    },
    {
      "name": "B&B Hospital, Gwarko, Lalitpur",
      "imageUrl": "assets/hospitals.png"
    },
    {
      "name": "Dhulikhel Hospital, Kavrepalanchowk",
      "imageUrl": "assets/hospitals.png"
    },
    {
      "name": "Norvic Hospital, Thapathali, Kathmandu",
      "imageUrl": "assets/hospitals.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospitals'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards in each row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8, // Adjust the height and width ratio
          ),
          itemCount: hospitals.length,
          itemBuilder: (context, index) {
            return HospitalCard(
              name: hospitals[index]["name"]!,
              imageUrl: hospitals[index]["imageUrl"]!,
            );
          },
        ),
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  HospitalCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 137, 230, 140),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const   Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HospitalAvailability()),
                );
                // Action when "Book an appointment" is pressed
              },
              child: Flexible(child: const Text('Book an appointment',style: TextStyle(fontSize: 14),)),
            ),
          ),
        ],
      ),
    );
  }
}

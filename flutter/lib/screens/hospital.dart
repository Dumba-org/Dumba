import 'package:flutter/material.dart';
import 'package:rekhdekh/screens/hospital_availability.dart'; // Ensure correct path
import 'package:rekhdekh/widgets/color.dart'; // Ensure correct path

class HospitalGridScreen extends StatelessWidget {
  final List<Map<String, String>> hospitals = [
    {
      "name": "Bir Hospital, Kantipath, Kathmandu",
      "imageUrl": "assets/hospitals/bir.jpg" // Ensure images are in the correct path
    },
    {
      "name": "Teaching Hospital, Maharajgunj, Kathmandu",
      "imageUrl": "assets/hospitals/teaching.jpg"
    },
    {
      "name": "Kanti Children’s Hospital, Maharajgunj, Kathmandu",
      "imageUrl": "assets/hospitals/kanti.jpg"
    },
    {
      "name": "Nepal Cancer Hospital, Harisiddhi, Lalitpur",
      "imageUrl": "assets/hospitals/cancer.jpg"
    },
    {
      "name": "Grande Hospital, Tokha, Kathmandu",
      "imageUrl": "assets/hospitals/grande.jpg"
    },
    {
      "name": "B&B Hospital, Gwarko, Lalitpur",
      "imageUrl": "assets/hospitals/bnb.jpg"
    },
    {
      "name": "Dhulikhel Hospital, Kavrepalanchowk",
      "imageUrl": "assets/hospitals/dhulikhel.jpg"
    },
    {
      "name": "Norvic Hospital, Thapathali, Kathmandu",
      "imageUrl": "assets/hospitals/norvic.jpg"
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
      color: const Color.fromARGB(255, 128, 238, 196),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imageUrl, // Use Image.asset for local assets
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover, // Changed to cover to maintain aspect ratio
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.image,
                size: 100, // Adjusted to match the image size
              ), // Fallback icon
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, // Ensure primaryColor is defined
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HospitalAvailability(),
                  ),
                );
                // Action when "Book an appointment" is pressed
              },
              child: const Text(
                'Book an appointment',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

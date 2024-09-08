import 'package:flutter/material.dart';

import '../widgets/color.dart';

class HospitalAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Availability'),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hospital Image and Name
          Card(
            elevation: 4.0,
            child: Expanded(
              child: Column(
                children: [
                  Image.network('assets/hospitals.png'),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Bir Hospital, Kantipath, Kathmandu',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          // General, ICU, Emergency sections
          availabilitySection('General', 65, 25),
          availabilitySection('ICU', 10, 5),
          availabilitySection('Emergency', 65, 25),

          const SizedBox(height: 16.0),

          // Available Services
          const Text(
            'Available Services:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                serviceTile('CT Scan', Icons.local_hospital),
                serviceTile('X-ray', Icons.local_hospital),
                serviceTile('Endoscopy', Icons.medical_services),
                serviceTile('Full Checkup', Icons.health_and_safety),
                serviceTile('ENT Checkup', Icons.hearing),
                serviceTile('Cardiology', Icons.favorite),
                serviceTile('Urine test', Icons.science),
                serviceTile('Eye test', Icons.remove_red_eye),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget availabilitySection(String title, int total, int available) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:  TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold)),
                Column(
                  children: [
                    Text('Available:'),
                    Text(' $available Seat',
                        style: const TextStyle(color: Colors.green)),
                  ],
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {},
                child: const Text(
                  'Apply Now',
                  style: TextStyle(color: Colors.white),
                )),
            Column(
              children: [
                Text('Available:'),
                Text(' $available Seat',
                    style: const TextStyle(color: Colors.green)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget serviceTile(String name, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40),
        const SizedBox(height: 8.0),
        Text(name),
      ],
    );
  }
}

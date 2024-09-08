import 'package:flutter/material.dart';
import 'package:rekhdekh/widgets/color.dart';

import 'find_hospital.dart';

class ServiceListPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Nearby Hospital',
      'icon': Icons.local_hospital,
      'image': 'assets/images/hospital.png',
      'route': NearbyHospitalPage(),
    },
    {
      'name': 'Blood Donation',
      'icon': Icons.bloodtype,
      'image': 'assets/images/blooddonation.png',
      'route': BloodDonationPage(),
    },
    {
      'name': 'Ambulance Tracking',
      'icon': Icons.local_shipping,
      'image': 'assets/images/ambulance.jpg',
      'route': AmbulanceTrackingPage(),
    },
    {
      'name': 'Insurance Service',
      'icon': Icons.security,
      'image': 'assets/images/insurance.png',
      'route': InsuranceServicePage(),
    },
    {
      'name': 'Home Lab Test',
      'icon': Icons.science,
      'image': 'assets/images/labreport.png',
      'route': HomeLabTestPage(),
    },
    {
      'name': 'Pharmacy Service',
      'icon': Icons.local_pharmacy,
      'image': 'assets/images/pharmacy.png',
      'route': PharmacyServicePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 6,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => services[index]['route'],
                  ),
                );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: Image.asset(
                      services[index]['image'],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    leading: Icon(services[index]['icon'], color: Colors.teal),
                    title: Text(
                      services[index]['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NearbyHospitalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Hospitals'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/hospital.png', height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Find the nearest hospitals around your location. Contact them directly or get directions.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Implement location-based hospital search
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HospitalList(),
                ),
              );
            },
            icon: Icon(Icons.location_on),
            label: Text('Find Hospitals'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor
            ),
          ),
        ],
      ),
    );
  }
}

class BloodDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/blood.png', height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Donate blood and save lives. Join our blood donation campaign or find blood banks near you.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Implement blood bank search
            },
            icon: Icon(Icons.favorite),
            label: Text('Find Blood Banks'),
            style: ElevatedButton.styleFrom(
             backgroundColor: primaryColor
            ),
          ),
        ],
      ),
    );
  }
}

class AmbulanceTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambulance Tracking'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/ambulance.jpg', height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Track ambulances in real-time to ensure quick emergency response.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Implement ambulance tracking
            },
            icon: Icon(Icons.local_shipping),
            label: Text('Track Ambulances'),
            style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor
            ),
          ),
        ],
      ),
    );
  }
}

class InsuranceServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurance Service'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/insurance.png', height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Explore our health insurance options and secure your future today.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Implement insurance info
            },
            icon: Icon(Icons.security),
            label: Text('Get Insurance Info'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor
            ),
          ),
        ],
      ),
    );
  }
}

class HomeLabTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Lab Test'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/labreport.png', height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Book home lab tests and get results online. Convenient and quick!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Implement home lab test booking
            },
            icon: Icon(Icons.science),
            label: Text('Book Lab Test'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor
            ),
          ),
        ],
      ),
    );
  }
}

class PharmacyServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Service'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/pharmacy.png', height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Order medicines from trusted pharmacies directly to your home.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Implement pharmacy order feature
            },
            icon: Icon(Icons.local_pharmacy),
            label: Text('Order Medicine'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor
            ),
          ),
        ],
      ),
    );
  }
}
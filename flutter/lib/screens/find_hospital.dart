import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  final List<Map<String, dynamic>> _hospitals = [
    {
      'name': 'Bir Hospital',
      'address': 'National Hospital of Nepal',
      'lat': 27.705235,
      'lng': 85.313276,
      'image': 'assets/hospitals/bir.jpg', // Replace with actual image URL
      'rating': 4.3
    },
    {
      'name': 'Teaching Hospital',
      'address': 'Maharajgunj, Kathmandu',
      'lat': 27.736916,
      'lng': 85.329840,
      'image': 'assets/hospitals/teaching.jpg', // Replace with actual image URL
      'rating': 4.7
    },
    {
      'name': 'Patan Hospital',
      'address': 'Patan, Kathmandu',
      'lat': 27.667516,
      'lng': 85.324763,
      'image': 'assets/hospitals/patan.jpg', // Replace with actual image URL
      'rating': 4.2
    },
    // Add more hospitals here...
  ];

  late List<Map<String, dynamic>> _filteredHospitals;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredHospitals = _hospitals;
    _searchController.addListener(_filterHospitals);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterHospitals() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredHospitals = _hospitals.where((hospital) {
        return hospital['name'].toLowerCase().contains(query) ||
               hospital['address'].toLowerCase().contains(query);
      }).toList();
    });
  }

  void _openMap(double lat, double lng) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open Google Maps';
    }
  }

  Widget _buildRating(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++) Icon(Icons.star, color: Colors.amber, size: 20),
        if (hasHalfStar) Icon(Icons.star_half, color: Colors.amber, size: 20),
        for (int i = 0; i < (5 - fullStars - (hasHalfStar ? 1 : 0)); i++) Icon(Icons.star_border, color: Colors.amber, size: 20),
        SizedBox(width: 5),
        Text(
          rating.toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals in Kathmandu'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search hospitals...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredHospitals.length,
        itemBuilder: (context, index) {
          final hospital = _filteredHospitals[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                _openMap(hospital['lat'], hospital['lng']);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      hospital['image'],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.image, size: 180),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hospital['name'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          hospital['address'],
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 10),
                        _buildRating(hospital['rating']),
                      ],
                    ),
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

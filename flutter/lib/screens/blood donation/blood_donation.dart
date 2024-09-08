import 'package:flutter/material.dart';
import 'package:rekhdekh/screens/homescreen.dart';
import 'package:rekhdekh/widgets/color.dart';

class BloodBankPage extends StatefulWidget {
  const BloodBankPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BloodBankPageState createState() => _BloodBankPageState();
}

class _BloodBankPageState extends State<BloodBankPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blood Bank',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  const Homescreen(), // Replace with your main screen widget
            ));
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            color: primaryColor,
          ),
          tabs: [
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: const Tab(text: 'Request Blood')),
            Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: const Tab(text: 'Donate Blood')),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        child: TabBarView(
          controller: _tabController,
          children: const [
            // Request Blood Form
            Padding(
              padding: EdgeInsets.all(16.0),
              child: BloodRequestForm(),
            ),
            // Donate Blood Form
            // ignore: unnecessary_const
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: BloodDonationForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Blood Request Form
class BloodRequestForm extends StatelessWidget {
  const BloodRequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextField(label: 'Patient’s Name', hint: 'Zesan H.'),
        const CustomTextField(label: 'Patient’s Age', hint: '45 years'),
        const CustomTextField(label: 'Requested By', hint: 'Nima Sherpa'),
        const CustomTextField(label: 'Select District', hint: 'Kathmandu'),
        const CustomDropdownField(
            label: 'Select Blood Group',
            items: ['A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-']),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Submit logic here
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Blood Donation Form
class BloodDonationForm extends StatelessWidget {
  const BloodDonationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextField(label: 'Donor’s Name', hint: 'Enter your name'),
        const CustomTextField(label: 'Donor’s Age', hint: 'Enter your age'),
        const CustomTextField(
            label: 'Contact Number', hint: 'Enter your contact'),
        const CustomTextField(label: 'Select District', hint: 'Kathmandu'),
        const CustomDropdownField(
            label: 'Select Blood Group',
            items: ['A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-']),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Submit donation logic here
            },
            child: const Text('Submit'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Dropdown Widget
class CustomDropdownField extends StatelessWidget {
  final String label;
  final List<String> items;

  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedValue = items.first;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
            onChanged: (newValue) {
              selectedValue = newValue!;
            },
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

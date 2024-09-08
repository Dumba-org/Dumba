class Doctor {
  final String name;
  final String specialty;
  final String price;
  final String imageUrl;

  Doctor(this.name, this.specialty, this.price, this.imageUrl);
}

List<Doctor> doctors = [
  Doctor('Dr Ram Sherpa', 'Heart Specialist', 'Rs 500/hour', 'assets/images/doc1.png'),
  Doctor('Dr Sita Rai', 'Orthopedic Specialist', 'Rs 600/hour', 'assets/images/doc2.png'),
  Doctor('Dr John Doe', 'Dermatologist', 'Rs 700/hour', 'assets/images/doc4.png'),
  Doctor('Dr Jane Smith', 'Pediatrician', 'Rs 550/hour', 'assets/images/doc3.png'),
];
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  // Sample article data
  final List<Map<String, dynamic>> articles = const [
    {
      'title': 'How to Stay Fit',
      'description': 'Learn the best tips to stay healthy and fit.',
      'image': 'assets/hospitals.png',
      'date': '2024-09-05',
    },
    {
      'title': 'Mental Health Awareness',
      'description': 'Why mental health matters and how to care for it.',
      'image': 'assets/hospitals.png',
      'date': '2024-09-04',
    },
    {
      'title': 'Healthy Eating Habits',
      'description': 'Discover the secrets of a balanced diet.',
      'image': 'assets/hospitals.png',
      'date': '2024-09-03',
    },
    // Add more articles here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Articles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Show search screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Article Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      article['image'],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Article Title
                  Text(
                    article['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Article Date
                  Text(
                    DateFormat.yMMMd().format(DateTime.parse(article['date'])),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Article Description
                  Text(
                    article['description'],
                    style: const TextStyle(fontSize: 14),
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

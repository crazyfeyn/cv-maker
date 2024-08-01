import 'package:flutter/material.dart';
import 'package:flutter_application/views/screens/academic_screen.dart';
import 'package:flutter_application/views/screens/main_screen.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SummarySection(
                icon: Icons.storage,
                title: 'Polivalent',
                description:
                    'Plenty of skills around communication, media, web and advertising.',
              ),
              SummarySection(
                icon: Icons.work,
                title: 'Experience',
                description:
                    'More than 10 years working in design fields, with Adobe Creative Suite, Figma and collaborative tools.',
              ),
              SummarySection(
                icon: Icons.chat,
                title: 'Open-minded',
                description:
                    'Always looking for continuous improvement and ready to learn about the newest.',
              ),
              SummarySection(
                icon: Icons.sentiment_satisfied,
                title: 'Empathic & humble',
                description: 'The user is in the center.',
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const MainScreen()));
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const Text(
                      'Contact',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const AcademicBackgroundPage()));
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SummarySection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  SummarySection(
      {required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application/views/screens/experience_screen.dart';
import 'package:flutter_application/views/screens/summary_screen.dart';

class AcademicBackgroundPage extends StatelessWidget {
  const AcademicBackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Academic backgr.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    AcademicItem(
                      title: 'JOURNALISM',
                      subtitle: 'Universidad Pontificia de Salamanca',
                      year: '2007',
                    ),
                    AcademicItem(
                      title: 'GALICIAN LANG.',
                      subtitle: 'Universidade da Coruña',
                      year: '2009',
                    ),
                    AcademicItem(
                      title: 'WEB APP DEVELOPMENT',
                      subtitle: 'IES Fernando Wirtz (A Coruña)',
                      year: '2016',
                    ),
                    AcademicItem(
                      title: 'UX/UI DESIGN',
                      subtitle: 'La Zona - FUE (Fundación Universidad Empresa)',
                      year: '2022',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => SummaryPage()));
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
                              builder: (ctx) => ExperienceTimeline()));
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

class AcademicItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String year;

  AcademicItem({
    required this.title,
    required this.subtitle,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const Icon(
            Icons.bookmark,
            color: Colors.pinkAccent,
            size: 40,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  'Year: $year',
                  style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

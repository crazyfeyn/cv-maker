import 'package:flutter/material.dart';
import 'package:flutter_application/views/screens/academic_screen.dart';
import 'package:flutter_application/views/screens/contact_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TimelineEvent(
              year: '2024 - (CURRENT)',
              title: 'GRAPHIC DESIGN',
              company: 'La Voz de Galicia',
              description: 'Online & offline advertising design',
              isCurrent: true,
            ),
            TimelineEvent(
              year: '2021 - 2022',
              title: 'LAYOUT & GRAPHIC DESIGN',
              company: 'Nós Diario / Sermos Galiza',
              description: 'Offline design & layout. Infographics',
            ),
            TimelineEvent(
              year: '2020 - 2021',
              title: 'GRAPHIC, LAYOUT, AND SOCIAL MEDIA DESIGN',
              company: 'Octo Comunicación',
              description: 'Ads design, layout design, social media design',
            ),
            TimelineEvent(
              year: '2020 - 2020',
              title: 'FRONT END DEV. UI DESIGN',
              company: 'Softek',
              description: 'Web Design & developing with Angular',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const AcademicBackgroundPage()));
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const ContactScreen()));
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineEvent extends StatelessWidget {
  final String year;
  final String title;
  final String company;
  final String description;
  final bool isCurrent;

  TimelineEvent({
    required this.year,
    required this.title,
    required this.company,
    required this.description,
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        const url =
            'https://medium.com/@0golibtoramurodov/flutter-nima-729fa94d59e8';
        _launchUrl(url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: isCurrent ? Colors.blue : Colors.pink[100],
                  child: isCurrent
                      ? const Icon(Icons.fiber_manual_record,
                          color: Colors.white)
                      : null,
                ),
                if (!isCurrent)
                  Container(
                    height: 100,
                    width: 2,
                    color: Colors.pink[100],
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    company,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}


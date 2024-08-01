import 'package:flutter/material.dart';
import 'package:flutter_application/views/screens/experience_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                'Contact',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Hello! I am based in Culleredo, Galiza (Spain) and there are plenty of ways to get in touch with me:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const ContactInfo(
                icon: Icons.phone,
                info: '(+34) 667 725130',
              ),
              const ContactInfo(
                icon: Icons.email,
                info: 'v.rivadulla.deschamps@gmail.com',
              ),
              const ContactInfo(
                icon: Icons.web,
                info: 'www.veronicard.eu',
              ),
              const ContactInfo(
                icon: Icons.link,
                info: 'about.me',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.whatsapp),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.behance),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ExperienceTimeline()));
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
                    onTap: () {},
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

class LanguageItem extends StatelessWidget {
  final String flag;
  final String language;
  final String level;

  const LanguageItem(
      {super.key,
      required this.flag,
      required this.language,
      required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Text(
                flag,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    language,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(level),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String info;

  const ContactInfo({super.key, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Text(info, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

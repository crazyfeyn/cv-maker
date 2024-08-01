import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/download_pdf_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/views/screens/summary_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Future<void> _launchPhoneNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe6feff),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          BlocBuilder<DownloadPdfBloc, DownloadPdfState>(
              builder: (context, state) {
            if (state is LoadingPdfState) {
              return const Center(child: CircularProgressIndicator());
            }
            return IconButton(
              onPressed: () {
                context.read<DownloadPdfBloc>().add(DownloadPdfEvent());
              },
              icon: const Icon(Icons.picture_as_pdf),
            );
          })
        ],
      ),
      body: BlocBuilder<DownloadPdfBloc, DownloadPdfState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            height: 300,
                          ),
                        ),
                        const Text(
                          "G'olib To'ramurodov",
                          style: TextStyle(
                              color: Color(0xFF000072),
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                        ),
                        const Wrap(
                          children: [
                            Text(
                              'Flutter tech',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Frontend developer',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'High skilled with communication',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        const Text(
                          '+1 month experience',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.place),
                            SizedBox(width: 10),
                            Text(
                              'Chirchik, Tashkent, Uzbekistan',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
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
                              child: GestureDetector(
                                onTap: () {
                                  _launchPhoneNumber('+998917787836');
                                },
                                child: const Text(
                                  'Contact',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => SummaryPage()));
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

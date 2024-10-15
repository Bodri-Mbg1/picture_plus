import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:picture_plus/widgets/photos.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => PictureState();
}

class PictureState extends State<FirstPage> {
  List<Photo> photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhoto();
  }

  Future<void> fetchPhoto() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        setState(() {
          photos = data.map((json) => Photo.fromJson(json)).toList();
        });
      } else {
        throw Exception('Erreur lors du chargement des images');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Erreur: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.density_medium),
                Text(
                  'PicturePlus',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'FontsFree',
                    letterSpacing: -1.0,
                  ),
                ),
                Icon(
                  Icons.account_circle_outlined,
                  size: 35,
                  color: Color(0xffff7a07),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: InstaImageViewer(
                          child: Image.network(
                            photos[index].url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 235, 235, 235),
        padding: const EdgeInsets.all(1.0),
        child: GNav(
          backgroundColor: const Color.fromARGB(255, 235, 235, 235),
          color: Colors.black,
          activeColor: Colors.white,
          gap: 8,
          tabBorderRadius: 15,
          tabBackgroundColor: Color.fromARGB(255, 255, 196,
              144), // changer la couleur de fond des icônes actives
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          mainAxisAlignment: MainAxisAlignment.center, // centrage des icônes
          onTabChange: (index) {
            if (kDebugMode) {
              print(index);
            }
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search_sharp,
              text: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cinelist/widgets/bottom_nav_bar.dart'; // Import the BottomNavBar widget

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Handle favorite action
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {
              // Handle bookmark action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Image
            Stack(
              children: [
                Image.asset(
                  'assets/hunter_x_hunter.jpg', // Replace with your image asset
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  child: Icon(
                    Icons.favorite,
                    size: 32,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),

            // Movie Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Movie Title",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        "YYYY",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "EN/FR/ES",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.timer, size: 20),
                          SizedBox(width: 4),
                          Text("0:00"),
                          SizedBox(width: 16),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle trailer action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6F61), // Coral color
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text("Trailer",
                        style: TextStyle(color: Colors.white)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Maecenas bibendum iaculis tortor volutpat mattis. "
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Curabitur malesuada sem sit amet massa egestas aliquet. "
                    "Aliquam erat volutpat.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Horizontal Gallery
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of images in the gallery
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/sample_poster.jpg', // Replace with your image asset
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      //bottomNavigationBar: const BottomNavBar(currentRoute: '/movie_detail'),
    );
  }
}

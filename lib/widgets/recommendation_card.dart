

import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String imageUrl;
  final String location;
  final String date;
  final String userName;
  final String userImageUrl;
  final String likes;

  const RecommendationCard({
    required this.imageUrl,
    required this.location,
    required this.date,
    required this.userName,
    required this.userImageUrl,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350, // Set the height for the container
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageUrl,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
  
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            
            ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(userImageUrl),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            location,
                            style: const TextStyle(
                                color: Colors.white,),
                          ),
                          Text(
                            date,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            userName,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const Icon(Icons.favorite, color: Colors.red),
                          Text(likes, style: const TextStyle(color: Colors.white)),
                          const Icon(Icons.share, color: Colors.white),
                        ],
                      ),
                    ],
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

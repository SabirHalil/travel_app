import 'package:flutter/material.dart';

class VisitedPlacesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final places = [
      {'image': 'Historical.png', 'title': 'Zelve', 'location': 'Nevşehir'},
      {'image': 'Education.png', 'title': 'Hunat Hatun Madrasa', 'location': 'Kayseri'},
      {'image': 'Relaxation & Spa.png', 'title': 'Hunat Hatun Madrasa', 'location': 'Kayseri'},
      {'image': 'Museums.png', 'title': 'Kayseri Ulu Cami', 'location': 'Kayseri'},
      {'image': 'Mountains.png', 'title': 'Kayseri Kalesi', 'location': 'Kayseri'},
      {'image': 'Water-Related.png', 'title': 'Kayseri Kalesi', 'location': 'Kayseri'},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: places.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          final place = places[index];
          return _buildVisitedPlaceCard(
            place['image']!,
            place['title']!,
            place['location']!,
          );
        },
      ),
    );
  }

  Widget _buildVisitedPlaceCard(String imageUrl, String title, String location) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/$imageUrl'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CategorySelectionWidget extends StatefulWidget {
  @override
  _CategorySelectionWidgetState createState() =>
      _CategorySelectionWidgetState();
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  final List<Map<String, String>> categories = [
    {'name': 'Historical', 'image': 'Historical.png'},
    {'name': 'Museums', 'image': 'Museums.png'},
    {'name': 'Religious', 'image': 'Religious Sites.png'},
  ];

  final List<Map<String, String>> places = [
    





    {'image': 'Historical.png', 'title': 'Zelve', 'location': 'Nevşehir'},
    {'image': 'Education.png', 'title': 'Hunat Hatun Madrasa', 'location': 'Kayseri'},
    {'image': 'Relaxation & Spa.png', 'title': 'Hunat Hatun Madrasa', 'location': 'Kayseri'},
    {'image': 'Water-Related.png', 'title': 'Kayseri Ulu Cami', 'location': 'Kayseri'},
    {'image': 'Museums.png', 'title': 'Kayseri Kalesi', 'location': 'Kayseri'},
    {'image': 'Mountains.png', 'title': 'Kayseri Kalesi', 'location': 'Kayseri'},
  ];

  int selectedCategoryIndex = 0;
  Set<int> selectedPlaces = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedCategoryIndex == index
                        ? Colors.red
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/${category['image']!}'),
                      ),
                     const SizedBox(height: 8),
                      Text(
                        category['name']!,
                        style: TextStyle(
                          color: selectedCategoryIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: places.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              final place = places[index];
              final isSelected = selectedPlaces.contains(index);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedPlaces.remove(index);
                    } else {
                      selectedPlaces.add(index);
                    }
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/${place['image']!}'),
                          fit: BoxFit.cover,
                          colorFilter: isSelected
                              ? ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.dstATop,
                                )
                              : null,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place['title']!,
                            style: const TextStyle(
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
                            place['location']!,
                            style:const TextStyle(
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
                    if (isSelected)
                      const Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
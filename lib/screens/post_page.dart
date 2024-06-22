import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          Container(
            height: 35.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_photo_alternate, size: 50, color: Colors.grey),
                Text('Add an image'),
              ],
            ),
          ),
         const SizedBox(height: 16),
        TextField(
              controller: textController,
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red.withOpacity(0.1),
                hintText: 'Share your travel experience!',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
         const SizedBox(height: 16),
      TextField(
              controller: locationController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red.withOpacity(0.1),
                hintText: 'Search location...',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
                suffixIcon:const Icon(Icons.search),
              ),
            ),
        const  SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Handle the post action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize:const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:const Text(
                'Post',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

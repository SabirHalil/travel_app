import 'package:flutter/material.dart';
import 'package:travel_app/widgets/gradient_circle_avatar.dart';
import 'package:travel_app/widgets/recommendation_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GradientCircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/person1.png'),
              ),
              GradientCircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/2.jpg'),
              ),
              GradientCircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/3.jpg'),
              ),
              GradientCircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/4.jpg'),
              ),
              GradientCircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/person2.png'),
              ),
              GradientCircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/person3.png'),
              ),
              GradientCircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/person4.png'),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
          thickness: 1,
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Text(
              '   Your recommendations are ready :)  ',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
            ),
          ],
        ),
      const  RecommendationCard(
            imageUrl: 'assets/images/kaputas_plaji.png',
            location: 'Kaputas Beach, Turkey',
            date: '01.01.2024',
            userName: 'Claire Williams',
            userImageUrl: 'assets/images/person3.png',
            likes: '2.2k'),
      const              RecommendationCard(
            imageUrl: 'assets/images/goreme.png',
            location: 'Goreme, Turkey',
            date: '01.05.2024',
            userName: 'Adam Smith',
            userImageUrl: 'assets/images/person1.png',
            likes: '8.5k')
      ],
    );
  }
}

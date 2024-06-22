import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app/widgets/visited_place_grid.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 20.h,
          margin: EdgeInsets.symmetric(horizontal: 05.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ece Naz',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Text('ecenaz@gmail.com'),
                ],
              ),
              SizedBox(
                width: 15.h,
                height: 15.h,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/person3.png'),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 05.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '12',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  const Text('Posts'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '120',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  const Text('Followers'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '1200',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  const Text('Following'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TabBar(
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          tabs: const [
            Tab(text: 'My Photos'),
            Tab(text: 'Visited Place'),
            Tab(text: 'Travel Plan'),
          ],
        ),
        SizedBox(
          height: 50.h,
          child: Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                VisitedPlacesGrid(),
                VisitedPlacesGrid(),
                VisitedPlacesGrid(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

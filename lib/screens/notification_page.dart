import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app/core/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Map<String, String>> notifications = [
    {
      'image': 'https://randomuser.me/api/portraits/men/2.jpg',
      'name': 'Nevşehir',
      'message': 'Your Travel Recommendations Are Ready!',
      'time': '3m ago'
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/1.jpg',
      'name': 'Ahmet',
      'message': 'You Have a New Follower!',
      'time': '20m ago'
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/1.jpg',
      'name': 'Ayşe',
      'message': 'Your Photo was Liked!',
      'time': '25m ago'
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/2.jpg',
      'name': 'Guides Turkiye',
      'message': 'You can get new location recommendation!',
      'time': '30m ago'
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/10.jpg',
      'name': 'Ahmet',
      'message': 'You Have a New Follower!',
      'time': '20m ago'
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/1.jpg',
      'name': 'Ayşe',
      'message': 'Your Photo was Liked!',
      'time': '25m ago'
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/6.jpg',
      'name': 'Gökhan',
      'message': 'You Have a New Follower!',
      'time': '30m ago'
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/5.jpg',
      'name': 'Selma',
      'message': 'Your Photo was Liked!',
      'time': '25m ago'
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/7.jpg',
      'name': 'Buket',
      'message': 'Your Photo was Liked!',
      'time': '25m ago'
    },
  ];
  var list = ['New', 'Old', 'All'];
  String dropdownValue = 'New';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Mark all read'), _dropDownWidget()],
          ),
        ),
    _notificationList(),
      ],
    );
  }

  _dropDownWidget() {
    return SizedBox(
      width: 25.w,
      child: DropdownButton<String>(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        focusColor: Colors.black,
        style: const TextStyle(
          color: Colors.black,
        ),
        iconDisabledColor: GlobalColors.primaryColor,
        iconEnabledColor: GlobalColors.primaryColor,
        value: dropdownValue,
        underline: Container(),
        icon: const Icon(Icons.arrow_drop_down),
        borderRadius: BorderRadius.circular(10),
        isExpanded: true,
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    );
  }

  _notificationList() {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(notification['image']!),
            ),
            title: Text(notification['name']!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle:   Text(notification['message']!),   
            trailing:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.more_horiz, color: GlobalColors.primaryColor,),
                SizedBox(height: 5),
                Text(notification['time']!,
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
        
          );
        },
      ),
    );
  }
}

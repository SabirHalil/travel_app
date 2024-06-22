import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/widgets/custom_button.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
      var list = ['Kayseri', 'Istanbul', 'Adana', 'Ankara'];
    String dropdownValue = 'Kayseri';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 15.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_blur.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Text('Which city would you like to visit?',
                  style: TextStyle(fontSize: 18.sp))),
        ),
        const SizedBox(height: 10),
        Center(
            child: Image(
          image: const AssetImage('assets/images/touch_map.png'),
          height: 30.h,
          width: 60.w,
          fit: BoxFit.fill,
        )),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Please select the city you plan to visit before we suggest locations. Based on you selection, we will recommend places in that city.',
            style: TextStyle(fontSize: 18.sp, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 10),
        _dropDownWidget(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(text: 'Let\s get personal', onPressed: (){}),
        ),
      ],
    );
  }

  _dropDownWidget() {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(125, 250, 232, 232),
      ),
      child: DropdownButton<String>(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        focusColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
        ),
        value: dropdownValue,
        underline: Container(),
        icon: const Icon(Icons.arrow_drop_down),
        borderRadius: BorderRadius.circular(10),
        isExpanded: true,
        
        items: list
            .map((String value) {
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
}

import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            //border color
            borderSide: const BorderSide(color: Color(0XFF888C94), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            //border color when search is pressed
            borderSide: const BorderSide(
              color: Color(0XFF888C94),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white, //background color
          filled: true,
          suffixIcon: const Icon(Icons.search),
          suffixIconColor: const Color(0XFF888C94), //icon color
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Color(0XFF888C94), // text color in the textfield
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}

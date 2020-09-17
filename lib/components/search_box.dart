import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        fillColor: Theme.of(context).primaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(width: 2.0),
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 28.0,
          color: Colors.white,
        ),
      ),
      onChanged: (value) {
        print(value);
      },
    );
  }
}

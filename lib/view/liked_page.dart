import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back)),
        title: Text(
          'Like Page',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Lord Huron',
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  'Take me back to the night we met',
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}

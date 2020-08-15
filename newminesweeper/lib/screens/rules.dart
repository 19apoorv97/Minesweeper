import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  static final String id='rules';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text('Instructions'),
          ),
          body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get the girl before her boyfriend comes!',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Each box either contains a mine or a number, avoid stepping on mines and flag the box, the numbers help you guess where the next mine can be.',
                    style: TextStyle(fontSize:18),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '(Suppose a box has number 2 then all the boxes that are in direct contact with that box will contain 2 mines)',
                    style: TextStyle(fontSize:18),),
                )
              ],
            ),
        ),
    );
  }
}
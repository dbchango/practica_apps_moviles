import 'package:flutter/material.dart';
import 'package:mascha_bus/widgets/current_location_widget.dart';
import 'package:mascha_bus/widgets/form_widget.dart';
import 'package:mascha_bus/widgets/lines_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();  

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _pages = <Widget>[
    CurrentLocationWidget(
      key: PageStorageKey('Current'),
    ),
    LinesWidget(
      key: PageStorageKey('Lines'),
    ),
    FormWidget(
      key: PageStorageKey('Form')
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text('Mashca Bus : '+ _pages[_selectedIndex].key.toString()),
       ),
       body: PageStorage(bucket: _bucket, child: _pages[_selectedIndex],),
       bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle),
            label: 'Ubications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_center),
            label: 'Form',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
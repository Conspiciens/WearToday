import 'package:flutter/material.dart';


class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key}); 

  @override
  State<NavigationBarWidget> createState() => _NavigationBarState();  
}

class _NavigationBarState extends State<NavigationBarWidget> {
  int pageCurrentIndex = 0; 
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior, 
        selectedIndex: pageCurrentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            pageCurrentIndex = index; 
          });
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Fit Check'),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark_border), 
            icon: Icon(Icons.bookmark), 
            label: 'Wardrobe')
        ] 
      )
    ); 
  }
}


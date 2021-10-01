import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/presentation/widgets/persons_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: PersonsList(),
    );
  }
}

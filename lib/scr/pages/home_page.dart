import 'package:flutter/material.dart';

import 'package:qrreaderapp/scr/pages/direciones_page.dart';
import 'package:qrreaderapp/scr/pages/mapas_page.dart';

import 'package:qrcode_reader/qrcode_reader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){},
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  _scanQR() async{
    // geo:40.776250712734054,-73.97298231562502
    String futureString = '';

    //try {
    //  futureString = await new QRCodeReader().scan();
    //}catch(e){
    //  print(e.toString());
    //}

    //print('futureString: $futureString');

    //if(futureString != null){
    //  print(futureString);
    //}
  }

  Widget _crearBottomNavigationBar(){
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        )
      ],

    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return MapasPage();
      case 1: return DirrecionesPage();

      default:
        return MapasPage(); 
    }
  }
}


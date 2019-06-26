import 'package:flutter/material.dart';
import 'package:qrreaderapp/scr/bloc/scans_bloc.dart';
import 'package:qrreaderapp/scr/models/scan_model.dart';

import 'package:qrreaderapp/scr/pages/direciones_page.dart';
import 'package:qrreaderapp/scr/pages/mapas_page.dart';

import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrreaderapp/scr/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.borrarScanTODOS,
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
    String futureString = 'https://www.udemy.com';

    //try {
    //  futureString = await new QRCodeReader().scan();
    //}catch(e){
    //  print(e.toString());
    //}

    if(futureString != null){
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);

      //final scan2 = ScanModel(valor: 'geo:40.776250712734054,-73.97298231562502');
      //scansBloc.agregarScan(scan2);

      utils.abrirScan(context, scan);
    }
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


import 'package:flutter/material.dart';
import 'package:qrreaderapp/scr/models/scan_model.dart';


class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coosrdenadas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ],
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}
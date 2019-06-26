import 'dart:async';

import 'package:qrreaderapp/scr/providers/db_provider.dart';

class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc(){
    return _singleton;
  }

  ScansBloc._internal(){
     obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream;

  dispose(){
    _scansController?.close();
  }

  obtenerScans() async {
    _scansController.sink.add(await DBProvider.db.todosLosScans());
    
  }

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScanTODOS() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }
}
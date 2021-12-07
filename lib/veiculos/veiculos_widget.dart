import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VeiculosWidget extends StatefulWidget {
  const VeiculosWidget({
    Key key,
    this.cadsr,
  }) : super(key: key);

  final DocumentReference cadsr;

  @override
  _VeiculosWidgetState createState() => _VeiculosWidgetState();
}

class _VeiculosWidgetState extends State<VeiculosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CadastroDeVeiculoRecord>(
      stream: CadastroDeVeiculoRecord.getDocument(widget.cadsr),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitFadingCircle(
                color: Color(0xFFFF5A00),
                size: 50,
              ),
            ),
          );
        }
        final veiculosCadastroDeVeiculoRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Meus veículos',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: Icon(
              Icons.games,
              color: Colors.white,
              size: 24,
            ),
          ),
          body: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

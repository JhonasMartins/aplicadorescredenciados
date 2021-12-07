import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditarPerfilWidget extends StatefulWidget {
  const EditarPerfilWidget({Key key}) : super(key: key);

  @override
  _EditarPerfilWidgetState createState() => _EditarPerfilWidgetState();
}

class _EditarPerfilWidgetState extends State<EditarPerfilWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          'Editar Perfil',
          style: FlutterFlowTheme.subtitle1.override(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xC01F1F1F),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [],
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: 90,
                            height: 90,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/composto_1.jpg',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          'Edit Image',
                          style: GoogleFonts.getFont(
                            'DM Sans',
                            color: Color(0xFFFF5A00),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 20),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Seu nome',
                                  labelStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintText: 'What do people call you...?',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Endereço de email',
                                  labelStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SwitchListTile(
                        value: switchListTileValue ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue = newValue),
                        title: Text(
                          'Receber Notificações',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Ligar as notificações.',
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        tileColor: Colors.white,
                        activeColor: FlutterFlowTheme.primaryColor,
                        activeTrackColor: Color(0xFF9C9C9C),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final userUpdateData = createUserRecordData(
                                  email: '',
                                  displayName: '',
                                  photoUrl: '',
                                  wallpaper: '',
                                );
                                await currentUserReference
                                    .update(userUpdateData);
                              },
                              text: 'Salvar',
                              options: FFButtonOptions(
                                width: 230,
                                height: 50,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 8,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

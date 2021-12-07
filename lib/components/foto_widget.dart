import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FotoWidget extends StatefulWidget {
  const FotoWidget({Key key}) : super(key: key);

  @override
  _FotoWidgetState createState() => _FotoWidgetState();
}

class _FotoWidgetState extends State<FotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xFF191919),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/images/8a329a73192035.5c011ba24d298.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 25),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Card Title',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          getCurrentTimestamp.toString(),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida mattis lorem, et posuere tortor rutrum vitae. Vivamus lacinia fringilla libero, at maximus quam imperdiet sed. Pellentesque egestas eget ex a consectetur.',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Button',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

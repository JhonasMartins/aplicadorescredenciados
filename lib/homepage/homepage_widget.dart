import '../backend/backend.dart';
import '../components/foto_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({
    Key key,
    this.estetica,
  }) : super(key: key);

  final EsteticaRecord estetica;

  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  List<EsteticaRecord> algoliaSearchResults = [];
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EsteticaRecord>>(
      future: EsteticaRecord.search(
        term: algoliaSearchResults.length.toString(),
      ),
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
        List<EsteticaRecord> homepageEsteticaRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF5A00),
            automaticallyImplyLeading: true,
            title: Image.asset(
              'assets/images/LOGOTIPO_SOFT99_2020-03.png',
              width: 55,
              height: 44,
              fit: BoxFit.cover,
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Colors.white,
          drawer: Drawer(
            elevation: 16,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/8a329a73192035.5c011ba24d298.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'JHONAS MARTINS',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'suporte@soft99.com.br',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFDBDBDB),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Color(0xFF7C7C7C),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Insira a sua cidade...',
                                      hintStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    setState(() => algoliaSearchResults = null);
                                    await EsteticaRecord.search(
                                      term: textController.text,
                                      location: googleMapsCenter,
                                      maxResults: 30,
                                    )
                                        .then((r) => algoliaSearchResults = r)
                                        .onError((_, __) =>
                                            algoliaSearchResults = [])
                                        .whenComplete(() => setState(() {}));
                                  },
                                  text: 'Pesquisar',
                                  icon: Icon(
                                    Icons.location_searching,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 150,
                                    height: 40,
                                    color: Color(0xC0FFFFFF),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFF5A00),
                                      fontSize: 15,
                                    ),
                                    borderSide: BorderSide(
                                      color: Color(0xFFFF5A00),
                                      width: 1,
                                    ),
                                    borderRadius: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: FlutterFlowGoogleMap(
                              controller: googleMapsController,
                              onCameraIdle: (latLng) =>
                                  setState(() => googleMapsCenter = latLng),
                              initialLocation: googleMapsCenter ??=
                                  LatLng(13.106061, -59.613158),
                              markers: (algoliaSearchResults ?? [])
                                  .map(
                                    (algoliaSearchResultsItem) =>
                                        FlutterFlowMarker(
                                      algoliaSearchResultsItem.reference.path,
                                      algoliaSearchResultsItem.localizacao,
                                      () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: 500,
                                                child: FotoWidget(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                              markerColor: GoogleMarkerColor.violet,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.silver,
                              initialZoom: 14,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: true,
                              showMapToolbar: false,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

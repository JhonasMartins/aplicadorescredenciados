import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({Key key}) : super(key: key);

  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget>
    with TickerProviderStateMixin {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
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
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Image.asset(
          'assets/images/LOGOTIPO_SOFT99_2020-03.png',
          width: 60,
          height: 48,
          fit: BoxFit.cover,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 24,
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      drawer: Drawer(
        elevation: 16,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: 200,
          child: Stack(
            children: [
              PageView(
                controller: pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(
                    'assets/images/8a329a73192035.5c011ba24d298.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ).animated([animationsMap['imageOnPageLoadAnimation']]),
                  Image.asset(
                    'assets/images/90774579_2356627031302292_8988738398676058112_n.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/6f184323313945.563230731c047.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-0.85, 0.85),
                child: SmoothPageIndicator(
                  controller: pageViewController ??=
                      PageController(initialPage: 0),
                  count: 3,
                  axisDirection: Axis.horizontal,
                  onDotClicked: (i) {
                    pageViewController.animateToPage(
                      i,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  effect: ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 8,
                    radius: 16,
                    dotWidth: 5,
                    dotHeight: 6,
                    dotColor: Colors.white,
                    activeDotColor: Color(0xFFFF5A00),
                    paintStyle: PaintingStyle.stroke,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

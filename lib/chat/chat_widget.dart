import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key key,
    this.chatUser,
  }) : super(key: key);

  final UserRecord chatUser;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'chatPageOnPageLoadAnimation': AnimationInfo(
      curve: Curves.linear,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        automaticallyImplyLeading: true,
        title: Text(
          widget.chatUser.displayName,
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<FFChatInfo>(
          future: FFChatManager.instance.getChatInfo(
            currentUserReference,
            widget.chatUser.reference,
            ChatUser(
              uid: widget.chatUser.reference.id,
              name: widget.chatUser.displayName,
              avatar: widget.chatUser.photoUrl,
            ),
          ),
          builder: (context, snapshot) => snapshot.hasData
              ? FFChatPage(
                  chatInfo: snapshot.data,
                  allowImages: true,
                  backgroundColor: Colors.white,
                  timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                  currentUserBoxDecoration: BoxDecoration(
                    color: Color(0xFFF2FFC1),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  otherUserBoxDecoration: BoxDecoration(
                    color: Color(0xC01F1F1F),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  currentUserTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Color(0xFF1E2429),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                  ),
                  otherUserTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  inputHintTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Color(0xFF95A1AC),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  inputTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                )
              : const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitFadingCircle(
                      color: Color(0xFFFF5A00),
                      size: 50,
                    ),
                  ),
                ),
        ).animated([animationsMap['chatPageOnPageLoadAnimation']]),
      ),
    );
  }
}

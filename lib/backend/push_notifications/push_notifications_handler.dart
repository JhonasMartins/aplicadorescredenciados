import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../homepage/homepage_widget.dart';
import '../../editar_perfil/editar_perfil_widget.dart';
import '../../configuracao/configuracao_widget.dart';
import '../../chat/chat_widget.dart';
import '../../veiculos/veiculos_widget.dart';
import '../../login/login_widget.dart';
import '../../cadastro/cadastro_widget.dart';
import '../../ajuda/ajuda_widget.dart';
import '../../andamento/andamento_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFF171717),
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/SOFT99-04.png',
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Homepage': (data) async => HomepageWidget(
        estetica: await getDocumentParameter(
            data, 'estetica', EsteticaRecord.serializer),
      ),
  'EditarPerfil': (data) async => EditarPerfilWidget(),
  'Configuracao': (data) async => ConfiguracaoWidget(),
  'chat': (data) async => ChatWidget(
        chatUser:
            await getDocumentParameter(data, 'chatUser', UserRecord.serializer),
      ),
  'chats': (data) async => NavBarPage(initialPage: 'ChatsWidget'),
  'Veiculos': (data) async => VeiculosWidget(
        cadsr: getParameter(data, 'cadsr'),
      ),
  'Login': (data) async => LoginWidget(),
  'Cadastro': (data) async => CadastroWidget(),
  'PerfilCopy': (data) async => NavBarPage(initialPage: 'PerfilCopyWidget'),
  'Ajuda': (data) async => AjudaWidget(),
  'andamento': (data) async => AndamentoWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

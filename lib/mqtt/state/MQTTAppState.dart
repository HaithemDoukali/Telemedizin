/*
*  
*/

import 'package:flutter/cupertino.dart';

// enumeration for connection state - if App is connected etc.
enum MQTTAppConnectionState { connected, disconnected, connecting }

/* MQTTAppState is ChangeNotifier object
*  -> when change happend to any field you can notified listeners
*  -> updte UI
*/

class MQTTAppState with ChangeNotifier {
  MQTTAppConnectionState _appConnectionState =
      MQTTAppConnectionState.disconnected;

  String _receivedText = ''; // text received from topic
  String _historyText = ''; // what we have send

  // Setter
  void setReceivedText(String text) {
    _receivedText = text;
    _historyText = _historyText + '\n' + _receivedText;
    notifyListeners(); // call all the registered listeners -> update
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  // Getter
  String get getReceivedText => _receivedText;
  String get getHistoryText => _historyText;
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}

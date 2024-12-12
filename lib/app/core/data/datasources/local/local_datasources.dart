import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/session_model.dart';

class SessionDatasources {
  final Box<SavedSession> box;

  SessionDatasources({
    required this.box,
  });
  Future<void> saveSession(SavedSession session) async {
    await box.put('session', session);
    debugPrint("session saved $session");
  }

  Future<void> deleteSession() async {
    await box.delete('session');
  }

  // stream session
  ValueListenable<Box<SavedSession>> get listenableSession => box.listenable(keys: ['session']);

  SavedSession? getSession() {
    final session = box.get('session');
    // check if session is expired
    if (session != null && DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(session.expiresAt * 1000))) {
      deleteSession();
      return null;
    }

    return session;
  }
}

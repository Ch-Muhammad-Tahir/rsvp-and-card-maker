import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class HelperFunction {
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Route createRoute({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static String generateUniqueKey(
      {int length = 32,
      bool caseSensitive = true,
      bool includeSpecialChars = true}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final randomPart = _generateRandomString(
      length: length - now.toString().length,
      caseSensitive: caseSensitive,
      includeSpecialChars: includeSpecialChars,
    );
    final uniqueString = '${now.toString()}$randomPart';
    return uniqueString;
  }

  static String _generateRandomString(
      {required int length,
      bool caseSensitive = true,
      bool includeSpecialChars = true}) {
    final charPool = caseSensitive
        ? (includeSpecialChars
            ? 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+[{]}\\|;:",<.>/?'
            : 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789')
        : (includeSpecialChars
            ? 'abcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()-_=+[{]}\\|;:",<.>/?'
            : 'abcdefghijklmnopqrstuvwxyz0123456789');
    final random = Random.secure();
    final randomBytes = List<int>.generate(length, (_) => random.nextInt(256));
    final randomString = String.fromCharCodes(randomBytes
        .map((byte) => byte % charPool.length + charPool.codeUnitAt(0)));
    return randomString;
  }
}

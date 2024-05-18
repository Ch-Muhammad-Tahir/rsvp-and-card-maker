import 'dart:convert';
import 'dart:io';

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

  static String generateUniqueKey({int length = 64}) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final micro = DateTime.now().microsecondsSinceEpoch.toString();
    final randomValue = Random.secure().nextInt(1 << 32).toString();
    const alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const specialChars = "!@#\$%&?";

    // Shuffle the alphabet string
    final shuffledAlphabet = alphabet.split('')..shuffle();
    // Select a random subset of characters from the shuffled alphabet
    final randomAlphabetSubset = shuffledAlphabet
        .take(length)
        .join(); // Take 'length' characters from the shuffled alphabet

    // Combine all components into a single list of characters
    final allChars = (timestamp +
            randomValue +
            specialChars +
            randomAlphabetSubset +
            micro)
        .split('')
      ..shuffle();

    // Combine the shuffled characters into a single string
    final uniqueString = allChars
        .join('')
        .substring(0, length); // Ensure final string is of length 'length'

    return uniqueString;
  }
}

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DocumentReference> usersList(
  DocumentReference user1,
  DocumentReference user2,
) {
  return [user1, user2];
}

bool checkUsers(
  DocumentReference currentUser,
  DocumentReference anotherUser,
  List<DocumentReference> members,
) {
  if ((currentUser == members.first || currentUser == members.last) &&
      (anotherUser == members.first || anotherUser == members.last)) {
    return true;
  }
  return false;
}

bool? newCustomFunction(int? index) {
  // Check if the integer argument named index is a multiple of three, specifically returning true when index divided by three leaves a remainder of two. The function should return a boolean value.
  if (index == null) return null; // Check for null input
  return index % 3 ==
      2; // Return true if index leaves a remainder of 2 when divided by 3
}

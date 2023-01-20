library foodapp_services;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/utils/_index.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

part 'recipes_service.dart';
part 'auth_service.dart';

NetworkUtil _networkUtil = NetworkUtil();

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:token/utils/constants.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  Map<String, dynamic> decodeToken = decode(yourToken);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('User Info',style: TextStyle(color: Colors.white),),
      ),
      body:  Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey
            ),
            child: Column(children: [
                Text('Name: ${decodeToken['user_info']['name']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                Text('Address: ${decodeToken['user_info']['organization'][0]['name']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                Text('UID: ${decodeToken['user_info']['organization'][0]['uuid']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                Text('Active: ${decodeToken['user_info']['organization'][0]['active']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                Text('Amaliyotchi roli UID:  ${decodeToken['user_info']['organization'][0]['practitioner_role'][0]['uuid']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                Text('Amaliyotchi roli Code: ${decodeToken['user_info']['organization'][0]['practitioner_role'][0]['code']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                Text('SUB: ${decodeToken['sub']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                Text('EXP: ${decodeToken['exp']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                Text('Client id: ${decodeToken['client_id']}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.start,),
            ]),
          ),
        ],
      ),
    );
  }
}

 Map<String, dynamic> decode(String token) {
    final splitToken = token.split(".");
    if (splitToken.length != 3) {
      throw FormatException('Invalid token');
    }
    try {
      final payloadBase64 = splitToken[1]; 
      final normalizedPayload = base64.normalize(payloadBase64);
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      final decodedPayload = jsonDecode(payloadString);

      // Return the decoded payload
      return decodedPayload;
    } catch (error) {
      throw FormatException('Invalid payload');
    }
  }
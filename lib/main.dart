import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: const Text("GSoC Network Tool"),
          backgroundColor: Colors.blueAccent,
        ),

        body: Center(
          child: NetworkControlPanel(),
        ),
      ),
    ); 
  }
}

class NetworkControlPanel extends StatelessWidget{
  const NetworkControlPanel({super.key});
  Future<void> fetchData() async{
    final String apiUrl = "https://jsonplaceholder.typicode.com/posts/1";
    try{
      print("Requesting data from: $apiUrl");
      final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "User-Agent": "PostmanRuntime/7.26.8", // Sunucunun seni reddetmesini engeller
        "Accept": "*/*",
      },
    );

      if (response.statusCode ==200){
        print("Success! Data received: ${response.body}");
      }
      else{
        print("Error: Status code ${response.statusCode}");
      }
    }
    catch(e){
      print("Connection failed: $e");
    }
  }

  void testWebSocket() async{
    print("Attempting to open WebSocket connection via dart:io...");
    try{
      final socket = await WebSocket.connect("wss://echo.websocket.org");
      socket.listen((message){
        print("LIVE FRAME RECEIVING: $message");
      }, onDone: ()=> print("WebSocket connection closed."));

      print("Sending Websocket frame...");
      socket.add("Hello GSoC! Can the Network Tab see this specific test?");
    }catch (e){
      print ("WebSocket Error: $e");
    }
  }
  
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: fetchData,
          child: const Text("Test HTTP (Visible in DevTools)"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: testWebSocket,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: const Text("Test WebSocket (Invisible Frames)"),
        ),
      ],
    );
  }
}

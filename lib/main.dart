import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fetchData, 
      child: Text("Fetch Data from Internet"),
    );
  }
}

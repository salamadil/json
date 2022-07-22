import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const fe());
}

class fe extends StatefulWidget {
  const fe({super.key});

  @override
  State<fe> createState() => _feState();
}

class _feState extends State<fe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("hi my name ....."),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
            ),
            Text(
              "hi my friend so ",
              style: TextStyle(
                  backgroundColor: Colors.amberAccent, letterSpacing: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.amberAccent,
                height: 40,
                width: 30,
                child: FutureBuilder(
                  future: ad(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("loading...");
                    }
                    ;
                    if (snapshot.hasError) {
                      return Text(Error().toString());
                    }
                    if (snapshot.data == null) {
                      return Text("no data");
                    }
                    return Text("you look a good man ): ");
                  },
                ),
              ),
            ),
            Container(
              height: 300,
              width: 590,
              color: Colors.grey,
              child: FutureBuilder(
                future: hg(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("loading...");
                  }
                  ;
                  if (snapshot.hasError) {
                    return Text("hi");
                  }
                  if (snapshot.data == null) {
                    return Text("no data");
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          snapshot.data[index]["name"].toString(),
                        ),
                        trailing: Text("salam"),
                        subtitle: Text(
                          snapshot.data[index]["address"].toString(),
                        ),
                        title: Text(
                          snapshot.data[index]["name"].toString(),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future ad() async {
    return await Future.delayed(Duration(seconds: 4)).then((value) => true);
  }

  Future hg() async {
    String line = "https://jsonplaceholder.typicode.com/users";
    http.Response d1 = await http.get(Uri.parse(line));
    var d = json.decode(d1.body);
    return d;
  }
}
/*
class f extends StatefulWidget {
  const f({super.key});

  @override
  State<f> createState() => _fState();
}

class _fState extends State<f> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // drawerEdgeDragWidth: 100,
      appBar: AppBar(
        title: Text("salam"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("data"),
          Container(
            height: 28,
            width: 20,
            child: FutureBuilder(
              future: as(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                ;
                if (snapshot.data == Error) {
                  return Text(snapshot.data.Error.toString());
                  ;
                }
                ;
                return Text("return");
              },
            ),
          ),
          Expanded(
              child: Container(
            child: FutureBuilder(
              future: fetchPostsFromApi(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      height: 70,
                      width: 70,
                      child: CircularProgressIndicator()); //loading
                } else if (snap.hasError) {
                  return Text(snap.error.toString());
                } else if (snap.data == null) {
                  return Text('no data');
                }
                return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.amberAccent,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          snap.data![index]["title"].toString(),
                        ),
                      );
                    });
              },
            ),
          )),
        ],
      ),
    ));
  }
  /*

  Future wit() async {
    return await Future.delayed(Duration(seconds: 10)).then((value) => true);
  }

  Future ait() async {
    return await Future.delayed(Duration(seconds: 5)).then((value) => true);
  }
  */

  Future as() async {
    return await Future.delayed(Duration(seconds: 10)).then((value) => true);
  }

  Future fetchPostsFromApi() async {
    final String _apiEndpoint = "https://jsonplaceholder.typicode.com/posts";
    http.Response _response = await http.get(Uri.parse(_apiEndpoint));
    var _decodedJson = json.decode(_response.body);
    /* List<Map<String, dynamic>> _listOfPosts =
        _decodedJson.cast<Map<String, dynamic>>();

    print(_listOfPosts[0]["title"].toString());
    
    return _listOfPosts;
  */
    return _decodedJson;
  }
}
*/

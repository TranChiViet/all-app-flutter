import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> characters = [];
  bool _isLoading = false;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _isLoading
            ? const CircularProgressIndicator()
            : characters.isEmpty
                ? Center(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            fetchData();
                          });
                        },
                        child: const Text('Fetch Data')),
                  )
                : ListView.builder(itemBuilder: ((context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image(
                            image: NetworkImage(characters[index]['image'])),
                        title: Text(characters[index]['name']),
                      ),
                    );
                  })));
  }

  void fetchData() async {
    setState(() {
      _isLoading = true;
    });

    HttpLink link = HttpLink("https://rickandmortyapi.com/graphql");
    GraphQLClient qlClient = GraphQLClient(
        link: link,
        cache: GraphQLCache(
          store: HiveStore(),
        ));
    QueryResult queryResult =
        await qlClient.query(QueryOptions(document: gql(""" query{
            characters(){
              results{
                name
                species
                image
              }
            }
          }
""")));
    setState(() {
      characters = queryResult.data!['characters']['results'];
      _isLoading = false;
    });
  }
}

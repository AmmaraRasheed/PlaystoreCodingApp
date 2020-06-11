import 'package:flutter/material.dart';

class MySearch extends StatefulWidget {
  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final List<String> city_names = [
    "Aberdeen","classAurora","Austin","Bakersfield","York",
    "Youngstown"];
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Searchview"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String selected = await showSearch(
                  context: context, delegate: _MySearchDelegate(city_names));

              if (selected != null && selected != query) {
                setState(() {
                  query = selected;
                });
              }
            },
          )
        ],
      ),
      body: Container(
        child: _buildList(''),
      ),
    );
  }

  Widget _buildList(_searchText) {
    final searchItems = query.isEmpty ? city_names : city_names
        .where((c) => c.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchItems.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text((searchItems[index])),
          leading: Icon(Icons.location_city),
//          subtitle: Text('Search'),
        );
      },
    );
  }
}

class _MySearchDelegate extends  SearchDelegate<String>{

  final List<String> city_names;
  _MySearchDelegate(this.city_names);

  final List<String> _history = [
    "Aurora",
    "Austin",
    "Bakersfield",
    "Baltimore",
    "Barnstable",
    "Baton Rouge",
    "Beaumont",
    "Bel Air",
    "Bellevue",
    "Berkeley",
    "Bethlehem"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {

    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon((Icons.clear)),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {


    print("Myquery");
    print(query);
    final suggestions = query.isEmpty
        ? _history
        : city_names.where((c) => c.toLowerCase().contains(query)).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(suggestions[index]),
            onTap: () {
//              showResults(context);
              close(context, suggestions[index]);

            },
          );
        });


  }
  
}

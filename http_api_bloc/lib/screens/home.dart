import 'package:flutter/material.dart';

import '../blocs/bloc_export.dart';
import '../elements/element_export.dart';
import '../models/food.dart';
import 'food_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FoodBloc foodBloc;

  @override
  void initState() {
    foodBloc = BlocProvider.of<FoodBloc>(context);
    foodBloc.add(FetchFoodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: FoodSearch(
                        searchBloc: BlocProvider.of<SearchBloc>(context)));
              }),
        ],
      ),
      body: Container(
        child: BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
          if (state is FoodInitialState) {
            return buildLoading();
          } else if (state is FoodLoadingState) {
            return buildLoading();
          } else if (state is FoodLoadedState) {
            return buildHintsList(state.recipes);
          } else if (state is FoodErrorState) {
            return buildError(state.message);
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

class FoodSearch extends SearchDelegate<List> {
  SearchBloc searchBloc;
  FoodSearch({required this.searchBloc});
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, []);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    String queryString;
    queryString = query;
    searchBloc.add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        if (state is SearchUninitialized) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchError) {
          return Center(
            child: Text('Failed To Load'),
          );
        }
        if (state is SearchLoaded) {
          if (state.recipes.isEmpty) {
            return Center(
              child: Text('No Results'),
            );
          }
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FoodDetail(recipes: state.recipes[index])));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 90,
                            width: 100,
                            child:
                                Image.network(state.recipes[index].imageUrl)),
                        Text(state.recipes[index].title),
                      ],
                    ),
                  ),
                );

                //Text(state.recipes[index].title);
              },
              itemCount: state.recipes.length);
        }
        return Scaffold();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

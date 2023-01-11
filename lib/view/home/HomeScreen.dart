// ignore_for_file: prefer_const_declarations, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, avoid_print, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/remote/response/Status.dart';
import 'package:flutter_mvvm/view/widget/MyTextView.dart';
import 'package:flutter_mvvm/view_model/home/MoviesListVM.dart';
import 'package:provider/provider.dart';
import '../../models/moviesList/MoviesMain.dart';
import '../../themes/AppContextExtension.dart';

class HomeScreen extends StatefulWidget {
  
  static final String id = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Create ViewModel Object
  final MoviesListVM viewModel = MoviesListVM();

  @override
  void initState() {
    viewModel.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: MyTextView(context.resources.strings.homeScreen, context.resources.color.colorWhite, context.resources.dimension.bigText)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ChangeNotifierProvider<MoviesListVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<MoviesListVM>(builder: (context, viewModel, _) {
          switch (viewModel.movieMain.status) {
            case Status.LOADING:
              print("LOADING");
              return CircularProgressIndicator();
            case Status.ERROR:
              print("ERROR");
              return Container(child: Text("Error"),);
            case Status.COMPLETED:
              print("COMPLETED");
              return _getMoviesListView(viewModel.movieMain.data?.results);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  // Movie List
   Widget _getMoviesListView(List<Result?>? moviesList) {
    return ListView.builder(
        itemCount: moviesList?.length,
        itemBuilder: (context, position) {
          return _getMovieListItem(moviesList![position]!);
        });
  }

  // Movie List Items
  Widget _getMovieListItem(Result item) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          child: Image.network(
            item.posterPath ?? "",
            errorBuilder: (context, error, stackTrace) {
              return new Image.asset('assets/images/img_error.png');
            },
            fit: BoxFit.fill,
            width: context.resources.dimension.listImageSize,
            height: context.resources.dimension.listImageSize,
          ),
          borderRadius: BorderRadius.circular(context.resources.dimension.imageBorderRadius),
        ),
        title: MyTextView(item.title ?? "NA",context.resources.color.colorPrimaryText,context.resources.dimension.bigText),
        subtitle: MyTextView(item.releaseDate.toString()??"NA",context.resources.color.colorSecondaryText,context.resources.dimension.mediumText),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(DateTime.tryParse(item.voteAverage.toString()).toString()),
            MyTextView(item.voteAverage.toString() ?? "NA" ,context.resources.color.colorBlack,context.resources.dimension.mediumText),
            SizedBox(width: context.resources.dimension.verySmallMargin,),
            Icon(Icons.star,color: context.resources.color.colorAccent,),
          ],
        ),
        onTap: () {
          //
        },
      ),
      elevation: context.resources.dimension.lightElevation,
    );
  }
  
}
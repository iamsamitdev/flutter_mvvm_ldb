// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_declarations, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import '../../models/moviesList/MoviesMain.dart';
import '../../utils/constant.dart';
import '../../view/widget/MyTextView.dart';
import '../../themes/AppContextExtension.dart';
import '../widget/MyChips.dart';

class MovieDetailsScreen extends StatelessWidget {

  static final String id = "movie_details";

  final Result? movieData;

  // receive data from the HomeScreen as a parameter
  MovieDetailsScreen(this.movieData);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(context.resources.strings.movieDetailScreen)),
      body: Container(
        color: context.resources.color.colorWhite,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.resources.dimension.smallMargin),
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    imageBaseUrl+movieData!.posterPath.toString(),
                    errorBuilder: (context, error, stackTrace) {
                      return new Image.asset('assets/images/img_error.png');
                    },
                    fit: BoxFit.fill,
                    height: context.resources.dimension.imageHeight,
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                          title: MyTextView(movieData?.title ?? "NA",context.resources.color.colorPrimaryText,context.resources.dimension.bigText,),
                          subtitle: MyTextView(movieData?.releaseDate.toString() ?? "NA",context.resources.color.colorSecondaryText,context.resources.dimension.mediumText,),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyTextView("${movieData?.voteAverage ?? "" }",context.resources.color.colorBlack,context.resources.dimension.mediumText),
                              SizedBox(width: context.resources.dimension.verySmallMargin,),
                              Icon(Icons.star,color: context.resources.color.colorAccent,),
                            ],
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.resources.dimension.defaultMargin),
                        child: Container(child: MyTextView(context.resources.strings.titleCategories,context.resources.color.colorPrimaryText, context.resources.dimension.bigText,),alignment: AlignmentDirectional.topStart,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
                        child: _setChipView(movieData?.genreIds.toString(),context.resources.color.catChipColor),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.resources.dimension.defaultMargin),
                        child: Container(child: MyTextView(context.resources.strings.titleCast,context.resources.color.colorPrimaryText, context.resources.dimension.bigText),alignment: AlignmentDirectional.topStart,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
                        child: _setChipView(movieData?.genreIds.toString(),context.resources.color.castChipColor),
                      ),
                    ],
                  ),
                  elevation: context.resources.dimension.highElevation,
                  margin: EdgeInsets.all(context.resources.dimension.smallMargin),
                  color: context.resources.color.colorWhite,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _setChipView(String? data,Color color) {
    var size = data?.length??0;
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8,
        children: [
          for (var i = 0; i < size; i++)
            MyChips(data?[i]??"NA", color)
        ],
      ),
    );
  }
}
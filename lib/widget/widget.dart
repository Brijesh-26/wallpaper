import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/views/image_view.dart';

Widget BrandName(){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text('Wonderful', style: TextStyle(color: Colors.black87),),
        SizedBox(width: 10.0),
        Text('Cover', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
      ],
),
  );
}

// Widget loader(){
//   return Container(
//       alignment: Alignment.topCenter,
//       margin: EdgeInsets.only(top: 20),
//       child: Shimmer.fromColors( // Wrap your widget into Shimmer.
//         baseColor: Colors.grey[200],
//         highlightColor: Colors.grey[350],
//         child: FacebookPostWidget(
//           'This is a title',
//           'This is a content, This is a content',
//           'https://r-cf.bstatic.com/images/hotel/max1024x768/116/116281457.jpg',
//           backgroundColor: Colors.white,
//         ),
//       ),
//   );
// }


Widget
wallpapersList({required List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children:
        wallpapers.map((wallpaper){
          return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(imgUrl: wallpaper.src.portrait,)));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,)),
              ),
            ),
          ),
          );
        }).toList(),

    ),
  );
}
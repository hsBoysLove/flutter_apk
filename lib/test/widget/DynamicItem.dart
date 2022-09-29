import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class DynamicItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int viewCount;
  static const double ITEM_HEIGHT = 100;
  static const double TITLE_HEIGHT = 80;
  static const double MARGIN_SIZE = 10;

  const DynamicItem(this.title, this.imageUrl, this.viewCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(MARGIN_SIZE),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageWrapper(imageUrl),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleWrapper(context, title),
                  _viewCountWrapper(viewCount.toString())
                ],
              ))
            ],
          ),
        ),
        onLongPress: () {
          onLongItemClick(title, context);
        },
        onTap: () {
          onItemClick(title);
        });
  }

  Widget _viewCountWrapper(String text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(MARGIN_SIZE, 0, 0, 0),
      height: ITEM_HEIGHT - TITLE_HEIGHT,
      child: Row(
        children: [
          const Icon(
            Icons.remove_red_eye_outlined,
            size: 14.0,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            viewCount.toString(),
            style: const TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  Widget _titleWrapper(BuildContext context, String text) {
    return Container(
      height: ITEM_HEIGHT,
      margin: const EdgeInsets.fromLTRB(MARGIN_SIZE, 0, 0, 0),
      child: Text(
        title,
        textScaleFactor: 0.8,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _imageWrapper(String imageUrl) {
    /**
     * decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
        Color(0xFF56AF6D),
        Color(0xFF56AA6D),
        ])),
     * */

    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: 150,
          height: ITEM_HEIGHT,
          // child: Image.network(imageUrl),
          child: CachedNetworkImage(
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            imageUrl: imageUrl,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ));
  }

  void onItemClick(String title) {
    // const snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // MotionToast.success(
    //         description: const Text('操作成功！'),
    //         position: MotionToastPosition.bottom)
    //     .show(context);
    Fluttertoast.showToast(
        msg: "---$title---",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
        webBgColor: "#000000",
        webPosition: "center");
  }

  void onLongItemClick(String title, BuildContext ctx) {
    MotionToast.success(
            description: Text('----$title---'),
            position: MotionToastPosition.bottom)
        .show(ctx);
  }
}

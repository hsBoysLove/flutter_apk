import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_project/test/utils/DynamicMockData.dart';
import 'package:flutter_project/test/widget/DynamicItem.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  int _currentPage = 1;
  int PAGE_SIZE = 10;
  List<Map<String, Object>> _listItems = [];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    _currentPage = 1;
    _requestNewItems();
  }

  void _load() async {
    _currentPage += 1;
    _requestNewItems();
  }

  void _requestNewItems() async {
    List<Map<String, Object>> newItems =
        await DynamicMockData.list(_currentPage, PAGE_SIZE);
    setState(() {
      if (_currentPage > 1) {
        _listItems += newItems;
      } else {
        _listItems = newItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        onRefresh: () async {
          _refresh();
        },
        onLoad: () async {
          _load();
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 180,
                child: Swiper(
                  loop: true,
                  duration: 1000,
                  autoplay: true,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      // child: Image.network(
                      //    DynamicMockData.bannerUrls[
                      //    index % DynamicMockData.bannerUrls.length],
                      //    fit: BoxFit.fill,
                      //  ),
                      child: CachedNetworkImage(
                        imageUrl: DynamicMockData.bannerUrls[
                            index % DynamicMockData.bannerUrls.length],
                        fit: BoxFit.fill,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  },
                  itemCount: DynamicMockData.bannerUrls.length,
                  pagination:
                      const SwiperPagination(alignment: Alignment.bottomCenter),
                  control: null,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  onTap: (int index) {
                    Fluttertoast.showToast(
                        msg: "这是第$index张图片", gravity: ToastGravity.CENTER);
                  },
                  onIndexChanged: (int index) {},
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return DynamicItem(
                _listItems[index]['title'] as String,
                _listItems[index]['imageUrl'] as String,
                _listItems[index]['viewCount'] as int,
              );
            }, childCount: _listItems.length))
          ],
        ),
      ),
    );
  }
}

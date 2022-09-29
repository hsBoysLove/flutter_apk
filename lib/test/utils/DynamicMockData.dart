class DynamicMockData {
  static Future<List<Map<String, Object>>> list(int page, int size) async {
    // var duration = const Duration(seconds: 1);
    // sleep(duration);
    List<String> titles = [
      "你做三四月的事，在八九月自有答案。” - 简书",
      "修身、齐家、治国、平天下(《礼记》)",
      "玉不琢，不成器;人不学，不知道。(《礼记》)",
      "良药苦口利于病，忠言逆耳利于行。(《史记》)",
      "文武之道，一张一弛。(《礼记》)",
      "苟利国家生死以，岂因祸福避"
    ];
    List<String> imgUrls = [
      "https://t7.baidu.com/it/u=2443491726,2331383820&fm=193&f=GIF",
      "https://t7.baidu.com/it/u=2925116833,2991570114&fm=193&f=GIF",
      "https://t7.baidu.com/it/u=3357675082,868315873&fm=193&f=GIF",
      "https://t7.baidu.com/it/u=4240412186,2201962808&fm=193&f=GIF",
      "https://t7.baidu.com/it/u=1022663639,86748287&fm=193&f=GIF",
      'https://t7.baidu.com/it/u=3683704156,288749744&fm=193&f=GIF'
    ];

    return List<Map<String, Object>>.generate(size, (index) {
      return {
        'title': titles[index % 6],
        'imageUrl': imgUrls[index % 6],
        'viewCount': 180,
      };
    });
  }

  static List<String> bannerUrls = [
    "https://img1.baidu.com/it/u=2540238818,33471054&fm=253&fmt=auto&app=138&f=JPEG?w=658&h=247",
    "https://img2.baidu.com/it/u=2993476027,2746657918&fm=253&fmt=auto&app=138&f=JPEG?w=658&h=308",
    "https://img0.baidu.com/it/u=3616929476,643461535&fm=253&fmt=auto&app=138&f=JPEG?w=780&h=356",
    "https://img2.baidu.com/it/u=4292779000,2271560776&fm=253&fmt=auto&app=138&f=JPEG?w=780&h=268",
  ];
}

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []]; // Grid 형태에서 각 Row를 담기 위한 2차원 배열

  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();

    // 각 콘텐츠(사진 or 동영상)의 사이즈를 넣음
    for (var i = 0; i < 100; i++) {
      var gridIndex = groupIndex
          .indexOf(min<int>(groupIndex)!); // quiver 패키지를 사용하여 가장 작은 값의 인덱스를 찾음
      var size = 1;
      if (gridIndex != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gridIndex].add(size);
      groupIndex[gridIndex] += size;
    }
  }

  // AppBar가 고정되지 않고, 아래로 스크롤하면 사라진 후 위로 올릴 때 다시 나타나야 하기 때문에,
  // Scaffold의 AppBar를 사용하지 않고 _appbar()를 새로 만들어 줌
  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef),
            ),
            child: Row(
              children: const [
                Icon(Icons.search),
                Text(
                  '검색',
                  style: TextStyle(fontSize: 15, color: Color(0xff838383)),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.location_pin),
        )
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (idx) => Container(
                  height: Get.width / 3 * groupBox[index][idx],
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQupaI6WQyHdtiGcZb9PONJ2MSBgcDm2r7jMQ&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }
}

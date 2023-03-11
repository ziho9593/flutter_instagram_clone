import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/components/avatar_widget.dart';
import 'package:flutter_instagram_clone/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2,
          thumbPath: 'https://i.ytimg.com/vi/Xh9IDGkyM1c/maxresdefault.jpg',
          size: 70,
        ),
        Positioned(
          right: 3,
          bottom: 1,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.white, width: 2)),
            child: const Center(
                child: Text(
              '+',
              style: TextStyle(fontSize: 20, color: Colors.white, height: 1.1),
            )),
          ),
        )
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        _myStory(),
        const SizedBox(width: 5),
        ...List.generate(
            100,
            (index) => AvatarWidget(
                type: AvatarType.TYPE1,
                thumbPath:
                    'https://i.ytimg.com/vi/_ulvHOhIsqc/maxresdefault.jpg')),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          _storyBoardList(),
        ],
      ),
    );
  }
}

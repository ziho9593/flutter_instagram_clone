import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/components/avatar_widget.dart';

class ActiveHistory extends StatelessWidget {
  const ActiveHistory({super.key});

  Widget _activeItemOne() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          AvatarWidget(
              type: AvatarType.TYPE2,
              size: 40,
              thumbPath:
                  'https://cdn.gametoc.co.kr/news/photo/202204/65674_207211_2736.jpg'),
          const SizedBox(width: 10),
          const Expanded(
              child: Text.rich(TextSpan(
            text: '39saku_chan',
            style: TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '님이 회원님의 게시물을 좋아합니다.',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: ' 5시간',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          )))
        ],
      ),
    );
  }

  Widget _newRecentlyActiveView(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '활동',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _newRecentlyActiveView('오늘'),
            _newRecentlyActiveView('이번 주'),
            _newRecentlyActiveView('이번 달'),
          ],
        ),
      ),
    );
  }
}

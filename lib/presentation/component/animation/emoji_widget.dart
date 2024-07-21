import 'dart:math';

import 'package:flutter/material.dart';

class EmojiFireWork {
  EmojiFireWork({required this.emojiAsset});

  final AssetImage emojiAsset;

  late Map<Key, FireworkWidget> fireworkWidgets = {};

  void addFireworkWidget() {
    final fireworkWidgetKey = UniqueKey();

    fireworkWidgets.addEntries(<Key, FireworkWidget>{
      fireworkWidgetKey: FireworkWidget(
        key: fireworkWidgetKey,
        notifyWidgetIsDisposed: (Key widgetKey) {
          fireworkWidgets.remove(widgetKey);
        },
        emojiAsset: emojiAsset,
      )
    }.entries);
  }
}

class FireworkWidget extends StatefulWidget {
  const FireworkWidget({
    super.key,
    required this.notifyWidgetIsDisposed,
    required this.emojiAsset,
  });

  final Function(Key) notifyWidgetIsDisposed;
  final AssetImage emojiAsset;

  @override
  State<FireworkWidget> createState() => _FireworkWidgetState();
}

class _FireworkWidgetState extends State<FireworkWidget>
    with TickerProviderStateMixin {
  // 불꽃놀이에서 움직이는 각각의 위젯들을 담아두는 리스트
  late List<EmojiWidget> emojiWidgetList;

  // 3가지 움직임을 위해, 3가지 AnimationController를 선언
  late final AnimationController emojiAnimationShootController,
      emojiAnimationFloatController,
      emojiAnimationLifeTimeController;

  // AnimationController의 값에 대해 움직이는 double 값(Animation)들을 선언
  late final Animation<double> emojiShootAnimation,
      emojiFloatYAnimation,
      emojiFloatXAnimation,
      emojiLifeTimeAnimation;

  // 애니메이션 지속 시간을 결정하는 변수
  late Duration _emojiLifetimeDuration = Duration(seconds: 5);
  late Duration _emojiShootDuration = Duration(seconds: 2);

  final int emojiAmount = 30;

  @override
  void initState() {
    super.initState();

    // 이모지가 폭죽처럼 발사되는 Animation 관련 값 초기화
    emojiAnimationShootController = AnimationController(
      vsync: this,
      duration: _emojiShootDuration,
    );
    emojiShootAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: emojiAnimationShootController,
      curve: Curves.easeOut,
    ));
    emojiShootAnimation.addListener(() {
      setState(() {});
    });

    // 이모지가 하늘로 날아가는 Animation 관련 값 초기화
    // 가로 움직임과 세로 움직임이 별개이기 때문에, Animation을 X와 Y로 분리하였음
    emojiAnimationFloatController = AnimationController(
        vsync: this,
        duration: Duration(seconds: _emojiLifetimeDuration.inSeconds));
    emojiFloatXAnimation = Tween(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(
        parent: emojiAnimationFloatController,
        curve: Curves.linear,
      ),
    );
    emojiFloatXAnimation.addListener(() {
      setState(() {});
    });
    emojiFloatYAnimation = Tween(begin: -50.0, end: 1000.0).animate(
      CurvedAnimation(
        parent: emojiAnimationFloatController,
        curve: Curves.easeIn,
      ),
    );
    emojiFloatYAnimation.addListener(() {
      setState(() {});
    });

    // 불꽃놀이 위젯 자체의 지속시간과 관련된 Animation 관련 값 초기화
    // 여기에서 이모지 크기를 조정할 수 있는 값을 제공한다.
    emojiAnimationLifeTimeController =
        AnimationController(vsync: this, duration: _emojiLifetimeDuration);
    emojiLifeTimeAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: emojiAnimationLifeTimeController, curve: Curves.linear));
    emojiLifeTimeAnimation.addListener(() {
      setState(() {});
    });
    emojiLifeTimeAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.notifyWidgetIsDisposed(widget.key!);
      }
    });

    startAnimation();
  }

  void startAnimation() {
    emojiAnimationShootController.forward(from: 0.0);
    emojiAnimationFloatController.forward(from: 0.0);
    emojiAnimationLifeTimeController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: List.generate(
          emojiAmount,
          (index) => EmojiWidget(
            emojiAsset: widget.emojiAsset,
            emojiFloatXAnimation: emojiFloatXAnimation,
            emojiFloatYAnimation: emojiFloatYAnimation,
            emojiShootAnimation: emojiShootAnimation,
            emojiLifeTimeAnimation: emojiLifeTimeAnimation,
          ),
        ),
      ),
    );
  }
}

class EmojiWidget extends StatefulWidget {
  const EmojiWidget({
    required this.emojiShootAnimation,
    required this.emojiFloatYAnimation,
    required this.emojiFloatXAnimation,
    required this.emojiLifeTimeAnimation,
    required this.emojiAsset,
  });

  final AssetImage emojiAsset;
  final Animation<double> emojiShootAnimation,
      emojiFloatYAnimation,
      emojiFloatXAnimation,
      emojiLifeTimeAnimation;

  @override
  State<EmojiWidget> createState() => EmojiWidgetState();
}

class EmojiWidgetState extends State<EmojiWidget> {
  late double xScale, yScale, distinctiveRandomSeed;

  @override
  void initState() {
    super.initState();

    xScale = Random().nextDouble() * 2 - 1;
    yScale = Random().nextDouble() * 2 - 1;
    distinctiveRandomSeed = Random().nextDouble();
  }

  @override
  Widget build(BuildContext context) {
    var emojiAnimationShootX = widget.emojiShootAnimation.value * 3 * xScale;
    var emojiAnimationShootY = widget.emojiShootAnimation.value * 5 * yScale;

    var emojiAnimationFloatX =
        sin(widget.emojiFloatXAnimation.value + distinctiveRandomSeed) * 20;
    var emojiAnimationFloatY = widget.emojiFloatYAnimation.value < 0
        ? 0
        : widget.emojiFloatYAnimation.value * -1;

    var emojiAnimationPositionX = emojiAnimationShootX + emojiAnimationFloatX;
    var emojiAnimationPositionY = emojiAnimationShootY + emojiAnimationFloatY;

    var emojiScale = sin(
                (widget.emojiLifeTimeAnimation.value + distinctiveRandomSeed) *
                    10) *
            0.3 +
        1;
    bool isEmojiTransparent =
        (widget.emojiLifeTimeAnimation.value + distinctiveRandomSeed) > 1.8;

    return Positioned(
      left: emojiAnimationPositionX,
      top: emojiAnimationPositionY,
      child: Opacity(
        opacity: isEmojiTransparent ? 0.0 : 1.0,
        child: Image(
          image: widget.emojiAsset,
          width: 40 * emojiScale,
          height: 40 * emojiScale,
        ),
      ),
    );
  }
}

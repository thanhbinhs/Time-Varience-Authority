import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'VariableDataLibraryClass.dart';


class StopPauseNsilde extends StatefulWidget{
  String nameSong;
  String songInfor;
  String songPath;

  StopPauseNsilde({
    required this.nameSong,
    required this.songInfor,
    required this.songPath,
  });
  @override
  State<StopPauseNsilde> createState() => _StopPauseNsildeState();
}

class _StopPauseNsildeState extends State<StopPauseNsilde> {

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = true;
  double _sliderValue = 0.0;
  Duration _maxDuration = Duration.zero;
  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (!_isPageBeingDragged && _currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    _initAudioPlayer();
  }

  PageController _pageController = PageController(initialPage: 1, viewportFraction: 1);
  int _currentPage = 1;
  bool _isPageBeingDragged = false;
  Timer? _timer;

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      if (!_isPageBeingDragged && _pageController.hasClients) {
        _pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
      }
    });
  }

  Future<void> _initAudioPlayer() async {
    await _audioPlayer.setAsset('assets/Music/au.mp3');
    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _maxDuration = duration ?? Duration.zero;
      });
    });
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _sliderValue = position.inMilliseconds.toDouble();
      });
    });
  }

  Future<void> _togglePlayer() async {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  void _seek(double value) {
    _audioPlayer.seek(Duration(milliseconds: value.toInt()));
  }
  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    VariableData variableData = VariableData(context);
    return Container(
      height: 70,
      width: 200,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            color: Colors.blue,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return index % 2 == 0
                    ? Padding(
                      padding: EdgeInsets.all(5),
                      child:   Container(
                          height: 40,
                          color: Colors.orange,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    color: Colors.brown,
                                    child: Text(
                                      "Song name",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 15,
                                    color: Colors.brown,
                                    child: Text(
                                      "10 min",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(255, 50, 50, 50)
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          )
                      ),
                    )
                    : IconButton(
                      icon: Icon(_isPlaying ? Icons.play_arrow : Icons.pause),
                      iconSize: 35,
                      onPressed: _togglePlayer,
                );
              },
            ),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
              // color: Colors.brown,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 5,
                ),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 10,
                ),
              ),
              child: Slider(
                value: _sliderValue,
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                },
                onChangeEnd: _seek,
                min: 0.0,
                max: _maxDuration.inMilliseconds.toDouble(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
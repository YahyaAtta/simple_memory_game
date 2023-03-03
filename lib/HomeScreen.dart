import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool visible = false;
  bool visible2 = false;
  bool visible3 = true;
  String answer = " ";
  String optionwrong1 = "Top Left,Bottom Left";
  String optionwrong2 = "Bottom Right Top Right";
  String optionwrong3 = "Top Left Top Right";
  String optioncorrect = "Bottom Left Top Right";
  AudioPlayer audioPlayer = AudioPlayer();
  void startGame() {
    audioPlayer.play(AssetSource('audios/start.mp3'));
  }

  void PlaySoundCorrect() {
    audioPlayer.play(AssetSource('audios/correct.mp3'));
  }

  void PlaySoundWrong() {
    audioPlayer.play(AssetSource('audios/wrong.mp3'));
  }

  Reset() async {
    setState(() {
      optioncorrect = "Top Left,Bottom Left";
      optionwrong1 = "Bottom Right Top Right";
      optionwrong2 = "Top Left Top Right";
      optionwrong3 = "Bottom Left Top Right";
      answer = " ";
      visible3 = true;
      visible2 = false;
    });
  }

  TextVisiable() async {
    setState(() {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          visible2 = true;
        });
      });
    });
  }

  ImageVisiable() async {
    setState(() {
      visible = true;
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          visible = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Game'),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 32,
            padding: EdgeInsets.only(right: 15, left: 15),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AboutDialog(
                  applicationIcon: Icon(
                    Icons.gamepad_rounded,
                    size: 45,
                  ),
                  applicationName: 'Memory Game',
                  applicationVersion: '1.0.0',
                  applicationLegalese: 'Developed By YAHYA ATTA',
                ),
              );
            },
            icon: Icon(Icons.info_rounded),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 70),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Visibility(
                          visible: visible,
                          child: Image.asset(
                            'assets/images/CPU.png',
                            height: 130,
                            width: 130,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Visibility(
                          visible: visible,
                          child: Image.asset(
                            'assets/images/Wifi.png',
                            height: 130,
                            width: 130,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: visible,
                        child: Image.asset(
                          'assets/images/Mobile Phone.png',
                          height: 130,
                          width: 130,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Visibility(
                        visible: visible,
                        child: Image.asset(
                          'assets/images/Monitor.jpg',
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: visible3,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                width: double.infinity,
                height: 90,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 27),
                    ),
                    onPressed: () {
                      setState(() {
                        visible3 = false;
                      });
                      startGame();
                      ImageVisiable();
                      TextVisiable();
                    },
                    child: const Text(
                      'Start The Game',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Visibility(
            visible: visible2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Where is Mobile Phone and Wifi Position?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: visible2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                    value: optionwrong1,
                    groupValue: answer,
                    onChanged: (val) {
                      setState(() {
                        answer = val!;
                      });
                    }),
                const Text(
                  'Top Left,Bottom Left',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Visibility(
            visible: visible2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                    value: optionwrong2,
                    groupValue: answer,
                    onChanged: (val) {
                      setState(() {
                        answer = val!;
                      });
                    }),
                const Text(
                  'Bottom Right,Top Right',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Visibility(
            visible: visible2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                    value: optioncorrect,
                    groupValue: answer,
                    onChanged: (val) {
                      setState(() {
                        answer = val!;
                      });
                    }),
                const Text(
                  'Bottom left,Top Right',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Visibility(
            visible: visible2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                    value: optionwrong3,
                    groupValue: answer,
                    onChanged: (val) {
                      setState(() {
                        answer = val!;
                      });
                    }),
                const Text(
                  'Top Left,Top Right',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: visible2,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (answer == "" || answer == " ") {
                          setState(() {
                            var snackBar = const SnackBar(
                              content: Text("Please Choose your answer"),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        } else if (answer == optioncorrect) {
                          var snackBar = const SnackBar(
                            content:
                                Text("Congratulation You Answer is Correct"),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          );
                          setState(() {
                            Future.delayed(const Duration(seconds: 4), () {
                              setState(() {
                                visible2 = false;
                                visible3 = true;
                                answer = " ";
                              });
                            });
                          });
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          PlaySoundCorrect();
                        } else {
                          PlaySoundWrong();

                          var snackBar = const SnackBar(
                            content: Text("Wrong Answer"),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    },
                    child: const Text('Submit')),
              ),
              const SizedBox(
                width: 10,
              ),
              Visibility(
                visible: visible2,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Reset();
                      });
                    },
                    child: const Text('Reset')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

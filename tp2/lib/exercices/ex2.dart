import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';
import 'dart:math' as math;
import 'dart:async';

class Ex2 extends StatefulWidget {
  final Exercice exercice;

  const Ex2({Key? key, required this.exercice}) : super(key: key);

  @override
  _Ex2State createState() => _Ex2State();
}

class _Ex2State extends State<Ex2> {
  double _currentSliderValue1 = math.Random().nextInt(101).toDouble();
  double _currentSliderValue2 = math.Random().nextInt(101).toDouble();
  double _currentSliderValue3 = math.Random().nextInt(101).toDouble();
  double _currentSliderValue4 = 50;
  bool isFlipEnabled = false;
  bool _isPlaying = false;
  late Timer _timer;
  


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

    void _startStopTimer() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        setState(() {
          _currentSliderValue1 = (_currentSliderValue1 + 1) % 101;
          _currentSliderValue2 = (_currentSliderValue2 - 1) % 101;
          _currentSliderValue3 = (_currentSliderValue3 - 1) % 101;
          _currentSliderValue4 = (_currentSliderValue4 + 1) % 101;
        });
      });
    } else {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 2: transformer une image',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 300,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(color: Colors.white),
              child: Transform.scale(
                scale: _currentSliderValue4 / 100, 
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY((_currentSliderValue2*math.pi)/100)..rotateZ((_currentSliderValue3*math.pi)/100)..rotateX((_currentSliderValue1*math.pi)/100), 
                  child: isFlipEnabled 
                      ? Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.diagonal3Values(-1.0, 1.0, 1.0), 
                          child: Image.asset('assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg'),
                        )
                      : Image.asset('assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg'),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0), 
                    child: Text(
                      'Rotate X: ',
                      style: TextStyle(
                        fontFamily: "PlayfairDisplay",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded( 
                    child: Slider(
                      value: _currentSliderValue1,
                      max: 100,
                      divisions: 100,
                      label: _currentSliderValue1.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue1 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0), 
                    child: Text(
                      'Rotate Y: ',
                      style: TextStyle(
                        fontFamily: "PlayfairDisplay",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: _currentSliderValue2,
                      max: 100,
                      divisions: 100,
                      label: _currentSliderValue2.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue2 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0), 
                    child: Text(
                      'Rotate Z: ',
                      style: TextStyle(
                        fontFamily: "PlayfairDisplay",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: _currentSliderValue3,
                      max: 100,
                      divisions: 100,
                      label: _currentSliderValue3.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue3 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0), 
                    child: Text(
                      'Mirror: ',
                      style: TextStyle(
                        fontFamily: "PlayfairDisplay",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SquareCheckbox(
                     initialValue: isFlipEnabled,
                    onChanged: (value) {
                      setState(() {
                        isFlipEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0), 
                    child: Text(
                      'Scale : ',
                      style: TextStyle(
                        fontFamily: "PlayfairDisplay",
                        fontSize: 18,
                      ),
                      ),
                  ), 
                  Expanded(
                    child: Slider(
                      value: _currentSliderValue4,
                      max: 100,
                      divisions: 100,
                      label: _currentSliderValue4.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue4 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _startStopTimer,
                child: Text(_isPlaying ? 'Stop' : 'Play'),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}

class SquareCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const SquareCheckbox({
    Key? key,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _SquareCheckboxState createState() => _SquareCheckboxState();
}

class _SquareCheckboxState extends State<SquareCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          if (widget.onChanged != null) {
            widget.onChanged!(_value);
          }
        });
      },
      child: Container(
        width: 24, 
        height: 24, 
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: _value ? Colors.red : Colors.transparent,
        ),
        child: _value
            ? Icon(
                Icons.check,
                color: Colors.black,
                size: 25, 
              )
            : null,
      ),
    );
  }
}
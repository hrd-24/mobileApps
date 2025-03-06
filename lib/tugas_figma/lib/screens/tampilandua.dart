import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ppkd_aps/tugas_figma/lib/models/question_model.dart';

class Tampilandua extends StatefulWidget {
  @override
  _TampilanduaState createState() => _TampilanduaState();
}

class _TampilanduaState extends State<Tampilandua> {
  int _currentQuestionIndex = 0;
  int? selectedAnswer;
  int _timeLeft = 10; // Timer dalam detik
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer(); // Mulai timer saat halaman dibuka
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer saat halaman ditutup
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _nextQuestion(); // Jika waktu habis, pindah ke pertanyaan berikutnya
      }
    });
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _timeLeft = 10; // Reset waktu ke 30 detik
    });
    _startTimer();
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
        selectedAnswer = null; // Reset pilihan jawaban
        _resetTimer(); // Reset timer untuk pertanyaan baru
      } else {
        _timer.cancel(); // Hentikan timer jika sudah di pertanyaan terakhir
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> options = questions[_currentQuestionIndex]['options'];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios),
                            Text('Previous'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${_currentQuestionIndex + 1}/${questions.length}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 50),
              SizedBox(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 229,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: -10,
                              blurRadius: 50,
                              offset: Offset(0, 20),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            questions[_currentQuestionIndex]['question'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              strokeCap: StrokeCap.round,
                              value: _timeLeft / 30, // Progress Timer
                              backgroundColor: Color(0xFFABD1C6),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF004643),
                              ),
                              strokeWidth: 8.0,
                            ),
                          ),
                          Text(
                            '$_timeLeft', // Menampilkan waktu tersisa
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                child: Column(
                  children: [
                    for (int i = 0; i < options.length; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          color: selectedAnswer == i
                              ? Color(0xFFABD1C6)
                              : Colors.white,
                        ),
                        child: ListTile(
                          title: Text('${options[i]}'),
                          trailing: Checkbox(
                            value: selectedAnswer == i,
                            onChanged: (bool? value) {
                              setState(() {
                                selectedAnswer = i;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            activeColor: Color(0xFF004643),
                            checkColor: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              selectedAnswer = i;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004643),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _nextQuestion,
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

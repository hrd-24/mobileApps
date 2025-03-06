class Question {
  final String questionText;
  final List<int> options;
  final int correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Tahun berapa saat ini?',
      'options': [2020, 2023, 2024, 2025],
    },
    {
      'question': 'Bulan apa sekarang?',
      'options': ['Januari', 'Februari', 'Maret', 'April',],
    },
    {
      'question': 'Tanggal berapa hari ini?',
      'options': [1, 10, 15, 25],
    },
  ];

  

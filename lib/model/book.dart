import 'dart:convert';

class Book {
  final String price;
  final String date;
  final String type_work;
  final String place;
  final String job_description;
  final String spicalicaition;
  final String company;

  const Book({
    required this.price,
    required this.date,
    required this.type_work,
    required this.place,
    required this.job_description,
    required this.spicalicaition,
    required this.company,
  });
  factory Book.fromJson(Map<String, dynamic> json) => Book(
        price: json['price'],
        date: json['date'],
        type_work: json['type_work'],
        place: json['place'],
        job_description: json['job_description'],
        spicalicaition: json['spicalicaition'],
        company: json['company'],
      );

  Map<String, dynamic> toJson() => {
        'price': price,
        'date': date,
        'type_work': type_work,
        'place': place,
        'job_description': job_description,
        'spicalicaition': spicalicaition,
        'company': company,
      };
}

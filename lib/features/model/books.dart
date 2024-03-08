class BookModel {
  int? id;
  String bookName;
  String bookAuthor;
  int bookCell;

  BookModel({
     this.id,
    required this.bookName,
    required this.bookAuthor,
    required this.bookCell,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    id: json['id'],
    bookName: json['bookName'],
    bookAuthor: json['bookAuthor'],
    bookCell: json['bookCell'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'bookName': bookName,
    'bookAuthor': bookAuthor,
    'bookCell': bookCell,
  };
}

import 'package:pr_2/domain/entity/cellEntity.dart';

class Cell extends CellEntity {
  late int id;
  final String cellName;
  final int row;
  final int column;

  Cell({
    required this.cellName,
    required this.row,
    required this.column,
  }) : super(
          cellName: cellName,
          row: row,
          column: column,
        );

  Map<String, dynamic> toMap() {
    return {
      'cellName': cellName,
      'row': row,
      'column': column,
    };
  }

  factory Cell.toFromMap(Map<String, dynamic> json) {
    return Cell(
      cellName: json['cellName'],
      row: json['row'],
      column: json['column'],
    );
  }
}

/// Matrix.
class Matrix<T> {
  /// Constructs a null matrix of the given size.
  Matrix.size({
    required this.height,
    required this.width,
  }) : data = List.filled(height, List.filled(width, null));

  /// Constructs a matrix from [data].
  Matrix.fromList({
    required this.data,
  })  : height = data.length,
        width = data[0].length,
        assert(
          data.isNotEmpty && data[0].isNotEmpty && !data.any((row) => data[0].length != row.length),
          'All of the rows must be the same length.',
        );

  /// Raw data of the matrix.
  final List<List<T?>> data;

  /// The number of columns.
  final int width;

  /// The number of rows.
  final int height;
}

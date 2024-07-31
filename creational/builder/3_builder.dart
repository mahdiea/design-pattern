class SelectQueryBuilder {
  late String _from;
  List<String> _select = [];
  List<String> _where = [];

  SelectQueryBuilder from(String table) {
    _from = table;
    return this;
  }

  SelectQueryBuilder select(String field) {
    _select.add(field);
    return this;
  }

  SelectQueryBuilder where(String condition) {
    _where.add(condition);
    return this;
  }

  String build() {
    String query = 'SELECT ';
    for (String field in _select) {
      query += '$field, ';
    }

    print('query');
    print(query);
    query = query.substring(0, query.length - 2); // Remove trailing comma

    query += ' FROM $_from';

    if (_where.isNotEmpty) {
      query += ' WHERE ';
      for (String condition in _where) {
        query += '$condition AND ';
      }

      query = query.substring(0, query.length - 5); // Remove trailing AND
    }

    return query;
  }
}

void main() {
  SelectQueryBuilder queryBuilder = SelectQueryBuilder();
  String query = queryBuilder
      .from('users')
      .select('id')
      .select('name')
      .select('email')
      .where('age > 18')
      .build();
  print(query);
}

//SELECT id, name, email FROM users WHERE age > 18 ;

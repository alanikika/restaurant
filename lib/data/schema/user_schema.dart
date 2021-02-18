const tableUser = "user";

const username = "username";
const password = "password";
const nickName = "nick_name";
const nationality = "nationality";
const dateOfBirth = "date_birth";

const userCreateTableSql = """
  CREATE TABLE $tableUser (
    $username TEXT,
    $password TEXT,
    $nickName TEXT,
    $nationality TEXT,
    $dateOfBirth TEXT
  )
""";

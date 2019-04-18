# Workerman\Mysql\Connection

Long-living MySQL connection for daemon.

# Install
```composer require workerman/mysql```

# Usage
```php
$db = new Workerman\MySQL\Connection($mysql_host, $mysql_port, $user, $password, $db_bname);

// Get all rows.
$db1->select('ID,Sex')->from('Persons')->where('sex= :sex')->bindValues(array('sex'=>'M'))->query();
// Equivalent to.
$db1->select('ID,Sex')->from('Persons')->where("sex='F'")->query();
// Equivalent to.
$db->query("SELECT ID,Sex FROM `Persons` WHERE sex='M'");


// Get one row.
$db->select('ID,Sex')->from('Persons')->where('sex= :sex')->bindValues(array('sex'=>'M'))->row();
// Equivalent to.
$db->select('ID,Sex')->from('Persons')->where("sex= 'F' ")->row();
// Equivalent to.
$db->row("SELECT ID,Sex FROM `Persons` WHERE sex='M'");


// Get a column.
$db->select('ID')->from('Persons')->where('sex= :sex')->bindValues(array('sex'=>'M'))->column();
// Equivalent to.
$db->select('ID')->from('Persons')->where("sex= 'F' ")->column();
// Equivalent to.
$db->column("SELECT `ID` FROM `Persons` WHERE sex='M'");

// Get single.
$db->select('ID,Sex')->from('Persons')->where('sex= :sex')->bindValues(array('sex'=>'M'))->single();
// Equivalent to.
$db->select('ID,Sex')->from('Persons')->where("sex= 'F' ")->single();
// Equivalent to.
$db->single("SELECT ID,Sex FROM `Persons` WHERE sex='M'");

// Complex query.
$db->select('*')->from('table1')->innerJoin('table2','table1.uid = table2.uid')->where('age > :age')
->groupBy(array('aid'))->having('foo="foo"')->orderByASC/*orderByDESC*/(array('did'))
->limit(10)->offset(20)->bindValues(array('age' => 13));
// Equivalent to.
$db->query(SELECT * FROM `table1` INNER JOIN `table2` ON `table1`.`uid` = `table2`.`uid` WHERE age > 13
GROUP BY aid HAVING foo="foo" ORDER BY did LIMIT 10 OFFSET 20“);

// Insert.
$insert_id = $db->insert('Persons')->cols(array(
    'Firstname'=>'abc', 
    'Lastname'=>'efg', 
    'Sex'=>'M', 
    'Age'=>13))->query();
// Equivalent to.
$insert_id = $db->query("INSERT INTO `Persons` ( `Firstname`,`Lastname`,`Sex`,`Age`) 
VALUES ( 'abc', 'efg', 'M', 13)");

// Updagte.
$row_count = $db->update('Persons')->cols(array('sex'))->where('ID=1')
->bindValue('sex', 'F')->query();
// Equivalent to.
$row_count = $db->update('Persons')->cols(array('sex'=>'F'))->where('ID=1')->query();
// Equivalent to.
$row_count = $db->query("UPDATE `Persons` SET `sex` = 'F' WHERE ID=1");

// Delete.
$row_count = $db->delete('Persons')->where('ID=9')->query();
// Equivalent to.
$row_count = $db->query("DELETE FROM `Persons` WHERE ID=9");

// Transaction.
$db1->beginTrans();
....
$db1->commitTrans(); // or $db1->rollBackTrans();

```

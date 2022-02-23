# SQL tips

## Queries

The most simple query: `select *`

To specify a table: `select * from tableName`

(The table name is the part after "dbo." For example, for 
"dbo.tblDailyRecs", the table name is "tblDailyRecs".)

You can break up complex queries into multiple lines so they're not all on 
one line.

To specify criteria using the column ID:
```
select *
from tblArchiveRecords
where meterId = 152
```

To order the output by another Column ID:
```
select *
from tblArchiveRecords
where meterid = 152
order by ObjectID
```

The `where` clauses can get complicated, using `or`, `and`, and other 
goodies. Use parentheses to protect your desired order of operations. 
`and` is executed before `or` without parentheses.

## More about SELECT

To retrieve specific columns: `select FirstName, LastName from tableName ...`

To retrieve a column with a problematic name, wrap the name in square brackets:
`select [Date] ...`

To rename a column in the output (ONLY in the output -- column ID in the table 
stays the same: `select crDate as CreationDate ...`

To rename a column with a label that includes spaces, wrap the label in square
brackets:
` select crDate as [Creation Date] ...`




## BEGIN TRAN, ROLLBACK, and COMMIT

You can't mess anything up with the select command, but you can make
permanent modifications with insert, update, delete. To protect yourself
from irreversible damage, always do a trial run with your modifications
by wrapping them in a BEGIN TRAN / ROLLBACK pair:
```
BEGIN TRAN

insert ...
update ...
delete ...

select ... (optional -- to check your work)

ROLLBACK
```

This will make all of your changes, and then undo them -- roll them back.
Once you are satisfied that your changes are working the way they're 
supposed to, you can change ROLLBACK to COMMIT:
```
BEGIN TRAN

insert ...
update ...
delete ...

COMMIT
```

BEGIN TRAN blocks the database table and keeps anybody else from accessing it.

ALWAYS pair a BEGIN TRAN with ROLLBACK or COMMIT.


## Built-in functions

To get the date:
```
select getdate()
-- or
select GETUTCDATE()
```

There's also a lot of @@ functions. Type `select @@` and then hit TAB to 
see them.




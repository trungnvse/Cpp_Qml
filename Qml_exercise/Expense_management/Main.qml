/*******************************************************************************
* Import
*******************************************************************************/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.LocalStorage 2.15
/*******************************************************************************
* Code
*******************************************************************************/
ApplicationWindow
{
    visible: true
    width: 400
    height: 600
    title: "Expense management"

    /*-----DATABASE-----*/
    /* Define database */
    property var db: LocalStorage.openDatabaseSync("ExpenseDB", "1.0", "Database to manage expense", 1000000);

    /* Initialize database */
    Component.onCompleted:
    {
        initializeDB();
        loadExpenses();
    }

    /* Function to Initialize database */
    function initializeDB()
    {
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Expenses(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, amount REAL)');
        });
    }

    /* Function to Insert into database */
    function addExpenseToDB(name, amount)
    {
        db.transaction(function(tx) {
            var result = tx.executeSql('INSERT INTO Expenses(name, amount) VALUES(?, ?)', [name, amount]);
            var id = result.insertId; /* take id of expense that just added */
            expenseModel.addExpense(id, name, amount);
        });
    }

    /* Function to Delete from database */
    function removeExpenseFromDB(id, index)
    {
        db.transaction(function(tx) {
            tx.executeSql('DELETE FROM Expenses WHERE id = ?', [id]);
            expenseModel.removeExpense(index);
        });

    }

    /* Function to Read from database */
    function loadExpenses()
    {
        db.transaction(function(tx) {
            var result = tx.executeSql('SELECT * FROM Expenses');
            for (var i = 0; i < result.rows.length; i++)
            {
                expenseModel.addExpense(result.rows.item(i).id,
                                        result.rows.item(i).name,
                                        result.rows.item(i).amount);
            }
        });
    }


    /* MODEL */
    /* Model of expense */
    ListModel
    {
        id: expenseModel
        property real totalExpense: 0

        function addExpense(id, name, amount)
        {
            append({ id: parseInt(id), name: name, amount: amount });
            totalExpense += amount;
        }

        function removeExpense(index)
        {
            if (index >= 0 && index < count)
            {
                totalExpense -= get(index).amount;
                remove(index);
            }
        }
    }


    /* LAYOUT for application */
    ColumnLayout
    {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        /* Insert infor of expense */
        RowLayout
        {
            TextField
            {
                id: expenseName
                placeholderText: "Activities"
                Layout.fillWidth: true
            }

            TextField
            {
                id: expenseAmount
                placeholderText: "Amount of money"
                validator: DoubleValidator { bottom: 0 }
                Layout.fillWidth: true
            }

            Button
            {
                text: "Insert"
                onClicked:
                {
                    if (expenseName.text && expenseAmount.text)
                    {
                        var amount = parseFloat(expenseAmount.text);
                        addExpenseToDB(expenseName.text, amount);
                        expenseName.clear();
                        expenseAmount.clear();
                    }
                }
            }
        }

        /* List of expense */
        ListView
        {
            id: expenseList
            model: expenseModel
            Layout.fillWidth: true
            Layout.fillHeight: true
            delegate: RowLayout
            {
                width: expenseList.width
                Label
                {
                    text: name
                    Layout.fillWidth: true
                }

                Label
                {
                    text: amount.toFixed(0) + "k VND"
                }

                Button
                {
                    text: "Delete"
                    onClicked:
                    {
                        if (index >= 0 && index < expenseModel.count)
                        {
                            var expenseId = expenseModel.get(index).id; /* take id of expense */
                            removeExpenseFromDB(expenseId, index);             /* delete from database */
                        }
                    }
                }
            }
        }

        /* Total of expense */
        Label
        {
            text: "Total: " + expenseModel.totalExpense.toFixed(0) + "k VND"
            font.bold: true
            Layout.alignment: Qt.AlignRight
        }
    }
}
/*******************************************************************************
* EOF
*******************************************************************************/

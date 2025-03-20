/*******************************************************************************
* Inport
*******************************************************************************/
import QtQuick 2.15
import QtQuick.Controls 2.15
/*******************************************************************************
* Code
*******************************************************************************/
ListModel {
    id: expenseModel

    /* Total of expense */
    property real totalExpense: 0

    /* Funcion insert */
    function addExpense(name, amount) {
        append({ name: name, amount: amount });
        totalExpense += amount;
    }

    /* Function delete */
    function removeExpense(index) {
        if (index >= 0 && index < count) { // Kiểm tra index hợp lệ
            totalExpense -= get(index).amount;
            remove(index);
        }
    }
}
/*******************************************************************************
* EOF
*******************************************************************************/

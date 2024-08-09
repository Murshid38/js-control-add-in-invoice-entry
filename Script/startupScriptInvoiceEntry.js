const InvoiceEntryControlAddIn = document.getElementById('controlAddIn');

InvoiceEntryControlAddIn.innerHTML = `
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice Entry</title>
</head>

<body>
    <form id="upperForm">
        <label for="saleType">Sale Type</label>
        <select id="saleType" name="saleType">
        </select>

        <label for="broker">Broker</label>
        <select id="broker" name="broker">
        </select>

        <label for="store">Store</label>
        <select id="store" name="store">
        </select>

        <label for="lorryNo">Lorry No</label>
        <input type="text" name="lorryNo" id="lorryNo">

        <label for="driverName">Driver Name</label>
        <input type="text" name="driverName" id="driverName">

        <label for="turnDate">Turn Date</label>
        <input type="date" name="turnDate" id="turnDate">

        <label for="turnNo">Turn No</label>
        <input type="number" name="turnNo" id="turnNo">

        <label for="NICDVNo">NIC/DV No</label>
        <input type="text" name="NICDVNo" id="NICDVNo">

        <label for="sellingMark">Selling Mark</label>
        <input type="text" name="sellingMark" id="sellingMark">

        <label for="date">Date</label>
        <input type="date" name="date" id="date">

        <label for="invoiceYear">Invoice Year</label>
        <input type="number" min="1990" max="9999"name="invoiceYear" id="invoiceYear">

        <label for="mark">Mark</label>
        <input type="text" name="mark" id="mark">
    </form>

    <button type="button" id="enterButton">Enter</button>
</body>

</html>
`;

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnControlAddInReady', []);
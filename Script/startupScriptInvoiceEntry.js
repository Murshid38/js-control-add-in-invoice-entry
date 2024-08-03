const InvoiceEntryControlAddIn = document.getElementById('controlAddIn');

InvoiceEntryControlAddIn.innerHTML = `
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action="">
        <label for="saleType">Sale Type</label>
        <select id="saleType" name="saleType">
        </select>

        <label for="broker">Broker</label>
        <select id="broker" name="broker">
        </select>

        <label for="store">Store</label>
        <select id="store" name="store">
        </select>
    </form>

    <button type="button" id="submitButton">Submit</button>
</body>

</html>
`;

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnControlAddInReady', []);
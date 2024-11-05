function getSaleTypes(SaleType) {
    const saleTypeDropdown = document.getElementById('saleType');

    const newOption = document.createElement('option');
    newOption.value = SaleType;
    newOption.text = SaleType;

    saleTypeDropdown.appendChild(newOption);
}

function getBroker(Vendor) {
    const brokerDropDown = document.getElementById('broker');

    const newOption = document.createElement('option');
    newOption.value = Vendor;
    newOption.text = Vendor;

    brokerDropDown.appendChild(newOption);
}

function getStores(Store) {
    const storeDropDown = document.getElementById('store');

    const newOption = document.createElement('option');
    newOption.value = Store;
    newOption.text = Store;

    storeDropDown.appendChild(newOption);
}

function setInvoiceEntrySubmission() {
    const enterButton = document.getElementById('enterButton');

    enterButton.addEventListener("click", function () {
        const saleTypeDropdown = document.getElementById('saleType');
        const saleTypeValue = saleTypeDropdown.value;
        console.log('Sale Type Value: ' + saleTypeValue);

        const brokerDropDown = document.getElementById('broker');
        const broker = brokerDropDown.value.split(' - ');
        const brokerCode = broker[0];
        const brokerName = broker[1];

        const storeDropDown = document.getElementById('store');
        const store = storeDropDown.value.split(' - ');
        const storeCode = store[0];
        const storeName = store[1];

        invoiceEntryJSONObj = {};
        invoiceEntryJSONObj['SaleType'] = saleTypeValue;
        invoiceEntryJSONObj['BrokerCode'] = brokerCode;
        invoiceEntryJSONObj['BrokerName'] = brokerName;
        invoiceEntryJSONObj['StoreCode'] = storeCode;
        invoiceEntryJSONObj['StoreName'] = storeName;

        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('EntrySubmission', [invoiceEntryJSONObj]);
    })
}
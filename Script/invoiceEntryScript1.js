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
    const submitButton = document.getElementById('submitButton');
    // const saleTypeValue = saleTypeDropdown.value;

    // const broker = brokerDropDown.value.split(' - ');
    // const brokerCode = broker[0];
    // const brokerName = broker[1];

    // const store = storeDropDown.value.split(' - ');
    // const storeCode = store[0];
    // const storeName = store[1];

    submitButton.addEventListener("click", function () {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('EntrySubmission', []);
    })
}
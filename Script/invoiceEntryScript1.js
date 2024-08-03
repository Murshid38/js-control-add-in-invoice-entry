const submitButton = document.querySelector('button');

function getSaleTypes(SaleType) {
    const saleTypeDropdown = document.getElementById('saleType');

    const newOption = document.createElement('option');
    newOption.value = SaleType;
    newOption.text = SaleType;

    saleTypeDropdown.appendChild(newOption);
}

function getVendors(Vendor) {
    const vendorDropDown = document.getElementById('broker');

    const newOption = document.createElement('option');
    newOption.value = Vendor;
    newOption.text = Vendor;

    vendorDropDown.appendChild(newOption);
}

function getStores(Store) {
    const storeDropDown = document.getElementById('store');

    const newOption = document.createElement('option');
    newOption.value = Store;
    newOption.text = Store;

    storeDropDown.appendChild(newOption);
}

function returnBroker() {
    const brokerDropDown = document.getElementById('broker');
    const brokerName = brokerDropDown.value;

    // raise the BrokerSelected event
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('BrokerSelected', [brokerName]);
}

function InsertDataToInvoiceEntry() {
    console.log('Clicked Submit Button!!!');    
}

submitButton.addEventListener('click', InsertDataToInvoiceEntry);
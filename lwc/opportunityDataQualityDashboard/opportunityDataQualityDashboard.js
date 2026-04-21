import { LightningElement, wire } from 'lwc';
import getInactiveOwners from '@salesforce/apex/OpportunityDataQualityController.getInactiveOwners';
import getInactivePicklistValues from '@salesforce/apex/OpportunityDataQualityController.getInactivePicklistValues';
import getDuplicateRecords from '@salesforce/apex/OpportunityDataQualityController.getDuplicateRecords';
import getMissingMandatoryFields from '@salesforce/apex/OpportunityDataQualityController.getMissingMandatoryFields';

export default class OpportunityDataQualityDashboard extends LightningElement {
    activeTab = 'inactiveOwners';

    data = {
        inactiveOwners: { count: 0, records: [] },
        inactivePicklist: { count: 0, records: [] },
        duplicates: { count: 0, records: [] },
        missingFields: { count: 0, records: [] }
    };

    columns = [
        { label: 'Opportunity Name', fieldName: 'Name' },
        { label: 'Stage', fieldName: 'StageName' },
        { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
        { label: 'Owner ID', fieldName: 'OwnerId' }
    ];

    @wire(getInactiveOwners)
    wiredInactiveOwners({ data, error }) {
        if (data) this.data.inactiveOwners = data;
    }

    @wire(getInactivePicklistValues)
    wiredInactivePicklist({ data, error }) {
        if (data) this.data.inactivePicklist = data;
    }

    @wire(getDuplicateRecords)
    wiredDuplicates({ data, error }) {
        if (data) this.data.duplicates = data;
    }

    @wire(getMissingMandatoryFields)
    wiredMissingFields({ data, error }) {
        if (data) this.data.missingFields = data;
    }

    handleTabChange(event) {
        this.activeTab = event.target.value;
    }

    get currentData() {
        return this.data[this.activeTab];
    }
}
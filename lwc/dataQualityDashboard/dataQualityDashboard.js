import { LightningElement, wire } from 'lwc';
import getDataQualityMetrics from '@salesforce/apex/DataQualityController.getDataQualityMetrics';
import getObjectMetrics from '@salesforce/apex/DataQualityController.getObjectMetrics';

export default class DataQualityDashboard extends LightningElement {
  dataQualityScore;
  inactiveOwnerCount;
  missingValuesCount;
  duplicateRecordCount;
  isLoading = false;

  selectedObject;
  selectedInactiveOwnerCount;
  selectedMissingValuesCount;
  selectedDuplicateRecordCount;

  objectOptions = [
        { label: 'Account', value: 'Account' },
        { label: 'Contact', value: 'Contact' },
        { label: 'Opportunity', value: 'Opportunity' },
  ];

  // Fetch data quality metrics for all objects
  @wire(getDataQualityMetrics)
  wiredMetrics({ error, data }) {
    if (data) {
      this.dataQualityScore = data.dataQualityScore;
      this.inactiveOwnerCount = data.inactiveOwnerCount;
      this.missingValuesCount = data.missingValuesCount;
      this.duplicateRecordCount = data.duplicateRecordCount;
    } else if (error) {
      console.error('Error fetching data quality metrics:', error);
    }
  } 
  // Handle object selection
  handleObjectChange(event) {
    this.selectedObject = event.detail.value;
    this.isLoading = true
    this.fetchObjectMetrics();
  }

  // Fetch data quality metrics for selected object
  fetchObjectMetrics() {    
    console.log('Fetching metrics for object:'+ this.selectedObject);
    getObjectMetrics({ objectName: this.selectedObject })
      .then((data) => {
        this.selectedInactiveOwnerCount = data.inactiveOwnerCount;
        this.selectedMissingValuesCount = data.missingValuesCount;
        this.selectedDuplicateRecordCount = data.duplicateRecordCount;
      })
      .catch((error) => {
        console.error('Error fetching object metrics:', error);        
      })      
      .finally(() => {
      this.isLoading = false;
    });
;
  }
}
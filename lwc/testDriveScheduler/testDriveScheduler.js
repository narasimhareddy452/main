import { LightningElement,track,wire } from 'lwc';
import getVehicles from '@salesforce/apex/TestDriveSchedulerController.getVehicles';
import getContacts from '@salesforce/apex/TestDriveSchedulerController.getContacts';
import getSalesReps from '@salesforce/apex/TestDriveSchedulerController.getSalesReps';
export default class TestDriveScheduler extends LightningElement {
    @track vehicleOptions = [];
    @track customerOptions = [];
    @track salesRepOptions = [];
    @track statusOptions = [
        { label: 'Scheduled', value: 'Scheduled' },
        { label: 'Completed', value: 'Completed' },
        { label: 'Cancelled', value: 'Cancelled' }
    ];
    
    vehicleId;
    customerId;
    salesRepId;
    scheduledDate;
    status = 'Scheduled';
    
@wire(getVehicles)
    wiredVehicles({ data }) {
        if (data) {
            this.vehicleOptions = data.map(v => ({ label: v.Name, value: v.Id }));
        }
    }

@wire(getContacts)
wiredContacts({ data }) {
    if (data) {
        this.customerOptions = data.map(c => ({ label: c.Name, value: c.Id }));
    }
}

@wire(getSalesReps)
wiredSalesReps({ data }) {
    if (data) {
        this.salesRepOptions = data.map(c => ({ label: c.Name, value: c.Id }));
    }           
}

handleVehicleChange(event) {
        this.vehicleId = event.detail.value;
    }
handleCustomerChange(event) {
        this.customerId = event.detail.value;
    }

handleSalesRepChange(event) {
        this.salesRepId = event.detail.value;
    }

handleDateChange(event) {
        this.scheduledDate = event.detail.value;
    }
handleStatusChange(event) {
        this.status = event.detail.value;
    }
handleSubmit(){
    const testDrive={    
            
            FVehicles__c: this.vehicleId,
            Customer__c: this.customerId,
            Sales_Rep__c: this.salesRepId,
            Scheduled_Date__c: this.scheduledDate,
            Status__c: this.status

    };
       
    
createTestDrive({ testDrive })
            .then(() => {
                alert('Test drive scheduled successfully!');
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to schedule test drive.');
            });
    }

}
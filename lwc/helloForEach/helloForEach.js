import { LightningElement } from 'lwc';

export default class HelloForEach extends LightningElement {
    contacts=[
        {
            Id: 1,
            Name: 'Krishna',
            Title: 'VP of Engineering',
        },
        {
           Id: 2,
           Name:'Srinu',
           Title:'VP of Sales' 
        },
        {
            Id:3,
            Name:'Raju',
            Title:'CEO'
        }
    ]
}
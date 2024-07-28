import { LightningElement,track,api,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactExp.getContactListNew';

export default class SearchContacts extends LightningElement {
@track contactsList =  [];
@track error;
@track searchKey = '';
@track sortBy = 'FirstName';   
@track sortDirection = 'asc';

columns =[{label: 'FirstName',fieldName: 'FirstName',sortable: 'true' },
    {label: 'LastName',fieldName: 'LastName',sortable: 'true' },
    {label: 'Email',fieldName: 'Email',sortable: 'true' },
    {label: 'Phone',fieldName: 'Phone',sortable: 'true' }
];

@wire(getContacts)
    contactList({error,data}){
        if(data){
        this.contactsList = data;
        console.log('contactsList'+this.contactsList)
        this.error = undefined;
        }
        else if(error){
        this.contactsList = undefined;
        this.error = error;
        }
    }
    searchFilter(event){

        this.searchKey = event.target.value;
    }  

get filteredContacts(){

    if(this.searchKey === ''){
        return this.contactsList;
    }

    return  (this.contactsList).filter(contact => contact.LastName.toLowerCase().includes(this.searchKey.toLowerCase()) || 
    (contact.FirstName!=null ? contact.FirstName.toLowerCase().includes(this.searchKey.toLowerCase()) : '' )|| 
(contact.Email!=null ? contact.Email.toLowerCase().includes(this.searchKey.toLowerCase()): '') ||
(contact.Phone!=null ? contact.Phone.toLowerCase().includes(this.searchKey.toLowerCase()): ''));
}

handleSortdata(event){

    this.sortDirection = event.detail.sortDirection;
    this.sortBy = event.detail.fieldName;
    this.sortData(event.detail.fieldName, event.detail.sortDirection);
}

sortData(fieldName,fieldDirection){
    let parseData = JSON.parse(JSON.stringify(this.contactsList));
    
    let keyValue = (a) =>{
        return a[fieldName];
    };

    let isReverse = fieldDirection === 'asc' ? 1 : -1;

    parseData.sort((x,y) => {
     x = keyValue(x) ? keyValue(x) : '';
     y = keyValue(y) ? keyValue(y) : '';
      return isReverse * ((x > y) - (y > x));
    });

    this.contactsList = parseData;
     

    }




}
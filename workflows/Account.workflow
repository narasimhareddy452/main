<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AccountcreationAlert</fullName>
        <description>AccountcreationAlert</description>
        <protected>false</protected>
        <recipients>
            <recipient>narasimhareddy452@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <rules>
        <fullName>updateaddress</fullName>
        <active>false</active>
        <description>updateaddress</description>
        <failedMigrationToolVersion>254.8.1</failedMigrationToolVersion>
        <formula>AND( ISCHANGED( BillingAddress ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

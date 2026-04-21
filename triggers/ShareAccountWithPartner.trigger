trigger ShareAccountWithPartner on Lead (after insert) {
List<PartnerNetworkRecordConnection> connections = new List<PartnerNetworkRecordConnection>();
 
    for (Lead lead : Trigger.new) {
        PartnerNetworkRecordConnection conn = new PartnerNetworkRecordConnection();
        conn.ConnectionId = [SELECT Id, ConnectionStatus FROM PartnerNetworkConnection
                             WHERE ConnectionStatus = 'Accepted' LIMIT 1].Id;
        conn.LocalRecordId = lead.Id;
        conn.SendClosedTasks = true;
        conn.SendOpenTasks = true;
        conn.SendEmails = true;
        connections.add(conn);
    }
 
    insert connections;
}
global class deletecontact

{

webservice static void deletecon(string accountid1)

{

    list<contact> con=[select id from contact where accountid=:accountid1];

    if(con.size()>0)

    {

    delete con;

    }

}

}
@isTest
private class TestRestrictContactByName {

	@isTest static void metodoTest() {
		
		List<contact> listaContatti = new List<contact>();
		Contact c1 = new Contact(FirstName='Francesco', LastName='Riggio' , email='Test@test.com');
		Contact c2 = new Contact(FirstName='Francesco1', LastName = 'INVALIDNAME',email='Test@test.com');
		listaContatti.add(c1);
		listaContatti.add(c2);
		
        Test.startTest();
			try
			{
				insert listaContatti;
			}
			catch(Exception ee)
			{
			}
		
        Test.stopTest(); 
		
       		
	}
	
}
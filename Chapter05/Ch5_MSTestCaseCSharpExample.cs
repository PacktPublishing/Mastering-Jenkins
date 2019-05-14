
// ------------------------------------------------------
// Test: An example MSTest case (Provided by MSDN)
// ------------------------------------------------------
[TestMethod()]
public void ConstructorTest()
{


   String userId = "MasteringJenkins";

   String password = "P@ssw0rd";

   myLogon logon = new Logon(userId, password);

   Assert.AreEqual<string>(userId, logonInfo.UserId, "The UserId was not correctly initialized.");
   Assert.AreEqual<string>(password, logonInfo.Password, "The Password was not correctly initialized.");

}

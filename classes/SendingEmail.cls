public class SendingEmail {
    
    public static void createNewTask(){
        Task tsk= new Task();
        tsk.Subject= 'Task Created from Apex Class on ' + System.now();
        tsk.Priority='Normal';
        tsk.Description='Created from Sending Email Apex Class';
        insert tsk;
        sendemailnotification();
    }
    
    public static void sendemailnotification(){
        System.debug('Sending Email Notification...');
        messaging.singleemailmessage email = new messaging.SingleEmailMessage();
        string[] toaddress= new string[] {'yeluripurnasairam@gmail.com'};
        email.setToAddresses(toaddress);
        email.setReplyTo(null); 
        email.setSenderDisplayName('Sairam Yeluri');
        email.setSubject('Email from Salesforce Org (Via Apex Class)');
        email.setPlainTextBody('This Email is sent via Apex Class');
        // Messaging.sendEmail(new messaging.SingleEmailMessage[] {email}); 
        messaging.Email[] emails = new messaging.Email[]{email};
        messaging.sendEmail(emails);
        System.debug('Email Notification Sent Succesfully');
        
    }
    
}
//SendingEmail.createNewTask();
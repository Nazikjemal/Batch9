List<Salesforce_project__c> sfProjectList = [
                                    SELECT
                                        id,
                                        name,
                                        project_name__c,
                                        status__c,
                                        (SELECT name, subject__c, priority__c FROM Salesforce_tickets__r)
                                    FROM Salesforce_project__c
                                    ];



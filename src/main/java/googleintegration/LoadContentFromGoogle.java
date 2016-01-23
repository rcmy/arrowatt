/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package googleintegration;

import com.google.gdata.client.spreadsheet.*;
import com.google.gdata.data.spreadsheet.*;
import com.google.gdata.util.*;

import java.io.IOException;
import java.net.*;
import java.util.*;

public class LoadContentFromGoogle 
{
    private HashMap<String,String> userPassHash;
    private List<SpreadsheetEntry> spreadsheets;
    
    public LoadContentFromGoogle() throws 
        IOException, AuthenticationException, MalformedURLException, ServiceException
    {
        userPassHash = new HashMap<String,String>();
        SpreadsheetService service =
        new SpreadsheetService("MySpreadsheetIntegration-v1");

        //Final - Do not change URL.
        URL SPREADSHEET_FEED_URL = new URL(
        "https://spreadsheets.google.com/feeds/cells/1jL2V_YbCAzOx_wUtBymSJPpDEjqLsqR46GBT1BSsiwQ/od6/public/full");

        // Make a request to the API and get all spreadsheets.
        SpreadsheetFeed feed = service.getFeed(SPREADSHEET_FEED_URL, SpreadsheetFeed.class);
        spreadsheets = feed.getEntries();
    
    }
    
    public HashMap<String,String> loadUsersPasswords() 
    {
        if (spreadsheets.size() == 0) {
            // TODO: There were no spreadsheets, act accordingly.
            System.out.println("no spreadsheets");
        }
        String username = "";
        String password = "";
        
        for(int i = 0; i < spreadsheets.size();i++){
            SpreadsheetEntry spreadsheetEntry = spreadsheets.get(i);
            System.out.println(spreadsheetEntry.getPlainTextContent());
            String currentContent = spreadsheetEntry.getPlainTextContent();
            if(currentContent.equals("Username") || currentContent.equals("Password"))
            {
                continue;
            }
            if(i%2==0)
            {
                username = currentContent;
            } else
            {
                password = currentContent;
                if(!username.isEmpty() && !password.isEmpty())
                {
                    userPassHash.put(username, password);
                    username = "";
                    password = "";
                }
                
            }
        }
        return userPassHash;
    }
}

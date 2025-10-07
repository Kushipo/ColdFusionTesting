<!DOCTYPE html>
<html>


<head>
    <title>My First Fusion Page</title>
</head>


<body>
    <h1>My First Fusion Page</h1>

<cfscript>
    // Setting a String, and a Number to a variable in CFScript
    aString = "h1";
    aNumber = 45;
    aStringandANumber = aString & " " & aNumber;

    // Examples of prints/outputs
    writeOutput("This is a <b>string:</b> " & aString & "<br>");
    writeOutput("This is a <b>number:</b> " & aNumber & "<br>");
    writeOutput("And this is <b>everything together:</b>
        " & aStringandANumber & "<br>"); // Do note the html tags


    // Now let's look at a big block os strings to set in a variable
    EmailContent = "
        Hi there!<br>
        We want to send you a hoverboard for Christmas!<br>
        Please send us your address!<br>
        Thanks!<br>";

    writeOutput("<b><br>This is a big block of text:<br></b> #EmailContent#");

    // This is a simple introduction to Dates
    DateToday = now(); //sets to current date and time
    writeOutput("<br><b>Today's date and time is:</b> " & DateToday & "<br>");

    CenturyDate = "1/1/2000";
    DaysSinceTurnOfCentury = DateDiff("d", CenturyDate, DateToday);
    writeOutput("<b>Days since the turn of the century:</b> " & DaysSinceTurnOfCentury);

    FortyTwoDaysFromNow = DateAdd("d", 42, DateToday);
    writeOutput("<br><b>42 days from now will be:</b> " &
        FortyTwoDaysFromNow & "<br><br>");
    
    // Time for Arrays!
    writeOutput("<br><b><i>Arrays</i></b>");

    // One dimensional Arrays
    ThingsILike = ["Warm Sandy Beaches",
                    "Snowboarding",
                    "Programming",
                    "Nicoletta",
                    45];
    
    writeOutput("<br><b>Things I Like:</b><br>");

    // Alternate Method
    ThingsILike2 = arrayNew(1);
    arrayAppend(ThingsILike2, "RuneScape");
    arrayAppend(ThingsILike2, "ColdFusion");
    arrayAppend(ThingsILike2, "Rock Climbing");

    // Printing out the Arrays
    for (i=1; i LTE arrayLen(ThingsILike); i=i+1) {
        writeOutput(i & ". " & ThingsILike[i] & "<br>");
    }

    // You can add in specific positions as well
    // But recall that in ColdFusion, Arrays always start at 1!!
    ThingsILike2[2] = "Programming";

    // Others Methods of adding items into an Array
    ArrayAppend(ThingsILike2, "Nature");
    ArrayInsertAt(ThingsILike2, 1, "Snowboarding");

    writeOutput("<br><b>Things I Like 2:</b><br>");

     // Printing out the Arrays
    for (i=1; i LTE arrayLen(ThingsILike2); i=i+1) {
        writeOutput(i & ". " & ThingsILike2[i] & "<br>");
    }

    // Multidimensional Arrays
    writeOutput("<br><b><i>Multidimensional Arrays</i></b><br>");
    MultiArray = arrayNew(2); // 2 indicates 2 dimensions
    MultiArray[1][1] = "Name";
    MultiArray[1][2] = "Age";
    MultiArray[1][3] = "City";


    // Adding more rows
    MultiArray[2][1] = "Nicoletta";
    MultiArray[2][2] = 25;
    MultiArray[2][3] = "Cuneo";
    MultiArray[3][1] = "Ezra";
    MultiArray[3][2] = 27;
    MultiArray[3][3] = "Cuneo";

    // Start of the HTML Table
    writeOutput('<table border="1" cellpadding="5" cellspacing="0"> ');

    // Printing out the Multidimensional Array
    for (i=1; i LTE arrayLen(MultiArray); i=i+1) {

        writeOutput("<tr>");

        for (j=1; j LTE arrayLen(MultiArray[i]); j=j+1) {
            if (i EQ 1) {
                writeOutput("<th>" & MultiArray[i][j] & "</th>");
            } else {
                writeOutput("<td>" & MultiArray[i][j] & "</td>");
            }
            
        }
        
        writeOutput("</tr>");

    }
    writeOutput("</table>");


    // Jumping into Structures!!!
    writeOutput("<br><b><i>Structures</i></b><br>");
    FruitBasket = structNew();
    
    //Alternate Method
    FruitBasket2 = {};

    // Adding items into the structs (Bracket Notation)
    FruitBasket2["Mango"] = "Like";
    FruitBasket2["Sushi"] = "Lke";
    FruitBasket2["Fish"] = "Dislike";

    // Printing of the value of the structs
    writeDump(#FruitBasket2#);
    writeOutput("<br>");

    // Adding items into the structs (Dot Notation)
    // Notice how it CAPS all the .keys
    FruitBasket.Banana = "Like";
    FruitBasket.Pizza = "Like";
    FruitBasket.Coffee = "Like";
    FruitBasket.Fish = "Dislike";

    writeDump(#FruitBasket#);
    writeOutput("<br>");
    
    // Struct creation and population in one step
    fruitBasket = {
        Coffee = "Like",
        Sushi = "Like",
        Fish = "Dislike",
        Nicoletta = "Love"
    };

    writeDump(#fruitBasket#);
    writeOutput("<br>");
    
    // Displaying just the contents of the struct
    writeOutput("<b>Contents of the Fruit Basket: (Always Struct)</b><br>");
    for (key in fruitBasket) {
        writeOutput(key & ": " & fruitBasket[key] & "<br>");
    }


    //EXTRAS ONLY AFTER FULL UNDERSTANDING OF THE BASICS ABOVE
    // Now the motherload, the Array of Structures!!!
    writeOutput("<br><b><i>Array of Structures</i></b><br>");
    Employees = [];
    arrayAppend(Employees, {Name="Nicoletta", Age=25, City="Cuneo"});
    arrayAppend(Employees, {Name="Ezra", Age=27, City="Cuneo"});
    arrayAppend(Employees, {Name="Giorgio", Age=30, City="Turin"});
    arrayAppend(Employees, {Name="Luca", Age=28, City="Milan"});

    writeOutput('<table border="1" cellpadding="5" cellspacing="0"> ');
    writeOutput("<tr><th>Name</th><th>Age</th><th>City</th></tr>");
    for (i=1; i LTE arrayLen(Employees); i=i+1) {
        writeOutput("<tr>");
        writeOutput("<td>" & Employees[i].Name & "</td>");
        writeOutput("<td>" & Employees[i].Age & "</td>");
        writeOutput("<td>" & Employees[i].City & "</td>");
        writeOutput("</tr>");
    }
    writeOutput("</table>");
    writeOutput("<br>");
    writeOutput("<br>");

    // Queries, the final frontier
    writeOutput("<br><b><i>Queries</i></b><br>");
    /*
    // writing a new query
    WeaponQuery = queryExecute(
        "SELECT Name, Price, Type
        FROM Weapons
        WHERE Price < 500000",
        [],
        {
        }

    );*/

    // reading from a JSON file in the same folder
    filePath =  expandPath("./weapon_data.json");

    // reading the file content
    jsonString = fileRead(filePath);

    // parsing the JSON string into a ColdFusion variable
    WeaponDataArray = deserializeJSON(jsonString);

    // creating our own filter with an array manually
    FilteredWeapons = [];

    for (weaponStruct in WeaponDataArray) {
        if(weaponStruct.Price > 500000) {
            arrayAppend(FilteredWeapons, weaponStruct);
        }
    }

    writeOutput("<h2><b><i>Data loaded and filtered from JSON:</i></vb></h2>");

    // Looping through the query results
    writeOutput('<table border="1" cellpadding="5" cellspacing="0"> ');

    // we use a for loop here
    for(row in FilteredWeapons) {
        writeOutput(
            row.Name & " costs " & row.Price & " gp and is a " & row.Type & " weapon." & "<br>"
        );
    }

    writeOutput("</table>");

    writeOutput(("<br> HI <br>"));

    

</cfscript>


</body>
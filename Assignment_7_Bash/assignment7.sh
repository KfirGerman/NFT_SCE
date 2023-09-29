#!/bin/bash


# Help functions

fetch_webpage() {
    local url="$1"
    local file="$2"
    local user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

    if ! curl -s -A "$user_agent" "$url" -o "$file"; then
        echo "Error: Failed to fetch the webpage from $url"
        return 1
    fi

    return 0
}



echo "#########################################################################################"
echo "#                                   Task 1                                              #"
echo "#                         Get the current Date from                                     #"
echo "#                          www.timeanddate.com                                          #"
echo "#########################################################################################"

URL="https://www.timeanddate.com"
FILE="time.html"

if ! fetch_webpage "$URL" "$FILE"; then
    exit 1
fi

# Extract the date and check if a date is found
DATE=$(grep -E -o "([0-9]{2}/[0-9]{2}/[0-9]{4})|([A-Z][a-z]{2,8} [0-9]{1,2}, [0-9]{4})" "$FILE" | head -n 1)
if [ -z "$DATE" ]; then
    echo "Error: No date found in the webpage."
    rm "$FILE"
    exit 1
fi

# Print the date and remove the temporary HTML file
echo "The current date is: $DATE"
rm "$FILE"


echo "#########################################################################################"
echo "#                                   Task 2                                              #"
echo "#                         Get the current IP address                                    #"
echo "#                          www.myip.com                                                 #"
echo "#########################################################################################"

URL="https://www.myip.com"
FILE="ip.html"

if ! fetch_webpage "$URL" "$FILE"; then
    exit 1
fi

# Extract the IP address and check if an IP address is found
IP=$(grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" "$FILE" | head -n 1)
if [ -z "$IP" ]; then
    echo "Error: No IP address found in the webpage."
    # rm "$FILE"
fi

# Print the IP address and remove the temporary HTML file
echo "The current IP address is: $IP"
# rm "$FILE"


echo "#########################################################################################"
echo "#                                   Task 3                                              #"
echo "#                            Get the main headline from                                 #"
echo "#                              www.ynet.co.il                                           #"
echo "#########################################################################################"

URL="https://www.ynet.co.il/home/0,7340,L-8,00.html"
FILE="ynet.html"

if ! fetch_webpage "$URL" "$FILE"; then
    exit 1
fi

HEADLINE=$(grep -oP '<h1 class="slotTitle"[^>]*><span[^>]*>\K[^<]*' "$FILE" | head -n 1)
if [ -z "$HEADLINE" ]; then
    echo "Error: No headline found in the webpage."
    rm "$FILE"
    exit 1
fi

# Print the headline and remove the temporary HTML file
echo "The main headline is: $HEADLINE"
rm "$FILE"



echo "#########################################################################################"
echo "#                                   Task 4                                              #"
echo "#                        Get the download link from                                     #"
echo "#                              www.bugzilla.org                                         #"
echo "#########################################################################################"

URL="https://www.bugzilla.org"
FILE="bugzilla.html"

# Fetching the webpage using the fetch_webpage function
if ! fetch_webpage "$URL" "$FILE"; then
    exit 1
fi

# Extracting the download link using grep and capturing the href value
DOWNLOAD_LINK=$(grep -oP '<a title="Download Bugzilla" href="\K[^"]*' "$FILE")
if [ -z "$DOWNLOAD_LINK" ]; then
    echo "Error: No download link found on the webpage."
    rm "$FILE"
    exit 1
fi

# Printing the download link and removing the temporary HTML file
echo "The download link is: $URL$DOWNLOAD_LINK"
rm "$FILE"


echo "#########################################################################################"
echo "#                                   Task 5                                              #"
echo "#                       Get the first tutorial name from                                #"
echo "#                          www.jmeter.apache.org                                        #"
echo "#########################################################################################"

URL="https://jmeter.apache.org"
FILE="jmeter.html"

# Fetching the webpage using the fetch_webpage function
if ! fetch_webpage "$URL" "$FILE"; then
    exit 1
fi

# Extracting the first tutorial name after the Tutorials section, treating file as text
TUTORIAL_NAME=$(grep -a -oPz '(?s)<div class="menu-title">Tutorials</div>.*?</ul>' "$FILE" | grep -a -oP '<a href="[^"]+">\K[^<]+' | head -n 1)

# Check if TUTORIAL_NAME is empty
if [ -z "$TUTORIAL_NAME" ]; then
    echo "Error: No tutorial name found on the webpage."
    rm "$FILE"
    exit 1
fi

# Printing the first tutorial name and removing the temporary HTML file
echo "The first tutorial name is: $TUTORIAL_NAME"
rm "$FILE"


echo "#########################################################################################"
echo "#                                   Task 6                                              #"
echo "#                       Get list of student names from moodle                           #"
echo "#                          www.moodle.sce.ac.il                                         #"
echo "#########################################################################################"

echo "Unfortunately, Moodle does not allow web scraping. Protected by 2FA."


echo "#########################################################################################"
echo "#                                   Task 7                                              #"
echo "#                     Extracting job titles from LinkedIn                               #"
echo "#########################################################################################"

URL="https://www.linkedin.com/jobs/nft-jobs?position=1&pageNum=0"
FILE="linkedin.html"

# Fetching the webpage using the fetch_webpage function
if ! fetch_webpage "$URL" "$FILE"; then
    exit 1
fi

# target the <span class="sr-only"> element and extract the text after it using grep and separating the lines using tr
JOB_TITLES=$(grep -oP '<span class="sr-only">\K[^<]+' "$FILE" | tr '\n' ' ')

# Check if JOB_TITLES is empty
if [ -z "$JOB_TITLES" ]; then
    echo "Error: No job titles found on the webpage."
    rm "$FILE"
    exit 1
fi

# Printing the job titles and removing the temporary HTML file
echo "The job titles are: $JOB_TITLES"
rm "$FILE"

# task 8
# Extracting
  #software non functional testing ’ books from: www.amazon.com

echo "#########################################################################################"
echo "#                                   Task 8                                              #"
echo "#                     Extracting NFT books from Amazon                                  #"
echo "#########################################################################################"

URL="https://www.amazon.com/s?k=software+non+functional+testing&crid=2MHRWS9ST1EJA&sprefix=%2Caps%2C190&ref=nb_sb_noss_2"
FILE="amazon.html"

# check if amazon.html exists, if not, fetch the webpage
if [ ! -f "$FILE" ]; then
    if ! fetch_webpage "$URL" "$FILE"; then
        exit 1
    fi
fi

# Extract the book titles and check if a book title is found
BOOK_TITLES=$(grep -oP '<span class="a-size-medium a-color-base a-text-normal">\K[^<]+' "$FILE")
if [ -z "$BOOK_TITLES" ]; then
    echo "Error: No book titles found in the webpage."
    # rm "$FILE"
    exit 1
fi

# Print the book titles and remove the temporary HTML file
echo "The book titles are:"
echo "$BOOK_TITLES"
# rm "$FILE"













#Invoking a WebRequest of news.google.com
$Response = Invoke-WebRequest -Uri https://news.google.com -Method Get
$Response.StatusCode
$Response.Links
$Response.Images | Select -First 1 

#Invoke rest method to get all issues from a GitHub repo
(Invoke-Restmethod -Uri https://api.github.com/repos/adamdriscoll/poshtools/issues ).title

#Create a new issue on GitHub using their REST API.
$Body = @{
    title = 'This is a test issue for a presentation'
    body = 'This is some additional information'
} | ConvertTo-Json

#TODO: Need to find a good example of a webservice for this....
New-WebServiceProxy 


configuration Lights {

Import-DscResource -Module Light

    Light Basement {
        Url = 'http://www.billgateshouse.com/'
        Name = 'Bedroom' 
        State = 'ON'
    }

}

Lights
Start-DscConfiguration Lights


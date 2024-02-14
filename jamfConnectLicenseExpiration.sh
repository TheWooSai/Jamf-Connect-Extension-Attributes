#!/bin/zsh

if [[ -f "/Library/Managed Preferences/com.jamf.connect.plist" ]];then
    decodedLicense=$(echo $(defaults read /Library/Managed\ Preferences/com.jamf.connect.plist LicenseFile) | base64 -D)
    expiryDateRaw=$(/usr/bin/plutil -extract ExpirationDate raw - <<< $decodedLicense)
    expiryDate=$(echo "$expiryDateRaw" | rev | cut -c6- | rev )
else
    expiryDate="9999-99-99 23:59:59"
fi

echo "<result>$expiryDate</result>"

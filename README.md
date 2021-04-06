# Fortinet VPN Add-on

This repository provides [forticlientsslvpn_cli](https://kb.fortinet.com/kb/documentLink.do?externalID=FD39996) add-on for Jelastic Platform.

**Type of nodes this add-on can be applied to**: 
- Application server (cp).

### What it can be used for?
It will provide a secure connection from your 1st application node to your VPN gateway

### Deployment
In order to get this solution instantly deployed, click the "Deploy to Jelastic" button

[![GET IT HOSTED](https://raw.githubusercontent.com/jelastic-jps/jpswiki/master/images/getithosted.png)](https://app.j.layershift.co.uk/?manifest=../../raw/master/fortinetvpn.jps)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../raw/master/fortinetvpn.jps) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

For more information on what Jelastic add-on is and how to apply it, follow the [Jelastic Add-ons](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-Addons) reference.

### Actions

Once installed you can:

* Change the configuration parameters using Configure button
* Check  status using Status button
* Restart Fortinet VPN

### CLI options:
```
sudo systemctl status fortinetvpn@server
sudo systemctl stop fortinetvpn@server
sudo systemctl start fortinetvpn@server
sudo systemctl restart fortinetvpn@server
```


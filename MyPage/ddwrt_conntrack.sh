#!/bin/sh
echo "<html>"
echo " <head>"
echo "  <meta http-equiv=\"Content-Type\" content=\"application/xhtml+xml; charset=iso-8859-1\" />"
echo "  <link rel=\"icon\" href=\"images/favicon.ico\" type=\"image/x-icon\" />"
echo "  <link rel=\"shortcut icon\" href=\"images/favicon.ico\" type=\"image/x-icon\" />"
echo "  <script type=\"text/javascript\" src=\"common.js\"></script>"
echo "  <script type=\"text/javascript\" src=\"lang_pack/english.js\"></script>"
echo "  <script type=\"text/javascript\" src=\"lang_pack/language.js\"></script>"
echo "  <link type=\"text/css\" rel=\"stylesheet\" href=\"style/$(nvram get router_style)/style.css\" />"
echo "  <!--[if IE]><link type=\"text/css\" rel=\"stylesheet\" href=\"style/$(nvram get router_style)/style_ie.css\" /><![endif]-->"
echo "  <script type=\"text/javascript\" src=\"js/prototype.js\"></script>"
echo "  <script type=\"text/javascript\" src=\"js/effects.js\"></script>"
echo "  <script type=\"text/javascript\" src=\"js/window.js\"></script>"
echo "  <script type=\"text/javascript\" src=\"js/window_effects.js\"></script>"
echo "  <script type=\"text/javascript\" src=\"/user/ddwrt_conntrack.js\"></script>"
echo "  <script type=\"text/javascript\">"
echo "   var ip_conntrack_max=$(nvram get ip_conntrack_max)"
echo "   var qos_uplink=$(nvram get wshaper_uplink)"
echo "   var qos_downlink=$(nvram get wshaper_downlink)"
echo "   var hosts = { "
awk '{ printf "    '\''%s'\'': { online: false, name: \"%s\" },\n",$1,$2; }' /tmp/hosts
echo "    '$(nvram get wan_ipaddr)': { online: true, name: \"&lt;WAN&gt;\" }"
echo "   }"
echo "  </script>"
echo "  <link type=\"text/css\" rel=\"stylesheet\" href=\"style/pwc/default.css\" />"
echo "  <link type=\"text/css\" rel=\"stylesheet\" href=\"style/pwc/ddwrt.css\" />"
echo "  <title>$(nvram get router_name) - NAT Activity v0.13</title>"
echo " </head>"
echo " <body class=\"gui\">"
echo " <div id=\"wrapper\">"
echo "  <div id=\"content\">"
echo "   <div id=\"header\">"
echo "   <div id=\"logo\"><h1>Control Panel</h1></div>"
echo "   <div id=\"menu\">"
echo "    <div id=\"menuMain\">"
echo "     <ul id=\"menuMainList\">"
echo "      <li><a href=\"index.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.setup)</script></strong></a></li>"
echo "      <li><a href=\"Wireless_Basic.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.wireless)</script></strong></a></li>"
echo "      <li><a href=\"Services.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.services)</script></strong></a></li>"
echo "      <li><a href=\"Firewall.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.security)</script></strong></a></li>"
echo "      <li><a href=\"Filters.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.accrestriction)</script></strong></a></li>"
echo "      <li><a href=\"ForwardSpec.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.applications)</script></strong></a></li>"
echo "      <li><a href=\"Management.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.admin)</script></strong></a></li>"
echo "      <li class=\"current\"><span><strong><script type=\"text/javascript\">Capture(bmenu.statu)</script></strong></span>"
echo "       <div id=\"menuSub\">"
echo "        <ul id=\"menuSubList\">"
echo "         <li><a href=\"Status_Router.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.statuRouter)</script></strong></a></li>"
echo "         <li><a href=\"Status_Internet.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.statuInet)</script></strong></a></li>"
echo "         <li><a href=\"Status_Lan.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.statuLAN)</script></strong></a></li>"
echo "         <li><a href=\"Status_Wireless.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.statuWLAN)</script></strong></a></li>"
echo "         <li><a href=\"Status_Bandwidth.asp\"><strong><script type=\"text/javascript\">Capture(bmenu.statuBand)</script></strong></a></li>"
echo "         <li><a href=\"Info.htm\"><strong><script type=\"text/javascript\">Capture(bmenu.statuSysInfo)</script></strong></a></li>"
echo "         <li><span><strong>My Page</strong></span></li>"
echo "        </ul>"
echo "       </div>"
echo "      </li>"
echo "     </ul>"
echo "    </div>"
echo "   </div>"
echo "  </div>"
echo "  <div id=\"main\">"
echo "   <div id=\"contents\">"
# Page Body
echo '   <h2>NAT Activity</h2>'
echo "   <fieldset>"
echo "    <legend>Clients</legend>"
echo "    <table class=\"table\" cellpadding=\"2\" id=\"traffic_table\" summary=\"clients monitored\">"
echo "     <tr>"
echo "      <th style=\"width: 15px;\">#</th>"
echo "      <th style=\"width: 125px;\">Host Name</th>"
echo "      <th style=\"width: 82px;\">IP Address</th>"
echo "      <th style=\"width: 28px;\">Cons</th>"
echo "      <th style=\"width: 86px; text-align: right;\">Uploading</th>"
echo "      <th style=\"width: 86px; text-align: right;\">Downloading</th>"
echo "      <th style=\"width: 54px; text-align: right;\">Up</th>"
echo "      <th style=\"width: 54px; text-align: right;\">Down</th>"
echo "     </tr>"
echo "     <tr><td colspan=5>CALCULATING...</td></tr>"
echo "    </table>"
echo "   </fieldset><br />"
echo "   <fieldset>"
echo "    <legend>Bandwidth Summary</legend>"
echo "    <div style=\"width: 100%; margin: 2px 0;\">Upstream Load:<div style=\"width: 100%; height: 12px; background: #ddffdd; border: 1px solid #eeffee;\" id=\"BarUp\"></div></div>"
echo "    <div style=\"width: 100%; margin: 2px 0;\">Downstream Load:<div style=\"width: 100%; height: 12px; background: #ddffdd; border: 1px solid #eeffee;\" id=\"BarDown\"></div></div>"
echo "   </fieldset><br />"
echo "   <fieldset>"
echo "    <legend>Active Protocols</legend>"
echo "    <table class=\"table\" cellpadding=\"2\" style=\"width: 250px; margin: 0; display: inline; float: left;\" id=\"ports_table\">"
echo "     <tr>"
echo "      <th style=\"width: 140px;\">Client</th>"
echo "      <th style=\"width: 82px;\">Port</th>"
echo "      <th style=\"width: 28px;\">Cons</th>"
echo "     </tr>"
echo "     <tr><td colspan=3>CALCULATING...</td></tr>"
echo "    </table>"
echo "   </fieldset><br />"
echo "   <fieldset>"
echo "    <legend>Active Connections (<span id=\"conRefresh\" a href=\"#\" style=\"cursor: pointer;\" onclick=\"confresh()\">PAUSE</span>)</legend>"
echo "    <table class=\"table\" cellspacing=\"0\" id=\"active_connections_table\" style=\"margin: 0;\">"
echo "     <tr>"
echo "      <th width=\"4%\">Con</th>"
echo "      <th width=\"30%\">Source</th>"
echo "      <th width=\"16%\">Port</th>"
echo "      <th width=\"30%\">Destination</th>"
echo "      <th width=\"16%\">Port</th>"
echo "      <th width=\"4%\">QoS</th>"
echo "     </tr>"
echo "     <tr><td colspan=6>CALCULATING...</td></tr>"
echo '     <script type="text/javascript">'
echo '      //<![CDATA['
echo "      var t = new SortableTable(document.getElementById('active_connections_table'), 1000);"
echo '      //]]>'
echo '     </script>'
echo '    </table>'
echo "   </fieldset><br />"
# Footer
echo "   <div class=\"submitFooter\">"
echo "<script type=\"text/javascript\">"
echo "//<![CDATA["
echo "var autoref = sbutton.autorefresh;"
echo "submitFooterButton(0,0,0,autoref);"
echo "//]]>"
echo "</script>"
echo "    </div>"
echo "   </form>"
echo "   </div>"
echo "  </div>"
echo "  <div id=\"helpContainer\">"
echo "   <div id=\"help\">"
echo "    <div><h2>Help:</h2></div>"
echo "    <dl>"
echo "     <dt class=\"term\">Clients:</dt>"
echo "     <dd class=\"definition\">List of clients which have been active on the network and how much traffic they are generating / have generated through the router."
echo "     <p>Currently active clients are in green, idle/disconnected clients are in red.</dd>"
echo "     <dt class=\"term\">Bandwidth Summary:</dt>"
echo "     <dd class=\"definition\">Stacked bar graph showing clients using more than 1% of the WAN bandwidth.<p>If you have a lot of clients all using less than 1% each but combined more than that, they will be grouped together as bar * as they would not fit on the graph by themselves.</dd>"
echo "     <dt class=\"term\">Active Protocols:</dt>"
echo "     <dd class=\"definition\">Shows what known protocols are being used on the network and by which clients.  All unknown connections are grouped into Other in the list."
echo "     <p>You can add more protocols to the known list simply by editing the ddwrt_conntrack.js file on your router."
echo "     <p>Be aware that adding none-standard ports (eg Bittorrent port ranges) will cause confusing results as the page does not distinguish between client and server ports.</dd>"
echo "     <dt class=\"term\">Active Connections:</dt>"
echo "     <dd class=\"definition\">Shows every active connection being tracked by the router and their QoS rating if appropriate."
echo "     <p>Click PAUSE to pause the Active Connections table so you can look at it more closely, the other tables will continue to refresh as normal.  When paused you can also click the table headings to sort the columns.</p>"
echo "     <p>The QoS ratings are: "
echo "    <script type=\"text/javascript\">"
echo "    //<![CDATA["
echo "     for(i=10;i<50;i=i+10) {"
echo "     document.write(\"<span style='width: 90px; padding: 0 3px; margin: 0 3px; background: \"+qos_col[i]+\"'>\"+qos[i]+\"</span>\");"
echo "     }";
echo "    //]]>"
echo "    </script>"
echo "    <p>If a line is not colour coded it means that connection is exempt from QoS.</dd>"
echo "    </dl>"
echo "   </div>"
echo "  </div>"
echo "  <div id=\"floatKiller\"></div>"
echo "   <div id=\"statusInfo\">"
echo "    <div class=\"info\"><script type=\"text/javascript\">Capture(share.firmware)</script>:"
echo "    <script type=\"text/javascript\">"
echo "    //<![CDATA["
echo "     document.write(\"<a title='" + share.about + "' href='javascript:openAboutWindow()'>$(cat /tmp/loginprompt|grep DD-WRT|cut -d' ' -f1) $(cat /tmp/loginprompt|grep DD-WRT|cut -d' ' -f2) ($(cat /tmp/loginprompt|grep Release|cut -d' ' -f2)) $(cat /tmp/loginprompt|grep DD-WRT|cut -d' ' -f3)</a>\");"
echo "    //]]>"
echo "    </script>"
echo "    </div>"
echo "   <div class=\"info\"><script type=\"text/javascript\">Capture(share.time)</script>:  <span id=\"uptime\"></span></div>"
echo "   <div class=\"info\">WAN<span id=\"ipinfo\">&nbsp;$(nvram get wan_ipaddr)</span></div>"
echo "  </div>"
echo " </div>"
echo " </div>"
echo " </body>"
echo "</html>"
#
# This script was written by Renaud Deraison <deraison@cvs.nessus.org>
#
# See the Nessus Scripts License for details
#

if(description)
{
 script_id(11465);
 script_version ("$Revision: 1.5 $");
 script_cve_id("CVE-1999-1180");
 
 name["english"] = "args.bat";
 
 script_name(english:name["english"]);
 
 desc["english"] = "
The CGI 'args.bat' (and/or 'args.cmd') is installed. This CGI has
a well known security flaw that lets an attacker upload 
arbitrary files on the remote web server. 

Solution : remove it from /cgi-dos.

Risk factor : High";



 script_description(english:desc["english"]);
 
 summary["english"] = "Checks for the presence of /cgi-dos/args.bat";
 
 script_summary(english:summary["english"], francais:summary["francais"]);
 
 script_category(ACT_GATHER_INFO);
 
 
 script_copyright(english:"This script is Copyright (C) 2003 Renaud Deraison",
		francais:"Ce script est Copyright (C) 2003 Renaud Deraison");
 family["english"] = "CGI abuses";
 family["francais"] = "Abus de CGI";
 script_family(english:family["english"], francais:family["francais"]);
 script_dependencie("find_service.nes", "no404.nasl");
 script_require_ports("Services/www", 80);
 exit(0);
}

#
# The script code starts here
#

include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");

if ( report_paranoia < 2 ) exit(0);


port = get_http_port(default:80);

if(!get_port_state(port))exit(0);

res = is_cgi_installed_ka(item:"/cgi-dos/args.bat", port:port);
if( res == NULL ) exit (0);
if( res != 0 ) { security_hole(port); exit(0); }

res = is_cgi_installed_ka(item:"/cgi-dos/args.cmd", port:port);

if( res == NULL ) exit (0);
if( res != 0 ) { security_hole(port); exit(0); }

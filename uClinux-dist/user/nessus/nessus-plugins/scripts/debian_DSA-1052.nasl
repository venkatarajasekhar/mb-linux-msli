# This script was automatically generated from the dsa-1052
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2004 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004 Michel Arboi

if (! defined_func('bn_random')) exit(0);

desc = '
Several buffer overflows have been discovered in cgiirc, a web-based
IRC client, which could be exploited to execute arbitrary code.
The old stable distribution (woody) does not contain cgiirc packages.
For the stable distribution (sarge) these problems have been fixed in
version 0.5.4-6sarge1.
For the unstable distribution (sid) these problems have been fixed in
version 0.5.4-6sarge1.
We recommend that you upgrade your cgiirc package.


Solution : http://www.debian.org/security/2006/dsa-1052
Risk factor : High';

if (description) {
 script_id(22594);
 script_version("$Revision: 1.1 $");
 script_xref(name: "DSA", value: "1052");
 script_cve_id("CVE-2006-2148");

 script_description(english: desc);
 script_copyright(english: "This script is (C) 2006 Michel Arboi <mikhail@nessus.org>");
 script_name(english: "[DSA1052] DSA-1052-1 cgiirc");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1052-1 cgiirc");
 exit(0);
}

include("debian_package.inc");

w = 0;
if (deb_check(prefix: 'cgiirc', release: '', reference: '0.5.4-6sarge1')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package cgiirc is vulnerable in Debian .\nUpgrade to cgiirc_0.5.4-6sarge1\n');
}
if (deb_check(prefix: 'cgiirc', release: '3.1', reference: '0.5.4-6sarge1')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package cgiirc is vulnerable in Debian 3.1.\nUpgrade to cgiirc_0.5.4-6sarge1\n');
}
if (deb_check(prefix: 'cgiirc', release: '3.1', reference: '0.5.4-6sarge1')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package cgiirc is vulnerable in Debian sarge.\nUpgrade to cgiirc_0.5.4-6sarge1\n');
}
if (w) { security_hole(port: 0, data: desc); }

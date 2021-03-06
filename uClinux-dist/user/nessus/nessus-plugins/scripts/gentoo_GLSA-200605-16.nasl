# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200605-16.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004 Michel Arboi <mikhail@nessus.org>

if (! defined_func('bn_random')) exit(0);

if (description)
{
 script_id(21614);
 script_version("$Revision: 1.1 $");
 script_xref(name: "GLSA", value: "200605-16");
 script_cve_id("CVE-2006-0847");

 desc = 'The remote host is affected by the vulnerability described in GLSA-200605-16
(CherryPy: Directory traversal vulnerability)


    Ivo van der Wijk discovered that the "staticfilter" component of
    CherryPy fails to sanitize input correctly.
  
Impact

    An attacker could exploit this flaw to obtain arbitrary files from
    the web server.
  
Workaround

    There is no known workaround at this time.
  
References:
    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-0847


Solution: 
    All CherryPy users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=dev-python/cherrypy-2.1.1"
  

Risk factor : Low
';
 script_description(english: desc);
 script_copyright(english: "(C) 2006 Michel Arboi <mikhail@nessus.org>");
 script_name(english: "[GLSA-200605-16] CherryPy: Directory traversal vulnerability");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'CherryPy: Directory traversal vulnerability');
 exit(0);
}

include('qpkg.inc');
if (qpkg_check(package: "dev-python/cherrypy", unaffected: make_list("ge 2.1.1"), vulnerable: make_list("lt 2.1.1")
)) { security_warning(0); exit(0); }

# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200609-20.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004 Michel Arboi <mikhail@nessus.org>

if (! defined_func('bn_random')) exit(0);

if (description)
{
 script_id(22471);
 script_version("$Revision: 1.1 $");
 script_xref(name: "GLSA", value: "200609-20");

 desc = 'The remote host is affected by the vulnerability described in GLSA-200609-20
(DokuWiki: Shell command injection and Denial of Service)


    Input validation flaws have been discovered in the image handling of
    fetch.php if ImageMagick is used, which is not the default method.
  
Impact

    A remote attacker could exploit the flaws to execute arbitrary shell
    commands with the rights of the web server daemon or cause a Denial of
    Service.
  
Workaround

    There is no known workaround at this time.
  
References:
    http://www.freelists.org/archives/dokuwiki/09-2006/msg00278.html


Solution: 
    All DokuWiki users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=www-apps/dokuwiki-20060309e"
  

Risk factor : High
';
 script_description(english: desc);
 script_copyright(english: "(C) 2006 Michel Arboi <mikhail@nessus.org>");
 script_name(english: "[GLSA-200609-20] DokuWiki: Shell command injection and Denial of Service");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'DokuWiki: Shell command injection and Denial of Service');
 exit(0);
}

include('qpkg.inc');
if (qpkg_check(package: "www-apps/dokuwiki", unaffected: make_list("ge 20060309e"), vulnerable: make_list("lt 20060309e")
)) { security_hole(0); exit(0); }

import sys
import ldap
from ldapbind import LdapBind

if __name__ == '__main__':
    KAUST_ID = sys.argv[1] if len(sys.argv) > 1 else '134830'
    print "Using KAUST id: %s" % KAUST_ID
    with LdapBind() as l:
        try:
            print l.whoami_s()
            print l.search_ext_s('DC=KAUST,DC=EDU,DC=SA', ldap.SCOPE_SUBTREE,
                                 "(uidNumber=%s)" % KAUST_ID,
                                 ['displayName'])[0][1]['displayName'][0]
        except ldap.LDAPError, error:
            print error

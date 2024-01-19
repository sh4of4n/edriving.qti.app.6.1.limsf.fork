// The present software is not subject to the US Export Administration Regulations (no exportation license required), May 2012
package my.com.tbs.edriving.qti.app.info.subtype

class SecurityOption(activated: Boolean, title: String) {
    var activated = false
    var title = ""
    fun toString(no: String, yes: String): String {
        var act = no
        if (activated) act = yes
        return act + "\t" + title
    }

    init {
        this.activated = activated
        this.title = title
    }
}
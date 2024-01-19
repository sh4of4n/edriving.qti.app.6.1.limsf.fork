// The present software is not subject to the US Export Administration Regulations (no exportation license required), May 2012
package my.com.tbs.edriving.qti.app.info


abstract class MorphoInfo {
    abstract override fun toString(): String

    companion object {
        var m_b_fvp = false
        var mLatentDetect = false
    }
}
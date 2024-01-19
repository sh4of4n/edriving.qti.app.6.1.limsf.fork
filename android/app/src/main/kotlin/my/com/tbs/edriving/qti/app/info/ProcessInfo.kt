package my.com.tbs.edriving.qti.app.info

import com.morpho.morphosmart.sdk.CallbackMask;

class ProcessInfo {

    companion object {
        fun getInstance(): ProcessInfo {
            if (mInstance == null) {
                mInstance = ProcessInfo()
                mInstance?.reset()
            }
            return mInstance!!
        }
    
        private var mInstance: ProcessInfo? = null
    }
    

    fun reset()
    {

    }

    private var callbackCmd: Int = (CallbackMask.MORPHO_CALLBACK_IMAGE_CMD.getValue()
            or CallbackMask.MORPHO_CALLBACK_ENROLLMENT_CMD.getValue()
            or CallbackMask.MORPHO_CALLBACK_COMMAND_CMD.getValue()
            or CallbackMask.MORPHO_CALLBACK_CODEQUALITY.getValue()
            or CallbackMask.MORPHO_CALLBACK_DETECTQUALITY.getValue()
            or CallbackMask.MORPHO_CALLBACK_BUSY_WARNING.getValue())

    fun getCallbackCmd(): Int {
        return callbackCmd
    }

    fun setCallbackCmd(callbackCmd: Int) {
        this.callbackCmd = callbackCmd
    }

}
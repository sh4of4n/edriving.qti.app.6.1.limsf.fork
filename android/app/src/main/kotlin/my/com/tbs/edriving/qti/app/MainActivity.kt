package my.com.tbs.edriving.qti.app

import com.example.morpho_sample.MainActivity
import android.annotation.SuppressLint
import android.app.AlertDialog
import android.content.ContextWrapper
import android.content.DialogInterface
import android.content.Intent
import android.content.IntentFilter
import android.content.res.AssetManager
import android.hardware.usb.UsbManager
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.os.Looper
import android.os.StrictMode
import android.util.Log
import com.intellego.morphosmart.driver.CTException
import com.intellego.morphosmart.driver.DeviceException
import com.intellego.morphosmart.driver.DeviceProbe
import com.intellego.morphosmart.driver.MorphoSmart
import com.intellego.morphosmart.ilv.ILVErrorCode
import com.intellego.morphosmart.ilv.ILVResultCode
import com.intellego.mykad.CardHolderInfo
import com.intellego.mykad.MyKad
import com.morpho.android.usb.USBManager
import com.morpho.morphosmart.sdk.CallbackMask
import com.morpho.morphosmart.sdk.Coder
import com.morpho.morphosmart.sdk.CustomInteger
import com.morpho.morphosmart.sdk.DetectionMode
import com.morpho.morphosmart.sdk.ErrorCodes
import com.morpho.morphosmart.sdk.FalseAcceptanceRate
import com.morpho.morphosmart.sdk.IMsoSecu
import com.morpho.morphosmart.sdk.MorphoDatabase
import com.morpho.morphosmart.sdk.MorphoDevice
import com.morpho.morphosmart.sdk.ResultMatching
import com.morpho.morphosmart.sdk.SecuConfig
import com.morpho.morphosmart.sdk.StrategyAcquisitionMode
import com.morpho.morphosmart.sdk.Template
import com.morpho.morphosmart.sdk.TemplateList
import com.morpho.morphosmart.sdk.TemplateType
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import morpho.msosecu.sdk.api.MsoSecu
import my.com.tbs.edriving.qti.app.info.MorphoInfo
import my.com.tbs.edriving.qti.app.info.subtype.SecurityOption
import my.com.tbs.edriving.qti.app.info.ProcessInfo
import java.io.*
import java.util.*


class MainActivity : FlutterActivity(), Observer {
    private var morphoSmart: MorphoSmart? = null
    private var deviceProbe: DeviceProbe? = null
    private var mykad: MyKad? = null
    private lateinit var fp: ByteArray
    private var mMainFolderPath = ""
    var morphoDevice: MorphoDevice? = null
    var sensorName = ""
    val ma = com.example.morpho_sample.MainActivity()

    init {
      try {
          System.loadLibrary("MSO_Secu")
      } catch (e: UnsatisfiedLinkError) {
          Log.e("MorphoSample", "Exception in loadLibrary: $e")
          e.printStackTrace()
      }
  }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call: MethodCall,
                result: MethodChannel.Result ->
            // This method is invoked on the main thread.
            if (call.method == "getBatteryLevel") {
                val batteryLevel = batteryLevel
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            }
            // mykad
            else if (call.method == "onCreate") {
                try {
                    deviceProbe = DeviceProbe(this.baseContext)
                    result.success("Connect success")
                } catch (e: DeviceException) {
                    result.error("UNAVAILABLE", e.message, null)
                }
            } else if (call.method == "onReadMyKad") {
                if (morphoSmart == null) {
                    val usbManager = this.baseContext.getSystemService(USB_SERVICE) as UsbManager
                    if (deviceProbe == null) {
                        result.error(
                                "UNAVAILABLE",
                                "No smart card reader attached to the system",
                                null
                        )
                    }
                    if (deviceProbe!!.usbDevice == null) {
                        result.error(
                                "UNAVAILABLE",
                                "No smart card reader attached to the system",
                                null
                        )
                    }
                    morphoSmart = MorphoSmart(usbManager, deviceProbe!!.usbDevice, this)
                }
                try {
                    morphoSmart!!.open()
                    mykad = MyKad(morphoSmart)
                    var cardHolderInfo = CardHolderInfo()
                    try {
                        mykad!!.powerUp()
                        cardHolderInfo = mykad!!.getCardHolderInfo(false, false)
                        mykad!!.powerDown()
                        result.success(cardHolderInfo.nric)
                    } catch (e: Exception) {
                        // TODO Auto-generated catch block
                        throw RuntimeException(e.message)
                    }
                } catch (e: DeviceException) {
                    throw RuntimeException("Error opening smartcard reader:" + e.message)
                }
            } else if (call.method == "onFingerprintVerify") {
                if (morphoSmart == null) {
                    val usbManager = this.baseContext.getSystemService(USB_SERVICE) as UsbManager
                    if (deviceProbe == null) {
                        result.error(
                                "UNAVAILABLE",
                                "No fingerprint reader attached to the system",
                                null
                        )
                    }
                    if (deviceProbe!!.usbDevice == null) {
                        result.error(
                                "UNAVAILABLE",
                                "No fingerprint reader attached to the system",
                                null
                        )
                    }
                    morphoSmart = MorphoSmart(usbManager, deviceProbe!!.usbDevice, this)
                }
                try {
                    morphoSmart!!.open()
                    if (!morphoSmart!!.isFpReaderReady) {
                        result.error(
                                "UNAVAILABLE",
                                "No fingerprint reader attached to the system",
                                null
                        )
                    }
                    mykad = MyKad(morphoSmart)
                    try {
                        mykad!!.powerUp()
                        fp = mykad!!.fingerPrint
                        result.success("Please place your thumb on the fingerprint reader...")
                    } catch (e: CTException) {
                        throw RuntimeException(e.message)
                    }
                } catch (e: DeviceException) {
                    throw RuntimeException("Error opening fingerprint reader: " + e.message)
                }
            } else if (call.method == "onFingerprintVerify2") {
                try {
                    mykad!!.powerDown()
                    val morphosmartResult = morphoSmart!!.verifyFingerprint(fp, 10.toShort())
                    if (morphosmartResult.errorCode == ILVErrorCode.ILV_OK) {
                        if (morphosmartResult.resultCode == ILVResultCode.ILVSTS_HIT) {
                            result.success("Fingerprint matches fingerprint in MyKad")
                        } else {
                            throw RuntimeException(
                                    "Fingerprint does not match fingerprint in MyKad"
                            )
                        }
                    } else if (morphosmartResult.errorCode == ILVErrorCode.ILVERR_INVALID_MINUTIAE
                    ) {
                        result.error("UNAVAILABLE", "Invalid fingerprint miniature", null)
                    } else if (morphosmartResult.errorCode == ILVErrorCode.ILVERR_TIMEOUT) {
                        throw RuntimeException("Fingerprint verification operation timed out")
                    } else if (morphosmartResult.errorCode == ILVErrorCode.ILVERR_CMDE_ABORTED) {
                        throw RuntimeException("Fingerprint verification operation aborted")
                    } else if (morphosmartResult.errorCode == ILVErrorCode.ILVERR_MYKAD) {
                        result.error("UNAVAILABLE", "ILVERR_MYKAD", null)
                    } else if (morphosmartResult.errorCode == ILVErrorCode.ILVERR_LICENSE_REG_FAILED
                    ) {
                        throw RuntimeException(
                                "Fingerprint SDK activation failed. Make sure tablet is connected to internet."
                        )
                    } else if (morphosmartResult.errorCode == ILVErrorCode.ILVERR_INVALID_LICENSE) {
                        throw RuntimeException(
                                "Fingerprint SDK activation failed due to invalid or missing license"
                        )
                    } else {
                        throw RuntimeException(
                                "Fingerprint verification operation encountered an error"
                        )
                    }
                } catch (e: Exception) {
                    throw RuntimeException(e.message)
                }
            } else if (call.method == "onReadCardVerifyFp") {
                if (morphoSmart == null) {
                    val usbManager = this.baseContext.getSystemService(USB_SERVICE) as UsbManager
                    if (deviceProbe == null) {
                        throw RuntimeException("No fingerprint reader attached to the system")
                    }
                    if (deviceProbe!!.usbDevice == null) {
                        throw RuntimeException("No fingerprint reader attached to the system")
                    }
                    morphoSmart = MorphoSmart(usbManager, deviceProbe!!.usbDevice, this)
                }
                try {
                    morphoSmart!!.open()
                    mykad = MyKad(morphoSmart)
                    if (!morphoSmart!!.isFpReaderReady) {
                        throw RuntimeException("No fingerprint reader attached to the system")
                    }
                    var cardHolderInfo = CardHolderInfo()
                    try {
                        mykad!!.powerUp()
                        cardHolderInfo = mykad!!.getCardHolderInfo(false, true)
                        //                      if (readPhoto)
                        //                      {
                        //                        cardHolderInfo.setPhoto(mykad.getPhoto());
                        //                      }
                        mykad!!.powerDown()
                        val lEndTime = Date().time
                        val fingerprint = ByteArray(1196)
                        System.arraycopy(
                                cardHolderInfo.fingerprint1,
                                0,
                                fingerprint,
                                0,
                                cardHolderInfo.fingerprint1.size
                        )
                        System.arraycopy(
                                cardHolderInfo.fingerprint2,
                                0,
                                fingerprint,
                                cardHolderInfo.fingerprint1.size,
                                cardHolderInfo.fingerprint2.size
                        )
                        //                      MorphoSmartResult morphosmartResult =
                        // morphosmart.verifyFingerprint(fingerprint, (short) verifyFpTimeout);
                        result.success("")
                    } catch (e: Exception) {
                        throw RuntimeException(e.message)
                    }
                } catch (e: DeviceException) {
                    throw RuntimeException(e.message)
                }
            }
            // fingerprint format
            else if (call.method == "onCreate2") {


                ma.onCreateFunc(this)

//                mMainFolderPath =
//                        "/sdcard/Android/media/" + getApplicationContext().getPackageName()
//                try {
//                    val dir: java.io.File = java.io.File(mMainFolderPath)
//                    if (!dir.exists()) {
//                        dir.mkdirs()
//                    }
//                    val ret: Int = MorphoDevice.SetMainFolderPath(mMainFolderPath)
//                    if (ret != ErrorCodes.MORPHO_OK) {
//                        throw RuntimeException(ErrorCodes.getError(ret, 0))
//                    }
//                } catch (e: java.lang.Exception) {
//                    throw RuntimeException(
//                            "unable to create config Path: " + mMainFolderPath + e.message
//                    )
//                }
//
//                //                    copyBinFromAssets()
//                //                    copyLogFileParam()
//
//                USBManager.getInstance()
//                        .initialize(this, "com.morpho.morphosample.USB_ACTION", true)
//
//                if (android.os.Build.VERSION.SDK_INT > 9) {
//                    val policy = StrictMode.ThreadPolicy.Builder().permitAll().build()
//                    StrictMode.setThreadPolicy(policy)
//                }
//
//                morphoDevice = MorphoDevice()
                result.success("oncreate success")
            } else if (call.method == "enumerate") {
                result.success(ma.enumerate(this))
//                val cUsbDevice = CustomInteger()
//
//                val ret: Int = morphoDevice!!.initUsbDevicesNameEnum(cUsbDevice)
//                val nbUsbDevice: Int = cUsbDevice.getValueOf()
//                if (ret == ErrorCodes.MORPHO_OK) {
//                    if (nbUsbDevice > 0) {
//                        sensorName = morphoDevice!!.getUsbDeviceName(0)
//                        result.success("enumerate success")
//                    } else {
//                        val alertDialog = AlertDialog.Builder(this).create()
//                        alertDialog.setTitle("eDriving QTI")
//                        alertDialog.setMessage(
//                                "The device is not detected, or you have not asked USB permissions.\nPlease click the button 'Grant USB Permissions'"
//                        )
//                        alertDialog.setCancelable(false)
//                        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "OK") { dialog, which
//                            ->
//                            // finish();
//                        }
//                        alertDialog.show()
//                    }
//                } else {
//                    val alertDialog: AlertDialog = AlertDialog.Builder(this).create()
//                    alertDialog.setTitle("eDriving QTI")
//                    alertDialog.setMessage(
//                            ErrorCodes.getError(ret, morphoDevice!!.getInternalError())
//                    )
//                    alertDialog.setCancelable(false)
//                    alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "OK") { dialog, which ->
//                        // finish();
//                    }
//                    alertDialog.show()
//                }
            } else if (call.method == "connection") {
               result.success( ma.connection(this))
//                var ret: Int = ErrorCodes.MORPHO_OK
//                val secuConfig = SecuConfig()
//                ret = morphoDevice!!.openUsbDevice(sensorName, 0)
//                if (ret != ErrorCodes.MORPHO_OK) {
//                    val alertDialog = AlertDialog.Builder(this).create()
//                    alertDialog.setTitle("eDriving QTI")
//                    alertDialog.setMessage(
//                            ErrorCodes.getError(ret, morphoDevice!!.getInternalError())
//                    )
//                    alertDialog.setCancelable(false)
//                    alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "OK") { dialog, which ->
//                        finish()
//                    }
//                    alertDialog.show()
//                } else {
//                    // Get device security configuration
//
//                    // Get device security configuration
//                    ret = morphoDevice!!.getSecuConfig(secuConfig)
//                    if (ret !== ErrorCodes.MORPHO_OK) showMsgError(ret)
//
//                    var ok = true
//
//                    // Check that certificates and keys are available on device in case of Offered
//                    // security or Tunneling modes
//                    // Certificates and keys shall be stored in /sdcard/Keys folder
//
//                    // Check that certificates and keys are available on device in case of Offered
//                    // security or Tunneling modes
//                    // Certificates and keys shall be stored in /sdcard/Keys folder
//                    if (secuConfig.isModeOfferedSecurity() || secuConfig.isModeTunneling()) {
//                        val keysPath = "$mMainFolderPath/Idemia/Keys/MSO/host.der"
//                        val folder = File(keysPath)
//                        if (!folder.exists()) {
//                            ok = false
//                            val alertDialog = AlertDialog.Builder(this).create()
//                            alertDialog.setTitle("eDriving QTI")
//                            alertDialog.setMessage(
//                                    "Could not find /sdcard/Android/media/com.morpho.morphosampleAndroid/Idemia/Keys/MSO/ folder !!!\nPlease create the folder and put in it host.der (HOST public certificate), host.key (HOST private key) and ca.crt (CA public key) or CertPath directory (folder containing trusted certificates chain) generated with MKMS"
//                            )
//                            alertDialog.setCancelable(false)
//                            alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "OK") {
//                                    dialog,
//                                    which ->
//                                finish()
//                            }
//                            alertDialog.show()
//                        }
//                    }
//
//                    if (ok) {
//                        // Instantiate MsoSecu in case of security mode
//                        val msoSecu: IMsoSecu = MsoSecu()
//                        // Set host and root certificate paths
//                        val keysPath = "$mMainFolderPath/Idemia/Keys/MSO/"
//                        msoSecu.setOpenSSLPath(keysPath)
//
//                        // Call offeredSecuOpen if device is configured with offered security mode
//                        if (secuConfig.isModeOfferedSecurity()) {
//                            ret = morphoDevice!!.offeredSecuOpen(msoSecu)
//                            if (ret !== ErrorCodes.MORPHO_OK) {
//                                ok = false
//                                showMsgError(ret)
//                            }
//                        }
//
//                        if (ok) {
//                            // Set security configuration
//                            val securityOptions: ArrayList<SecurityOption> =
//                                    ArrayList<SecurityOption>()
//                            securityOptions.add(
//                                    SecurityOption(
//                                            secuConfig.isDownloadIsProtected(),
//                                            "Download is protected with a signature"
//                                    )
//                            )
//                            securityOptions.add(
//                                    SecurityOption(secuConfig.isModeTunneling(), "Mode Tunneling")
//                            )
//                            securityOptions.add(
//                                    SecurityOption(
//                                            secuConfig.isModeOfferedSecurity(),
//                                            "Mode Offered Security"
//                                    )
//                            )
//                            securityOptions.add(
//                                    SecurityOption(
//                                            secuConfig.isAcceptsOnlySignedTemplates(),
//                                            "Sensor accepts only signed templates"
//                                    )
//                            )
//                            securityOptions.add(
//                                    SecurityOption(secuConfig.isExportScore(), "Export Score")
//                            )
//                            securityOptions.add(
//                                    SecurityOption(
//                                            secuConfig.isTripleDes(),
//                                            "TripleDes Tunneling Mode"
//                                    )
//                            )
//                            securityOptions.add(
//                                    SecurityOption(
//                                            secuConfig.isAes256Gcm(),
//                                            "AES256GCM Tunneling Mode"
//                                    )
//                            )
//                            securityOptions.add(
//                                    SecurityOption(secuConfig.isAes128Cbc(), "AES128CBC Privacy")
//                            )
//                            securityOptions.add(
//                                    SecurityOption(secuConfig.isAes256Cbc(), "AES256CBC Privacy")
//                            )
//
//                            val productDescriptor: String = morphoDevice!!.getProductDescriptor()
//                            val tokenizer = StringTokenizer(productDescriptor, "\n")
//                            if (tokenizer.hasMoreTokens()) {
//                                val l_s_current = tokenizer.nextToken()
//                                if (l_s_current.contains("FINGER VP") || l_s_current.contains("FVP")
//                                ) {
//                                    MorphoInfo.m_b_fvp = true
//                                }
//                            }
//                            val morphoDatabase = MorphoDatabase()
//                            // Check Privacy Mode status
//                            val status: Array<MorphoDevice.MorphoDevicePrivacyModeStatus?> =
//                                    arrayOfNulls<MorphoDevice.MorphoDevicePrivacyModeStatus>(1)
//                            ret = morphoDevice!!.getPrivacyModeStatus(status)
//
//
//                            // Check if database is OK
//                            // final MorphoDatabase morphoDatabase = new MorphoDatabase();
//                            ret = morphoDevice!!.getDatabase(0, morphoDatabase)
//                            Log.i("MORPHO_USB", "morphoDevice.getDatabase = $ret")
//
//                            // Everything is OK, close com and display main GUI
//                            if (secuConfig.isModeOfferedSecurity()) {
//                                morphoDevice!!.offeredSecuClose()
//                            }
//                            if (secuConfig.isModeTunneling()) {
//                                morphoDevice!!.tunnelingClose()
//                            }
//
//                            result.success("connection success 2")
//                        }
//                    }
//                }
            }
            else if (call.method == "morphoDeviceVerifyWithFile") {
                result.success(ma.morphoDeviceVerifyWithFile(this))
//                try {
//                    val fingerPrintString =
//                        "AjwAXFL/gIC9ksOgzKy6pqSnsJGgl6eTSqpWo0CpZ5B1jI+Mm4ldik2PSnpdemNTiYO7hMNgOYlAZ09XYWNvdHNavlp7ZoRppnOdZqZnt3Q5d6RatW2NrWadmZIpoISQSYpjWGCAeIZNYGppbH3Dcth3c28obY9jml7SjcSM053LXjMnKhAQEf//e50kKNX9"
//                    val templateList = TemplateList()
//                    val buffer = Base64.getDecoder()
//                        .decode(fingerPrintString) //fingerPrintString.getBytes(StandardCharsets.UTF_8);
//                    val template = Template()
//                    template.setData(buffer)
//                    template.setTemplateType(TemplateType.MORPHO_PK_COMP as TemplateType)
//                    templateList.putTemplate(template)
//                    val timeOut = 0
//                    val far: Int = FalseAcceptanceRate.MORPHO_FAR_5
//                    val coderChoice: Coder = Coder.MORPHO_DEFAULT_CODER
//                    val detectModeChoice: Int = DetectionMode.MORPHO_VERIF_DETECT_MODE.getValue()
//                    val matchingStrategy = 0
//                    var callbackCmd: Int = ProcessInfo.getInstance().getCallbackCmd()
//
//                    callbackCmd =
//                        callbackCmd and CallbackMask.MORPHO_CALLBACK_ENROLLMENT_CMD.getValue().inv()
//                    var resultMatching: ResultMatching? = null
//                    // Check if running under security mode
//                    var isTunnelingMode = false
//                    var isOfferedSecurityMode = false
//                    val securityOptions: ArrayList<SecurityOption> = ArrayList()
//                    for (so in securityOptions) {
//                        if (so.title == "Mode Tunneling") {
//                            isTunnelingMode = so.activated
//                        } else if (so.title == "Mode Offered Security") {
//                            isOfferedSecurityMode = so.activated
//                        }
//                    }
//                    if (!isTunnelingMode && !isOfferedSecurityMode) {
//                        resultMatching = ResultMatching()
//                    }
//                    var ret: Int = morphoDevice!!.setStrategyAcquisitionMode(StrategyAcquisitionMode.MORPHO_ACQ_EXPERT_MODE
//                    )
//                    if (ret == 0) {
//                        ret = morphoDevice!!.verify(
//                            timeOut,
//                            far,
//                            coderChoice,
//                            detectModeChoice,
//                            matchingStrategy,
//                            templateList,
//                            callbackCmd,
//                            this,
//                            resultMatching
//                        )
//                    }
//                    var message = ""
//                    if (ret == ErrorCodes.MORPHO_OK && resultMatching != null) {
//                        message = """
//            Matching Score = ${resultMatching.getMatchingScore().toString()}
//            PK Number = ${resultMatching.getMatchingPKNumber()}
//            """.trimIndent()
//                    }
//                    val msg = message
//                    val l_ret = ret
//                    val internalError: Int = morphoDevice!!.getInternalError()
//                    alert(l_ret, internalError, "Verify", msg, true)
//                    result.success("morphoDeviceVerifyWithFile success")
//                } catch (e: java.lang.Exception) {
//                    alert(e.message)
//                }
            }
            else {
                result.notImplemented()
            }
        }
    }
    private val batteryLevel: Int
        private get() {
            var batteryLevel = -1
            batteryLevel =
                    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
                        val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
                        batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
                    } else {
                        val intent =
                                ContextWrapper(applicationContext)
                                        .registerReceiver(
                                                null,
                                                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                                        )
                        intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                                intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
                    }
            return batteryLevel
        }
    companion object {
        private const val CHANNEL = "samples.flutter.dev/battery"
    }

    private fun copyBinFromAssets() {
        val filename = "dummy_image.bin"
        var `in`: java.io.InputStream? = null
        var out: java.io.OutputStream? = null
        try {
            val filePath = "$mMainFolderPath/Idemia/Special/MSO/"
            val dir: java.io.File = java.io.File(filePath)
            if (!dir.exists()) {
                dir.mkdirs()
            }
            val binFileParam: java.io.File = java.io.File(filePath, filename)
            if (!binFileParam.exists()) {
                val assetManager: AssetManager = getAssets()
                `in` = assetManager.open(filename)
                val outFile: java.io.File = java.io.File(filePath, filename)
                out = FileOutputStream(outFile)
                copyFile(`in`, out)
            }
        } catch (e: IOException) {
            throw RuntimeException("Failed to copy asset file: " + filename + e.message)
        } finally {
            if (`in` != null) {
                try {
                    `in`.close()
                } catch (e: IOException) {
                    throw RuntimeException("Unable to Close the in file: " + e.message)
                }
            }
            if (out != null) {
                try {
                    out.close()
                } catch (e: IOException) {
                    throw RuntimeException("Unable to Close the Out file: " + e.message)
                }
            }
        }
    }

    private fun copyLogFileParam() {
        val filename = "Log.ini"
        try {
            val filePath = "$mMainFolderPath/Idemia/Conf/MSO/"
            val dir: java.io.File = java.io.File(filePath)
            if (!dir.exists()) {
                dir.mkdirs()
            }
            val logFileParam: java.io.File = java.io.File(dir, filename)
            if (!logFileParam.exists()) {
                val assetManager: AssetManager = getAssets()
                var `in`: java.io.InputStream? = null
                var out: java.io.OutputStream? = null
                `in` = assetManager.open(filename)
                out = FileOutputStream(filePath + filename)
                copyFile(`in`, out)
                `in`.close()
                `in` = null
                out.flush()
                out.close()
                out = null
            }
        } catch (e: IOException) {
            throw RuntimeException("Failed to copy asset file: " + filename + e.message)
        }
    }

    @Throws(IOException::class)
    private fun copyFile(`in`: InputStream, out: OutputStream) {
        val buffer = ByteArray(512 * 1024)
        var read: Int
        while (`in`.read(buffer).also { read = it } != -1) {
            out.write(buffer, 0, read)
        }
    }

    private fun showMsgError(ret: Int) {
        val alertDialog = AlertDialog.Builder(this).create()
        alertDialog.setTitle("eDriving QTI")
        val msg: String = "ahhhhhhh"
        alertDialog.setMessage(msg)
        alertDialog.setCancelable(false)
        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "OK") { dialog, which -> finish() }
        alertDialog.show()

        // Wait for click event
        try {
            Looper.loop()
        } catch (e: java.lang.RuntimeException) {}
    }

    protected fun alert(codeError: Int, internalError: Int, title: String?, message: String) {
        val alertDialog = AlertDialog.Builder(this).create()
        alertDialog.setTitle(title)
        var msg: String
        msg = if (codeError == 0) {
            "Operation completed successfully"
        } else {
            "Operation failed" + "\n" + ErrorCodes.getError(
                codeError,
                internalError
            )
        }
        msg += if (message.equals("", ignoreCase = true)) "" else """
     
     $message
     """.trimIndent()
        alertDialog.setMessage(msg)
        alertDialog.setButton(
            DialogInterface.BUTTON_POSITIVE, "Ok"
        ) { dialog, which -> }
        alertDialog.show()
    }

    protected fun alert(msg: String?) {
        val alertDialog = AlertDialog.Builder(this).create()
        alertDialog.setTitle(R.string.app_name)
        alertDialog.setMessage(msg)
        alertDialog.setButton(
            DialogInterface.BUTTON_POSITIVE, "Ok"
        ) { dialog, which -> }
        alertDialog.show()
    }

    protected fun alert(
        codeError: Int,
        internalError: Int,
        title: String?,
        message: String,
        isMatchingOperation: Boolean
    ) {
        val alertDialog = AlertDialog.Builder(this).create()
        alertDialog.setTitle(title)
        var msg: String?
        if (codeError == 0) {
            msg = getString(R.string.OP_SUCCESS)
        } else {
            val errorInternationalization: String? =
                convertToInternationalMessage(codeError, internalError, isMatchingOperation)
            msg = getString(R.string.OP_FAILED).toString() + "\n" + errorInternationalization
        }
        msg += if (message.equals("", ignoreCase = true)) "" else """
     
     $message
     """.trimIndent()
        alertDialog.setMessage(msg)
        alertDialog.setButton(
            DialogInterface.BUTTON_POSITIVE, "Ok"
        ) { dialog, which -> }
        alertDialog.show()
    }

    @SuppressLint("DefaultLocale")
    fun convertToInternationalMessage(
        iCodeError: Int,
        iInternalError: Int,
        isMatchingOperation: Boolean
    ): String? {
        return when (iCodeError) {
            ErrorCodes.MORPHO_OK -> getString(R.string.MORPHO_OK)
            ErrorCodes.MORPHOERR_INTERNAL -> getString(R.string.MORPHOERR_INTERNAL)
            ErrorCodes.MORPHOERR_PROTOCOLE -> getString(R.string.MORPHOERR_PROTOCOLE)
            ErrorCodes.MORPHOERR_CONNECT -> getString(R.string.MORPHOERR_CONNECT)
            ErrorCodes.MORPHOERR_CLOSE_COM -> getString(R.string.MORPHOERR_CLOSE_COM)
            ErrorCodes.MORPHOERR_BADPARAMETER -> getString(R.string.MORPHOERR_BADPARAMETER)
            ErrorCodes.MORPHOERR_MEMORY_PC -> getString(R.string.MORPHOERR_MEMORY_PC)
            ErrorCodes.MORPHOERR_MEMORY_DEVICE -> getString(R.string.MORPHOERR_MEMORY_DEVICE)
            ErrorCodes.MORPHOERR_NO_HIT -> getString(R.string.MORPHOERR_NO_HIT)
            ErrorCodes.MORPHOERR_STATUS -> getString(R.string.MORPHOERR_STATUS)
            ErrorCodes.MORPHOERR_DB_FULL -> getString(R.string.MORPHOERR_DB_FULL)
            ErrorCodes.MORPHOERR_DB_EMPTY -> getString(R.string.MORPHOERR_DB_EMPTY)
            ErrorCodes.MORPHOERR_ALREADY_ENROLLED -> getString(R.string.MORPHOERR_ALREADY_ENROLLED)
            ErrorCodes.MORPHOERR_BASE_NOT_FOUND -> getString(R.string.MORPHOERR_BASE_NOT_FOUND)
            ErrorCodes.MORPHOERR_BASE_ALREADY_EXISTS -> getString(R.string.MORPHOERR_BASE_ALREADY_EXISTS)
            ErrorCodes.MORPHOERR_NO_ASSOCIATED_DB -> getString(R.string.MORPHOERR_NO_ASSOCIATED_DB)
            ErrorCodes.MORPHOERR_NO_ASSOCIATED_DEVICE -> getString(R.string.MORPHOERR_NO_ASSOCIATED_DEVICE)
            ErrorCodes.MORPHOERR_INVALID_TEMPLATE -> getString(R.string.MORPHOERR_INVALID_TEMPLATE)
            ErrorCodes.MORPHOERR_NOT_IMPLEMENTED -> getString(R.string.MORPHOERR_NOT_IMPLEMENTED)
            ErrorCodes.MORPHOERR_TIMEOUT -> getString(R.string.MORPHOERR_TIMEOUT)
            ErrorCodes.MORPHOERR_NO_REGISTERED_TEMPLATE -> getString(R.string.MORPHOERR_NO_REGISTERED_TEMPLATE)
            ErrorCodes.MORPHOERR_FIELD_NOT_FOUND -> getString(R.string.MORPHOERR_FIELD_NOT_FOUND)
            ErrorCodes.MORPHOERR_CORRUPTED_CLASS -> getString(R.string.MORPHOERR_CORRUPTED_CLASS)
            ErrorCodes.MORPHOERR_TO_MANY_TEMPLATE -> getString(R.string.MORPHOERR_TO_MANY_TEMPLATE)
            ErrorCodes.MORPHOERR_TO_MANY_FIELD -> getString(R.string.MORPHOERR_TO_MANY_FIELD)
            ErrorCodes.MORPHOERR_MIXED_TEMPLATE -> getString(R.string.MORPHOERR_MIXED_TEMPLATE)
            ErrorCodes.MORPHOERR_CMDE_ABORTED -> getString(R.string.MORPHOERR_CMDE_ABORTED)
            ErrorCodes.MORPHOERR_INVALID_PK_FORMAT -> getString(R.string.MORPHOERR_INVALID_PK_FORMAT)
            ErrorCodes.MORPHOERR_SAME_FINGER -> getString(R.string.MORPHOERR_SAME_FINGER)
            ErrorCodes.MORPHOERR_OUT_OF_FIELD -> getString(R.string.MORPHOERR_OUT_OF_FIELD)
            ErrorCodes.MORPHOERR_INVALID_USER_ID -> getString(R.string.MORPHOERR_INVALID_USER_ID)
            ErrorCodes.MORPHOERR_INVALID_USER_DATA -> getString(R.string.MORPHOERR_INVALID_USER_DATA)
            ErrorCodes.MORPHOERR_FIELD_INVALID -> getString(R.string.MORPHOERR_FIELD_INVALID)
            ErrorCodes.MORPHOERR_USER_NOT_FOUND -> getString(R.string.MORPHOERR_USER_NOT_FOUND)
            ErrorCodes.MORPHOERR_COM_NOT_OPEN -> getString(R.string.MORPHOERR_COM_NOT_OPEN)
            ErrorCodes.MORPHOERR_ELT_ALREADY_PRESENT -> getString(R.string.MORPHOERR_ELT_ALREADY_PRESENT)
            ErrorCodes.MORPHOERR_NOCALLTO_DBQUERRYFIRST -> getString(R.string.MORPHOERR_NOCALLTO_DBQUERRYFIRST)
            ErrorCodes.MORPHOERR_USER -> getString(R.string.MORPHOERR_USER)
            ErrorCodes.MORPHOERR_BAD_COMPRESSION -> getString(R.string.MORPHOERR_BAD_COMPRESSION)
            ErrorCodes.MORPHOERR_SECU -> getString(R.string.MORPHOERR_SECU)
            ErrorCodes.MORPHOERR_CERTIF_UNKNOW -> getString(R.string.MORPHOERR_CERTIF_UNKNOW)
            ErrorCodes.MORPHOERR_INVALID_CLASS -> getString(R.string.MORPHOERR_INVALID_CLASS)
            ErrorCodes.MORPHOERR_USB_DEVICE_NAME_UNKNOWN -> getString(R.string.MORPHOERR_USB_DEVICE_NAME_UNKNOWN)
            ErrorCodes.MORPHOERR_CERTIF_INVALID -> getString(R.string.MORPHOERR_CERTIF_INVALID)
            ErrorCodes.MORPHOERR_SIGNER_ID -> getString(R.string.MORPHOERR_SIGNER_ID)
            ErrorCodes.MORPHOERR_SIGNER_ID_INVALID -> getString(R.string.MORPHOERR_SIGNER_ID_INVALID)
            ErrorCodes.MORPHOERR_FFD, ErrorCodes.MORPHOERR_MOIST_FINGER, ErrorCodes.MORPHOERR_MOVED_FINGER, ErrorCodes.MORPHOERR_SATURATED_FINGER, ErrorCodes.MORPHOERR_INVALID_FINGER -> if (isMatchingOperation) getString(
                R.string.MORPHOERR_NO_HIT
            ) else getString(R.string.MORPHOERR_LOW_QUALITY_FINGER)
            ErrorCodes.MORPHOERR_NO_SERVER -> getString(R.string.MORPHOERR_NO_SERVER)
            ErrorCodes.MORPHOERR_OTP_NOT_INITIALIZED -> getString(R.string.MORPHOERR_OTP_NOT_INITIALIZED)
            ErrorCodes.MORPHOERR_OTP_PIN_NEEDED -> getString(R.string.MORPHOERR_OTP_PIN_NEEDED)
            ErrorCodes.MORPHOERR_OTP_REENROLL_NOT_ALLOWED -> getString(R.string.MORPHOERR_OTP_REENROLL_NOT_ALLOWED)
            ErrorCodes.MORPHOERR_OTP_ENROLL_FAILED -> getString(R.string.MORPHOERR_OTP_ENROLL_FAILED)
            ErrorCodes.MORPHOERR_OTP_IDENT_FAILED -> getString(R.string.MORPHOERR_OTP_IDENT_FAILED)
            ErrorCodes.MORPHOERR_NO_MORE_OTP -> getString(R.string.MORPHOERR_NO_MORE_OTP)
            ErrorCodes.MORPHOERR_OTP_NO_HIT -> getString(R.string.MORPHOERR_OTP_NO_HIT)
            ErrorCodes.MORPHOERR_OTP_ENROLL_NEEDED -> getString(R.string.MORPHOERR_OTP_ENROLL_NEEDED)
            ErrorCodes.MORPHOERR_DEVICE_LOCKED -> getString(R.string.MORPHOERR_DEVICE_LOCKED)
            ErrorCodes.MORPHOERR_DEVICE_NOT_LOCK -> getString(R.string.MORPHOERR_DEVICE_NOT_LOCK)
            ErrorCodes.MORPHOERR_OTP_LOCK_GEN_OTP -> getString(R.string.MORPHOERR_OTP_LOCK_GEN_OTP)
            ErrorCodes.MORPHOERR_OTP_LOCK_SET_PARAM -> getString(R.string.MORPHOERR_OTP_LOCK_SET_PARAM)
            ErrorCodes.MORPHOERR_OTP_LOCK_ENROLL -> getString(R.string.MORPHOERR_OTP_LOCK_ENROLL)
            ErrorCodes.MORPHOERR_FVP_MINUTIAE_SECURITY_MISMATCH -> getString(R.string.MORPHOERR_FVP_MINUTIAE_SECURITY_MISMATCH)
            ErrorCodes.MORPHOERR_FVP_FINGER_MISPLACED_OR_WITHDRAWN -> getString(R.string.MORPHOERR_FVP_FINGER_MISPLACED_OR_WITHDRAWN)
            ErrorCodes.MORPHOERR_LICENSE_MISSING -> getString(R.string.MORPHOERR_LICENSE_MISSING)
            ErrorCodes.MORPHOERR_CANT_GRAN_PERMISSION_USB -> getString(R.string.MORPHOERR_CANT_GRAN_PERMISSION_USB)
            ErrorCodes.MORPHOERR_CAPTURE_FAILED -> getString(R.string.MORPHOERR_CAPTURE_FAILED)
            else -> String.format(
                "Unknown error %d, Internal Error = %d",
                iCodeError,
                iInternalError
            )
        }
    }

    override fun update(p0: Observable, p1: Any) { }
   
}

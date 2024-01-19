package com.example.morpho_sample;

import my.com.tbs.edriving.qti.app.R;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import morpho.msosecu.sdk.api.MsoSecu;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.hardware.usb.UsbDevice;
import android.hardware.usb.UsbDeviceConnection;
import android.hardware.usb.UsbManager;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.StrictMode;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RadioGroup;
import android.widget.TextView;

import com.example.morpho_sample.database.DatabaseItem;
import com.example.morpho_sample.info.MorphoInfo;
import com.example.morpho_sample.info.ProcessInfo;
import com.example.morpho_sample.info.VerifyInfo;
import com.example.morpho_sample.info.subtype.AuthenticationMode;
import com.example.morpho_sample.info.subtype.SecurityOption;
import com.example.morpho_sample.tools.MorphoTools;
import com.morpho.android.usb.USBManager;
import com.morpho.morphosmart.pipe.ILog;
import com.morpho.morphosmart.pipe.SimpleLogger;
import com.morpho.morphosmart.sdk.CallbackMask;
import com.morpho.morphosmart.sdk.CallbackMessage;
import com.morpho.morphosmart.sdk.Coder;
import com.morpho.morphosmart.sdk.CustomInteger;
import com.morpho.morphosmart.sdk.CustomLong;
import com.morpho.morphosmart.sdk.DetectionMode;
import com.morpho.morphosmart.sdk.ErrorCodes;
import com.morpho.morphosmart.sdk.FalseAcceptanceRate;
import com.morpho.morphosmart.sdk.FieldAttribute;
import com.morpho.morphosmart.sdk.IMsoSecu;
import com.morpho.morphosmart.sdk.ITemplateType;
import com.morpho.morphosmart.sdk.MatchingStrategy;
import com.morpho.morphosmart.sdk.MorphoDatabase;
import com.morpho.morphosmart.sdk.MorphoDevice;

import com.example.morpho_sample.tools.DeviceDetectionMode;
import com.morpho.morphosmart.sdk.MorphoField;
import com.morpho.morphosmart.sdk.MorphoImage;
import com.morpho.morphosmart.sdk.MorphoUser;
import com.morpho.morphosmart.sdk.MorphoUserList;
import com.morpho.morphosmart.sdk.MorphoWakeUpMode;
import com.morpho.morphosmart.sdk.ResultMatching;
import com.morpho.morphosmart.sdk.SecuConfig;
import com.morpho.morphosmart.sdk.Template;
import com.morpho.morphosmart.sdk.TemplateFVP;
import com.morpho.morphosmart.sdk.TemplateFVPType;
import com.morpho.morphosmart.sdk.TemplateList;
import com.morpho.morphosmart.sdk.TemplateType;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Observable;
import java.util.Observer;
import java.util.Random;

public class MainActivity extends FlutterActivity implements Observer {
    private static final String CHANNEL = "samples.flutter.dev/battery";
    private String mMainFolderPath = "";
    MorphoDevice morphoDevice;
    String sensorName = "";
    private int sensorBus = -1;
    private int sensorAddress = -1;
    private int sensorFileDescriptor = -1;
    private String mKeysPath = "";
    static MorphoDatabase morphoDatabase = null;
    private UsbDeviceConnection usbDeviceConnection = null;
    private boolean isOfferedSecurityMode = false;
    private boolean isTunnelingMode = false;
    private IMsoSecu msoSecu = new MsoSecu();
    private MorphoDevice.MorphoDevicePrivacyModeEncryptionAlgo privacyInfoIndexEnum = MorphoDevice.MorphoDevicePrivacyModeEncryptionAlgo.PRIVACY_ENCRYPTION_ALGO_AES128;
    private int privacy_ret = 0;
    private Context context;

    static {
        try {
            System.loadLibrary("MSO_Secu");
        } catch (UnsatisfiedLinkError e) {
            Log.e("MorphoSample", "Exception in loadLibrary: " + e);
            e.printStackTrace();
        }
    }

    public void onCreateFunc(Context context) {
        this.context=context;
//        mMainFolderPath = "/sdcard/Android/media/" + getApplicationContext().getPackageName();
//        try {
//            File dir = new File(mMainFolderPath);
//            if (!dir.exists()) {
//                dir.mkdirs();
//            }
//            int ret = MorphoDevice.SetMainFolderPath(mMainFolderPath);
//            if (ret != ErrorCodes.MORPHO_OK) {
//                throw new RuntimeException(ErrorCodes.getError(ret, 0));
//            }
//        } catch (Exception e) {
//            throw new RuntimeException("unable to create config Path: " + mMainFolderPath + e.getMessage());
//        }

        // copyBinFromAssets();
        // copyLogFileParam();

        USBManager.getInstance().initialize(context, "com.morpho.morphosample.USB_ACTION", true);

        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }

        morphoDevice = new MorphoDevice();
    }

    public String enumerate(Context context) {
        CustomInteger cUsbDevice = new CustomInteger();

        int ret = morphoDevice.initUsbDevicesNameEnum(cUsbDevice);
        Integer nbUsbDevice = new Integer(cUsbDevice.getValueOf());
        if (ret == ErrorCodes.MORPHO_OK) {
            if (nbUsbDevice > 0) {
                sensorName = morphoDevice.getUsbDeviceName(0);
                return "enumerate success";
//                result.success("enumerate success");
            } else {
                final AlertDialog alertDialog = new AlertDialog.Builder(context).create();
                alertDialog.setTitle(context.getResources().getString(R.string.morphosample));
                alertDialog.setMessage(getResources().getString(R.string.deviceNotDetected));
                alertDialog.setCancelable(false);
                alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, context.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        //finish();
                    }
                });
                alertDialog.show();
            }

        } else {
            final AlertDialog alertDialog = new AlertDialog.Builder(context).create();
            alertDialog.setTitle(context.getResources().getString(R.string.morphosample));
            alertDialog.setMessage(ErrorCodes.getError(ret, morphoDevice.getInternalError()));
            alertDialog.setCancelable(false);
            alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, context.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    //finish();
                }
            });
            alertDialog.show();
        }
        return "enumerate error";
    }

    public String connection(Context context) {
        int ret = ErrorCodes.MORPHO_OK;
        final SecuConfig secuConfig = new SecuConfig();
        ret = morphoDevice.openUsbDevice(sensorName, 0);

        if (ret != ErrorCodes.MORPHO_OK) {
            final AlertDialog alertDialog = new AlertDialog.Builder(context).create();
            alertDialog.setTitle(context.getResources().getString(R.string.morphosample));
            alertDialog.setMessage(ErrorCodes.getError(ret, morphoDevice.getInternalError()));
            alertDialog.setCancelable(false);
            alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, context.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    finish();
                }
            });
            alertDialog.show();
        } else {
            // Get device security configuration
            ret = morphoDevice.getSecuConfig(secuConfig);
            if (ret != ErrorCodes.MORPHO_OK)
                showMsgError(ret);

            boolean ok = true;

            // Check that certificates and keys are available on device in case of Offered security or Tunneling modes
            // Certificates and keys shall be stored in /sdcard/Keys folder
            if (secuConfig.isModeOfferedSecurity() || secuConfig.isModeTunneling()) {


                String keysPath = mMainFolderPath + "/Idemia/Keys/MSO/host.der";
                File folder = new File(keysPath);
                if (!folder.exists()) {
                    ok = false;
                    final AlertDialog alertDialog = new AlertDialog.Builder(context).create();
                    alertDialog.setTitle(context.getResources().getString(R.string.morphosample));
                    alertDialog.setMessage(getResources().getString(R.string.setOpenSSLPath));
                    alertDialog.setCancelable(false);
                    alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, context.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            finish();
                        }
                    });
                    alertDialog.show();
                }

            }

            if (ok) {
                // Instantiate MsoSecu in case of security mode
                IMsoSecu msoSecu = new MsoSecu();
                // Set host and root certificate paths
                String keysPath = mMainFolderPath + "/Idemia/Keys/MSO/";
                msoSecu.setOpenSSLPath(keysPath);

                // Call offeredSecuOpen if device is configured with offered security mode
                if (secuConfig.isModeOfferedSecurity()) {
                    ret = morphoDevice.offeredSecuOpen(msoSecu);
                    if (ret != ErrorCodes.MORPHO_OK) {
                        ok = false;
                        showMsgError(ret);
                    }
                }

                // Call tunnelingOpen if device is configured with Tunneling mode
                // if (secuConfig.isModeTunneling()) {
                //     // Read host certificate
                //     ArrayList<Byte> hostCertificate = new ArrayList<Byte>();
                //     msoSecu.getHostCertif(hostCertificate);
                //     ret = morphoDevice.tunnelingOpen(msoSecu, MorphoTools.toByteArray(hostCertificate));
                //     if (ret == ErrorCodes.MORPHOERR_FIRMWARE_NOT_SUPPORTING_SHA256) {
                //         final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
                //         alertDialog.setTitle(this.getResources().getString(R.string.morphosample));
                //         alertDialog.setMessage(ErrorCodes.getError(ret, morphoDevice.getInternalError()));
                //         alertDialog.setCancelable(false);
                //         alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, this.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                //             public void onClick(DialogInterface dialog, int which) {
                //                 finish();
                //             }
                //         });
                //         alertDialog.show();
                //         ok = false;
                //     } else if (ret != ErrorCodes.MORPHO_OK) {
                //         ok = false;
                //         showMsgError(ret);
                //     }
                // }

                if (ok) {
                    // Set security configuration
                    ArrayList<SecurityOption> securityOptions = new ArrayList<SecurityOption>();
                    securityOptions.add(new SecurityOption(secuConfig.isDownloadIsProtected(), "Download is protected with a signature"));
                    securityOptions.add(new SecurityOption(secuConfig.isModeTunneling(), "Mode Tunneling"));
                    securityOptions.add(new SecurityOption(secuConfig.isModeOfferedSecurity(), "Mode Offered Security"));
                    securityOptions.add(new SecurityOption(secuConfig.isAcceptsOnlySignedTemplates(), "Sensor accepts only signed templates"));
                    securityOptions.add(new SecurityOption(secuConfig.isExportScore(), "Export Score"));
                    securityOptions.add(new SecurityOption(secuConfig.isTripleDes(), "TripleDes Tunneling Mode"));
                    securityOptions.add(new SecurityOption(secuConfig.isAes256Gcm(), "AES256GCM Tunneling Mode"));
                    securityOptions.add(new SecurityOption(secuConfig.isAes128Cbc(), "AES128CBC Privacy"));
                    securityOptions.add(new SecurityOption(secuConfig.isAes256Cbc(), "AES256CBC Privacy"));
                    ProcessInfo.getInstance().setSecurityOptions(securityOptions);

                    // Set other info data
                    ProcessInfo.getInstance().setMSOSerialNumber(sensorName);
                    ProcessInfo.getInstance().setMSOBus(sensorBus);
                    ProcessInfo.getInstance().setMSOAddress(sensorAddress);
                    ProcessInfo.getInstance().setMSOFD(sensorFileDescriptor);
                    ProcessInfo.getInstance().setMsoDetectionMode(DeviceDetectionMode.SdkDetection);
                    String productDescriptor = morphoDevice.getProductDescriptor();
                    java.util.StringTokenizer tokenizer = new java.util.StringTokenizer(productDescriptor, "\n");
                    if (tokenizer.hasMoreTokens()) {
                        String l_s_current = tokenizer.nextToken();
                        if (l_s_current.contains("FINGER VP") || l_s_current.contains("FVP")) {
                            MorphoInfo.m_b_fvp = true;
                        }
                    }

                    final MorphoDatabase morphoDatabase = new MorphoDatabase();
                    // Check Privacy Mode status
                    MorphoDevice.MorphoDevicePrivacyModeStatus[] status = new MorphoDevice.MorphoDevicePrivacyModeStatus[1];
                    ret = morphoDevice.getPrivacyModeStatus(status);
                    if (ErrorCodes.MORPHO_OK != ret) {
                        ProcessInfo.getInstance().setPrivacyModeStatus(MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED);
                    }

                    // Check if database is OK
                    //final MorphoDatabase morphoDatabase = new MorphoDatabase();
                    ret = morphoDevice.getDatabase(0, morphoDatabase);
                    Log.i("MORPHO_USB", "morphoDevice.getDatabase = " + ret);
                    // if (ret != ErrorCodes.MORPHO_OK) {
                    //     if (ret == ErrorCodes.MORPHOERR_BASE_NOT_FOUND) {
                    //         //throw new RuntimeException("MORPHOERR_BASE_NOT_FOUND");

                    //         CustomInteger cuIndex = new CustomInteger();
                    //         MorphoField morphoFieldFirstName = new MorphoField();
                    //         morphoFieldFirstName.setName("First");
                    //         morphoFieldFirstName.setMaxSize(15);
                    //         morphoFieldFirstName.setFieldAttribute(FieldAttribute.MORPHO_PUBLIC_FIELD);
                    //         morphoDatabase.putField(morphoFieldFirstName, cuIndex);
                    //         Integer fNameIndex = new Integer(cuIndex.getValueOf());

                    //         MorphoField morphoFieldLastName = new MorphoField();
                    //         morphoFieldLastName.setName("Last");
                    //         morphoFieldLastName.setMaxSize(15);
                    //         morphoFieldLastName.setFieldAttribute(FieldAttribute.MORPHO_PUBLIC_FIELD);
                    //         morphoDatabase.putField(morphoFieldLastName, cuIndex);
                    //         Integer lNameIndex = new Integer(cuIndex.getValueOf());

                    //         int maxRecord = 500;
                    //         int maxNbFinger = 2;
                    //         boolean encryptDatabase = false;

                    //         final int ret2 = morphoDatabase.dbCreate(maxRecord, maxNbFinger, TemplateType.MORPHO_PK_COMP, 0, encryptDatabase);
                    //         if (ret2 == ErrorCodes.MORPHO_OK) {
                    //             ProcessInfo.getInstance().setBaseStatusOk(true);
                    //             if (secuConfig.isModeOfferedSecurity()) {
                    //                 morphoDevice.offeredSecuClose();
                    //             }
                    //             if (secuConfig.isModeTunneling()) {
                    //                 morphoDevice.tunnelingClose();
                    //             }
                    //             morphoDevice.closeDevice();
                    //             result.success("morphoDatabase.dbCreate success");
                    //         } else {
                    //             Handler mHandler = new Handler();
                    //             mHandler.post(new Runnable() {
                    //                 @Override
                    //                 public synchronized void run() {
                    //                     AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this).create();
                    //                     alertDialog.setTitle("DataBase : dbCreate");
                    //                     String msg = getString(R.string.OP_FAILED) + "\n" + getString(R.string.MORPHOERR_BADPARAMETER);
                    //                     alertDialog.setMessage(msg);
                    //                     alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, getString(R.string.ok), new DialogInterface.OnClickListener() {
                    //                         public void onClick(DialogInterface dialog, int which) {
                    //                         }
                    //                     });
                    //                     alertDialog.show();
                    //                 }
                    //             });
                    //         }
                    //     }
                    // } else {
                    // Everything is OK, close com and display main GUI
                    if (secuConfig.isModeOfferedSecurity()) {
                        morphoDevice.offeredSecuClose();
                    }
                    if (secuConfig.isModeTunneling()) {
                        morphoDevice.tunnelingClose();
                    }
//                                morphoDevice.closeDevice();
//                                MorphoSample.mMainFolderPath=mMainFolderPath;
//                                Intent dialogActivity = new Intent(ConnectionActivity.this, MorphoSample.class);
//                                startActivity(dialogActivity);
//                                finish();
                    return "connection success 2";
//                    result.success("connection success 2");
                    // }
                }
            }
        }
        return "connection error";
    }

    public String morphoDeviceVerifyWithFile(Context context)
    {
        try
        {
            String fingerPrintString = "AjwAXFL/gIC9ksOgzKy6pqSnsJGgl6eTSqpWo0CpZ5B1jI+Mm4ldik2PSnpdemNTiYO7hMNgOYlAZ09XYWNvdHNavlp7ZoRppnOdZqZnt3Q5d6RatW2NrWadmZIpoISQSYpjWGCAeIZNYGppbH3Dcth3c28obY9jml7SjcSM053LXjMnKhAQEf//e50kKNX9";
            TemplateList templateList = new TemplateList();
            final byte[] buffer = Base64.getDecoder().decode(fingerPrintString);//fingerPrintString.getBytes(StandardCharsets.UTF_8);
            Template template = new Template();
            template.setData(buffer);
            template.setTemplateType((TemplateType) TemplateType.MORPHO_PK_COMP);
            templateList.putTemplate(template);


            int timeOut = 0;
            int far = FalseAcceptanceRate.MORPHO_FAR_5;
            Coder coderChoice = Coder.MORPHO_DEFAULT_CODER;
            int detectModeChoice = DetectionMode.MORPHO_VERIF_DETECT_MODE.getValue();
            int matchingStrategy = 0;

            int callbackCmd = ProcessInfo.getInstance().getCallbackCmd();

            callbackCmd &= ~CallbackMask.MORPHO_CALLBACK_ENROLLMENT_CMD.getValue();

            ResultMatching resultMatching = null;
            // Check if running under security mode
            boolean isTunnelingMode = false;
            boolean isOfferedSecurityMode = false;
            ArrayList<SecurityOption> securityOptions = ProcessInfo.getInstance().getSecurityOptions();
            for (SecurityOption so : securityOptions) {
                if (so.title.equals("Mode Tunneling")) {
                    isTunnelingMode = so.activated;
                } else if (so.title.equals("Mode Offered Security")) {
                    isOfferedSecurityMode = so.activated;
                }
            }
            if (!isTunnelingMode && !isOfferedSecurityMode) {
                resultMatching = new ResultMatching();
            }

            int ret = morphoDevice.setStrategyAcquisitionMode(ProcessInfo.getInstance().getStrategyAcquisitionMode());

            if (ret == 0) {
                ret = morphoDevice.verify(timeOut, far, coderChoice, detectModeChoice, matchingStrategy, templateList, callbackCmd, this, resultMatching);
            }

            ProcessInfo.getInstance().setCommandBioStart(false);


            String message = "";

            if (ret == ErrorCodes.MORPHO_OK && resultMatching != null) {
                message = "Matching Score = " + resultMatching.getMatchingScore() + "\nPK Number = " + resultMatching.getMatchingPKNumber();
            }

            final String msg = message;
            final int l_ret = ret;
            final int internalError = morphoDevice.getInternalError();
            alert(l_ret, internalError, "Verify", msg, true, context);
            return "morphoDeviceVerifyWithFile success";
            //result.success("morphoDeviceVerifyWithFile success");
        }
        catch (Exception e)
        {
            alert(e.getMessage());
        }

        return "morphoDeviceVerifyWithFile error";
    }


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("getBatteryLevel")) {
                                int batteryLevel = getBatteryLevel();

                                if (batteryLevel != -1) {
                                    result.success(batteryLevel);
                                } else {
                                    result.error("UNAVAILABLE", "Battery level not available.", null);
                                }
                            } else if (call.method.equals("onCreate")) {
                                mMainFolderPath = "/sdcard/Android/media/" + getApplicationContext().getPackageName();
                                try {
                                    File dir = new File(mMainFolderPath);
                                    if (!dir.exists()) {
                                        dir.mkdirs();
                                    }
                                    int ret = MorphoDevice.SetMainFolderPath(mMainFolderPath);
                                    if (ret != ErrorCodes.MORPHO_OK) {
                                        throw new RuntimeException(ErrorCodes.getError(ret, 0));
                                    }
                                } catch (Exception e) {
                                    throw new RuntimeException("unable to create config Path: " + mMainFolderPath + e.getMessage());
                                }

                                // copyBinFromAssets();
                                // copyLogFileParam();

                                USBManager.getInstance().initialize(this, "com.morpho.morphosample.USB_ACTION", true);

                                if (android.os.Build.VERSION.SDK_INT > 9) {
                                    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                                    StrictMode.setThreadPolicy(policy);
                                }

                                morphoDevice = new MorphoDevice();
                                result.success("oncreate success");
                            } else if (call.method.equals("enumerate")) {


                                CustomInteger cUsbDevice = new CustomInteger();

                                int ret = morphoDevice.initUsbDevicesNameEnum(cUsbDevice);
                                Integer nbUsbDevice = new Integer(cUsbDevice.getValueOf());
                                if (ret == ErrorCodes.MORPHO_OK) {
                                    if (nbUsbDevice > 0) {
                                        sensorName = morphoDevice.getUsbDeviceName(0);
                                        result.success("enumerate success");
                                    } else {
                                        final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
                                        alertDialog.setTitle(this.getResources().getString(R.string.morphosample));
                                        alertDialog.setMessage(getResources().getString(R.string.deviceNotDetected));
                                        alertDialog.setCancelable(false);
                                        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, this.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                                            public void onClick(DialogInterface dialog, int which) {
                                                //finish();
                                            }
                                        });
                                        alertDialog.show();
                                    }

                                } else {
                                    final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
                                    alertDialog.setTitle(this.getResources().getString(R.string.morphosample));
                                    alertDialog.setMessage(ErrorCodes.getError(ret, morphoDevice.getInternalError()));
                                    alertDialog.setCancelable(false);
                                    alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, this.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                                        public void onClick(DialogInterface dialog, int which) {
                                            //finish();
                                        }
                                    });
                                    alertDialog.show();
                                }
                            } else if (call.method.equals("connection")) {
                                int ret = ErrorCodes.MORPHO_OK;
                                final SecuConfig secuConfig = new SecuConfig();
                                ret = morphoDevice.openUsbDevice(sensorName, 0);

                                if (ret != ErrorCodes.MORPHO_OK) {
                                    final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
                                    alertDialog.setTitle(this.getResources().getString(R.string.morphosample));
                                    alertDialog.setMessage(ErrorCodes.getError(ret, morphoDevice.getInternalError()));
                                    alertDialog.setCancelable(false);
                                    alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, this.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                                        public void onClick(DialogInterface dialog, int which) {
                                            finish();
                                        }
                                    });
                                    alertDialog.show();
                                } else {
                                    // Get device security configuration
                                    ret = morphoDevice.getSecuConfig(secuConfig);
                                    if (ret != ErrorCodes.MORPHO_OK)
                                        showMsgError(ret);

                                    boolean ok = true;

                                    // Check that certificates and keys are available on device in case of Offered security or Tunneling modes
                                    // Certificates and keys shall be stored in /sdcard/Keys folder
                                    if (secuConfig.isModeOfferedSecurity() || secuConfig.isModeTunneling()) {


                                        String keysPath = mMainFolderPath + "/Idemia/Keys/MSO/host.der";
                                        File folder = new File(keysPath);
                                        if (!folder.exists()) {
                                            ok = false;
                                            final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
                                            alertDialog.setTitle(this.getResources().getString(R.string.morphosample));
                                            alertDialog.setMessage(getResources().getString(R.string.setOpenSSLPath));
                                            alertDialog.setCancelable(false);
                                            alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, this.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                                                public void onClick(DialogInterface dialog, int which) {
                                                    finish();
                                                }
                                            });
                                            alertDialog.show();
                                        }

                                    }

                                    if (ok) {
                                        // Instantiate MsoSecu in case of security mode
                                        IMsoSecu msoSecu = new MsoSecu();
                                        // Set host and root certificate paths
                                        String keysPath = mMainFolderPath + "/Idemia/Keys/MSO/";
                                        msoSecu.setOpenSSLPath(keysPath);

                                        // Call offeredSecuOpen if device is configured with offered security mode
                                        if (secuConfig.isModeOfferedSecurity()) {
                                            ret = morphoDevice.offeredSecuOpen(msoSecu);
                                            if (ret != ErrorCodes.MORPHO_OK) {
                                                ok = false;
                                                showMsgError(ret);
                                            }
                                        }

                                        // Call tunnelingOpen if device is configured with Tunneling mode
                                        // if (secuConfig.isModeTunneling()) {
                                        //     // Read host certificate
                                        //     ArrayList<Byte> hostCertificate = new ArrayList<Byte>();
                                        //     msoSecu.getHostCertif(hostCertificate);
                                        //     ret = morphoDevice.tunnelingOpen(msoSecu, MorphoTools.toByteArray(hostCertificate));
                                        //     if (ret == ErrorCodes.MORPHOERR_FIRMWARE_NOT_SUPPORTING_SHA256) {
                                        //         final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
                                        //         alertDialog.setTitle(this.getResources().getString(R.string.morphosample));
                                        //         alertDialog.setMessage(ErrorCodes.getError(ret, morphoDevice.getInternalError()));
                                        //         alertDialog.setCancelable(false);
                                        //         alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, this.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
                                        //             public void onClick(DialogInterface dialog, int which) {
                                        //                 finish();
                                        //             }
                                        //         });
                                        //         alertDialog.show();
                                        //         ok = false;
                                        //     } else if (ret != ErrorCodes.MORPHO_OK) {
                                        //         ok = false;
                                        //         showMsgError(ret);
                                        //     }
                                        // }

                                        if (ok) {
                                            // Set security configuration
                                            ArrayList<SecurityOption> securityOptions = new ArrayList<SecurityOption>();
                                            securityOptions.add(new SecurityOption(secuConfig.isDownloadIsProtected(), "Download is protected with a signature"));
                                            securityOptions.add(new SecurityOption(secuConfig.isModeTunneling(), "Mode Tunneling"));
                                            securityOptions.add(new SecurityOption(secuConfig.isModeOfferedSecurity(), "Mode Offered Security"));
                                            securityOptions.add(new SecurityOption(secuConfig.isAcceptsOnlySignedTemplates(), "Sensor accepts only signed templates"));
                                            securityOptions.add(new SecurityOption(secuConfig.isExportScore(), "Export Score"));
                                            securityOptions.add(new SecurityOption(secuConfig.isTripleDes(), "TripleDes Tunneling Mode"));
                                            securityOptions.add(new SecurityOption(secuConfig.isAes256Gcm(), "AES256GCM Tunneling Mode"));
                                            securityOptions.add(new SecurityOption(secuConfig.isAes128Cbc(), "AES128CBC Privacy"));
                                            securityOptions.add(new SecurityOption(secuConfig.isAes256Cbc(), "AES256CBC Privacy"));
                                            ProcessInfo.getInstance().setSecurityOptions(securityOptions);

                                            // Set other info data
                                            ProcessInfo.getInstance().setMSOSerialNumber(sensorName);
                                            ProcessInfo.getInstance().setMSOBus(sensorBus);
                                            ProcessInfo.getInstance().setMSOAddress(sensorAddress);
                                            ProcessInfo.getInstance().setMSOFD(sensorFileDescriptor);
                                            ProcessInfo.getInstance().setMsoDetectionMode(DeviceDetectionMode.SdkDetection);
                                            String productDescriptor = morphoDevice.getProductDescriptor();
                                            java.util.StringTokenizer tokenizer = new java.util.StringTokenizer(productDescriptor, "\n");
                                            if (tokenizer.hasMoreTokens()) {
                                                String l_s_current = tokenizer.nextToken();
                                                if (l_s_current.contains("FINGER VP") || l_s_current.contains("FVP")) {
                                                    MorphoInfo.m_b_fvp = true;
                                                }
                                            }

                                            final MorphoDatabase morphoDatabase = new MorphoDatabase();
                                            // Check Privacy Mode status
                                            MorphoDevice.MorphoDevicePrivacyModeStatus[] status = new MorphoDevice.MorphoDevicePrivacyModeStatus[1];
                                            ret = morphoDevice.getPrivacyModeStatus(status);
                                            if (ErrorCodes.MORPHO_OK != ret) {
                                                ProcessInfo.getInstance().setPrivacyModeStatus(MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED);
                                            }

                                            // Check if database is OK
                                            //final MorphoDatabase morphoDatabase = new MorphoDatabase();
                                            ret = morphoDevice.getDatabase(0, morphoDatabase);
                                            Log.i("MORPHO_USB", "morphoDevice.getDatabase = " + ret);
                                            // if (ret != ErrorCodes.MORPHO_OK) {
                                            //     if (ret == ErrorCodes.MORPHOERR_BASE_NOT_FOUND) {
                                            //         //throw new RuntimeException("MORPHOERR_BASE_NOT_FOUND");

                                            //         CustomInteger cuIndex = new CustomInteger();
                                            //         MorphoField morphoFieldFirstName = new MorphoField();
                                            //         morphoFieldFirstName.setName("First");
                                            //         morphoFieldFirstName.setMaxSize(15);
                                            //         morphoFieldFirstName.setFieldAttribute(FieldAttribute.MORPHO_PUBLIC_FIELD);
                                            //         morphoDatabase.putField(morphoFieldFirstName, cuIndex);
                                            //         Integer fNameIndex = new Integer(cuIndex.getValueOf());

                                            //         MorphoField morphoFieldLastName = new MorphoField();
                                            //         morphoFieldLastName.setName("Last");
                                            //         morphoFieldLastName.setMaxSize(15);
                                            //         morphoFieldLastName.setFieldAttribute(FieldAttribute.MORPHO_PUBLIC_FIELD);
                                            //         morphoDatabase.putField(morphoFieldLastName, cuIndex);
                                            //         Integer lNameIndex = new Integer(cuIndex.getValueOf());

                                            //         int maxRecord = 500;
                                            //         int maxNbFinger = 2;
                                            //         boolean encryptDatabase = false;

                                            //         final int ret2 = morphoDatabase.dbCreate(maxRecord, maxNbFinger, TemplateType.MORPHO_PK_COMP, 0, encryptDatabase);
                                            //         if (ret2 == ErrorCodes.MORPHO_OK) {
                                            //             ProcessInfo.getInstance().setBaseStatusOk(true);
                                            //             if (secuConfig.isModeOfferedSecurity()) {
                                            //                 morphoDevice.offeredSecuClose();
                                            //             }
                                            //             if (secuConfig.isModeTunneling()) {
                                            //                 morphoDevice.tunnelingClose();
                                            //             }
                                            //             morphoDevice.closeDevice();
                                            //             result.success("morphoDatabase.dbCreate success");
                                            //         } else {
                                            //             Handler mHandler = new Handler();
                                            //             mHandler.post(new Runnable() {
                                            //                 @Override
                                            //                 public synchronized void run() {
                                            //                     AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this).create();
                                            //                     alertDialog.setTitle("DataBase : dbCreate");
                                            //                     String msg = getString(R.string.OP_FAILED) + "\n" + getString(R.string.MORPHOERR_BADPARAMETER);
                                            //                     alertDialog.setMessage(msg);
                                            //                     alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, getString(R.string.ok), new DialogInterface.OnClickListener() {
                                            //                         public void onClick(DialogInterface dialog, int which) {
                                            //                         }
                                            //                     });
                                            //                     alertDialog.show();
                                            //                 }
                                            //             });
                                            //         }
                                            //     }
                                            // } else {
                                                // Everything is OK, close com and display main GUI
                                                if (secuConfig.isModeOfferedSecurity()) {
                                                    morphoDevice.offeredSecuClose();
                                                }
                                                if (secuConfig.isModeTunneling()) {
                                                    morphoDevice.tunnelingClose();
                                                }
//                                morphoDevice.closeDevice();
//                                MorphoSample.mMainFolderPath=mMainFolderPath;
//                                Intent dialogActivity = new Intent(ConnectionActivity.this, MorphoSample.class);
//                                startActivity(dialogActivity);
//                                finish();
                                                result.success("connection success 2");
                                           // }
                                        }
                                    }
                                }
                            } else if (call.method.equals("onStartStop")) {
                                ProcessInfo.getInstance().setDatabaseSelectedIndex(0);
                                MorphoInfo info = retrieveSettings();
                                if (info != null) {
                                    ProcessInfo.getInstance().setMorphoInfo(info);
                                    try {
                                        ProcessInfo.getInstance().setCommandBioStart(true);
                                        ProcessInfo.getInstance().setStarted(true);
                                        result.success("onStartStop success");
                                    } catch (Exception e) {
                                        throw new RuntimeException("onStartStop: " + e.getMessage());
                                    }
                                    result.error("UNAVAILABLE", "onStartStop Not OK!", null);
                                }
                            } else if (call.method.equals("verify_oncreate")) {
                                mKeysPath = mMainFolderPath + "/Idemia/Keys/MSO/";
                                USBManager.getInstance().initialize(this, "com.morpho.morphosample.USB_ACTION", true);

                                morphoDevice = new MorphoDevice();
                                morphoDatabase = new MorphoDatabase();
                                if (ProcessInfo.getInstance().getMorphoDevice() == null) {
                                    String sensorName = ProcessInfo.getInstance().getMSOSerialNumber();
                                    int bus = ProcessInfo.getInstance().getMSOBus();
                                    int address = ProcessInfo.getInstance().getMSOAddress();
                                    int fd = ProcessInfo.getInstance().getMSOFD();
                                    DeviceDetectionMode detectionMode = ProcessInfo.getInstance().getMsoDetectionMode();
                                    int ret = ErrorCodes.MORPHO_OK;

                                    if (detectionMode == DeviceDetectionMode.SdkDetection) {
                                        ret = morphoDevice.openUsbDevice(sensorName, 0);
                                        Log.i("MORPHO_USB", "Opening device in DeviceDetectionMode.SdkDetection returns " + ret);

                                    } else if (detectionMode == DeviceDetectionMode.TCPDetection) {

                                        ret = morphoDevice.openDevicePipe(
                                                ProcessInfo.getInstance().getMsoPipeClient(),
                                                ProcessInfo.getInstance().getIp(),
                                                ProcessInfo.getInstance().getPort(),
                                                ProcessInfo.getInstance().getMSOSerialNumber(),
                                                ProcessInfo.getInstance().getTimeout()
                                        );
                                        Log.i("MORPHO_USB", "Opening device in DeviceDetectionMode.TCPDetection returns " + ret);
                                    } else {
                                        ret = openDevice(bus, address, fd);
                                        Log.i("MORPHO_USB", "Opening device in DeviceDetectionMode.UserDetection returns " + ret);
                                    }

                                    ArrayList<SecurityOption> securityOptions = ProcessInfo.getInstance().getSecurityOptions();
                                    for (SecurityOption so : securityOptions) {
                                        if (so.title.equals("Mode Offered Security")) {
                                            isOfferedSecurityMode = so.activated;
                                        } else if (so.title.equals("Mode Tunneling")) {
                                            isTunnelingMode = so.activated;
                                        }
                                    }

                                    if (isOfferedSecurityMode) {
                                        // Set OpenSSL path

                                        msoSecu.setOpenSSLPath(mKeysPath);
                                        // Open Offered security mode
                                        ret = morphoDevice.offeredSecuOpen(msoSecu);
                                        Log.i("MORPHO_USB", "Opening device in Offered Security mode returns " + ret);
                                        if (ret != ErrorCodes.MORPHO_OK) {
                                            finish();
                                        }
                                    }

                                    if (isTunnelingMode) {
                                        // Set OpenSSL path
                                        msoSecu.setOpenSSLPath(mKeysPath);
                                        // Get host certificate
                                        ArrayList<Byte> hostCertificate = new ArrayList<Byte>();
                                        msoSecu.getHostCertif(hostCertificate);
                                        // Open Tunneling mode
                                        ret = morphoDevice.tunnelingOpen(msoSecu, MorphoTools.toByteArray(hostCertificate));
                                        Log.i("MORPHO_USB", "Opening device in Tunneling mode returns " + ret);
                                        if (ret != ErrorCodes.MORPHO_OK) {
                                            finish();
                                        }
                                    }

                                    SecuConfig secuConfig = new SecuConfig();
                                    ret = morphoDevice.getSecuConfig(secuConfig);
                                    if (ret == 0) {
                                        if (secuConfig.isAes128Cbc()) {
                                            privacyInfoIndexEnum = MorphoDevice.MorphoDevicePrivacyModeEncryptionAlgo.PRIVACY_ENCRYPTION_ALGO_AES128;
                                        } else if (secuConfig.isAes256Cbc()) {
                                            privacyInfoIndexEnum = MorphoDevice.MorphoDevicePrivacyModeEncryptionAlgo.PRIVACY_ENCRYPTION_ALGO_AES256;
                                        }
                                    } else {
                                        alert(ret, morphoDevice.getInternalError(), "Error retrieving Device Privacy Info", "");
                                    }
                                    MorphoDevice.MorphoDevicePrivacyModeStatus[] status = new MorphoDevice.MorphoDevicePrivacyModeStatus[1];
                                    privacy_ret = morphoDevice.getPrivacyModeStatus(status);

                                    if (ErrorCodes.MORPHO_OK != privacy_ret) {
                                        ProcessInfo.getInstance().setPrivacyModeStatus(MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED);
                                    } else if (status[0] == MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED) {
                                        ProcessInfo.getInstance().setPrivacyModeStatus(MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED);
                                    } else if (status[0] == MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_ENABLED) {
                                        ProcessInfo.getInstance().setPrivacyModeStatus(MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_ENABLED);
                                    } else if (status[0] == MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_PARTIAL_ENABLED) {
                                        ProcessInfo.getInstance().setPrivacyModeStatus(MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_PARTIAL_ENABLED);
                                    } else if (status[0] == MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_STANDALONE_ENABLED) {
                                        ProcessInfo.getInstance().setPrivacyModeStatus(MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_STANDALONE_ENABLED);
                                    }

                                    if (ret == ErrorCodes.MORPHO_OK) {
                                        ret = morphoDevice.getDatabase(0, morphoDatabase);
                                        Log.i("MORPHO_USB", "morphoDevice.getDatabase = " + ret);
                                        if (ret != ErrorCodes.MORPHO_OK) {
                                            finish();
                                        }
                                    } else {
                                        finish();
                                    }
                                }

                                ProcessInfo.getInstance().setMorphoDevice(morphoDevice);
                                ProcessInfo.getInstance().setMorphoDatabase(morphoDatabase);

                                if (ProcessInfo.getInstance().isBaseStatusOk()) {
                                    result.success("isBaseStatusOk");
                                } else {
                                    result.error("UNAVAILABLE", "isBaseStatusOk Not OK!", null);
                                }

                            } else if (call.method.equals("loadDatabaseItem")) {
                                loadDatabaseItem();
                                initDatabaseInformations();

                                if (usbDeviceConnection != null) {
                                    usbDeviceConnection.close();
                                    usbDeviceConnection = null;
                                }
                                result.success("loadDatabaseItem success");
                            } else if (call.method.equals("morphoUserVerify")) {
                                try {
                                    if (ProcessInfo.getInstance().getDatabaseSelectedIndex() != -1) {
                                        int i = ProcessInfo.getInstance().getDatabaseSelectedIndex();

                                        List<DatabaseItem> databaseItems = ProcessInfo.getInstance().getDatabaseItems();

                                        String userID = databaseItems.get(i).getId();

                                        final MorphoUser morphoUser = new MorphoUser();

                                        int ret = 0;
                                        final byte[] privacyKey;

                                        if (MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED != ProcessInfo.getInstance().getPrivacyModeStatus()) {
                                            // get Privacy key
                                            privacyKey = getPrivacyKey();
                                            if (null == privacyKey) {
                                                alert("An error occured while getting Privacy key");
                                            } else {
                                                // crypt and update user data
                                                byte[] random = new byte[4];
                                                new Random().nextBytes(random);

                                                byte[] idUserCrypted = encryptPrivacyData(userID.getBytes(), privacyKey, random);
                                                ret = morphoDatabase.getUserBuffer(idUserCrypted, morphoUser);
                                            }
                                        } else {
                                            ret = morphoDatabase.getUser(userID, morphoUser);
                                        }

                                        if (ret == 0) {
                                            ProcessInfo processInfo = ProcessInfo.getInstance();
                                            int timeout = processInfo.getTimeout();
                                            int far = processInfo.getMatchingThreshold();
                                            Coder coder = processInfo.getCoder();
                                            int detectModeChoice;
                                            MatchingStrategy matchingStrategy = processInfo.getMatchingStrategy();

                                            int callbackCmd = ProcessInfo.getInstance().getCallbackCmd();

                                            callbackCmd &= ~CallbackMask.MORPHO_CALLBACK_ENROLLMENT_CMD.getValue();

                                            ResultMatching resultMatching = null;
                                            // Check if running under security mode
                                            boolean isTunnelingMode = false;
                                            boolean isOfferedSecurityMode = false;
                                            ArrayList<SecurityOption> securityOptions = ProcessInfo.getInstance().getSecurityOptions();
                                            for (SecurityOption so : securityOptions) {
                                                if (so.title.equals("Mode Tunneling")) {
                                                    isTunnelingMode = so.activated;
                                                } else if (so.title.equals("Mode Offered Security")) {
                                                    isOfferedSecurityMode = so.activated;
                                                }
                                            }
                                            if (!isTunnelingMode && !isOfferedSecurityMode) {
                                                resultMatching = new ResultMatching();
                                            }

                                            detectModeChoice = DetectionMode.MORPHO_ENROLL_DETECT_MODE.getValue();

                                            if (processInfo.isForceFingerPlacementOnTop()) {
                                                detectModeChoice |= DetectionMode.MORPHO_FORCE_FINGER_ON_TOP_DETECT_MODE.getValue();
                                            }

                                            if (processInfo.isWakeUpWithLedOff()) {
                                                detectModeChoice |= MorphoWakeUpMode.MORPHO_WAKEUP_LED_OFF.getCode();
                                            }

                                            ret = morphoDevice.setStrategyAcquisitionMode(ProcessInfo.getInstance().getStrategyAcquisitionMode());

                                            if (ret == 0) {
                                                ret = morphoUser.verify(timeout, far, coder, detectModeChoice, matchingStrategy, callbackCmd, this, resultMatching);
                                            }

//                                            getAndWriteFFDLogs();

                                            final String[] message = {""};
                                            if (ret == ErrorCodes.MORPHO_OK) {
                                                String user_authenticated = "";
                                                for (int j = 0; j <= 2; j++) {
                                                    if (MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED != ProcessInfo.getInstance().getPrivacyModeStatus()) {
                                                        if (ProcessInfo.getInstance().getPrivacyKey() == null) {
                                                            alert("An error occured while getting Privacy key");
                                                        } else {
                                                            byte[] memB = morphoUser.getBufferField(j);
                                                            byte[] decrypted_bio_data = decryptAndCheckPrivacyData(memB, ProcessInfo.getInstance().getPrivacyKey());

                                                            String mem = new String(decrypted_bio_data);
                                                            user_authenticated = user_authenticated + " " + mem;
                                                        }
                                                    } else {
                                                        String mem = morphoUser.getField(j);
                                                        user_authenticated = user_authenticated + " " + mem;
                                                    }
                                                }

                                                message[0] = "User authenticated :\n";
                                                if (MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED != ProcessInfo.getInstance().getPrivacyModeStatus()) {
                                                    //////////////////////////
                                                    final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
                                                    alertDialog.setTitle(getResources().getString(R.string.morphosample));
                                                    alertDialog.setMessage("Decrypt User info : ");
                                                    alertDialog.setCancelable(false);
                                                    alertDialog.setButton(DialogInterface.BUTTON_NEGATIVE, getString(R.string.cancel), new DialogInterface.OnClickListener() {
                                                        public void onClick(DialogInterface dialog, int which) {
                                                            byte[] userIDB = morphoUser.getBufferField(0);
                                                            byte[] firstNameB = morphoUser.getBufferField(1);
                                                            byte[] lastNameB = morphoUser.getBufferField(2);

                                                            String userIDt = new String(userIDB);
                                                            String firstName = new String(firstNameB);
                                                            String lastName = new String(lastNameB);

                                                            message[0] += "\t" + getString(R.string.idnumber) + " : " + userIDt + "\n";
                                                            message[0] += "\t" + getString(R.string.firstname) + " : " + firstName + "\n";
                                                            message[0] += "\t" + getString(R.string.lastname) + " : " + lastName + "\n";

                                                            final String msg = message[0];
                                                            final int l_ret = 0;
                                                            final int internalError = morphoDevice.getInternalError();

                                                            alert(l_ret, internalError, "Verify", msg, true, context);
                                                        }
                                                    });
                                                    alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, getString(R.string.ok), new DialogInterface.OnClickListener() {
                                                        public void onClick(DialogInterface dialog, int which) {
                                                            byte[] userIDB = morphoUser.getBufferField(0);
                                                            byte[] firstNameB = morphoUser.getBufferField(1);
                                                            byte[] lastNameB = morphoUser.getBufferField(2);
                                                            if (ProcessInfo.getInstance().getPrivacyKey() == null) {
                                                                alert("An error occured while getting Privacy key");
                                                            } else {
                                                                byte[] decrypted_bio_data = decryptAndCheckPrivacyData(userIDB, ProcessInfo.getInstance().getPrivacyKey());


                                                                String userIDt = new String(decrypted_bio_data);

                                                                decrypted_bio_data = decryptAndCheckPrivacyData(firstNameB, ProcessInfo.getInstance().getPrivacyKey());

                                                                String firstName = new String(decrypted_bio_data);

                                                                decrypted_bio_data = decryptAndCheckPrivacyData(lastNameB, ProcessInfo.getInstance().getPrivacyKey());

                                                                String lastName = new String(decrypted_bio_data);

                                                                message[0] += "\t" + getString(R.string.idnumber) + " : " + userIDt + "\n";
                                                                message[0] += "\t" + getString(R.string.firstname) + " : " + firstName + "\n";
                                                                message[0] += "\t" + getString(R.string.lastname) + " : " + lastName + "\n";

                                                                final String msg = message[0];
                                                                final int l_ret = 0;
                                                                final int internalError = morphoDevice.getInternalError();

                                                                alert(l_ret, internalError, "Verify", msg, true, context);
                                                            }
                                                            ;
                                                        }
                                                    });
                                                    /////////////////////////
                                                    alertDialog.show();

                                                } else {
                                                    message[0] += "\t" + getString(R.string.idnumber) + " : " + morphoUser.getField(0) + "\n";
                                                    message[0] += "\t" + getString(R.string.firstname) + " : " + morphoUser.getField(1) + "\n";
                                                    message[0] += "\t" + getString(R.string.lastname) + " : " + morphoUser.getField(2) + "\n";
                                                }
                                                if (resultMatching != null) {
                                                    message[0] += "\tMatching Score = " + resultMatching.getMatchingScore() + "\n";
                                                    message[0] += "\tPK Number = " + resultMatching.getMatchingPKNumber();
                                                }
                                            }
                                            final String msg = message[0];
                                            final int l_ret = ret;
                                            final int internalError = morphoDevice.getInternalError();

                                            alert(l_ret, internalError, "Verify", msg, true, context);
                                        }
                                    } else {
                                        alert("Select a user in the list view.");
                                    }
                                } catch (Exception e) {
                                    throw new RuntimeException(e.getMessage());
                                }
                                ProcessInfo.getInstance().setCommandBioStart(false);
                            } else if (call.method.equals("morphoDeviceVerifyWithFile")) {
                                try
                                {
                                    String fingerPrintString = "AjwAXFL/gIC9ksOgzKy6pqSnsJGgl6eTSqpWo0CpZ5B1jI+Mm4ldik2PSnpdemNTiYO7hMNgOYlAZ09XYWNvdHNavlp7ZoRppnOdZqZnt3Q5d6RatW2NrWadmZIpoISQSYpjWGCAeIZNYGppbH3Dcth3c28obY9jml7SjcSM053LXjMnKhAQEf//e50kKNX9";
                                    TemplateList templateList = new TemplateList();
                                    final byte[] buffer = Base64.getDecoder().decode(fingerPrintString);//fingerPrintString.getBytes(StandardCharsets.UTF_8);
                                    Template template = new Template();
                                    template.setData(buffer);
                                    template.setTemplateType((TemplateType) TemplateType.MORPHO_PK_COMP);
                                    templateList.putTemplate(template);


                                    int timeOut = 0;
                                    int far = FalseAcceptanceRate.MORPHO_FAR_5;
                                    Coder coderChoice = Coder.MORPHO_DEFAULT_CODER;
                                    int detectModeChoice = DetectionMode.MORPHO_VERIF_DETECT_MODE.getValue();
                                    int matchingStrategy = 0;

                                    int callbackCmd = ProcessInfo.getInstance().getCallbackCmd();

                                    callbackCmd &= ~CallbackMask.MORPHO_CALLBACK_ENROLLMENT_CMD.getValue();

                                    ResultMatching resultMatching = null;
                                    // Check if running under security mode
                                    boolean isTunnelingMode = false;
                                    boolean isOfferedSecurityMode = false;
                                    ArrayList<SecurityOption> securityOptions = ProcessInfo.getInstance().getSecurityOptions();
                                    for (SecurityOption so : securityOptions) {
                                        if (so.title.equals("Mode Tunneling")) {
                                            isTunnelingMode = so.activated;
                                        } else if (so.title.equals("Mode Offered Security")) {
                                            isOfferedSecurityMode = so.activated;
                                        }
                                    }
                                    if (!isTunnelingMode && !isOfferedSecurityMode) {
                                        resultMatching = new ResultMatching();
                                    }

                                    int ret = morphoDevice.setStrategyAcquisitionMode(ProcessInfo.getInstance().getStrategyAcquisitionMode());

                                    if (ret == 0) {
                                        ret = morphoDevice.verify(timeOut, far, coderChoice, detectModeChoice, matchingStrategy, templateList, callbackCmd, this, resultMatching);
                                    }

                                    ProcessInfo.getInstance().setCommandBioStart(false);


                                    String message = "";

                                    if (ret == ErrorCodes.MORPHO_OK && resultMatching != null) {
                                        message = "Matching Score = " + resultMatching.getMatchingScore() + "\nPK Number = " + resultMatching.getMatchingPKNumber();
                                    }

                                    final String msg = message;
                                    final int l_ret = ret;
                                    final int internalError = morphoDevice.getInternalError();
                                    alert(l_ret, internalError, "Verify", msg, true, context);
                                    result.success("morphoDeviceVerifyWithFile success");
                                }
                                catch (Exception e)
                                {
                                    alert(e.getMessage());
                                }

                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }

    private void copyBinFromAssets() {
        String filename = "dummy_image.bin";
        InputStream in = null;
        OutputStream out = null;
        try {
            String filePath = mMainFolderPath + "/Idemia/Special/MSO/";
            File dir = new File(filePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File binFileParam = new File(filePath, filename);
            if (!binFileParam.exists()) {
                AssetManager assetManager = getAssets();
                in = assetManager.open(filename);
                File outFile = new File(filePath, filename);
                out = new FileOutputStream(outFile);
                copyFile(in, out);
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to copy asset file: " + filename + e.getMessage());
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    throw new RuntimeException("Unable to Close the in file: " + e.getMessage());
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    throw new RuntimeException("Unable to Close the Out file: " + e.getMessage());
                }
            }
        }
    }

    private void copyFile(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[512 * 1024];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
        }
    }

    private void copyLogFileParam() {
        String filename = "Log.ini";
        try {
            String filePath = mMainFolderPath + "/Idemia/Conf/MSO/";
            File dir = new File(filePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File logFileParam = new File(dir, filename);
            if (!logFileParam.exists()) {
                AssetManager assetManager = getAssets();
                InputStream in = null;
                OutputStream out = null;
                in = assetManager.open(filename);
                out = new FileOutputStream(filePath + filename);
                copyFile(in, out);
                in.close();
                in = null;
                out.flush();
                out.close();
                out = null;
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to copy asset file: " + filename + e.getMessage());
        }
    }

    private void showMsgError(int ret) {
        final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle(this.getResources().getString(R.string.morphosample));
        String msg = convertToInternationalMessage(ret, morphoDevice.getInternalError(), getApplicationContext(), false);
        alertDialog.setMessage(msg);
        alertDialog.setCancelable(false);
        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, this.getResources().getString(R.string.ok), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                finish();
            }
        });
        alertDialog.show();

        // Wait for click event
        try {
            Looper.loop();
        } catch (RuntimeException e) {

        }
    }

    public String convertToInternationalMessage(int iCodeError, int iInternalError, Context context, boolean isMatchingOperation) {
        switch (iCodeError) {
            case ErrorCodes.MORPHO_OK:
                return context.getString(R.string.MORPHO_OK);
            case ErrorCodes.MORPHOERR_INTERNAL:
                return context.getString(R.string.MORPHOERR_INTERNAL);
            case ErrorCodes.MORPHOERR_PROTOCOLE:
                return context.getString(R.string.MORPHOERR_PROTOCOLE);
            case ErrorCodes.MORPHOERR_CONNECT:
                return context.getString(R.string.MORPHOERR_CONNECT);
            case ErrorCodes.MORPHOERR_CLOSE_COM:
                return context.getString(R.string.MORPHOERR_CLOSE_COM);
            case ErrorCodes.MORPHOERR_BADPARAMETER:
                return context.getString(R.string.MORPHOERR_BADPARAMETER);
            case ErrorCodes.MORPHOERR_MEMORY_PC:
                return context.getString(R.string.MORPHOERR_MEMORY_PC);
            case ErrorCodes.MORPHOERR_MEMORY_DEVICE:
                return context.getString(R.string.MORPHOERR_MEMORY_DEVICE);
            case ErrorCodes.MORPHOERR_NO_HIT:
                return context.getString(R.string.MORPHOERR_NO_HIT);
            case ErrorCodes.MORPHOERR_STATUS:
                return context.getString(R.string.MORPHOERR_STATUS);
            case ErrorCodes.MORPHOERR_DB_FULL:
                return context.getString(R.string.MORPHOERR_DB_FULL);
            case ErrorCodes.MORPHOERR_DB_EMPTY:
                return context.getString(R.string.MORPHOERR_DB_EMPTY);
            case ErrorCodes.MORPHOERR_ALREADY_ENROLLED:
                return context.getString(R.string.MORPHOERR_ALREADY_ENROLLED);
            case ErrorCodes.MORPHOERR_BASE_NOT_FOUND:
                return context.getString(R.string.MORPHOERR_BASE_NOT_FOUND);
            case ErrorCodes.MORPHOERR_BASE_ALREADY_EXISTS:
                return context.getString(R.string.MORPHOERR_BASE_ALREADY_EXISTS);
            case ErrorCodes.MORPHOERR_NO_ASSOCIATED_DB:
                return context.getString(R.string.MORPHOERR_NO_ASSOCIATED_DB);
            case ErrorCodes.MORPHOERR_NO_ASSOCIATED_DEVICE:
                return context.getString(R.string.MORPHOERR_NO_ASSOCIATED_DEVICE);
            case ErrorCodes.MORPHOERR_INVALID_TEMPLATE:
                return context.getString(R.string.MORPHOERR_INVALID_TEMPLATE);
            case ErrorCodes.MORPHOERR_NOT_IMPLEMENTED:
                return context.getString(R.string.MORPHOERR_NOT_IMPLEMENTED);
            case ErrorCodes.MORPHOERR_TIMEOUT:
                return context.getString(R.string.MORPHOERR_TIMEOUT);
            case ErrorCodes.MORPHOERR_NO_REGISTERED_TEMPLATE:
                return context.getString(R.string.MORPHOERR_NO_REGISTERED_TEMPLATE);
            case ErrorCodes.MORPHOERR_FIELD_NOT_FOUND:
                return context.getString(R.string.MORPHOERR_FIELD_NOT_FOUND);
            case ErrorCodes.MORPHOERR_CORRUPTED_CLASS:
                return context.getString(R.string.MORPHOERR_CORRUPTED_CLASS);
            case ErrorCodes.MORPHOERR_TO_MANY_TEMPLATE:
                return context.getString(R.string.MORPHOERR_TO_MANY_TEMPLATE);
            case ErrorCodes.MORPHOERR_TO_MANY_FIELD:
                return context.getString(R.string.MORPHOERR_TO_MANY_FIELD);
            case ErrorCodes.MORPHOERR_MIXED_TEMPLATE:
                return context.getString(R.string.MORPHOERR_MIXED_TEMPLATE);
            case ErrorCodes.MORPHOERR_CMDE_ABORTED:
                return context.getString(R.string.MORPHOERR_CMDE_ABORTED);
            case ErrorCodes.MORPHOERR_INVALID_PK_FORMAT:
                return context.getString(R.string.MORPHOERR_INVALID_PK_FORMAT);
            case ErrorCodes.MORPHOERR_SAME_FINGER:
                return context.getString(R.string.MORPHOERR_SAME_FINGER);
            case ErrorCodes.MORPHOERR_OUT_OF_FIELD:
                return context.getString(R.string.MORPHOERR_OUT_OF_FIELD);
            case ErrorCodes.MORPHOERR_INVALID_USER_ID:
                return context.getString(R.string.MORPHOERR_INVALID_USER_ID);
            case ErrorCodes.MORPHOERR_INVALID_USER_DATA:
                return context.getString(R.string.MORPHOERR_INVALID_USER_DATA);
            case ErrorCodes.MORPHOERR_FIELD_INVALID:
                return context.getString(R.string.MORPHOERR_FIELD_INVALID);
            case ErrorCodes.MORPHOERR_USER_NOT_FOUND:
                return context.getString(R.string.MORPHOERR_USER_NOT_FOUND);
            case ErrorCodes.MORPHOERR_COM_NOT_OPEN:
                return context.getString(R.string.MORPHOERR_COM_NOT_OPEN);
            case ErrorCodes.MORPHOERR_ELT_ALREADY_PRESENT:
                return context.getString(R.string.MORPHOERR_ELT_ALREADY_PRESENT);
            case ErrorCodes.MORPHOERR_NOCALLTO_DBQUERRYFIRST:
                return context.getString(R.string.MORPHOERR_NOCALLTO_DBQUERRYFIRST);
            case ErrorCodes.MORPHOERR_USER:
                return context.getString(R.string.MORPHOERR_USER);
            case ErrorCodes.MORPHOERR_BAD_COMPRESSION:
                return context.getString(R.string.MORPHOERR_BAD_COMPRESSION);
            case ErrorCodes.MORPHOERR_SECU:
                return context.getString(R.string.MORPHOERR_SECU);
            case ErrorCodes.MORPHOERR_CERTIF_UNKNOW:
                return context.getString(R.string.MORPHOERR_CERTIF_UNKNOW);
            case ErrorCodes.MORPHOERR_INVALID_CLASS:
                return context.getString(R.string.MORPHOERR_INVALID_CLASS);
            case ErrorCodes.MORPHOERR_USB_DEVICE_NAME_UNKNOWN:
                return context.getString(R.string.MORPHOERR_USB_DEVICE_NAME_UNKNOWN);
            case ErrorCodes.MORPHOERR_CERTIF_INVALID:
                return context.getString(R.string.MORPHOERR_CERTIF_INVALID);
            case ErrorCodes.MORPHOERR_SIGNER_ID:
                return context.getString(R.string.MORPHOERR_SIGNER_ID);
            case ErrorCodes.MORPHOERR_SIGNER_ID_INVALID:
                return context.getString(R.string.MORPHOERR_SIGNER_ID_INVALID);
            case ErrorCodes.MORPHOERR_FFD:
            case ErrorCodes.MORPHOERR_MOIST_FINGER:
            case ErrorCodes.MORPHOERR_MOVED_FINGER:
            case ErrorCodes.MORPHOERR_SATURATED_FINGER:
            case ErrorCodes.MORPHOERR_INVALID_FINGER:
                return isMatchingOperation ? context.getString(R.string.MORPHOERR_NO_HIT) : context.getString(R.string.MORPHOERR_LOW_QUALITY_FINGER);
            case ErrorCodes.MORPHOERR_NO_SERVER:
                return context.getString(R.string.MORPHOERR_NO_SERVER);
            case ErrorCodes.MORPHOERR_OTP_NOT_INITIALIZED:
                return context.getString(R.string.MORPHOERR_OTP_NOT_INITIALIZED);
            case ErrorCodes.MORPHOERR_OTP_PIN_NEEDED:
                return context.getString(R.string.MORPHOERR_OTP_PIN_NEEDED);
            case ErrorCodes.MORPHOERR_OTP_REENROLL_NOT_ALLOWED:
                return context.getString(R.string.MORPHOERR_OTP_REENROLL_NOT_ALLOWED);
            case ErrorCodes.MORPHOERR_OTP_ENROLL_FAILED:
                return context.getString(R.string.MORPHOERR_OTP_ENROLL_FAILED);
            case ErrorCodes.MORPHOERR_OTP_IDENT_FAILED:
                return context.getString(R.string.MORPHOERR_OTP_IDENT_FAILED);
            case ErrorCodes.MORPHOERR_NO_MORE_OTP:
                return context.getString(R.string.MORPHOERR_NO_MORE_OTP);
            case ErrorCodes.MORPHOERR_OTP_NO_HIT:
                return context.getString(R.string.MORPHOERR_OTP_NO_HIT);
            case ErrorCodes.MORPHOERR_OTP_ENROLL_NEEDED:
                return context.getString(R.string.MORPHOERR_OTP_ENROLL_NEEDED);
            case ErrorCodes.MORPHOERR_DEVICE_LOCKED:
                return context.getString(R.string.MORPHOERR_DEVICE_LOCKED);
            case ErrorCodes.MORPHOERR_DEVICE_NOT_LOCK:
                return context.getString(R.string.MORPHOERR_DEVICE_NOT_LOCK);
            case ErrorCodes.MORPHOERR_OTP_LOCK_GEN_OTP:
                return context.getString(R.string.MORPHOERR_OTP_LOCK_GEN_OTP);
            case ErrorCodes.MORPHOERR_OTP_LOCK_SET_PARAM:
                return context.getString(R.string.MORPHOERR_OTP_LOCK_SET_PARAM);
            case ErrorCodes.MORPHOERR_OTP_LOCK_ENROLL:
                return context.getString(R.string.MORPHOERR_OTP_LOCK_ENROLL);
            case ErrorCodes.MORPHOERR_FVP_MINUTIAE_SECURITY_MISMATCH:
                return context.getString(R.string.MORPHOERR_FVP_MINUTIAE_SECURITY_MISMATCH);
            case ErrorCodes.MORPHOERR_FVP_FINGER_MISPLACED_OR_WITHDRAWN:
                return context.getString(R.string.MORPHOERR_FVP_FINGER_MISPLACED_OR_WITHDRAWN);
            case ErrorCodes.MORPHOERR_LICENSE_MISSING:
                return context.getString(R.string.MORPHOERR_LICENSE_MISSING);
            case ErrorCodes.MORPHOERR_CANT_GRAN_PERMISSION_USB:
                return context.getString(R.string.MORPHOERR_CANT_GRAN_PERMISSION_USB);
            case ErrorCodes.MORPHOERR_CAPTURE_FAILED:
                return getString(R.string.MORPHOERR_CAPTURE_FAILED);
            default:
                return String.format("Unknown error %d, Internal Error = %d", iCodeError, iInternalError);
        }
    }

    protected void alert(int codeError, int internalError, String title, String message) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle(title);
        String msg;
        if (codeError == 0) {
            msg = getResources().getString(R.string.OP_SUCCESS);
        } else {
            msg = getResources().getString(R.string.OP_FAILED) + "\n" + ErrorCodes.getError(codeError, internalError);
        }
        msg += ((message.equalsIgnoreCase("")) ? "" : "\n" + message);
        alertDialog.setMessage(msg);
        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "Ok", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
            }
        });
        alertDialog.show();
    }

    public MorphoInfo retrieveSettings() {
        MorphoInfo ret = null;
        if ((VerifyInfo.getInstance().getSelectedUriList().size() == 0) && (VerifyInfo.getInstance().getAuthenticationMode() == AuthenticationMode.File)) {
            alert(getResources().getString(R.string.mustselectfile));
        } else if (VerifyInfo.getInstance().getSelectedUriList().size() > 20) {
            alert(getResources().getString(R.string.mustselectLess20));
        } else {
            if (VerifyInfo.getInstance().getAuthenticationMode() == AuthenticationMode.Database) {
                if (ProcessInfo.getInstance().getDatabaseItems().size() == 0) {
                    alert(ErrorCodes.getError(ErrorCodes.MORPHOERR_DB_EMPTY, 0));
                } else {
                    if (ProcessInfo.getInstance().getDatabaseSelectedIndex() != -1) {
                        ret = VerifyInfo.getInstance();
                    } else {
                        alert(getResources().getString(R.string.selectuserfirst));
                    }
                }
            } else {
                ret = VerifyInfo.getInstance();
            }
        }
        return ret;
    }

    protected void alert(String msg) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle(R.string.app_name);
        alertDialog.setMessage(msg);
        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "Ok", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
            }
        });
        alertDialog.show();
    }

    synchronized int openDevice(int bus, int address, int fd) {
        int ret = ErrorCodes.MORPHO_OK;
        UsbManager usbManager = (UsbManager) this.getSystemService(Context.USB_SERVICE);
        HashMap<String, UsbDevice> usbDeviceList = usbManager.getDeviceList();

        Iterator<UsbDevice> usbDeviceIterator = usbDeviceList.values().iterator();
        while (usbDeviceIterator.hasNext()) {
            UsbDevice usbDevice = usbDeviceIterator.next();
            if (MorphoTools.isSupported(usbDevice.getVendorId(), usbDevice.getProductId())) {
                boolean hasPermission = usbManager.hasPermission(usbDevice);
                if (hasPermission) {
                    usbDeviceConnection = usbManager.openDevice(usbDevice);
                    if (usbDeviceConnection != null) {
                        //Log.d("MORPHO_USB" ,"getting serial number .. #" + mConnection.getSerial());
                        // int sensorFileDescriptor = connection.getFileDescriptor();
                        String name = usbDevice.getDeviceName();

                        String[] elts = name.split("/");
                        if (elts.length < 5)
                            continue;
                        int sensorBus = Integer.parseInt(elts[4].toString());
                        int sensorAddress = Integer.parseInt(elts[5].toString());
                        //device fd can change on device reboot
                        if (sensorBus == bus && sensorAddress == address /*&& sensorFileDescriptor == fd*/) {
                            ret = morphoDevice.openUsbDeviceFD(bus, address, fd, 0);
                            //Log.e("MORPHO_USB", "morphoDevice.openUsbDeviceFD " + ret);
                        }
                        break;
                    }
                }
            }
        }

        return ret;
    }

    static List<DatabaseItem> databaseItems = null;

    public int loadDatabaseItem() {
        int ret = 0;
        databaseItems = new ArrayList<DatabaseItem>();
        int[] indexDescriptor = new int[3];
        indexDescriptor[0] = 0;
        indexDescriptor[1] = 1;
        indexDescriptor[2] = 2;

        MorphoUserList morphoUserList = new MorphoUserList();
        ret = morphoDatabase.readPublicFields(indexDescriptor, morphoUserList);

        int l_nb_user = morphoUserList.getNbUser();
        for (int i = 0; i < l_nb_user; i++) {
            MorphoUser morphoUser = morphoUserList.getUser(i);

            if (MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED != ProcessInfo.getInstance().getPrivacyModeStatus()) { // Privacy Mode enabled
                byte[] userID = morphoUser.getBufferField(0);
                byte[] firstName = morphoUser.getBufferField(1);
                byte[] lastName = morphoUser.getBufferField(2);

                byte[] privacyKey = ProcessInfo.getInstance().getPrivacyKey();
                if (null != privacyKey) {
                    byte[] idDecrypted = null;
                    byte[] firstNameDecrypted = null;
                    byte[] lastNameDecrypted = null;

                    byte[] decrypted_bio_data = decryptAndCheckPrivacyData(userID, privacyKey);
                    if (null != decrypted_bio_data)
                        idDecrypted = Arrays.copyOfRange(decrypted_bio_data, 8, decrypted_bio_data.length);
                    decrypted_bio_data = decryptAndCheckPrivacyData(firstName, privacyKey);
                    if (null != decrypted_bio_data)
                        firstNameDecrypted = Arrays.copyOfRange(decrypted_bio_data, 8, decrypted_bio_data.length);
                    decrypted_bio_data = decryptAndCheckPrivacyData(lastName, privacyKey);
                    if (null != decrypted_bio_data)
                        lastNameDecrypted = Arrays.copyOfRange(decrypted_bio_data, 8, decrypted_bio_data.length);

                    if (null != idDecrypted && null != firstNameDecrypted && null != lastNameDecrypted)
                        databaseItems.add(new DatabaseItem(new String(idDecrypted), new String(firstNameDecrypted), new String(lastNameDecrypted)));
                } else {
                    alert("Privacy key not found, Data Base will not be decrypted/refreshed");
                }
            } else {
                String userID = morphoUser.getField(0);
                String firstName = morphoUser.getField(1);
                String lastName = morphoUser.getField(2);
                databaseItems.add(new DatabaseItem(userID, firstName, lastName));
            }
        }

        ProcessInfo.getInstance().setDatabaseItems(databaseItems);
        ProcessInfo.getInstance().setCurrentNumberOfRecordValue(databaseItems.size());

        return ret;
    }

    protected byte[] decryptAndCheckPrivacyData(byte[] cryptedData, byte[] key) {
        int ret = 0;

        // Privacy formatted and ciphered data = AES-128.CBC.ENC( Kprivacy, IV, CRC32( RND32 || Plain Data ) || RND32 || Plain Data || Padding )
        // Decrypt data
        byte[] iv = new byte[]{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
        ArrayList<Byte> aesEncryptedData = new ArrayList<Byte>();
        if (privacyInfoIndexEnum == MorphoDevice.MorphoDevicePrivacyModeEncryptionAlgo.PRIVACY_ENCRYPTION_ALGO_AES128) {
            ret = msoSecu.decryptAes128Cbc(key, cryptedData, iv, true, aesEncryptedData);
        } else if (privacyInfoIndexEnum == MorphoDevice.MorphoDevicePrivacyModeEncryptionAlgo.PRIVACY_ENCRYPTION_ALGO_AES256) {
            ret = msoSecu.decryptAes256Cbc(key, cryptedData, iv, true, aesEncryptedData);
        }
        if (0 != ret) {
            alert("An error occured while decrypting data");
            return null;
        }
        // No need to delete padding, it is already done by decryptAes128Cbc method
        byte[] decrypteddata = MorphoTools.toByteArray(aesEncryptedData);

        // Check CRC32
        byte[] CRC32Buffer = Arrays.copyOf(decrypteddata, 4);
        long CRC32 = MorphoTools.fourBytesToLongValue(CRC32Buffer);
        byte[] dataToCheck = Arrays.copyOfRange(decrypteddata, 4, decrypteddata.length);
        long[] computedCRC = {0};
        ret = msoSecu.computeCRC32(dataToCheck, 0x04C11DB7, 0xFFFFFFFF, true, true, 0xFFFFFFFF, computedCRC);
        if (0 != ret) {
            alert("An error occured while computing CRC32");
            return null;
        }

        if (computedCRC[0] != CRC32) {
            alert("CRC32 computation does not match");
            return null;
        }

        return Arrays.copyOfRange(dataToCheck, 4, dataToCheck.length);
    }

    private void initDatabaseInformations() {
        // setting maximum number of templates allowed per user

        CustomInteger finger = new CustomInteger();
        morphoDatabase.getNbFinger(finger);
        Integer nbFinger = new Integer(finger.getValueOf());
        ProcessInfo.getInstance().setNumberOfFingerPerRecord(nbFinger);

        //setting number of used records in database

        CustomLong record = new CustomLong();
        morphoDatabase.getNbUsedRecord(record);
        Long nbUsedRecord = new Long(record.getValueOf());
        ProcessInfo.getInstance().setCurrentNumberOfUsedRecordValue(nbUsedRecord);

        CustomLong totalRecord = new CustomLong();
        morphoDatabase.getNbTotalRecord(totalRecord);
        Long nbTotalRecord = new Long(totalRecord.getValueOf());
        ProcessInfo.getInstance().setMaximumNumberOfRecordValue(nbTotalRecord);

        CustomInteger customStatus = new CustomInteger();

        int ret = morphoDatabase.getDbEncryptionStatus(customStatus);
        Integer status = new Integer(customStatus.getValueOf());

        if (ret != ErrorCodes.MORPHO_OK) {
            ProcessInfo.getInstance().setEncryptDatabaseValue("N/A");
        } else {
            String databaseStatus = "NO";
            if (status == 1) {
                databaseStatus = "YES";
                if (MorphoDevice.MorphoDevicePrivacyModeStatus.PRIVACY_MODE_DISABLED != ProcessInfo.getInstance().getPrivacyModeStatus()) {
                    databaseStatus += " (Privacy Mode)";
                }
            }
            ProcessInfo.getInstance().setEncryptDatabaseValue(databaseStatus);
        }
    }

//    @Override
//    public void update(Observable o, Object arg) {
//        try
//        {
//            CallbackMessage message = (CallbackMessage) arg;
//
//            int type = message.getMessageType();
//
//            switch (type)
//            {
//
//                case 1:
//                    // message is a command.
//                    Integer command = (Integer) message.getMessage();
//
//                    // Analyze the command.
//                    switch (command)
//                    {
//                        case 0:
//                            strMessage = "move-no-finger";
//                            break;
//                        case 1:
//                            strMessage = "move-finger-up";
//                            break;
//                        case 2:
//                            strMessage = "move-finger-down";
//                            break;
//                        case 3:
//                            strMessage = "move-finger-left";
//                            break;
//                        case 4:
//                            strMessage = "move-finger-right";
//                            break;
//                        case 5:
//                            strMessage = "press-harder";
//                            break;
//                        case 6:
//                            strMessage = "move-latent";
//                            break;
//                        case 7:
//                            strMessage = "remove-finger";
//                            break;
//                        case 8:
//                            strMessage = "finger-ok";
//                            // switch live acquisition ImageView
//                            if (isCaptureVerif)
//                            {
//                                isCaptureVerif = false;
//                                index = 4; //R.id.imageView5;
//                            }
//                            else
//                            {
//                                index++;
//                            }
//
//                            switch (index)
//                            {
//                                case 1:
//                                    currentCaptureBitmapId = R.id.imageView2;
//                                    break;
//                                case 2:
//                                    currentCaptureBitmapId = R.id.imageView3;
//                                    break;
//                                case 3:
//                                    currentCaptureBitmapId = R.id.imageView4;
//                                    break;
//                                case 4:
//                                    currentCaptureBitmapId = R.id.imageView5;
//                                    break;
//                                case 5:
//                                    currentCaptureBitmapId = R.id.imageView6;
//                                    break;
//                                default:
//                                case 0:
//                                    currentCaptureBitmapId = R.id.imageView1;
//                                    break;
//                            }
//                            break;
//                    }
//
//                    mHandler.post(new Runnable()
//                    {
//                        @Override
//                        public synchronized void run()
//                        {
//                            updateSensorMessage(strMessage);
//                        }
//                    });
//
//                    break;
//                case 2:
//                    // message is a low resolution image, display it.
//                    byte[] image = (byte[]) message.getMessage();
//
//                    MorphoImage morphoImage = MorphoImage.getMorphoImageFromLive(image);
//                    int imageRowNumber = morphoImage.getMorphoImageHeader().getNbRow();
//                    int imageColumnNumber = morphoImage.getMorphoImageHeader().getNbColumn();
//                    final Bitmap imageBmp = Bitmap.createBitmap(imageColumnNumber, imageRowNumber, Bitmap.Config.ALPHA_8);
//
//                    imageBmp.copyPixelsFromBuffer(ByteBuffer.wrap(morphoImage.getImage(), 0, morphoImage.getImage().length));
//                    mHandler.post(new Runnable()
//                    {
//                        @Override
//                        public synchronized void run()
//                        {
//                            updateImage(imageBmp, currentCaptureBitmapId);
//                        }
//                    });
//                    break;
//                case 3:
//                    // message is the coded image quality.
//                    final Integer quality = (Integer) message.getMessage();
//                    mHandler.post(new Runnable()
//                    {
//                        @Override
//                        public synchronized void run()
//                        {
//                            updateSensorProgressBar(quality);
//                            updateImageBackground(currentCaptureBitmapId, quality);
//                        }
//                    });
//                    break;
//                case 5:
//                    // message is the busy warning
//                    strMessage = "device-is-busy";
//                    mHandler.post(new Runnable()
//                    {
//                        @Override
//                        public synchronized void run()
//                        {
//                            updateSensorMessage(strMessage);
//                        }
//                    });
//                    break;
//                //case 4:
//                //byte[] enrollcmd = (byte[]) message.getMessage();
//            }
//        }
//        catch (Exception e)
//        {
//            alert(e.getMessage());
//        }
//    }

    protected byte[] getPrivacyKey() {
        if (ProcessInfo.getInstance().getPrivacyKey() == null) {

            final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
            alertDialog.setTitle(this.getResources().getString(R.string.morphosample));
            alertDialog.setMessage(this.getResources().getString(R.string.selectPrivacyKey));
            alertDialog.setCancelable(false);
            alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, getString(R.string.ok), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    try {
                        Intent activityIntent = new Intent(Intent.ACTION_GET_CONTENT);
                        // Update with mime types
                        activityIntent.setType("*/*");
                        // Store the Workflow file in the intent
                        startActivityForResult(activityIntent, 0);
                    } catch (Exception e) {
                        alert(e.getMessage());
                    }
                }
            });
            alertDialog.show();

            // Wait for event click
            try {
                Looper.loop();
            } catch (RuntimeException e) {
            }
        }

        return ProcessInfo.getInstance().getPrivacyKey();
    }

    protected byte[] encryptPrivacyData(byte[] clear_data, byte[] key, byte[] random) {
        // Privacy formatted and ciphered data = AES-128.CBC.ENC( Kprivacy, IV, CRC32( RND32 || Plain Data ) || RND32 || Plain Data || Padding )
        // CRC32 computation parameters : Polynomial = 0x04C11DB7, input and output reflected, initial value = 0xFFFFFFFF and final XOR = 0xFFFFFFFF
        byte[] crypted_bio_data = null;
        try {
            // Compute CRC32
            byte[] iv = new byte[]{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
            ArrayList<Byte> aesEncryptedData = new ArrayList<Byte>();
            byte[] datainput = new byte[clear_data.length + 4]; //+ size of random

            System.arraycopy(random, 0, datainput, 0, 4);
            System.arraycopy(clear_data, 0, datainput, 4, clear_data.length);

            long[] computedCRC = {0};
            int ret = msoSecu.computeCRC32(datainput, 0x04C11DB7, 0xFFFFFFFF, true, true, 0xFFFFFFFF, computedCRC);
            if (0 != ret) {
                alert("An error occured while computing CRC32");
                return null;
            }

            // Build data to crypt
            byte[] CRC32Buffer = MorphoTools.longToFourByteBuffer(computedCRC[0], false);
            byte[] datainputF = new byte[clear_data.length + 4 + 4]; //+ size of crc & random

            System.arraycopy(CRC32Buffer, 0, datainputF, 0, 4);
            System.arraycopy(random, 0, datainputF, 4, 4);
            System.arraycopy(clear_data, 0, datainputF, 8, clear_data.length);

            // Crypt data
            if (key.length == MsoSecu.AES128_BLOCK_LENGTH) {
                ret = msoSecu.encryptAes128Cbc(key, datainputF, iv, true, aesEncryptedData);
            } else if (key.length == MsoSecu.AES256_BLOCK_LENGTH) {
                ret = msoSecu.encryptAes256Cbc(key, datainputF, iv, true, aesEncryptedData);
            }
            if (ret != 0) {
                alert("An error occured while encrypting data");
                return null;
            } else {
                crypted_bio_data = MorphoTools.toByteArray(aesEncryptedData);
            }
        } catch (Exception e) {
            alert(e.getMessage());
        }

        return crypted_bio_data;
    }

    protected void alert(int codeError, int internalError, String title, String message, boolean isMatchingOperation, Context context) {
        AlertDialog alertDialog = new AlertDialog.Builder(context).create();
        alertDialog.setTitle(title);
        String msg;
        if (codeError == 0) {
            msg = context.getResources().getString(R.string.OP_SUCCESS);
        } else {
            String errorInternationalization = convertToInternationalMessage(codeError, internalError, isMatchingOperation, context);
            msg = context.getResources().getString(R.string.OP_FAILED) + "\n" + errorInternationalization;
        }
        msg += ((message.equalsIgnoreCase("")) ? "" : "\n" + message);
        alertDialog.setMessage(msg);
        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "Ok", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
            }
        });
        alertDialog.show();
    }

    @SuppressLint("DefaultLocale")
    public String convertToInternationalMessage(int iCodeError, int iInternalError, boolean isMatchingOperation, Context context) {
        switch (iCodeError) {
            case ErrorCodes.MORPHO_OK:
                return context.getResources().getString(R.string.MORPHO_OK);
            case ErrorCodes.MORPHOERR_INTERNAL:
                return context.getResources().getString(R.string.MORPHOERR_INTERNAL);
            case ErrorCodes.MORPHOERR_PROTOCOLE:
                return context.getResources().getString(R.string.MORPHOERR_PROTOCOLE);
            case ErrorCodes.MORPHOERR_CONNECT:
                return context.getResources().getString(R.string.MORPHOERR_CONNECT);
            case ErrorCodes.MORPHOERR_CLOSE_COM:
                return context.getResources().getString(R.string.MORPHOERR_CLOSE_COM);
            case ErrorCodes.MORPHOERR_BADPARAMETER:
                return context.getResources().getString(R.string.MORPHOERR_BADPARAMETER);
            case ErrorCodes.MORPHOERR_MEMORY_PC:
                return context.getResources().getString(R.string.MORPHOERR_MEMORY_PC);
            case ErrorCodes.MORPHOERR_MEMORY_DEVICE:
                return context.getResources().getString(R.string.MORPHOERR_MEMORY_DEVICE);
            case ErrorCodes.MORPHOERR_NO_HIT:
                return context.getResources().getString(R.string.MORPHOERR_NO_HIT);
            case ErrorCodes.MORPHOERR_STATUS:
                return context.getResources().getString(R.string.MORPHOERR_STATUS);
            case ErrorCodes.MORPHOERR_DB_FULL:
                return context.getResources().getString(R.string.MORPHOERR_DB_FULL);
            case ErrorCodes.MORPHOERR_DB_EMPTY:
                return context.getResources().getString(R.string.MORPHOERR_DB_EMPTY);
            case ErrorCodes.MORPHOERR_ALREADY_ENROLLED:
                return context.getResources().getString(R.string.MORPHOERR_ALREADY_ENROLLED);
            case ErrorCodes.MORPHOERR_BASE_NOT_FOUND:
                return context.getResources().getString(R.string.MORPHOERR_BASE_NOT_FOUND);
            case ErrorCodes.MORPHOERR_BASE_ALREADY_EXISTS:
                return context.getResources().getString(R.string.MORPHOERR_BASE_ALREADY_EXISTS);
            case ErrorCodes.MORPHOERR_NO_ASSOCIATED_DB:
                return context.getResources().getString(R.string.MORPHOERR_NO_ASSOCIATED_DB);
            case ErrorCodes.MORPHOERR_NO_ASSOCIATED_DEVICE:
                return context.getResources().getString(R.string.MORPHOERR_NO_ASSOCIATED_DEVICE);
            case ErrorCodes.MORPHOERR_INVALID_TEMPLATE:
                return context.getResources().getString(R.string.MORPHOERR_INVALID_TEMPLATE);
            case ErrorCodes.MORPHOERR_NOT_IMPLEMENTED:
                return context.getResources().getString(R.string.MORPHOERR_NOT_IMPLEMENTED);
            case ErrorCodes.MORPHOERR_TIMEOUT:
                return context.getResources().getString(R.string.MORPHOERR_TIMEOUT);
            case ErrorCodes.MORPHOERR_NO_REGISTERED_TEMPLATE:
                return context.getResources().getString(R.string.MORPHOERR_NO_REGISTERED_TEMPLATE);
            case ErrorCodes.MORPHOERR_FIELD_NOT_FOUND:
                return context.getResources().getString(R.string.MORPHOERR_FIELD_NOT_FOUND);
            case ErrorCodes.MORPHOERR_CORRUPTED_CLASS:
                return context.getResources().getString(R.string.MORPHOERR_CORRUPTED_CLASS);
            case ErrorCodes.MORPHOERR_TO_MANY_TEMPLATE:
                return context.getResources().getString(R.string.MORPHOERR_TO_MANY_TEMPLATE);
            case ErrorCodes.MORPHOERR_TO_MANY_FIELD:
                return context.getResources().getString(R.string.MORPHOERR_TO_MANY_FIELD);
            case ErrorCodes.MORPHOERR_MIXED_TEMPLATE:
                return context.getResources().getString(R.string.MORPHOERR_MIXED_TEMPLATE);
            case ErrorCodes.MORPHOERR_CMDE_ABORTED:
                return context.getResources().getString(R.string.MORPHOERR_CMDE_ABORTED);
            case ErrorCodes.MORPHOERR_INVALID_PK_FORMAT:
                return context.getResources().getString(R.string.MORPHOERR_INVALID_PK_FORMAT);
            case ErrorCodes.MORPHOERR_SAME_FINGER:
                return context.getResources().getString(R.string.MORPHOERR_SAME_FINGER);
            case ErrorCodes.MORPHOERR_OUT_OF_FIELD:
                return context.getResources().getString(R.string.MORPHOERR_OUT_OF_FIELD);
            case ErrorCodes.MORPHOERR_INVALID_USER_ID:
                return context.getResources().getString(R.string.MORPHOERR_INVALID_USER_ID);
            case ErrorCodes.MORPHOERR_INVALID_USER_DATA:
                return context.getResources().getString(R.string.MORPHOERR_INVALID_USER_DATA);
            case ErrorCodes.MORPHOERR_FIELD_INVALID:
                return context.getResources().getString(R.string.MORPHOERR_FIELD_INVALID);
            case ErrorCodes.MORPHOERR_USER_NOT_FOUND:
                return context.getResources().getString(R.string.MORPHOERR_USER_NOT_FOUND);
            case ErrorCodes.MORPHOERR_COM_NOT_OPEN:
                return context.getResources().getString(R.string.MORPHOERR_COM_NOT_OPEN);
            case ErrorCodes.MORPHOERR_ELT_ALREADY_PRESENT:
                return context.getResources().getString(R.string.MORPHOERR_ELT_ALREADY_PRESENT);
            case ErrorCodes.MORPHOERR_NOCALLTO_DBQUERRYFIRST:
                return context.getResources().getString(R.string.MORPHOERR_NOCALLTO_DBQUERRYFIRST);
            case ErrorCodes.MORPHOERR_USER:
                return context.getResources().getString(R.string.MORPHOERR_USER);
            case ErrorCodes.MORPHOERR_BAD_COMPRESSION:
                return context.getResources().getString(R.string.MORPHOERR_BAD_COMPRESSION);
            case ErrorCodes.MORPHOERR_SECU:
                return context.getResources().getString(R.string.MORPHOERR_SECU);
            case ErrorCodes.MORPHOERR_CERTIF_UNKNOW:
                return context.getResources().getString(R.string.MORPHOERR_CERTIF_UNKNOW);
            case ErrorCodes.MORPHOERR_INVALID_CLASS:
                return context.getResources().getString(R.string.MORPHOERR_INVALID_CLASS);
            case ErrorCodes.MORPHOERR_USB_DEVICE_NAME_UNKNOWN:
                return context.getResources().getString(R.string.MORPHOERR_USB_DEVICE_NAME_UNKNOWN);
            case ErrorCodes.MORPHOERR_CERTIF_INVALID:
                return context.getResources().getString(R.string.MORPHOERR_CERTIF_INVALID);
            case ErrorCodes.MORPHOERR_SIGNER_ID:
                return context.getResources().getString(R.string.MORPHOERR_SIGNER_ID);
            case ErrorCodes.MORPHOERR_SIGNER_ID_INVALID:
                return context.getResources().getString(R.string.MORPHOERR_SIGNER_ID_INVALID);
            case ErrorCodes.MORPHOERR_FFD:
            case ErrorCodes.MORPHOERR_MOIST_FINGER:
            case ErrorCodes.MORPHOERR_MOVED_FINGER:
            case ErrorCodes.MORPHOERR_SATURATED_FINGER:
            case ErrorCodes.MORPHOERR_INVALID_FINGER:
                return isMatchingOperation ? getString(R.string.MORPHOERR_NO_HIT) : context.getResources().getString(R.string.MORPHOERR_LOW_QUALITY_FINGER);
            case ErrorCodes.MORPHOERR_NO_SERVER:
                return context.getResources().getString(R.string.MORPHOERR_NO_SERVER);
            case ErrorCodes.MORPHOERR_OTP_NOT_INITIALIZED:
                return context.getResources().getString(R.string.MORPHOERR_OTP_NOT_INITIALIZED);
            case ErrorCodes.MORPHOERR_OTP_PIN_NEEDED:
                return context.getResources().getString(R.string.MORPHOERR_OTP_PIN_NEEDED);
            case ErrorCodes.MORPHOERR_OTP_REENROLL_NOT_ALLOWED:
                return context.getResources().getString(R.string.MORPHOERR_OTP_REENROLL_NOT_ALLOWED);
            case ErrorCodes.MORPHOERR_OTP_ENROLL_FAILED:
                return context.getResources().getString(R.string.MORPHOERR_OTP_ENROLL_FAILED);
            case ErrorCodes.MORPHOERR_OTP_IDENT_FAILED:
                return context.getResources().getString(R.string.MORPHOERR_OTP_IDENT_FAILED);
            case ErrorCodes.MORPHOERR_NO_MORE_OTP:
                return context.getResources().getString(R.string.MORPHOERR_NO_MORE_OTP);
            case ErrorCodes.MORPHOERR_OTP_NO_HIT:
                return context.getResources().getString(R.string.MORPHOERR_OTP_NO_HIT);
            case ErrorCodes.MORPHOERR_OTP_ENROLL_NEEDED:
                return context.getResources().getString(R.string.MORPHOERR_OTP_ENROLL_NEEDED);
            case ErrorCodes.MORPHOERR_DEVICE_LOCKED:
                return context.getResources().getString(R.string.MORPHOERR_DEVICE_LOCKED);
            case ErrorCodes.MORPHOERR_DEVICE_NOT_LOCK:
                return context.getResources().getString(R.string.MORPHOERR_DEVICE_NOT_LOCK);
            case ErrorCodes.MORPHOERR_OTP_LOCK_GEN_OTP:
                return context.getResources().getString(R.string.MORPHOERR_OTP_LOCK_GEN_OTP);
            case ErrorCodes.MORPHOERR_OTP_LOCK_SET_PARAM:
                return context.getResources().getString(R.string.MORPHOERR_OTP_LOCK_SET_PARAM);
            case ErrorCodes.MORPHOERR_OTP_LOCK_ENROLL:
                return context.getResources().getString(R.string.MORPHOERR_OTP_LOCK_ENROLL);
            case ErrorCodes.MORPHOERR_FVP_MINUTIAE_SECURITY_MISMATCH:
                return context.getResources().getString(R.string.MORPHOERR_FVP_MINUTIAE_SECURITY_MISMATCH);
            case ErrorCodes.MORPHOERR_FVP_FINGER_MISPLACED_OR_WITHDRAWN:
                return context.getResources().getString(R.string.MORPHOERR_FVP_FINGER_MISPLACED_OR_WITHDRAWN);
            case ErrorCodes.MORPHOERR_LICENSE_MISSING:
                return context.getResources().getString(R.string.MORPHOERR_LICENSE_MISSING);
            case ErrorCodes.MORPHOERR_CANT_GRAN_PERMISSION_USB:
                return context.getResources().getString(R.string.MORPHOERR_CANT_GRAN_PERMISSION_USB);
            case ErrorCodes.MORPHOERR_CAPTURE_FAILED:
                return context.getResources().getString(R.string.MORPHOERR_CAPTURE_FAILED);
            default:
                return String.format("Unknown error %d, Internal Error = %d", iCodeError, iInternalError);
        }
    }

    @Override
    public void update(Observable observable, Object o) {

    }
}
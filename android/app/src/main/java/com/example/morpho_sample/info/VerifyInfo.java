// The present software is not subject to the US Export Administration Regulations (no exportation license required), May 2012
package com.example.morpho_sample.info;

import android.net.Uri;

import com.example.morpho_sample.info.subtype.AuthenticationMode;

import java.util.LinkedList;
import java.util.List;

public class VerifyInfo extends MorphoInfo
{
	private static VerifyInfo	mInstance	= null;

	public static VerifyInfo getInstance()
	{
		if (mInstance == null)
		{
			mInstance = new VerifyInfo();
			mInstance.reset();
		}
		return mInstance;
	}

	private VerifyInfo()
	{
	}

	private AuthenticationMode authenticationMode	= AuthenticationMode.Database;
	private List<Uri> mSelectedUriList			=  new LinkedList<Uri>();

	public String toString()
	{
		return "authenticationMode:\t" + authenticationMode + "\r\n" + "Selected files count:\t" + mSelectedUriList.size();
	}

	public void reset()
	{
		authenticationMode = AuthenticationMode.Database;
		mSelectedUriList.clear();
	}
	public void clearUriList()
	{
		mSelectedUriList.clear();
	}
	public AuthenticationMode getAuthenticationMode()
	{
		return authenticationMode;
	}

	public void setAuthenticationMode(AuthenticationMode authenticationMode)
	{
		this.authenticationMode = authenticationMode;
	}

	public List<Uri> getSelectedUriList()
	{
		return mSelectedUriList;
	}

	public void addUriInlist(Uri uri)
	{
		mSelectedUriList.add(uri);
	}
}

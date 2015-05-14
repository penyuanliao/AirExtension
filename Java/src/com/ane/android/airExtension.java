package com.ane.android;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class airExtension implements FREExtension
{
	public static airExtensionContext context;
	@Override
	public FREContext createContext(String arg0) 
	{
		context = new airExtensionContext();
		return context;
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		context = null;
	}

	@Override
	public void initialize() {
		// TODO Auto-generated method stub

	}

}

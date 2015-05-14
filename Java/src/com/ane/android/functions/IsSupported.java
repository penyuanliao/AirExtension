package com.ane.android.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class IsSupported implements FREFunction {
	
	@Override
	public FREObject call(FREContext _context, FREObject[] args) {
		FREObject result = null;
		
		_context.dispatchStatusEventAsync("DEVICE_EVENT", "isSupported");
		
		try
		{
			result = FREObject.newObject(true);
			return result;
			
		}catch (FREWrongThreadException e)
		{
			e.printStackTrace();
			
			return null;
		}
		
		
	}

}

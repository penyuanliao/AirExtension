package com.ane.android;

import java.util.Map;
import java.util.HashMap;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.ane.android.functions.*;

public class airExtensionContext extends FREContext {
	
	@Override
	public void dispose() 
	{
        
	}

	@Override
	public Map<String, FREFunction> getFunctions() 
	{
		Map<String, FREFunction> funcs = new HashMap<String, FREFunction>();
		
		funcs.put("isSupported", 		 new IsSupported());
		
        funcs.put("openUrl",             new OpenURL());
        
        funcs.put("SystemExit",          new SystemExit());
        
		return funcs;
	}

}

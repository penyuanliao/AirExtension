package com.ane.android.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

import android.content.Intent;
import android.net.Uri;

public class OpenURL implements FREFunction {
	
	@Override
	public FREObject call(FREContext _context, FREObject[] args) {
		
        String str = null;
        try
        {
            str = args[0].getAsString();
        }
        catch (Exception e)
        {
           e.printStackTrace();
            return null;
        }
        _context.dispatchStatusEventAsync("DEVICE_EVENT", "OpenURL");
        
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(str));
        _context.getActivity().startActivity(intent);

        return null;
		
		
	}

}

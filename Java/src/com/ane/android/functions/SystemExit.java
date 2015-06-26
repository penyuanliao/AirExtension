package com.ane.android.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

import android.content.Intent;
import android.net.Uri;

public class SystemExit implements FREFunction {
    
    @Override
    public FREObject call(FREContext _context, FREObject[] args) {
        
        _context.getActivity().finish();
        
        return null;
        
        
    }
    
}

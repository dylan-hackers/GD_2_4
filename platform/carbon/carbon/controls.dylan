module: carbon

/*
	Mac Control Manager
*/

/*
   TODO: Is it ControlRef or ControlHandle?
*/


/*
	Includes
*/

c-include( "Carbon.h" );

/*
	Constants
	Incomplete.
*/  


define constant $pushButProc :: <integer>				= 0;
define constant $checkBoxProc :: <integer>				= 1;
define constant $radioButProc :: <integer>				= 2;
define constant $scrollBarProc :: <integer>				= 16;
define constant $popupMenuProc :: <integer>				= 1008;


define constant $kControlUserPaneProc	:: <integer> = c-expr(int: "kControlUserPaneProc");
define constant $kControlEditTextProc :: <integer>				= 272; /* Appearance 1.0 or higher */
define constant $kControlEditTextPasswordProc :: <integer> 		= 274; /* Appearance 1.0 or higher */
define constant $kControlEditTextInlineInputProc :: <integer> 	= 276; /* Appearance 1.1 Can't combine with the other variants*/

define constant $kControlStaticTextProc :: <integer>		= 288; /* Appearance 1.0 or higher */ 

define constant $kControlPictureProc :: <integer>			= 304; /* Appearance 1.0 or higher */
define constant $kControlPictureNoTrackProc :: <integer>	= 305; /* Appearance 1.0 or higher */		

define constant $kControlSeparatorLineProc	:: <integer> = c-expr(int: "kControlSeparatorLineProc");
define constant $kControlGroupBoxTextTitleProc	:: <integer> = c-expr(int: "kControlGroupBoxTextTitleProc");
define constant $kControlGroupBoxSecondaryTextTitleProc	:: <integer> = c-expr(int: "kControlGroupBoxSecondaryTextTitleProc");
define constant $kControlSliderProc	:: <integer> = c-expr(int: "kControlSliderProc");
define constant $kControlSliderLiveFeedback	:: <integer> = c-expr(int: "kControlSliderLiveFeedback");
define constant $kControlSliderHasTickMarks	:: <integer> = c-expr(int: "kControlSliderHasTickMarks");
define constant $kControlSliderReverseDirection	:: <integer> = c-expr(int: "kControlSliderReverseDirection");
define constant $kControlSliderNonDirectional	:: <integer> = c-expr(int: "kControlSliderNonDirectional");
define constant $kControlSliderPointsDownOrRight	:: <integer> = c-expr(int: "kControlSliderPointsDownOrRight");
define constant $kControlSliderPointsUpOrLeft	:: <integer> = c-expr(int: "kControlSliderPointsUpOrLeft");
define constant $kControlSliderDoesNotPoint	:: <integer> = c-expr(int: "kControlSliderDoesNotPoint");
define constant $kControlListBoxProc	:: <integer> = c-expr(int: "kControlListBoxProc");
define constant $kControlListBoxAutoSizeProc	:: <integer> = c-expr(int: "kControlListBoxAutoSizeProc");
define constant $kControlScrollBarProc	:: <integer> = c-expr(int: "kControlScrollBarProc");
define constant $kControlScrollBarLiveProc	:: <integer> = c-expr(int: "kControlScrollBarLiveProc");

define constant $kControlPushButtonProc	:: <integer> = c-expr(int: "kControlPushButtonProc");
define constant $kControlRadioButtonProc :: <integer> = c-expr(int: "kControlRadioButtonProc");
define constant $kControlCheckBoxProc	:: <integer> = c-expr(int: "kControlCheckBoxProc");

define constant $kControlLabelPart :: <integer>			= 1;
define constant $kControlMenuPart :: <integer>			= 2;
define constant $kControlTrianglePart :: <integer>		= 4;
define constant $kControlPicturePart :: <integer>			= 6;							/* Appearance 1.0 and later*/
define constant $kControlIconPart :: <integer>			= 7;							/* Appearance 1.0 and later*/
define constant $kControlClockPart :: <integer>			= 8;						/* Appearance 1.0 and later*/
define constant $kControlListBoxPart :: <integer>			= 24;							/* Appearance 1.0 and later*/
define constant $kControlListBoxDoubleClickPart :: <integer> = 25;						/* Appearance 1.0 and later*/
define constant $kControlImageWellPart :: <integer>		= 26;							/* Appearance 1.0 and later*/
define constant $kControlRadioGroupPart :: <integer>		= 27;							/* Appearance 1.0.2 and later*/
define constant $kControlButtonPart :: <integer>			= 10;
define constant $kControlCheckBoxPart :: <integer>		= 11;
define constant $kControlRadioButtonPart :: <integer>		= 11;
define constant $kControlUpButtonPart :: <integer>		= 20;
define constant $kControlDownButtonPart :: <integer>		= 21;
define constant $kControlPageUpPart :: <integer>			= 22;
define constant $kControlPageDownPart :: <integer>		= 23;
define constant $kControlClockHourDayPart :: <integer>	= 9;							/* Appearance 1.1 and later*/
define constant $kControlClockMinuteMonthPart :: <integer> = 10;						/* Appearance 1.1 and later*/
define constant $kControlClockSecondYearPart :: <integer>	= 11;							/* Appearance 1.1 and later*/
define constant $kControlClockAMPMPart :: <integer>		= 12;						/* Appearance 1.1 and later*/
define constant $kControlDataBrowserPart :: <integer>		= 24;							/* CarbonLib 1.0 and later*/
define constant $kControlDataBrowserDraggedPart :: <integer> = 25;							/* CarbonLib 1.0 and later*/
define constant $kControlEntireControl :: <integer> = c-expr(int: "kControlEntireControl");
define constant $kControlNoPart :: <integer> = c-expr(int: "kControlNoPart");
define constant $kControlEditTextPart :: <integer> = c-expr(int: "kControlEditTextPart");

define constant $kControlKindBevelButton :: <integer> = c-expr(int: "kControlKindBevelButton");
define constant $kControlKindChasingArrows :: <integer> = c-expr(int: "kControlKindChasingArrows");	
define constant $kControlKindClock :: <integer> = c-expr(int: "kControlKindClock");	
define constant $kControlKindDataBrowser :: <integer> = c-expr(int: "kControlKindDataBrowser");	
define constant $kControlKindDisclosureButton :: <integer> = c-expr(int: "kControlKindDisclosureButton");	
define constant $kControlKindDisclosureTriangle :: <integer> = c-expr(int: "kControlKindDisclosureTriangle");	
define constant $kControlKindEditText :: <integer> = c-expr(int: "kControlKindEditText");	
define constant $kControlKindGroupBox :: <integer> = c-expr(int: "kControlKindGroupBox");	
define constant $kControlKindIcon :: <integer> = c-expr(int: "kControlKindIcon");	
define constant $kControlKindImageWell :: <integer> = c-expr(int: "kControlKindImageWell");	
define constant $kControlKindListBox :: <integer> = c-expr(int: "kControlKindListBox");	
define constant $kControlKindLittleArrows :: <integer> = c-expr(int: "kControlKindLittleArrows");	
define constant $kControlKindPicture :: <integer> = c-expr(int: "kControlKindPicture");	
define constant $kControlKindPlacard :: <integer> = c-expr(int: "kControlKindPlacard");	
define constant $kControlKindPopupArrow :: <integer> = c-expr(int: "kControlKindPopupArrow");	
define constant $kControlKindPopupButton :: <integer> = c-expr(int: "kControlKindPopupButton");	
define constant $kControlKindProgressBar :: <integer> = c-expr(int: "kControlKindProgressBar");	
define constant $kControlKindPushButton :: <integer> = c-expr(int: "kControlKindPushButton");	
define constant $kControlKindRadioGroup :: <integer> = c-expr(int: "kControlKindRadioGroup");	
define constant $kControlKindRoundButton :: <integer> = c-expr(int: "kControlKindRoundButton");	
define constant $kControlKindScrollBar :: <integer> = c-expr(int: "kControlKindScrollBar");	
define constant $kControlKindScrollingTextBox :: <integer> = c-expr(int: "kControlKindScrollingTextBox");	
define constant $kControlKindSeparator :: <integer> = c-expr(int: "kControlKindSeparator");	
define constant $kControlKindSignatureApple :: <integer> = c-expr(int: "kControlKindSignatureApple");	
define constant $kControlKindSlider :: <integer> = c-expr(int: "kControlKindSlider");	
define constant $kControlKindStaticText :: <integer> = c-expr(int: "kControlKindStaticText");	
define constant $kControlKindTabs :: <integer> = c-expr(int: "kControlKindTabs");	
define constant $kControlKindUserPane :: <integer> = c-expr(int: "kControlKindUserPane");	
define constant $kControlKindWindowHeader :: <integer> = c-expr(int: "kControlKindWindowHeader");

// Tags

define constant $kControlUserPaneDrawProcTag :: <integer> = c-expr(int: "kControlUserPaneDrawProcTag");
define constant $kControlStaticTextTextTag :: <integer> = c-expr(int: "kControlStaticTextTextTag");
define constant $kControlEditTextSelectionTag :: <integer> = c-expr(int: "kControlEditTextSelectionTag");
define constant $kControlEditTextPasswordTag :: <integer> = c-expr(int: "kControlEditTextPasswordTag"); 
define constant $kControlEditTextTextTag :: <integer> = c-expr(int: "kControlEditTextTextTag");
define constant $kControlListBoxListHandleTag :: <integer> = c-expr(int: "kControlListBoxListHandleTag");
define constant $kControlEditTextValidationProcTag :: <integer> = c-expr(int: "kControlEditTextValidationProcTag");
define constant $kControlEditTextKeyFilterTag :: <integer> = c-expr(int: "kControlEditTextKeyFilterTag");
// etc.

define constant $kControlSupportsEmbedding :: <integer> = c-expr(int: "kControlSupportsEmbedding");

/*
	types
*/

define functional class <ControlHandle> ( <Handle> )
end class <ControlHandle>;

define constant <ControlActionUPP> = <UniversalProcPtr>;
define constant <ControlEditTextValidationUPP> = <UniversalProcPtr>;
define constant <ControlKeyFilterUPP> = <UniversalProcPtr>;

define constant <ControlPartCode> = <SInt16>;
define constant <ControlFocusPart> = <SInt16>;

define functional class <ControlEditTextSelectionRec*> 
  (<statically-typed-pointer>)
end class <ControlEditTextSelectionRec*>;

define method content-size
  (thing == <ControlEditTextSelectionRec*>)
=>(result :: <integer>)
  c-expr(int: "sizeof(ControlEditTextSelectionRec)");
end method content-size;

define method selStart-value
  (rec :: <ControlEditTextSelectionRec*>)
=>(result :: <integer>)
  signed-short-at(rec, offset: 0);
end method selStart-value;

define method selEnd-value
  (rec :: <ControlEditTextSelectionRec*>)
=>(result :: <integer>)
  signed-short-at(rec, offset: 0);
end method selEnd-value;

define method selStart-value-setter
  (new-value :: <integer>, rec :: <ControlEditTextSelectionRec*>)
=>(result :: <integer>)
  signed-short-at(rec, offset: 0) := new-value;
end method selStart-value-setter;

define method selEnd-value-setter
  (new-value :: <integer>, rec :: <ControlEditTextSelectionRec*>)
=>(result :: <integer>)
  signed-short-at(rec, offset: 0) := new-value;
end method selEnd-value-setter;

/*
	DrawControls
*/

define method DrawControls( window :: <WindowRef> )
=> ()

	call-out( "DrawControls", void:, ptr: window.raw-value );

	values();

end method DrawControls;


/*
	NewControl
*/

define method NewControl( window :: <WindowRef>, bounds :: <Rect*>, title :: <pascal-string>,
						 	visible :: <boolean>, initialValue :: <integer>, minimumValue :: <integer>,
							maximumValue :: <integer>, procID :: <integer>, controlReference :: <integer> )
=> ( result :: <ControlHandle> )

	let visBool = if( visible ) 1 else 0 end if;

	make( <ControlHandle>, pointer: 
		call-out( "NewControl", ptr:, ptr: window.raw-value, ptr: bounds.raw-value, 
					ptr: title.raw-value, unsigned-char: visBool, 
					short: initialValue, short: minimumValue, short: maximumValue,
					short: procID, long: controlReference ) );

end method NewControl;
								 
								 	
/*
	DisposeControl
*/

define method DisposeControl( control :: <ControlHandle> )
=> ()
	
	call-out( "DisposeControl", void:, ptr: control.raw-value );
	
	values();
	
end method DisposeControl;		

/*
	KillControls
*/

define method KillControls( window :: <WindowRef> )	
=> ()
	
	call-out( "KillControls", void:, ptr: window.raw-value );
	
	values();

end method KillControls;		


								 
								 	
/*
	GetControlBounds
*/

define method GetControlBounds( control :: <ControlHandle>, r :: <Rect*> )
=> (r :: <Rect*>)
	
	call-out( "GetControlBounds", void:, ptr: control.raw-value, ptr: r.raw-value );
	
	r;
	
end method GetControlBounds;		



/*
	HiliteControl
*/

define method HiliteControl( control :: <ControlHandle>, part :: <integer> )
=> ()
	
	call-out( "HiliteControl", void:, ptr: control.raw-value, short: part );
	
	values();
	
end method HiliteControl;	


/*
	ShowControl
*/

define method ShowControl( control :: <ControlHandle> )
=> ()
	
	call-out( "ShowControl", void:, ptr: control.raw-value );
	
	values();
	
end method ShowControl;	


/*
	HideControl
*/

define method HideControl( control :: <ControlHandle> )
=> ()
	
	call-out( "HideControl", void:, ptr: control.raw-value );
	
	values();
	
end method HideControl;


/*
	GetControlValue
*/

define method GetControlValue( control :: <ControlHandle> )
=> ( result :: <integer> )
	
	call-out( "GetControlValue", short:, ptr: control.raw-value );
	
end method GetControlValue;


/*
	SetControlValue
*/

define method SetControlValue( control :: <ControlHandle>, value :: <integer> )
=> ()
	
	call-out( "SetControlValue", void:, ptr: control.raw-value, short: value );
	
	values();

end method SetControlValue;


/*
	MoveControl
*/

define method MoveControl( control :: <ControlHandle>, h :: <integer>, v :: <integer> )
=> ()
	
	call-out( "MoveControl", void:, ptr: control.raw-value, short: h, short: v );
	
	values();

end method MoveControl;


/*
	SizeControl
*/

define method SizeControl( control :: <ControlHandle>, h :: <integer>, v :: <integer> )
=> ()
	
	call-out( "SizeControl", void:, ptr: control.raw-value, short: h, short: v );
	
	values();

end method SizeControl;


/*
	SetControlTitle
*/

define method SetControlTitle( item :: <ControlHandle>, text :: <pascal-string> )
=> ()
	
	call-out( "SetControlTitle", void:, ptr: item.raw-value, ptr: text.raw-value );
	
	values();

end method SetControlTitle;


/*
	GetControlTitle
*/

define method GetControlTitle( item :: <ControlHandle>, text :: <pascal-string> )
=> ()
	
	call-out( "GetControlTitle", void:, ptr: item.raw-value, ptr: text.raw-value );
	
	values();

end method GetControlTitle;


/*
	DragControl
*/

define method DragControl( control :: <ControlHandle> , start :: <Point*>, limit<Rect*> :: <Rect*>, slop<Rect*> :: <Rect*>, axis :: <integer>)
=> ()

	call-out( "dragcontrol", void:, ptr: control.raw-value, ptr: start.raw-value, 
				ptr: limit<Rect*>.raw-value, ptr: slop<Rect*>.raw-value, short: axis );

	values();

end method DragControl;


/*
	FindControl
*/

define method FindControl( point :: <Point*>, window :: <WindowRef> )
=> ( control :: <ControlHandle>, result :: <ControlPartCode> )

    let temp = make( <Handle> ); // used as a pointer parameter
    let result = call-out( "findcontrol", short:, ptr: point.raw-value, ptr: window.raw-value, ptr: temp.raw-value );
    values( pointer-at( temp, offset: 0, class: <ControlHandle> ), as( <ControlPartCode>, result ) );

end method FindControl;


/*
	HandleControlClick
*/

define method HandleControlClick( inControl :: <ControlHandle>, inWhere :: <Point*>, 
                                    inModifiers :: <EventModifiers>, inAction :: <ControlActionUPP> )
=> ( result :: <ControlPartCode> )

	call-out( "handlecontrolclick", short:, ptr: inControl.raw-value, ptr: inWhere.raw-value, 
                    short: inModifiers, ptr: inAction.raw-value );

end method HandleControlClick;

/*
	HandleControlKey
*/

define method HandleControlKey( control :: <ControlHandle>, inKeyCode :: <SInt16>, 
                                inCharCode :: <SInt16>, inModifiers :: <EventModifiers> )
=> ( result :: <SInt16> )

	call-out( "HandleControlKey", short:, ptr: control.raw-value, short: inKeyCode,
                    short: inCharCode, int: inModifiers );

end method HandleControlKey;


/*
	IdleControls
*/

define method IdleControls( window :: <WindowRef> )
=> ()

    call-out( "IdleControls", void:, ptr: window.raw-value, );
    values()

end method IdleControls;


/*
	TrackControl
*/

define method TrackControl( control :: <ControlHandle>, point :: <Point*>, proc :: <ControlActionUPP> )
=> ( result :: <integer> )

	call-out( "trackcontrol", short:, ptr: control.raw-value, ptr: point.raw-value, ptr: proc.raw-value );

end method TrackControl;

/*
	TestControl
*/

define method TestControl( control :: <ControlHandle>, point :: <Point*> )
=> ( result :: <integer> )

	call-out( "testcontrol", short:, ptr: control.raw-value, ptr: point.raw-value );

end method TestControl;

/*
    Keyboard Focus. Appearance 1.0+
*/

/*
    AdvanceKeyboardFocus
*/

define method AdvanceKeyboardFocus( inWindow :: <WindowRef> )
=> ( result :: <OSErr> )

	call-out( "AdvanceKeyboardFocus", int:, ptr: inWindow.raw-value );

end method AdvanceKeyboardFocus;

/*
    ClearKeyboardFocus
*/

define method ClearKeyboardFocus( inWindow :: <WindowRef> )
=> ( result :: <OSErr> )

	call-out( "ClearKeyboardFocus", int:, ptr: inWindow.raw-value );

end method ClearKeyboardFocus;

/*
    GetKeyboardFocus
*/

define method GetKeyboardFocus( inWindow :: <WindowRef> )
=> ( control :: <ControlHandle>, error :: <OSErr> )

        let temp = make( <Handle> );	// Used as a ControlHandle * parameter
	let error = call-out( "GetKeyboardFocus", int:, ptr: inWindow.raw-value, ptr: temp.raw-value );
        values( pointer-at( temp, offset: 0, class: <ControlHandle> ), as( <OSErr>, error) );

end method GetKeyboardFocus;


/*
    ReverseKeyboardFocus
*/

define method ReverseKeyboardFocus( inWindow :: <WindowRef> )
=> ( result :: <OSErr> )

	call-out( "ReverseKeyboardFocus", int:, ptr: inWindow.raw-value );

end method ReverseKeyboardFocus;


/*
    SetKeyboardFocus
*/

define method SetKeyboardFocus( inWindow :: <WindowRef>, inControl :: <ControlHandle>,
                                inPart :: <ControlFocusPart> )
=> ( result :: <OSErr> )

	call-out( "SetKeyboardFocus", int:, ptr: inWindow.raw-value, ptr: inControl.raw-value,
                    short: inPart );

end method SetKeyboardFocus;

/*
    IsControlVisible
*/

define method IsControlVisible( inControl :: <ControlHandle> )
=> ( result :: <OSErr> )

	if( call-out( "IsControlVisible", int:, ptr: inControl.raw-value ))
    #t;
  else
    #f;
  end;

end method IsControlVisible;

/*
    CreateRootControl
*/

define method CreateRootControl( for-window :: <WindowRef> )
=> ( result :: <OSErr>, root-control :: <ControlHandle> )

  let temp :: <Handle> = make(<Handle>);
	let err = call-out( "CreateRootControl", int:, ptr: for-window.raw-value, ptr: temp.raw-value );
  values(as(<OSErr>, err), pointer-at(temp, class: <ControlHandle>, offset: 0));

end method CreateRootControl;

/*
  SetControlData
*/

define method SetControlData( inControl :: <ControlHandle>, inPart :: <integer>, inTagName :: <integer>,
                        inSize :: <integer>, inData :: <statically-typed-pointer>)
=> (result :: <OSErr>)
  as(<OSErr>, call-out("SetControlData", int:, ptr: inControl.raw-value, short: inPart, int: inTagName,
                        int: inSize, ptr: inData.raw-value));
end method SetControlData;

define method SetControlData( inControl :: <ControlHandle>, inPart :: <integer>, inTagName :: <integer>,
                        inSize :: <integer>, inData :: <raw-pointer>)
=> (result :: <OSErr>)
  as(<OSErr>, call-out("SetControlData", int:, ptr: inControl.raw-value, short: inPart, int: inTagName,
                        int: inSize, ptr: inData));
end method SetControlData;

/*
  GetControlData
*/

define method GetControlData( inControl :: <ControlHandle>, inPart :: <integer>, inTagName :: <integer>,
                        inSize :: <integer>, inData :: <statically-typed-pointer>)
=> (result :: <OSErr>, outSize :: <integer>)
  let temp :: <Handle> = make(<Handle>);
  values(as(<OSErr>, call-out("GetControlData", int:, ptr: inControl.raw-value, short: inPart, int: inTagName,
                        int: inSize, ptr: inData.raw-value, ptr: temp.raw-value)),
  signed-long-at(temp, offset: 0));	// Yes, signed
end method GetControlData;

define method GetControlData( inControl :: <ControlHandle>, inPart :: <integer>, inTagName :: <integer>,
                        inSize :: <integer>, inData :: <raw-pointer>)
=> (result :: <OSErr>, outSize :: <integer>)
  let temp :: <Handle> = make(<Handle>);
  values(as(<OSErr>, call-out("GetControlData", int:, ptr: inControl.raw-value, short: inPart, int: inTagName,
                        int: inSize, ptr: inData, ptr: temp.raw-value)),
  signed-long-at(temp, offset: 0));	// Yes, signed
end method GetControlData;

/*
  GetControlDataSize
*/

define method GetControlDataSize( inControl :: <ControlHandle>, inPart :: <integer>, inTagName :: <integer>)
=> (result :: <OSErr>, outSize :: <integer>)
  let temp :: <Handle> = make(<Handle>);
  values(as(<OSErr>, call-out("GetControlDataSize", int:, ptr: inControl.raw-value, short: inPart, int: inTagName,
                        ptr: temp.raw-value)),
  signed-long-at(temp, offset: 0));	// Yes, signed
end method GetControlDataSize;


/*
		NewControlUserPaneDrawUPP
*/

define method NewControlUserPaneDrawUPP( userRoutine ) //:: <callback-function> )
=> ( UPP :: <UniversalProcPtr> )
	let result = call-out( "NewControlUserPaneDrawUPP", ptr:, ptr: userRoutine.callback-entry );
	make( <UniversalProcPtr>, pointer: result );
end method NewControlUserPaneDrawUPP;

define method NewControlUserPaneDrawUPP( userRoutine :: <function-pointer> )	//  :: <callback-function>
=> ( UPP :: <UniversalProcPtr> )
	let result = call-out( "NewControlUserPaneDrawUPP", ptr:, ptr: userRoutine.raw-value );
	make( <UniversalProcPtr>, pointer: result );
end method NewControlUserPaneDrawUPP;

/*
		NewControlEditTextValidationUPP
*/

define method NewControlEditTextValidationUPP( userRoutine ) //:: <callback-function> )
=> ( UPP :: <UniversalProcPtr> )
	let result = call-out( "NewControlEditTextValidationUPP", ptr:, ptr: userRoutine.callback-entry );
	make( <UniversalProcPtr>, pointer: result );
end method NewControlEditTextValidationUPP;

define method NewControlEditTextValidationUPP( userRoutine :: <function-pointer> )	//  :: <callback-function>
=> ( UPP :: <UniversalProcPtr> )
	let result = call-out( "NewControlEditTextValidationUPP", ptr:, ptr: userRoutine.raw-value );
	make( <UniversalProcPtr>, pointer: result );
end method NewControlEditTextValidationUPP;

/*
		NewControlKeyFilterUPP
*/

define method NewControlKeyFilterUPP( userRoutine ) //:: <callback-function> )
=> ( UPP :: <UniversalProcPtr> )
	let result = call-out( "NewControlKeyFilterUPP", ptr:, ptr: userRoutine.callback-entry );
	make( <UniversalProcPtr>, pointer: result );
end method NewControlKeyFilterUPP;

define method NewControlKeyFilterUPP( userRoutine :: <function-pointer> )	//  :: <callback-function>
=> ( UPP :: <UniversalProcPtr> )
	let result = call-out( "NewControlKeyFilterUPP", ptr:, ptr: userRoutine.raw-value );
	make( <UniversalProcPtr>, pointer: result );
end method NewControlKeyFilterUPP;


/*
		NewControlActionUPP
*/

define method NewControlActionUPP( userRoutine ) //:: <callback-function> )
=> ( UPP :: <UniversalProcPtr> )
	let result = call-out( "NewControlActionUPP", ptr:, ptr: userRoutine.callback-entry );
	make( <UniversalProcPtr>, pointer: result );
end method NewControlActionUPP;

define method NewControlActionUPP( userRoutine :: <function-pointer> )	//  :: <callback-function>
=> ( UPP :: <UniversalProcPtr> )
	let result = call-out( "NewControlActionUPP", ptr:, ptr: userRoutine.raw-value );
	make( <UniversalProcPtr>, pointer: result );
end method NewControlActionUPP;



/*
  EmbedControl
*/

define method EmbedControl( inControl :: <ControlHandle>, inContainer :: <ControlHandle>)
=> (result :: <OSErr>)
  as(<OSErr>, call-out("EmbedControl", int:, ptr: inControl.raw-value, 
                        ptr: inContainer.raw-value));
end method EmbedControl;


define method GetBestControlRect(inControl :: <ControlHandle>, 
                                  outRect :: <Rect*>)
=> (result :: <OSErr>, baselineOffset :: <integer>)
  let temp :: <Handle> = make(<Handle>);
  values(as(<OSErr>, call-out("GetBestControlRect", int:, ptr: inControl.raw-value, 
                        ptr: outRect.raw-value, ptr: temp.raw-value)),
     signed-short-at(temp, offset: 0));
end method GetBestControlRect;

define method ActivateControl( inControl :: <ControlHandle>)
=> (result :: <OSErr>)
  as(<OSErr>, call-out("ActivateControl", int:, ptr: inControl.raw-value));
end method ActivateControl;

define method DeactivateControl( inControl :: <ControlHandle>)
=> (result :: <OSErr>)
  as(<OSErr>, call-out("DeactivateControl", int:, ptr: inControl.raw-value));
end method DeactivateControl;


// 32 Bit

define method SetControl32BitValue
    (inControl :: <ControlHandle>, value :: <integer>) => ()
  call-out("SetControl32BitValue", void:, ptr: inControl.raw-value, int: value);
end method SetControl32BitValue;

define method SetControl32BitMinimum
    (inControl :: <ControlHandle>, value :: <integer>) => ()
  call-out("SetControl32BitMinimum", void:, ptr: inControl.raw-value, int: value);
end method SetControl32BitMinimum;

define method SetControl32BitMaximum
    (inControl :: <ControlHandle>, value :: <integer>) => ()
  call-out("SetControl32BitMaximum", void:, ptr: inControl.raw-value, int: value);
end method SetControl32BitMaximum;

define method SetControlViewSize
    (inControl :: <ControlHandle>, value :: <integer>) => ()
  call-out("SetControlViewSize", void:, ptr: inControl.raw-value, int: value);
end method SetControlViewSize;


define method GetControl32BitValue(inControl :: <ControlHandle>)
=> (value :: <integer>)
  call-out("GetControl32BitValue", int:, ptr: inControl.raw-value);
end method GetControl32BitValue;

define method GetControl32BitMinimum(inControl :: <ControlHandle>)
=> (value :: <integer>)
  call-out("GetControl32BitMinimum", int:, ptr: inControl.raw-value);
end method GetControl32BitMinimum;

define method GetControl32BitMaximum(inControl :: <ControlHandle>)
=> (value :: <integer>)
  call-out("GetControl32BitMaximum", int:, ptr: inControl.raw-value);
end method GetControl32BitMaximum;

define method GetControlViewSize(inControl :: <ControlHandle>)
=> (value :: <integer>)
  call-out("GetControlViewSize", int:, ptr: inControl.raw-value);
end method GetControlViewSize;

// Actions

define method SetControlAction
    (inControl :: <ControlHandle>, action :: <UniversalProcPtr>) => ()
  call-out("SetControlAction", void:, ptr: inControl.raw-value, ptr: action.raw-value);
end method SetControlAction;
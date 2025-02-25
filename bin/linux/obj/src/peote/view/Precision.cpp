// Generated by Haxe 5.0.0-alpha.1+1423a5f
#include <hxcpp.h>

#ifndef INCLUDED_peote_view_Precision
#include <peote/view/Precision.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_9352486c47d2fdec_240_boot,"peote.view.Precision","boot",0xd8e62e48,"peote.view.Precision.boot","peote/view/PeoteGL.hx",240,0x90807f54)
HX_LOCAL_STACK_FRAME(_hx_pos_9352486c47d2fdec_241_boot,"peote.view.Precision","boot",0xd8e62e48,"peote.view.Precision.boot","peote/view/PeoteGL.hx",241,0x90807f54)
HX_LOCAL_STACK_FRAME(_hx_pos_9352486c47d2fdec_242_boot,"peote.view.Precision","boot",0xd8e62e48,"peote.view.Precision.boot","peote/view/PeoteGL.hx",242,0x90807f54)
HX_LOCAL_STACK_FRAME(_hx_pos_9352486c47d2fdec_243_boot,"peote.view.Precision","boot",0xd8e62e48,"peote.view.Precision.boot","peote/view/PeoteGL.hx",243,0x90807f54)
HX_LOCAL_STACK_FRAME(_hx_pos_9352486c47d2fdec_244_boot,"peote.view.Precision","boot",0xd8e62e48,"peote.view.Precision.boot","peote/view/PeoteGL.hx",244,0x90807f54)
HX_LOCAL_STACK_FRAME(_hx_pos_9352486c47d2fdec_245_boot,"peote.view.Precision","boot",0xd8e62e48,"peote.view.Precision.boot","peote/view/PeoteGL.hx",245,0x90807f54)
namespace peote{
namespace view{

void Precision_obj::__construct() { }

Dynamic Precision_obj::__CreateEmpty() { return new Precision_obj; }

void *Precision_obj::_hx_vtable = 0;

Dynamic Precision_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Precision_obj > _hx_result = new Precision_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Precision_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x50027352;
}

 ::Dynamic Precision_obj::VertexFloat;

 ::Dynamic Precision_obj::VertexInt;

 ::Dynamic Precision_obj::VertexSampler;

 ::Dynamic Precision_obj::FragmentFloat;

 ::Dynamic Precision_obj::FragmentInt;

 ::Dynamic Precision_obj::FragmentSampler;


Precision_obj::Precision_obj()
{
}

bool Precision_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"VertexInt") ) { outValue = ( VertexInt ); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"VertexFloat") ) { outValue = ( VertexFloat ); return true; }
		if (HX_FIELD_EQ(inName,"FragmentInt") ) { outValue = ( FragmentInt ); return true; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"VertexSampler") ) { outValue = ( VertexSampler ); return true; }
		if (HX_FIELD_EQ(inName,"FragmentFloat") ) { outValue = ( FragmentFloat ); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"FragmentSampler") ) { outValue = ( FragmentSampler ); return true; }
	}
	return false;
}

bool Precision_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"VertexInt") ) { VertexInt=ioValue.Cast<  ::Dynamic >(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"VertexFloat") ) { VertexFloat=ioValue.Cast<  ::Dynamic >(); return true; }
		if (HX_FIELD_EQ(inName,"FragmentInt") ) { FragmentInt=ioValue.Cast<  ::Dynamic >(); return true; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"VertexSampler") ) { VertexSampler=ioValue.Cast<  ::Dynamic >(); return true; }
		if (HX_FIELD_EQ(inName,"FragmentFloat") ) { FragmentFloat=ioValue.Cast<  ::Dynamic >(); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"FragmentSampler") ) { FragmentSampler=ioValue.Cast<  ::Dynamic >(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *Precision_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo Precision_obj_sStaticStorageInfo[] = {
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Precision_obj::VertexFloat,HX_("VertexFloat",78,27,05,fb)},
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Precision_obj::VertexInt,HX_("VertexInt",cb,ff,f6,ca)},
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Precision_obj::VertexSampler,HX_("VertexSampler",e4,55,f9,3d)},
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Precision_obj::FragmentFloat,HX_("FragmentFloat",8c,d3,31,c3)},
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Precision_obj::FragmentInt,HX_("FragmentInt",df,be,66,88)},
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Precision_obj::FragmentSampler,HX_("FragmentSampler",f8,2e,b8,eb)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static void Precision_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Precision_obj::VertexFloat,"VertexFloat");
	HX_MARK_MEMBER_NAME(Precision_obj::VertexInt,"VertexInt");
	HX_MARK_MEMBER_NAME(Precision_obj::VertexSampler,"VertexSampler");
	HX_MARK_MEMBER_NAME(Precision_obj::FragmentFloat,"FragmentFloat");
	HX_MARK_MEMBER_NAME(Precision_obj::FragmentInt,"FragmentInt");
	HX_MARK_MEMBER_NAME(Precision_obj::FragmentSampler,"FragmentSampler");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Precision_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Precision_obj::VertexFloat,"VertexFloat");
	HX_VISIT_MEMBER_NAME(Precision_obj::VertexInt,"VertexInt");
	HX_VISIT_MEMBER_NAME(Precision_obj::VertexSampler,"VertexSampler");
	HX_VISIT_MEMBER_NAME(Precision_obj::FragmentFloat,"FragmentFloat");
	HX_VISIT_MEMBER_NAME(Precision_obj::FragmentInt,"FragmentInt");
	HX_VISIT_MEMBER_NAME(Precision_obj::FragmentSampler,"FragmentSampler");
};

#endif

::hx::Class Precision_obj::__mClass;

static ::String Precision_obj_sStaticFields[] = {
	HX_("VertexFloat",78,27,05,fb),
	HX_("VertexInt",cb,ff,f6,ca),
	HX_("VertexSampler",e4,55,f9,3d),
	HX_("FragmentFloat",8c,d3,31,c3),
	HX_("FragmentInt",df,be,66,88),
	HX_("FragmentSampler",f8,2e,b8,eb),
	::String(null())
};

void Precision_obj::__register()
{
	Precision_obj _hx_dummy;
	Precision_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("peote.view.Precision",18,ee,f5,54);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Precision_obj::__GetStatic;
	__mClass->mSetStaticField = &Precision_obj::__SetStatic;
	__mClass->mMarkFunc = Precision_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(Precision_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< Precision_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Precision_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Precision_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Precision_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void Precision_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_9352486c47d2fdec_240_boot)
HXDLIN( 240)		VertexFloat =  ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("medium",75,54,c8,fe),0)
            			->setFixed(1,HX_("low",94,54,52,00),0)
            			->setFixed(2,HX_("high",62,37,0e,45),0));
            	}
{
            	HX_STACKFRAME(&_hx_pos_9352486c47d2fdec_241_boot)
HXDLIN( 241)		VertexInt =  ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("medium",75,54,c8,fe),0)
            			->setFixed(1,HX_("low",94,54,52,00),0)
            			->setFixed(2,HX_("high",62,37,0e,45),0));
            	}
{
            	HX_STACKFRAME(&_hx_pos_9352486c47d2fdec_242_boot)
HXDLIN( 242)		VertexSampler =  ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("medium",75,54,c8,fe),0)
            			->setFixed(1,HX_("low",94,54,52,00),0)
            			->setFixed(2,HX_("high",62,37,0e,45),0));
            	}
{
            	HX_STACKFRAME(&_hx_pos_9352486c47d2fdec_243_boot)
HXDLIN( 243)		FragmentFloat =  ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("medium",75,54,c8,fe),0)
            			->setFixed(1,HX_("low",94,54,52,00),0)
            			->setFixed(2,HX_("high",62,37,0e,45),0));
            	}
{
            	HX_STACKFRAME(&_hx_pos_9352486c47d2fdec_244_boot)
HXDLIN( 244)		FragmentInt =  ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("medium",75,54,c8,fe),0)
            			->setFixed(1,HX_("low",94,54,52,00),0)
            			->setFixed(2,HX_("high",62,37,0e,45),0));
            	}
{
            	HX_STACKFRAME(&_hx_pos_9352486c47d2fdec_245_boot)
HXDLIN( 245)		FragmentSampler =  ::Dynamic(::hx::Anon_obj::Create(3)
            			->setFixed(0,HX_("medium",75,54,c8,fe),0)
            			->setFixed(1,HX_("low",94,54,52,00),0)
            			->setFixed(2,HX_("high",62,37,0e,45),0));
            	}
}

} // end namespace peote
} // end namespace view

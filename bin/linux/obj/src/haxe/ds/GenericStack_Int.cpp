// Generated by Haxe 5.0.0-alpha.1+1423a5f
#include <hxcpp.h>

#ifndef INCLUDED_haxe_ds_GenericCell_Int
#include <haxe/ds/GenericCell_Int.h>
#endif
#ifndef INCLUDED_haxe_ds_GenericStack_Int
#include <haxe/ds/GenericStack_Int.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_3961c4e86dc3b25e_107_new,"haxe.ds.GenericStack_Int","new",0x59a8c48a,"haxe.ds.GenericStack_Int.new","haxe/ds/GenericStack.hx",107,0x77bce356)
namespace haxe{
namespace ds{

void GenericStack_Int_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_3961c4e86dc3b25e_107_new)
            	}

Dynamic GenericStack_Int_obj::__CreateEmpty() { return new GenericStack_Int_obj; }

void *GenericStack_Int_obj::_hx_vtable = 0;

Dynamic GenericStack_Int_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< GenericStack_Int_obj > _hx_result = new GenericStack_Int_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool GenericStack_Int_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x4fce5456;
}


GenericStack_Int_obj::GenericStack_Int_obj()
{
}

void GenericStack_Int_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(GenericStack_Int);
	HX_MARK_MEMBER_NAME(head,"head");
	HX_MARK_END_CLASS();
}

void GenericStack_Int_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(head,"head");
}

::hx::Val GenericStack_Int_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"head") ) { return ::hx::Val( head ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val GenericStack_Int_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"head") ) { head=inValue.Cast<  ::haxe::ds::GenericCell_Int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void GenericStack_Int_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("head",20,29,0b,45));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo GenericStack_Int_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::haxe::ds::GenericCell_Int */ ,(int)offsetof(GenericStack_Int_obj,head),HX_("head",20,29,0b,45)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *GenericStack_Int_obj_sStaticStorageInfo = 0;
#endif

static ::String GenericStack_Int_obj_sMemberFields[] = {
	HX_("head",20,29,0b,45),
	::String(null()) };

::hx::Class GenericStack_Int_obj::__mClass;

void GenericStack_Int_obj::__register()
{
	GenericStack_Int_obj _hx_dummy;
	GenericStack_Int_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("haxe.ds.GenericStack_Int",98,77,7d,84);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(GenericStack_Int_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< GenericStack_Int_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = GenericStack_Int_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = GenericStack_Int_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace haxe
} // end namespace ds

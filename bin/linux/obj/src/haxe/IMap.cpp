// Generated by Haxe 5.0.0-alpha.1+1423a5f
#include <hxcpp.h>

#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif

namespace haxe{


static ::String IMap_obj_sMemberFields[] = {
	HX_("get",96,80,4e,00),
	HX_("set",a2,9b,57,00),
	HX_("remove",44,9c,88,04),
	HX_("keys",f4,e1,06,47),
	::String(null()) };

::hx::Class IMap_obj::__mClass;

void IMap_obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("haxe.IMap",1b,07,35,eb);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(IMap_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TIsInterface< (int)0x09c2bd39 >;
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace haxe

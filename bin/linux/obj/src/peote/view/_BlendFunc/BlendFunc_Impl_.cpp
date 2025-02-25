// Generated by Haxe 5.0.0-alpha.1+1423a5f
#include <hxcpp.h>

#ifndef INCLUDED_lime__internal_backend_native_NativeOpenGLRenderContext
#include <lime/_internal/backend/native/NativeOpenGLRenderContext.h>
#endif
#ifndef INCLUDED_peote_view__BlendFunc_BlendFunc_Impl_
#include <peote/view/_BlendFunc/BlendFunc_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_0e381e6947c3efdc_13_toGL,"peote.view._BlendFunc.BlendFunc_Impl_","toGL",0x9032ad0b,"peote.view._BlendFunc.BlendFunc_Impl_.toGL","peote/view/BlendFunc.hx",13,0x6222ed6f)
namespace peote{
namespace view{
namespace _BlendFunc{

void BlendFunc_Impl__obj::__construct() { }

Dynamic BlendFunc_Impl__obj::__CreateEmpty() { return new BlendFunc_Impl__obj; }

void *BlendFunc_Impl__obj::_hx_vtable = 0;

Dynamic BlendFunc_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< BlendFunc_Impl__obj > _hx_result = new BlendFunc_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool BlendFunc_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x404c8e53;
}

int BlendFunc_Impl__obj::toGL(int this1, ::lime::_internal::backend::native::NativeOpenGLRenderContext gl){
            	HX_STACKFRAME(&_hx_pos_0e381e6947c3efdc_13_toGL)
HXDLIN(  13)		switch((int)(this1)){
            			case (int)0: {
HXLINE(  14)				return gl->FUNC_ADD;
            			}
            			break;
            			case (int)1: {
HXLINE(  15)				return gl->FUNC_SUBTRACT;
            			}
            			break;
            			case (int)2: {
HXLINE(  16)				return gl->FUNC_REVERSE_SUBTRACT;
            			}
            			break;
            			case (int)3: {
HXLINE(  17)				return gl->MIN;
            			}
            			break;
            			case (int)4: {
HXLINE(  18)				return gl->MAX;
            			}
            			break;
            			default:{
HXLINE(  19)				HX_STACK_DO_THROW(HX_("Error, wrong gl-blendmode",bb,3a,05,3b));
            			}
            		}
HXLINE(  13)		return 0;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(BlendFunc_Impl__obj,toGL,return )


BlendFunc_Impl__obj::BlendFunc_Impl__obj()
{
}

bool BlendFunc_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"toGL") ) { outValue = toGL_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *BlendFunc_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *BlendFunc_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class BlendFunc_Impl__obj::__mClass;

static ::String BlendFunc_Impl__obj_sStaticFields[] = {
	HX_("toGL",60,38,01,4d),
	::String(null())
};

void BlendFunc_Impl__obj::__register()
{
	BlendFunc_Impl__obj _hx_dummy;
	BlendFunc_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("peote.view._BlendFunc.BlendFunc_Impl_",a3,2b,cd,f6);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &BlendFunc_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(BlendFunc_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< BlendFunc_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = BlendFunc_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = BlendFunc_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace peote
} // end namespace view
} // end namespace _BlendFunc

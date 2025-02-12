// Generated by Haxe 5.0.0-alpha.1+1423a5f
#include <hxcpp.h>

#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_lime__internal_backend_native_NativeOpenGLRenderContext
#include <lime/_internal/backend/native/NativeOpenGLRenderContext.h>
#endif
#ifndef INCLUDED_lime_graphics_RenderContext
#include <lime/graphics/RenderContext.h>
#endif
#ifndef INCLUDED_peote_view_Version
#include <peote/view/Version.h>
#endif
#ifndef INCLUDED_peote_view__PeoteGL_PeoteGL_Impl_
#include <peote/view/_PeoteGL/PeoteGL_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_b2c91e149b36db3f_151_fromRenderContext,"peote.view._PeoteGL.PeoteGL_Impl_","fromRenderContext",0xc0ce029a,"peote.view._PeoteGL.PeoteGL_Impl_.fromRenderContext","peote/view/PeoteGL.hx",151,0x90807f54)
namespace peote{
namespace view{
namespace _PeoteGL{

void PeoteGL_Impl__obj::__construct() { }

Dynamic PeoteGL_Impl__obj::__CreateEmpty() { return new PeoteGL_Impl__obj; }

void *PeoteGL_Impl__obj::_hx_vtable = 0;

Dynamic PeoteGL_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< PeoteGL_Impl__obj > _hx_result = new PeoteGL_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool PeoteGL_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x767510b3;
}

 ::lime::_internal::backend::native::NativeOpenGLRenderContext PeoteGL_Impl__obj::fromRenderContext( ::lime::graphics::RenderContext context){
            	HX_STACKFRAME(&_hx_pos_b2c91e149b36db3f_151_fromRenderContext)
HXDLIN( 151)		if (::hx::IsNotNull( context->gles3 )) {
HXLINE( 152)			::haxe::Log_obj::trace(HX_("OpenGL-ES3 detected.",13,cd,ae,58),::hx::SourceInfo(HX_("peote/view/PeoteGL.hx",54,7f,80,90),152,HX_("peote.view._PeoteGL.PeoteGL_Impl_",d9,52,f2,9a),HX_("fromRenderContext",6f,19,d4,ba)));
HXLINE( 153)			{
HXLINE( 153)				::peote::view::Version_obj::isUBO = true;
HXDLIN( 153)				::peote::view::Version_obj::isINSTANCED = true;
HXDLIN( 153)				::peote::view::Version_obj::isVAO = true;
HXDLIN( 153)				::peote::view::Version_obj::isES3 = true;
            			}
HXLINE( 154)			return context->gles3;
            		}
            		else {
HXLINE( 156)			if (::hx::IsNotNull( context->gles2 )) {
HXLINE( 157)				::haxe::Log_obj::trace(HX_("OpenGL-ES2 detected.",d2,61,d0,d7),::hx::SourceInfo(HX_("peote/view/PeoteGL.hx",54,7f,80,90),157,HX_("peote.view._PeoteGL.PeoteGL_Impl_",d9,52,f2,9a),HX_("fromRenderContext",6f,19,d4,ba)));
HXLINE( 158)				return context->gles2;
            			}
            			else {
HXLINE( 160)				if (::hx::IsNotNull( context->gl )) {
HXLINE( 161)					::haxe::Log_obj::trace(HX_("OpenGL detected.",9b,15,17,73),::hx::SourceInfo(HX_("peote/view/PeoteGL.hx",54,7f,80,90),161,HX_("peote.view._PeoteGL.PeoteGL_Impl_",d9,52,f2,9a),HX_("fromRenderContext",6f,19,d4,ba)));
HXLINE( 162)					return context->gl;
            				}
            				else {
HXLINE( 164)					HX_STACK_DO_THROW(HX_("Error: missing OpenGL context",a6,8b,05,1f));
            				}
            			}
            		}
HXLINE( 151)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(PeoteGL_Impl__obj,fromRenderContext,return )


PeoteGL_Impl__obj::PeoteGL_Impl__obj()
{
}

bool PeoteGL_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 17:
		if (HX_FIELD_EQ(inName,"fromRenderContext") ) { outValue = fromRenderContext_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *PeoteGL_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *PeoteGL_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class PeoteGL_Impl__obj::__mClass;

static ::String PeoteGL_Impl__obj_sStaticFields[] = {
	HX_("fromRenderContext",6f,19,d4,ba),
	::String(null())
};

void PeoteGL_Impl__obj::__register()
{
	PeoteGL_Impl__obj _hx_dummy;
	PeoteGL_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("peote.view._PeoteGL.PeoteGL_Impl_",d9,52,f2,9a);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &PeoteGL_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(PeoteGL_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< PeoteGL_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = PeoteGL_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = PeoteGL_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace peote
} // end namespace view
} // end namespace _PeoteGL

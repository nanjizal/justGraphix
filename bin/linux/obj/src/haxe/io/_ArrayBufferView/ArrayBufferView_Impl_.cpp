// Generated by Haxe 5.0.0-alpha.1+1423a5f
#include <hxcpp.h>

#ifndef INCLUDED_haxe_io_ArrayBufferViewImpl
#include <haxe/io/ArrayBufferViewImpl.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_haxe_io_Error
#include <haxe/io/Error.h>
#endif
#ifndef INCLUDED_haxe_io__ArrayBufferView_ArrayBufferView_Impl_
#include <haxe/io/_ArrayBufferView/ArrayBufferView_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_8538c8ccac2fd27e_89_fromBytes,"haxe.io._ArrayBufferView.ArrayBufferView_Impl_","fromBytes",0xd52b9d62,"haxe.io._ArrayBufferView.ArrayBufferView_Impl_.fromBytes","haxe/io/ArrayBufferView.hx",89,0x20c96f00)
namespace haxe{
namespace io{
namespace _ArrayBufferView{

void ArrayBufferView_Impl__obj::__construct() { }

Dynamic ArrayBufferView_Impl__obj::__CreateEmpty() { return new ArrayBufferView_Impl__obj; }

void *ArrayBufferView_Impl__obj::_hx_vtable = 0;

Dynamic ArrayBufferView_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< ArrayBufferView_Impl__obj > _hx_result = new ArrayBufferView_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool ArrayBufferView_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x16f238f3;
}

 ::haxe::io::ArrayBufferViewImpl ArrayBufferView_Impl__obj::fromBytes( ::haxe::io::Bytes bytes,::hx::Null< int >  __o_pos, ::Dynamic length){
            		int pos = __o_pos.Default(0);
            	HX_GC_STACKFRAME(&_hx_pos_8538c8ccac2fd27e_89_fromBytes)
HXLINE(  90)		if (::hx::IsNull( length )) {
HXLINE(  91)			length = (bytes->length - pos);
            		}
HXLINE(  92)		bool _hx_tmp;
HXDLIN(  92)		bool _hx_tmp1;
HXDLIN(  92)		if ((pos >= 0)) {
HXLINE(  92)			_hx_tmp1 = ::hx::IsLess( length,0 );
            		}
            		else {
HXLINE(  92)			_hx_tmp1 = true;
            		}
HXDLIN(  92)		if (!(_hx_tmp1)) {
HXLINE(  92)			_hx_tmp = ((pos + length) > bytes->length);
            		}
            		else {
HXLINE(  92)			_hx_tmp = true;
            		}
HXDLIN(  92)		if (_hx_tmp) {
HXLINE(  93)			HX_STACK_DO_THROW(::haxe::io::Error_obj::OutsideBounds_dyn());
            		}
HXLINE(  94)		return  ::haxe::io::ArrayBufferViewImpl_obj::__alloc( HX_CTX ,bytes,pos,( (int)(length) ));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(ArrayBufferView_Impl__obj,fromBytes,return )


ArrayBufferView_Impl__obj::ArrayBufferView_Impl__obj()
{
}

bool ArrayBufferView_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"fromBytes") ) { outValue = fromBytes_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *ArrayBufferView_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *ArrayBufferView_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class ArrayBufferView_Impl__obj::__mClass;

static ::String ArrayBufferView_Impl__obj_sStaticFields[] = {
	HX_("fromBytes",a1,f2,20,72),
	::String(null())
};

void ArrayBufferView_Impl__obj::__register()
{
	ArrayBufferView_Impl__obj _hx_dummy;
	ArrayBufferView_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("haxe.io._ArrayBufferView.ArrayBufferView_Impl_",ef,3f,1e,38);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &ArrayBufferView_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(ArrayBufferView_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< ArrayBufferView_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = ArrayBufferView_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = ArrayBufferView_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace haxe
} // end namespace io
} // end namespace _ArrayBufferView

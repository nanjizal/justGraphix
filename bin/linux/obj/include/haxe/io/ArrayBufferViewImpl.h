// Generated by Haxe 5.0.0-alpha.1+1423a5f
#ifndef INCLUDED_haxe_io_ArrayBufferViewImpl
#define INCLUDED_haxe_io_ArrayBufferViewImpl

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,ArrayBufferViewImpl)
HX_DECLARE_CLASS2(haxe,io,Bytes)

namespace haxe{
namespace io{


class HXCPP_CLASS_ATTRIBUTES ArrayBufferViewImpl_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef ArrayBufferViewImpl_obj OBJ_;
		ArrayBufferViewImpl_obj();

	public:
		enum { _hx_ClassId = 0x7fa4dcf6 };

		void __construct( ::haxe::io::Bytes bytes,int pos,int length);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="haxe.io.ArrayBufferViewImpl")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"haxe.io.ArrayBufferViewImpl"); }
		static ::hx::ObjectPtr< ArrayBufferViewImpl_obj > __new( ::haxe::io::Bytes bytes,int pos,int length);
		static ::hx::ObjectPtr< ArrayBufferViewImpl_obj > __alloc(::hx::Ctx *_hx_ctx, ::haxe::io::Bytes bytes,int pos,int length);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~ArrayBufferViewImpl_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("ArrayBufferViewImpl",5e,a0,91,73); }

		 ::haxe::io::Bytes bytes;
		int byteOffset;
		int byteLength;
};

} // end namespace haxe
} // end namespace io

#endif /* INCLUDED_haxe_io_ArrayBufferViewImpl */ 

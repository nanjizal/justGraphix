// Generated by Haxe 5.0.0-alpha.1+1423a5f
#ifndef INCLUDED_peote_view__TextureData_TextureDataImpl
#define INCLUDED_peote_view__TextureData_TextureDataImpl

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(peote,view,_TextureData,TextureDataImpl)

namespace peote{
namespace view{
namespace _TextureData{


class HXCPP_CLASS_ATTRIBUTES TextureDataImpl_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef TextureDataImpl_obj OBJ_;
		TextureDataImpl_obj();

	public:
		enum { _hx_ClassId = 0x69ef6233 };

		void __construct(int width,int height,int format,::hx::Null< int >  __o_color, ::haxe::io::Bytes bytes);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="peote.view._TextureData.TextureDataImpl")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"peote.view._TextureData.TextureDataImpl"); }
		static ::hx::ObjectPtr< TextureDataImpl_obj > __new(int width,int height,int format,::hx::Null< int >  __o_color, ::haxe::io::Bytes bytes);
		static ::hx::ObjectPtr< TextureDataImpl_obj > __alloc(::hx::Ctx *_hx_ctx,int width,int height,int format,::hx::Null< int >  __o_color, ::haxe::io::Bytes bytes);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TextureDataImpl_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("TextureDataImpl",05,be,d9,4c); }

		int width;
		int height;
		int format;
		 ::haxe::io::Bytes bytes;
		void clear(::hx::Null< int >  color);
		::Dynamic clear_dyn();

		void clearFloat(::hx::Null< Float >  red,::hx::Null< Float >  green,::hx::Null< Float >  blue,::hx::Null< Float >  alpha);
		::Dynamic clearFloat_dyn();

};

} // end namespace peote
} // end namespace view
} // end namespace _TextureData

#endif /* INCLUDED_peote_view__TextureData_TextureDataImpl */ 

// Generated by Haxe 5.0.0-alpha.1+1423a5f
#ifndef INCLUDED_justGraphix_image_U32ArrImg
#define INCLUDED_justGraphix_image_U32ArrImg

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_justGraphix_image_Iimg
#include <justGraphix/image/Iimg.h>
#endif
HX_DECLARE_CLASS2(haxe,io,ArrayBufferViewImpl)
HX_DECLARE_CLASS2(justGraphix,image,Iimg)
HX_DECLARE_CLASS2(justGraphix,image,U32ArrImg)

namespace justGraphix{
namespace image{


class HXCPP_CLASS_ATTRIBUTES U32ArrImg_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef U32ArrImg_obj OBJ_;
		U32ArrImg_obj();

	public:
		enum { _hx_ClassId = 0x1a9d536c };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="justGraphix.image.U32ArrImg")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"justGraphix.image.U32ArrImg"); }
		static ::hx::ObjectPtr< U32ArrImg_obj > __new();
		static ::hx::ObjectPtr< U32ArrImg_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~U32ArrImg_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_("U32ArrImg",76,77,d8,7a); }

		 ::haxe::io::ArrayBufferViewImpl data;
		int width;
		int height;
		int length;
		int set(int index,int value);
		::Dynamic set_dyn();

		int get(int index);
		::Dynamic get_dyn();

};

} // end namespace justGraphix
} // end namespace image

#endif /* INCLUDED_justGraphix_image_U32ArrImg */ 

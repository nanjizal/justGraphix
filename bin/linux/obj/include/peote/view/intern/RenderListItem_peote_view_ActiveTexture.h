// Generated by Haxe 5.0.0-alpha.1+1423a5f
#ifndef INCLUDED_peote_view_intern_RenderListItem_peote_view_ActiveTexture
#define INCLUDED_peote_view_intern_RenderListItem_peote_view_ActiveTexture

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(peote,view,ActiveTexture)
HX_DECLARE_CLASS3(peote,view,intern,RenderListItem_peote_view_ActiveTexture)

namespace peote{
namespace view{
namespace intern{


class HXCPP_CLASS_ATTRIBUTES RenderListItem_peote_view_ActiveTexture_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef RenderListItem_peote_view_ActiveTexture_obj OBJ_;
		RenderListItem_peote_view_ActiveTexture_obj();

	public:
		enum { _hx_ClassId = 0x3ffa11e9 };

		void __construct( ::peote::view::ActiveTexture value, ::peote::view::intern::RenderListItem_peote_view_ActiveTexture prev, ::peote::view::intern::RenderListItem_peote_view_ActiveTexture next);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="peote.view.intern.RenderListItem_peote_view_ActiveTexture")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"peote.view.intern.RenderListItem_peote_view_ActiveTexture"); }
		static ::hx::ObjectPtr< RenderListItem_peote_view_ActiveTexture_obj > __new( ::peote::view::ActiveTexture value, ::peote::view::intern::RenderListItem_peote_view_ActiveTexture prev, ::peote::view::intern::RenderListItem_peote_view_ActiveTexture next);
		static ::hx::ObjectPtr< RenderListItem_peote_view_ActiveTexture_obj > __alloc(::hx::Ctx *_hx_ctx, ::peote::view::ActiveTexture value, ::peote::view::intern::RenderListItem_peote_view_ActiveTexture prev, ::peote::view::intern::RenderListItem_peote_view_ActiveTexture next);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~RenderListItem_peote_view_ActiveTexture_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("RenderListItem_peote_view_ActiveTexture",87,8b,ce,f1); }

		 ::peote::view::ActiveTexture value;
		 ::peote::view::intern::RenderListItem_peote_view_ActiveTexture next;
		 ::peote::view::intern::RenderListItem_peote_view_ActiveTexture prev;
};

} // end namespace peote
} // end namespace view
} // end namespace intern

#endif /* INCLUDED_peote_view_intern_RenderListItem_peote_view_ActiveTexture */ 

// Generated by Haxe 5.0.0-alpha.1+1423a5f
#ifndef INCLUDED_peote_view__BlendFactor_BlendFactor_Impl_
#define INCLUDED_peote_view__BlendFactor_BlendFactor_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS4(lime,_internal,backend,native,NativeOpenGLRenderContext)
HX_DECLARE_CLASS3(peote,view,_BlendFactor,BlendFactor_Impl_)

namespace peote{
namespace view{
namespace _BlendFactor{


class HXCPP_CLASS_ATTRIBUTES BlendFactor_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef BlendFactor_Impl__obj OBJ_;
		BlendFactor_Impl__obj();

	public:
		enum { _hx_ClassId = 0x76d20e0b };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="peote.view._BlendFactor.BlendFactor_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"peote.view._BlendFactor.BlendFactor_Impl_"); }

		inline static ::hx::ObjectPtr< BlendFactor_Impl__obj > __new() {
			::hx::ObjectPtr< BlendFactor_Impl__obj > __this = new BlendFactor_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< BlendFactor_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			BlendFactor_Impl__obj *__this = (BlendFactor_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(BlendFactor_Impl__obj), false, "peote.view._BlendFactor.BlendFactor_Impl_"));
			*(void **)__this = BlendFactor_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~BlendFactor_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("BlendFactor_Impl_",80,84,e4,d6); }

		static int toGL(int this1, ::lime::_internal::backend::native::NativeOpenGLRenderContext gl);
		static ::Dynamic toGL_dyn();

};

} // end namespace peote
} // end namespace view
} // end namespace _BlendFactor

#endif /* INCLUDED_peote_view__BlendFactor_BlendFactor_Impl_ */ 

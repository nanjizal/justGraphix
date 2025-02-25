// Generated by Haxe 5.0.0-alpha.1+1423a5f
#include <hxcpp.h>

#ifndef INCLUDED_lime_math_Rectangle
#include <lime/math/Rectangle.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_1237f756a3e4c0a2_83_new,"lime.math.Rectangle","new",0xb4aa4114,"lime.math.Rectangle.new","lime/math/Rectangle.hx",83,0xce0be93c)
HX_LOCAL_STACK_FRAME(_hx_pos_1237f756a3e4c0a2_265_offset,"lime.math.Rectangle","offset",0x04898f5f,"lime.math.Rectangle.offset","lime/math/Rectangle.hx",265,0xce0be93c)
HX_LOCAL_STACK_FRAME(_hx_pos_1237f756a3e4c0a2_340___toFlashRectangle,"lime.math.Rectangle","__toFlashRectangle",0x525ed026,"lime.math.Rectangle.__toFlashRectangle","lime/math/Rectangle.hx",340,0xce0be93c)
namespace lime{
namespace math{

void Rectangle_obj::__construct(::hx::Null< Float >  __o_x,::hx::Null< Float >  __o_y,::hx::Null< Float >  __o_width,::hx::Null< Float >  __o_height){
            		Float x = __o_x.Default(0);
            		Float y = __o_y.Default(0);
            		Float width = __o_width.Default(0);
            		Float height = __o_height.Default(0);
            	HX_STACKFRAME(&_hx_pos_1237f756a3e4c0a2_83_new)
HXLINE(  84)		this->x = x;
HXLINE(  85)		this->y = y;
HXLINE(  86)		this->width = width;
HXLINE(  87)		this->height = height;
            	}

Dynamic Rectangle_obj::__CreateEmpty() { return new Rectangle_obj; }

void *Rectangle_obj::_hx_vtable = 0;

Dynamic Rectangle_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Rectangle_obj > _hx_result = new Rectangle_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool Rectangle_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x3eea208a;
}

void Rectangle_obj::offset(Float dx,Float dy){
            	HX_STACKFRAME(&_hx_pos_1237f756a3e4c0a2_265_offset)
HXLINE( 266)		 ::lime::math::Rectangle _hx_tmp = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 266)		_hx_tmp->x = (_hx_tmp->x + dx);
HXLINE( 267)		 ::lime::math::Rectangle _hx_tmp1 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 267)		_hx_tmp1->y = (_hx_tmp1->y + dy);
            	}


HX_DEFINE_DYNAMIC_FUNC2(Rectangle_obj,offset,(void))

 ::Dynamic Rectangle_obj::_hx___toFlashRectangle(){
            	HX_STACKFRAME(&_hx_pos_1237f756a3e4c0a2_340___toFlashRectangle)
HXDLIN( 340)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC0(Rectangle_obj,_hx___toFlashRectangle,return )


Rectangle_obj::Rectangle_obj()
{
}

::hx::Val Rectangle_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"x") ) { return ::hx::Val( x ); }
		if (HX_FIELD_EQ(inName,"y") ) { return ::hx::Val( y ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"width") ) { return ::hx::Val( width ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { return ::hx::Val( height ); }
		if (HX_FIELD_EQ(inName,"offset") ) { return ::hx::Val( offset_dyn() ); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"__toFlashRectangle") ) { return ::hx::Val( _hx___toFlashRectangle_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val Rectangle_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"x") ) { x=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"y") ) { y=inValue.Cast< Float >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"width") ) { width=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { height=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Rectangle_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("height",e7,07,4c,02));
	outFields->push(HX_("width",06,b6,62,ca));
	outFields->push(HX_("x",78,00,00,00));
	outFields->push(HX_("y",79,00,00,00));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo Rectangle_obj_sMemberStorageInfo[] = {
	{::hx::fsFloat,(int)offsetof(Rectangle_obj,height),HX_("height",e7,07,4c,02)},
	{::hx::fsFloat,(int)offsetof(Rectangle_obj,width),HX_("width",06,b6,62,ca)},
	{::hx::fsFloat,(int)offsetof(Rectangle_obj,x),HX_("x",78,00,00,00)},
	{::hx::fsFloat,(int)offsetof(Rectangle_obj,y),HX_("y",79,00,00,00)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *Rectangle_obj_sStaticStorageInfo = 0;
#endif

static ::String Rectangle_obj_sMemberFields[] = {
	HX_("height",e7,07,4c,02),
	HX_("width",06,b6,62,ca),
	HX_("x",78,00,00,00),
	HX_("y",79,00,00,00),
	HX_("offset",93,97,3f,60),
	HX_("__toFlashRectangle",5a,56,1a,96),
	::String(null()) };

::hx::Class Rectangle_obj::__mClass;

void Rectangle_obj::__register()
{
	Rectangle_obj _hx_dummy;
	Rectangle_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("lime.math.Rectangle",22,67,0f,89);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(Rectangle_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< Rectangle_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Rectangle_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Rectangle_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace lime
} // end namespace math

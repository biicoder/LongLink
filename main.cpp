#include <iostream>
#include <vector>
#include <type_traits>
#include <typeinfo>
#include <memory>
#ifndef _MSC_VER
#include <cxxabi.h>
#endif
using namespace std;

template <class T>
std::string
type_name()
{
    typedef typename std::remove_reference<T>::type TR;
    std::unique_ptr<char, void(*)(void*)> own
           (
#ifndef _MSC_VER
                abi::__cxa_demangle(typeid(TR).name(), nullptr,
                                           nullptr, nullptr),
#else
                nullptr,
#endif
                std::free
           );
    std::string r = own != nullptr ? own.get() : typeid(TR).name();
    if (std::is_const<TR>::value)
        r += " const";
    if (std::is_volatile<TR>::value)
        r += " volatile";
    if (std::is_lvalue_reference<T>::value)
        r += "&";
    else if (std::is_rvalue_reference<T>::value)
        r += "&&";
    return r;
}

class Obj {
	public:
		Obj():m_(0) {
			cout << "obj construct" << endl;
		}
		~Obj() {
			cout << "obj deconstruct" << endl;
		}
		Obj(const Obj& other) {
			cout << "copy construct" << endl;
			m_ = other.m_;
		}
		Obj(Obj&& other) {
			cout << "move construct" << endl;
		}
	        Obj& operator=(const Obj& other) {
			cout << "operator =" << endl;
			return *this;
		}
		Obj& operator=(Obj&& other) {
			cout << "move operator=" << endl;
			return *this;
		}
		int m_;
};

int func(int a) {
	return a;
}

template<class T> const char* type() {
	return __PRETTY_FUNCTION__;
}

int
main(int argc, char* argv[]) {

	std::cout << "hello world" << std::endl;

	vector<Obj> vec;
	Obj b;
	Obj& a = b;
	Obj c;
	int (*p)(int) = func;
	cout << typeid(a).name() << endl;
	cout << type<decltype(p)>() << endl;
	vec.push_back(a);
	vec.push_back(b);
	vec.push_back(c);
	cout << "-----------" << endl;
	for(auto &it : vec) {
		cout << typeid(it).name() << endl;
		cout << type_name<decltype(it)>() << endl;
		cout << it.m_ << endl;
	}
	return 0;
}

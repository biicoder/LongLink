#include "event2/event.h"
#include <iostream>
#include <signal.h>
using namespace std;
static void signal_cb(evutil_socket_t fd, short event, void* arg) {
  event_base_loopbreak(static_cast<struct event_base*>(arg));
}
int
main() {

	cout << "-------- event demo---------------" << endl;
	struct event_base* base;
	struct event* signal_int;
	base = event_base_new();
	//signal_int = evsignal_new();
	return 0;

}

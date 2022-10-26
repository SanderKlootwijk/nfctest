#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
//#include "reader.h"
//#include "service.h"

void Example2Plugin::registerTypes(const char *uri) {
    //@uri Example2
    //qmlRegisterSingletonType<Reader>(uri, 1, 0, "Reader", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Reader; });
    //qmlRegisterSingletonType<Service>(uri, 1, 0, "Service", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Service; });
}

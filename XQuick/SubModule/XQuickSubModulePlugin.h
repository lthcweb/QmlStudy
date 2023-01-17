#ifndef XQUICK_SUBMODULE_H
#define XQUICK_SUBMODULE_H

#include <QQmlExtensionPlugin>

class XQuickSubModulePlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "XQuick/1.0")
public:
    void registerTypes(const char *uri) override;
};

#endif // XQUICK_SUBMODULE_H

#include "ComponentCreatorEngine.h"

ComponentCreatorEngine::ComponentCreatorEngine(QObject *parent) :
    QQmlApplicationEngine(parent)
{
#ifdef QT_DEBUG
    m_fileWatcher = new FileWatcher(this);

//    QObject::connect(m_fileWatcher, &FileWatcher::reloadUI, this, &ComponentCreatorEngine::reloadUI);
#endif
}

void ComponentCreatorEngine::clearCache()
{
    this->clearComponentCache();
}

void ComponentCreatorEngine::AddDirectory(const QString &path)
{
    m_fileWatcher->setDirectory(path);
}

void ComponentCreatorEngine::Start()
{
    QObject::connect(m_fileWatcher, &FileWatcher::reloadUI, this, &ComponentCreatorEngine::reloadUI);
}

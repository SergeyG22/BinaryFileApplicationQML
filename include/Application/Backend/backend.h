#pragma once
#include <QObject>
#include <QVariantMap>
#include <iostream>
#include <QDebug>
#include <boost/iostreams/device/mapped_file.hpp>
#include <boost/algorithm/cxx14/equal.hpp>
#include <boost/filesystem.hpp>


class BackendOperations: public QObject {
    Q_OBJECT
public:
    Q_INVOKABLE QVariantMap binaryFindOperation(QString,QString);
    BackendOperations() = default;
    ~BackendOperations() = default;
public slots:

signals:

private:

};

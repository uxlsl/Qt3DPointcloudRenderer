#ifndef QPOINTCLOUDGEOMETRY_H
#define QPOINTCLOUDGEOMETRY_H

#include <Qt3DRender/qgeometry.h>
#include "qpointcloud.h"

class QPointcloudGeometryPrivate;

class QPointcloudGeometry : public Qt3DRender::QGeometry
{
    Q_OBJECT
    Q_PROPERTY(QPointcloud *pointcloud READ pointcloud WRITE setPointcloud NOTIFY pointcloudChanged)

public:
    explicit QPointcloudGeometry(QNode *parent = NULL);
    ~QPointcloudGeometry();

    QPointcloud *pointcloud() const;


public Q_SLOTS:
    void setPointcloud(QPointcloud *pointcloud);
    void updateVertices();
private Q_SLOTS:
    void updateAttributes();
Q_SIGNALS:
    void pointcloudChanged(QPointcloud *pointcloud);

private:
    QPointcloudGeometryPrivate *m_p;
};


#endif

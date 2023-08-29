#include "hvachandler.h"

HVACHandler::HVACHandler(QObject *parent)
    : QObject{parent}
    , m_targetTemp( 70 )
{

}

int HVACHandler::targetTemp() const
{
    return m_targetTemp;
}

void HVACHandler::setTargetTemp(int targetTemp)
{
    if (m_targetTemp == targetTemp)
        return;
    m_targetTemp = targetTemp;
    emit targetTempChanged();
}

void HVACHandler::incrementTargetTemp(const int &val)
{
    int newTargetTemp = m_targetTemp + val;
    setTargetTemp( newTargetTemp );
}

#include "MyBluetooth.h"
#include <QDebug>

MyBluetooth::MyBluetooth(QWidget *parent)
{

}

MyBluetooth::~MyBluetooth()
{

}

QString MyBluetooth::RcvMsg() const
{
 return m_RcvMsg;
}

QString MyBluetooth::BtAddress() const
{
    return m_BtAddress;
}

int MyBluetooth::BtPosition() const
{
    return m_BtPosition;
}

void MyBluetooth::startServer()
{
    agent = new QBluetoothDeviceDiscoveryAgent;
    connect(agent,SIGNAL(deviceDiscovered(QBluetoothDeviceInfo)),this,SLOT(deviceDiscovered(QBluetoothDeviceInfo)));
    agent->start();
    socket = new QBluetoothSocket(QBluetoothServiceInfo::RfcommProtocol);
}

void MyBluetooth::write(const QString message)
{
    QByteArray sendMsg;
    sendMsg.append(message);
    sendMsg.append("\n");
    socket->write(sendMsg);
}

void MyBluetooth::msgReceived()
{
    QByteArray myData;
    int startIndex, endIndex;
    // Read data
    myData=socket->readAll();
    qDebug()<<"size: "<<myData.size()<<" Data: "<<myData;
    m_RcvMsg = QString::fromLocal8Bit(myData);

    // Process data
    startIndex = myData.lastIndexOf('~');
    endIndex = myData.indexOf('!',startIndex);
    if((startIndex != -1) && (endIndex != -1))
    {
        myData = myData.mid(startIndex+1, endIndex - startIndex-1);
//        qDebug() << "startIndex = " << startIndex;
//        qDebug() << "endIndex = " << endIndex;
//        qDebug() << "myData = " << myData;
        m_BtPosition = myData.toInt();
//        qDebug() << "Position = " + m_BtPosition;
        if(m_BtPosition != 0){
            if((m_BtPosition>0) && (m_BtPosition <= 40000))
            {
                m_BtPosition = (40000 - m_BtPosition) / 40;
                qDebug() << "Position updated = " << m_BtPosition;
                emit BtPositionChanged();
            }
            else
            {
                qDebug() << "error, number is out of range";
            }
        }
        else{
            qDebug()<<"error receive package: myData = " << myData << "is not a number";
        }
    }
        emit RcvMsgChanged();
}

void MyBluetooth::socketConnected()
{
    qDebug() << "Socket connected";
}

void MyBluetooth::socketDisconnect()
{
    qDebug() << "Socket disconnected";
}

void MyBluetooth::socketError(QBluetoothSocket::SocketError error)
{
    qDebug() << "Socket error" + error;
}

void MyBluetooth::connectSocket(const QString address)
{
    qDebug() << "Address of connected bluetooth device : " << address;
    static const QString serviceUUid(QString("00001101-0000-1000-8000-00805F9B34FB"));
    socket->connectToService(QBluetoothAddress(address),QBluetoothUuid(serviceUUid),QIODevice::ReadWrite);
    qDebug() << "connect to socket";
    connect(socket,SIGNAL(readyRead()),this,SLOT(msgReceived()));
    connect(socket,SIGNAL(connected()),this,SLOT(socketConnected()));
    connect(socket,SIGNAL(disconnected()),this,SLOT(socketDisconnect()));
    connect(socket,SIGNAL(error(QBluetoothSocket::SocketError)),this,SLOT(socketError(QBluetoothSocket::SocketError)));

}

void MyBluetooth::deviceDiscovered(const QBluetoothDeviceInfo &device)
{
    m_BtAddress = device.address().toString();
    emit BtAddressChanged();
}

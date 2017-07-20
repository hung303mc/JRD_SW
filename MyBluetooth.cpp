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

void MyBluetooth::startServer()
{
    agent = new QBluetoothDeviceDiscoveryAgent;
    connect(agent,SIGNAL(deviceDiscovered(QBluetoothDeviceInfo)),this,SLOT(deviceDiscovered(QBluetoothDeviceInfo)));
    agent->start();
    socket = new QBluetoothSocket(QBluetoothServiceInfo::RfcommProtocol);
}

void MyBluetooth::write(const QString message)
{
    socket->write(message.toLocal8Bit());
}

void MyBluetooth::msgReceived()
{
    m_RcvMsg = QString::fromLocal8Bit(socket->readAll());
    qDebug() << "Receive message from Client" + m_RcvMsg;
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

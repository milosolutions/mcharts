/*******************************************************************************
  Copyright (C) 2016 Milo Solutions
  Contact: https://www.milosolutions.com

  This file is part of Milo Code Database, which is a collection of useful code
  snippets often reused within Milo Solutions. As such, this code is present in
  many projects done by Milo Solutions and does not constitute a copyright
  infridgement.

  You are entitled to do anything you please with this code, just as with the
  rest of code you bought. Files not containing this notice were written
  specifically for this project and have not been shared with any other party
  within or without Milo.
*******************************************************************************/

#include "dataprovider.h"

/*!
 * \brief Class provides test data set for MiloCharts Demo project.
 * \class DataProvider
 */

DataProvider::DataProvider(QObject *parent) :
    QObject(parent)
{
}

/*!
 * \brief DataProvider::getValues - returns chart values.
 * \return
 */
QList<qreal> DataProvider::getValues() const
{
    return { 1.5, 2.5, 1.5, 2.5, 2.0, 1.0, 0.5 };
}

/*!
 * \brief DataProvider::getLabels - returns chart labels.
 * \return
 */
QStringList DataProvider::getLabels() const
{
    return QStringList({ "8:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00" });
}

/*!
 * \brief DataProvider::getColors - returns chart colors.
 * \return
 */
QStringList DataProvider::getColors() const
{
    return QStringList({ "#54bc9b",
                         "#f58d35",
                         "#f14946",
                         "#8562a4",
                         "#348faa",
                         "#dddddd",
                         "#c4c4c4"
                       });
}

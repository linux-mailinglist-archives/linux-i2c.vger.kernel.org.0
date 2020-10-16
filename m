Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C1C28FE05
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 08:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391469AbgJPGFa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 02:05:30 -0400
Received: from mail.vivotek.com ([60.248.39.150]:33148 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391458AbgJPGF3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Oct 2020 02:05:29 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09G63I6l027232;
        Fri, 16 Oct 2020 14:05:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=dkim; bh=clrtvEG+8dD3iBlUZaf/DbFmGcIlTBkvmWkQUpnUe3w=;
 b=NeQHtHZCuvRNSDAAoXVmsTxkSlNvI/ULyHU+brfx3ajX3vSFR0o8RbEohY6ynAf7GrGr
 5vlDHwJTyQPiue3yiBsPmrI5ksDp0k098uvZjVzLjqBP+PruZcgLw19fvrVXN6dzNpqx
 yAY9beHSzkfSFUwc6Rjl1q7CH6FJwMYq0vM= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 342yd1ccpt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 16 Oct 2020 14:05:23 +0800
Received: from localhost.localdomain (192.168.17.134) by CAS01.vivotek.tw
 (192.168.0.58) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 16 Oct
 2020 14:05:22 +0800
From:   Michael Wu <michael.wu@vatics.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Morgan Chang <morgan.chang@vatics.com>,
        Dean Hsiao <dean.hsiao@vatics.com>,
        Paul Chen <paul.chen@vatics.com>,
        Michael Wu <michael.wu@vatics.com>
Subject: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED before WRITE_RECEIVED
Date:   Fri, 16 Oct 2020 14:04:02 +0800
Message-ID: <20201016060402.17259-2-michael.wu@vatics.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016060402.17259-1-michael.wu@vatics.com>
References: <20201016060402.17259-1-michael.wu@vatics.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.17.134]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-16_02:2020-10-16,2020-10-16 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sometime we would get the following flows when doing an i2cset:

1. No any WRITE_REQUESTED
0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
WRITE_RECEIVED
0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
WRITE_RECEIVED
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x710 : INTR_STAT=0x200
STOP

2. WRITE_REQUESTED after WRITE_RECEIVED
0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
WRITE_RECEIVED
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
WRITE_RECEIVED
WRITE_REQUESTED

Documentation/i2c/slave-interface.rst said that I2C_SLAVE_WRITE_REQUESTED,
which is mandatory, comes without any data arrived. It means
I2C_SLAVE_WRITE_REQUESTED should be in front of any
I2C_SLAVE_WRITE_RECEIVED in a write-request. Obviously the 1st log shows
no I2C_SLAVE_WRITE_REQUESTED, and 2nd log shows I2C_SLAVE_WRITE_REQUESTED
occurred after I2C_SLAVE_WRITE_RECEIVED.

I2C_SLAVE_STOP is mandatory to notify a request finish to reset the state
machine of the backend. In case 2 it never do I2C_SLAVE_STOP when STOP
condition is received. This is one of illegal issues to be fixed.

dev->status can be used to record the current machine state, especially
DesignWare I2C controller has no interrupts to notify a new write-request
coming, an IC_INTR_RX_FULL rising while dev->status isn't
STATUS_WRITE_IN_PROGRESS is notified to do an I2C_SLAVE_WRITE_REQUESTED
by checking dev->status. dev->status also helps to resolve the omitted
I2C_SLAVE_STOP in case 2.

Signed-off-by: Michael Wu <michael.wu@vatics.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 73 ++++++++++++-----------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 02e7c5171827..57ce1f0b403c 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -172,50 +172,55 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 		"%#x STATUS SLAVE_ACTIVITY=%#x : RAW_INTR_STAT=%#x : INTR_STAT=%#x\n",
 		enabled, slave_activity, raw_stat, stat);
 
+	if (stat & DW_IC_INTR_RX_FULL) {
+		if (dev->status != STATUS_WRITE_IN_PROGRESS) {
+			if (dev->status != STATUS_IDLE)
+				i2c_slave_event(dev->slave, I2C_SLAVE_STOP,
+						&val);
+
+			dev->status = STATUS_WRITE_IN_PROGRESS;
+			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED,
+					&val);
+		}
+
+		regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+		val = tmp;
+		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
+				     &val))
+			dev_vdbg(dev->dev, "Byte %X acked!", val);
+	}
+
 	if (stat & DW_IC_INTR_RD_REQ) {
+		if (dev->status != STATUS_IDLE) {
+			dev->status = STATUS_IDLE;
+			i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
+		}
+
 		if (slave_activity) {
-			if (stat & DW_IC_INTR_RX_FULL) {
-				regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
-				val = tmp;
-
-				if (!i2c_slave_event(dev->slave,
-						     I2C_SLAVE_WRITE_RECEIVED,
-						     &val)) {
-					dev_vdbg(dev->dev, "Byte %X acked!",
-						 val);
-				}
-				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
-			} else {
-				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
-				regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &tmp);
-			}
-			if (!i2c_slave_event(dev->slave,
-					     I2C_SLAVE_READ_REQUESTED,
-					     &val))
-				regmap_write(dev->map, DW_IC_DATA_CMD, val);
+			regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
+			regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &tmp);
+
+			dev->status = STATUS_READ_IN_PROGRESS;
+			i2c_slave_event(dev->slave, I2C_SLAVE_READ_REQUESTED,
+					&val);
+			regmap_write(dev->map, DW_IC_DATA_CMD, val);
 		}
 	}
 
 	if (stat & DW_IC_INTR_RX_DONE) {
-		if (!i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED,
-				     &val))
-			regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);
+		i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED, &val);
+		regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);
 
+		dev->status = STATUS_IDLE;
 		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-		return 1;
 	}
 
-	if (stat & DW_IC_INTR_RX_FULL) {
-		regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
-		val = tmp;
-		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
-				     &val))
-			dev_vdbg(dev->dev, "Byte %X acked!", val);
-	} else
-		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-
-	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
-		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
+	if (stat & DW_IC_INTR_STOP_DET) {
+		if (dev->status != STATUS_IDLE) {
+			dev->status = STATUS_IDLE;
+			i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
+		}
+	}
 
 	return 1;
 }
-- 
2.17.1


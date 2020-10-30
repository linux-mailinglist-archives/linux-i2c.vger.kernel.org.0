Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B757F29FF5D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 09:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgJ3IFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Oct 2020 04:05:14 -0400
Received: from mail.vivotek.com ([60.248.39.150]:48978 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbgJ3IFK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Oct 2020 04:05:10 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09U7xpU0013442;
        Fri, 30 Oct 2020 16:04:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=dkim; bh=MEiPWEmutrI6dcy3tVAXJ3gnd1ispPOTl60DsYN2dHo=;
 b=WotQ/J/mcdzQD0RxRICVloPESXkfclR73BuRLK9A8GAAlJqjtxYh+QemRt+r9Bix1vla
 limL9uNu02j68llEeaJUGEluwE9xzFNYT8L0G/BXxAUHAxpCIuclmrE+vwojxpp0EgN8
 Gij5vJTYihjZAI7klonauQdd7mVeK9as4lw= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 34c6q166qr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 30 Oct 2020 16:04:57 +0800
Received: from localhost.localdomain (192.168.17.134) by CAS01.vivotek.tw
 (192.168.0.58) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 16:04:57 +0800
From:   Michael Wu <michael.wu@vatics.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Morgan Chang <morgan.chang@vatics.com>,
        Michael Wu <michael.wu@vatics.com>
Subject: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED before WRITE_RECEIVED
Date:   Fri, 30 Oct 2020 16:04:20 +0800
Message-ID: <20201030080420.28016-3-michael.wu@vatics.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030080420.28016-1-michael.wu@vatics.com>
References: <20201030080420.28016-1-michael.wu@vatics.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.17.134]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_12:2020-10-29,2020-10-29 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sometimes we would get the following flow when doing an i2cset:

0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
I2C_SLAVE_WRITE_RECEIVED
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
I2C_SLAVE_WRITE_REQUESTED
I2C_SLAVE_WRITE_RECEIVED

Documentation/i2c/slave-interface.rst says that I2C_SLAVE_WRITE_REQUESTED,
which is mandatory, should be sent while the data did not arrive yet. It
means in a write-request I2C_SLAVE_WRITE_REQUESTED should be reported
before any I2C_SLAVE_WRITE_RECEIVED.

By the way, I2C_SLAVE_STOP didn't be reported in the above case because
DW_IC_INTR_STAT was not 0x200.

dev->status can be used to record the current state, especially Designware
I2C controller has no interrupts to identify a write-request. This patch
makes not only I2C_SLAVE_WRITE_REQUESTED been reported first when
IC_INTR_RX_FULL is rising and dev->status isn't STATUS_WRITE_IN_PROGRESS
but also I2C_SLAVE_STOP been reported when a STOP condition is received.

Signed-off-by: Michael Wu <michael.wu@vatics.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 45 +++++++++--------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 13de01a0f75f..0d15f4c1e9f7 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -172,26 +172,25 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 		"%#x STATUS SLAVE_ACTIVITY=%#x : RAW_INTR_STAT=%#x : INTR_STAT=%#x\n",
 		enabled, slave_activity, raw_stat, stat);
 
-	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
-		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
+	if (stat & DW_IC_INTR_RX_FULL) {
+		if (dev->status != STATUS_WRITE_IN_PROGRESS) {
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
 
 	if (stat & DW_IC_INTR_RD_REQ) {
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
+			regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
+
+			dev->status = STATUS_READ_IN_PROGRESS;
 			if (!i2c_slave_event(dev->slave,
 					     I2C_SLAVE_READ_REQUESTED,
 					     &val))
@@ -203,18 +202,10 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 		if (!i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED,
 				     &val))
 			regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);
-
-		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-		return 1;
 	}
 
-	if (stat & DW_IC_INTR_RX_FULL) {
-		regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
-		val = tmp;
-		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
-				     &val))
-			dev_vdbg(dev->dev, "Byte %X acked!", val);
-	} else {
+	if (stat & DW_IC_INTR_STOP_DET) {
+		dev->status = STATUS_IDLE;
 		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
 	}
 
-- 
2.17.1


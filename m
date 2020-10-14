Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB9028D988
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 07:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgJNF0u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 01:26:50 -0400
Received: from mail.vivotek.com ([60.248.39.150]:47348 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728619AbgJNF0u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 01:26:50 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09E5PEBT029712;
        Wed, 14 Oct 2020 13:26:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=dkim;
 bh=vgyu/BhhyrWEekZhbBTnSbUBvL3B5Y+saUl7LForRJw=;
 b=EBkxsn13pBWELWU9d4jgB6uUDkM6r+iMEasd1xyFVKSsY+MQI8FdjRWrtzt7ct7qojo4
 hK98w8R3MQL0N+vYxcm4t6yWjHaBvY25VF2fGqSCs8tWwIQ/iUVpz2Mb+cHO9iSPi5NY
 oCGX4pXTlxaZzB6a4zykbStuuDomATyZrPU= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 342yd1ans1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 14 Oct 2020 13:26:43 +0800
Received: from localhost.localdomain (192.168.17.134) by CAS01.vivotek.tw
 (192.168.0.58) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 14 Oct
 2020 13:26:42 +0800
From:   Michael Wu <michael.wu@vatics.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Morgan Chang <morgan.chang@vatics.com>,
        Dean Hsiao <dean.hsiao@vatics.com>,
        Paul Chen <paul.chen@vatics.com>,
        Michael Wu <michael.wu@vatics.com>
Subject: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Date:   Wed, 14 Oct 2020 13:25:32 +0800
Message-ID: <20201014052532.3298-1-michael.wu@vatics.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.17.134]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-14_03:2020-10-14,2020-10-14 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When an I2C slave works, sometimes both IC_INTR_RX_FULL and
IC_INTR_STOP_DET are rising during an IRQ handle, especially when system
is busy or too late to handle interrupts.

If IC_INTR_RX_FULL is rising and the system doesn't handle immediately,
IC_INTR_STOP_DET may be rising and the system has to handle these two
events. For this there may be two problems:

1. IC_INTR_STOP_DET is rising after i2c_dw_read_clear_intrbits_slave()
   done: It seems invalidated because WRITE_REQUESTED is done after the
   1st WRITE_RECEIVED.

$ i2cset -f -y 2 0x42 0x00 0x41; dmesg -c
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
WRITE_RECEIVED
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
WRITE_REQUESTED
WRITE_RECEIVED
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x710 : INTR_STAT=0x200
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x510 : INTR_STAT=0x0
STOP
[2][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x510 : INTR_STAT=0x0

  t1: ISR with the 1st IC_INTR_RX_FULL.
  t2: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave().
  t3: Enter i2c_dw_irq_handler_slave() and then do
      i2c_slave_event(WRITE_RECEIVED) because
      if (stat & DW_IC_INTR_RX_FULL).
  t4: ISR with the 2nd IC_INTR_RX_FULL.
  t5: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave(),
      while IC_INTR_STOP_DET has not risen yet.
  t6: Enter i2c_dw_irq_handler_slave() and then IC_INTR_STOP_DET is
      rising. i2c_slave_event(WRITE_REQUESTED) will be done first because
      if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET)) and
      then doing i2c_slave_event(WRITE_RECEIVED).
  t7: do i2c_slave_event(STOP) due to IC_INTR_STOP_DET not be cleared yet.

2. Both IC_INTR_STOP_DET and IC_INTR_RX_FULL are rising before
   i2c_dw_read_clear_intrbits_slave(): STOP cannot wait because
   IC_INTR_STOP_DET is cleared by i2c_dw_read_clear_intrbits_slave().

$ i2cset -f -y 2 0x42 0x00 0x41; dmesg -c
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
WRITE_RECEIVED
[0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
[1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
WRITE_RECEIVED

  t1: ISR with the 1st IC_INTR_RX_FULL.
  t2: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave().
  t3: Enter i2c_dw_irq_handler_slave() and then do
      i2c_slave_event(WRITE_RECEIVED) because
      if (stat & DW_IC_INTR_RX_FULL).
  t4: ISR with both IC_INTR_STOP_DET and the 2nd IC_INTR_RX_FULL.
  t5: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave(). The
      current IC_INTR_STOP_DET is cleared by this
      i2c_dw_read_clear_intrbits_slave().
  t6: Enter i2c_dw_irq_handler_slave() and then do
      i2c_slave_event(WRITE_RECEIVED) because
      if (stat & DW_IC_INTR_RX_FULL).
  t7: i2c_slave_event(STOP) never be done because IC_INTR_STOP_DET was
      cleared in t5.

In order to resolve these problems, i2c_dw_read_clear_intrbits_slave()
should be called only one time in ISR and take the returned stat to handle
those occurred events.

Signed-off-by: Michael Wu <michael.wu@vatics.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 79 ++++++++++++-----------
 1 file changed, 40 insertions(+), 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 44974b53a626..8b3047fb2eae 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -159,7 +159,6 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	u32 raw_stat, stat, enabled, tmp;
 	u8 val = 0, slave_activity;
 
-	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
 	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
 	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_stat);
 	regmap_read(dev->map, DW_IC_STATUS, &tmp);
@@ -168,58 +167,61 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
 		return 0;
 
+	stat = i2c_dw_read_clear_intrbits_slave(dev);
 	dev_dbg(dev->dev,
 		"%#x STATUS SLAVE_ACTIVITY=%#x : RAW_INTR_STAT=%#x : INTR_STAT=%#x\n",
 		enabled, slave_activity, raw_stat, stat);
 
-	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
-		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
+	if (stat & DW_IC_INTR_RX_FULL) {
+		if (dev->status != STATUS_WRITE_IN_PROGRESS) {
+			if (dev->status != STATUS_IDLE)
+				i2c_slave_event(dev->slave, I2C_SLAVE_STOP,
+						&val);
+
+			dev->status = STATUS_WRITE_IN_PROGRESS
+			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED,
+					&val);
+		}
+
+		regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+		val = tmp;
+
+		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
+				     &val))
+			dev_vdbg(dev->dev, "Byte %X acked!", val);
+	}
 
 	if (stat & DW_IC_INTR_RD_REQ) {
+		if (dev->status != STATUS_IDEL) {
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
-				stat = i2c_dw_read_clear_intrbits_slave(dev);
-			} else {
-				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
-				regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &tmp);
-				stat = i2c_dw_read_clear_intrbits_slave(dev);
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
-		stat = i2c_dw_read_clear_intrbits_slave(dev);
-		return 1;
 	}
 
-	if (stat & DW_IC_INTR_RX_FULL) {
-		regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
-		val = tmp;
-		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
-				     &val))
-			dev_vdbg(dev->dev, "Byte %X acked!", val);
-	} else {
-		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-		stat = i2c_dw_read_clear_intrbits_slave(dev);
+	if (stat & DW_IC_INTR_STOP_DET) {
+		if (dev->status != STATUS_IDLE) {
+			dev->status = STATUS_IDLE;
+
+			i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
+		}
 	}
 
 	return 1;
@@ -230,7 +232,6 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 	struct dw_i2c_dev *dev = dev_id;
 	int ret;
 
-	i2c_dw_read_clear_intrbits_slave(dev);
 	ret = i2c_dw_irq_handler_slave(dev);
 	if (ret > 0)
 		complete(&dev->cmd_complete);
-- 
2.17.1


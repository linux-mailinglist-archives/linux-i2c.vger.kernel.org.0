Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B1728FE02
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 08:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391296AbgJPGFV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 02:05:21 -0400
Received: from mail.vivotek.com ([60.248.39.150]:33136 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391295AbgJPGFV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Oct 2020 02:05:21 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09G65Bvu030142;
        Fri, 16 Oct 2020 14:05:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=dkim;
 bh=OiryTol3lsa7n+iIcBzbc/EuEG5m0GVQYbD/SFQ9KYU=;
 b=dTUyTtYZpVgADzGjzJbvl3EYgaP59swy4Mm5Hh6zjNgIrtNkQpZI0gGy+N9nUSLpx5jy
 NChgifm7iyKhctuzG4B7BsrWIHrHuAPt1qOtTNhWBTb9KeakEfcO2quVxRiGSouT5KxQ
 E354osAhLn9Qu+9Ijk1SJdTJNVb6GtfRr5s= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 342yd1ccpm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 16 Oct 2020 14:05:11 +0800
Received: from localhost.localdomain (192.168.17.134) by CAS01.vivotek.tw
 (192.168.0.58) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 16 Oct
 2020 14:05:10 +0800
From:   Michael Wu <michael.wu@vatics.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Morgan Chang <morgan.chang@vatics.com>,
        Dean Hsiao <dean.hsiao@vatics.com>,
        Paul Chen <paul.chen@vatics.com>,
        Michael Wu <michael.wu@vatics.com>
Subject: [PATCH 1/2] i2c: designware: call i2c_dw_read_clear_intrbits_slave() once
Date:   Fri, 16 Oct 2020 14:04:01 +0800
Message-ID: <20201016060402.17259-1-michael.wu@vatics.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.17.134]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-16_02:2020-10-16,2020-10-16 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_dw_read_clear_intrbits_slave() was called per each interrupt handle.
It caused some interrupt bits which haven't been handled yet were cleared,
the corresponding handlers would do nothing due to interrupt bits been
discarded. For example,

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

The root cause is that i2c_dw_read_clear_intrbits_slave() was called many
times. Calling i2c_dw_read_clear_intrbits_slave() once in one ISR and take
the returned stat for later handling is the solution.

Signed-off-by: Michael Wu <michael.wu@vatics.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 44974b53a626..02e7c5171827 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -159,7 +159,6 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	u32 raw_stat, stat, enabled, tmp;
 	u8 val = 0, slave_activity;
 
-	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
 	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
 	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_stat);
 	regmap_read(dev->map, DW_IC_STATUS, &tmp);
@@ -168,13 +167,11 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
 		return 0;
 
+	stat = i2c_dw_read_clear_intrbits_slave(dev);
 	dev_dbg(dev->dev,
 		"%#x STATUS SLAVE_ACTIVITY=%#x : RAW_INTR_STAT=%#x : INTR_STAT=%#x\n",
 		enabled, slave_activity, raw_stat, stat);
 
-	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
-		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
-
 	if (stat & DW_IC_INTR_RD_REQ) {
 		if (slave_activity) {
 			if (stat & DW_IC_INTR_RX_FULL) {
@@ -188,11 +185,9 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 						 val);
 				}
 				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
-				stat = i2c_dw_read_clear_intrbits_slave(dev);
 			} else {
 				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
 				regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &tmp);
-				stat = i2c_dw_read_clear_intrbits_slave(dev);
 			}
 			if (!i2c_slave_event(dev->slave,
 					     I2C_SLAVE_READ_REQUESTED,
@@ -207,7 +202,6 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 			regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);
 
 		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-		stat = i2c_dw_read_clear_intrbits_slave(dev);
 		return 1;
 	}
 
@@ -217,10 +211,11 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
 				     &val))
 			dev_vdbg(dev->dev, "Byte %X acked!", val);
-	} else {
+	} else
 		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-		stat = i2c_dw_read_clear_intrbits_slave(dev);
-	}
+
+	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
+		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
 
 	return 1;
 }
@@ -230,7 +225,6 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 	struct dw_i2c_dev *dev = dev_id;
 	int ret;
 
-	i2c_dw_read_clear_intrbits_slave(dev);
 	ret = i2c_dw_irq_handler_slave(dev);
 	if (ret > 0)
 		complete(&dev->cmd_complete);
-- 
2.17.1


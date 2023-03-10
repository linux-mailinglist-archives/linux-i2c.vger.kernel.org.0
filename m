Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98CCC6B3724
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 08:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjCJHK6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 02:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjCJHK5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 02:10:57 -0500
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA6CA90A6;
        Thu,  9 Mar 2023 23:10:55 -0800 (PST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PXxzJ17Dgz8QrkZ;
        Fri, 10 Mar 2023 15:10:52 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
        by mse-fl1.zte.com.cn with SMTP id 32A7Aifo092161;
        Fri, 10 Mar 2023 15:10:44 +0800 (+08)
        (envelope-from liao.zenghui@zte.com.cn)
Received: from mapi (xaxapp02[null])
        by mapi (Zmail) with MAPI id mid31;
        Fri, 10 Mar 2023 15:10:46 +0800 (CST)
Date:   Fri, 10 Mar 2023 15:10:46 +0800 (CST)
X-Zmail-TransId: 2afa640ad7f6ffffffff817ab979
X-Mailer: Zmail v1.0
Message-ID: <202303101510464477898@zte.com.cn>
Mime-Version: 1.0
From:   <liao.zenghui@zte.com.cn>
To:     <jarkko.nikula@linux.intel.com>
Cc:     <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IGRlc2lnbndhcmU6IGZpeCBzbGF2ZSBub3QgYWNrbm93bGVkZ2Ugd2hlbiBhZGRyZXNzIG1hdGNoZWQ=?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 32A7Aifo092161
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID 640AD7FC.000 by FangMail milter!
X-FangMail-Envelope: 1678432252/4PXxzJ17Dgz8QrkZ/640AD7FC.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<liao.zenghui@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 640AD7FC.000/4PXxzJ17Dgz8QrkZ
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: liao zenghui <liao.zenghui@zte.com.cn>

According to Chapter 5.1.31 of the databook "DesignWare DW_apb_i2c
Databook (2.03a)", the bit[19] of the IC_ENABLE register defaults to
one when the configuration parameter of the controller is
"IC_MULTI_SAR_EN == 1". This bit controls whether the slave send
acknowledge signal to the master after an address match. Because
setting the IC_ENABLE register using "1" and "0" directly in function
"__i2c_dw_enabl" and function "__i2c_dw_disable_nowait", results in the
bit[19] of this register being zero, no acknowledge signal is generated
when address matched.
Therefore, the two functions are modified.Restore the reset value of the
IC_ENABLE register in the function "__i2c_dw_disable_nowait". Only
bit[0] is set in the function "__i2c_dw_enable" and the other bits
remain unchanged. In addition, the code for determining whether the i2c
controller is enabled using the value of the IC_ENABLE register is
modified. Otherwise, when "C_MULTI_SAR_EN==1" and the bit[19] of the
IC_ENABLE register is 1, the determination of the variable "enable"
will be not work.

Signed-off-by: liao zenghui <liao.zenghui@zte.com.cn>
---
drivers/i2c/busses/i2c-designware-core.h | 13 +++++++++++--
drivers/i2c/busses/i2c-designware-master.c | 2 +-
drivers/i2c/busses/i2c-designware-slave.c | 3 ++-
3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 050d8c63ad3c..49b2f8819952 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -113,6 +113,9 @@
#define DW_IC_STATUS_MASTER_ACTIVITY BIT(5)
#define DW_IC_STATUS_SLAVE_ACTIVITY BIT(6)

+#define DW_IC_ENABLE_ENABLE BIT(0)
+#define DW_IC_ENABLE_SAR_EN BIT(19)
+
#define DW_IC_SDA_HOLD_RX_SHIFT 16
#define DW_IC_SDA_HOLD_RX_MASK GENMASK(23, 16)

@@ -333,13 +336,19 @@ void i2c_dw_disable(struct dw_i2c_dev *dev);

static inline void __i2c_dw_enable(struct dw_i2c_dev *dev)
{
+ u32 enabled;
+
dev->status |= STATUS_ACTIVE;
- regmap_write(dev->map, DW_IC_ENABLE, 1);
+ regmap_read(dev->map, DW_IC_ENABLE, &enabled);
+ regmap_write(dev->map, DW_IC_ENABLE, enabled | DW_IC_ENABLE_ENABLE);
}

static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
{
- regmap_write(dev->map, DW_IC_ENABLE, 0);
+ u32 enabled;
+
+ regmap_read(dev->map, DW_IC_ENABLE, &enabled);
+ regmap_write(dev->map, DW_IC_ENABLE, enabled & DW_IC_ENABLE_SAR_EN);
dev->status &= ~STATUS_ACTIVE;
}

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 55ea91a63382..f2cc25f1c3c7 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -719,7 +719,7 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)

regmap_read(dev->map, DW_IC_ENABLE, &enabled);
regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
- if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
+ if (!(enabled & DW_IC_ENABLE_ENABLE) || !(stat & ~DW_IC_INTR_ACTIVITY))
return IRQ_NONE;
if (pm_runtime_suspended(dev->dev) || stat == GENMASK(31, 0))
return IRQ_NONE;
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index cec25054bb24..0da1e0291001 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -158,7 +158,8 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
regmap_read(dev->map, DW_IC_STATUS, &tmp);
slave_activity = ((tmp & DW_IC_STATUS_SLAVE_ACTIVITY) >> 6);

- if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
+ if (!(enabled & DW_IC_ENABLE_ENABLE) ||
+ !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
return IRQ_NONE;

stat = i2c_dw_read_clear_intrbits_slave(dev);
--
2.25.1

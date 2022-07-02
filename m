Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2A09564078
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 15:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbiGBN7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Jul 2022 09:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbiGBN7f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Jul 2022 09:59:35 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52635BE25;
        Sat,  2 Jul 2022 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656770374; x=1688306374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aum+UD8Fi4aVMEBrhQK8X7w7WaoAtKiqdmgIuZeVwUo=;
  b=PIrk/bJjf6+ae68kZEPN1VAGROmmTsFGae831yz/ODg1TOdwgbuJ+bL+
   76R+almwfRdN3Lkh8Eu6mw22KaJIrhpk7ceFZ8bthbsEbyV3foNSCFTFV
   eMv2XwQdNnUkz37AssNBspitl5La5qy5Uc4t3d83lj8VrmyJyr0Tt2J+l
   BHq8M+CqzgzePbeYQPppbPQk+tB/n7nKTWD5flkt7AQhq1EdJeERpNESb
   qZimkuhIAjY/0jJLgGsp6NARTZDgw8+vUJqCedX65OoV1T+GjoCDx6/29
   wVa9Y0WDMIhJqj2SurwUm3ZXbX+Rnw5PcN6YI3AH63KkkLijQWiwOvyzI
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="265865078"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="265865078"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 06:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="718918065"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 02 Jul 2022 06:59:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A59A2D9; Sat,  2 Jul 2022 16:59:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v1 2/2] i2c: Introduce i2c_str_read_write() and make use of it
Date:   Sat,  2 Jul 2022 16:59:25 +0300
Message-Id: <20220702135925.73406-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220702135925.73406-1-andriy.shevchenko@linux.intel.com>
References: <20220702135925.73406-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

str_read_write() returns a string literal "read" or "write" based
on the value. It also allows to unify usage of a such in the kernel.

For i2c case introduce a wrapper that takes struct i2c_msg as parameter.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/algos/i2c-algo-pca.c     | 3 +--
 drivers/i2c/algos/i2c-algo-pcf.c     | 3 +--
 drivers/i2c/busses/i2c-at91-master.c | 3 +--
 drivers/i2c/busses/i2c-exynos5.c     | 3 +--
 drivers/i2c/busses/i2c-hix5hd2.c     | 3 +--
 drivers/i2c/busses/i2c-img-scb.c     | 5 ++---
 drivers/i2c/busses/i2c-sh_mobile.c   | 3 +--
 drivers/i2c/busses/i2c-tiny-usb.c    | 6 ++----
 drivers/i2c/busses/i2c-viperboard.c  | 6 ++----
 drivers/i2c/i2c-core-base.c          | 3 +--
 include/linux/i2c.h                  | 7 +++++++
 11 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
index 384af88e58ad..e5ac3eee7a99 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -119,8 +119,7 @@ static int pca_address(struct i2c_algo_pca_data *adap,
 	int sta = pca_get_con(adap);
 	int addr = i2c_8bit_addr_from_msg(msg);
 
-	DEB2("=== SLAVE ADDRESS %#04x+%c=%#04x\n",
-	     msg->addr, msg->flags & I2C_M_RD ? 'R' : 'W', addr);
+	DEB2("=== SLAVE ADDRESS %#04x+%s=%#04x\n", msg->addr, i2c_str_read_write(msg), addr);
 
 	pca_outw(adap, I2C_PCA_DAT, addr);
 
diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 7a01f2687b4c..232224bbd670 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -316,8 +316,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		pmsg = &msgs[i];
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
-		     pmsg->flags & I2C_M_RD ? "read" : "write",
-		     pmsg->len, pmsg->addr, i + 1, num);)
+		     i2c_str_read_write(pmsg), pmsg->len, pmsg->addr, i + 1, num);)
 
 		ret = pcf_doAddress(adap, pmsg);
 
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index c0c35785a0dc..3761a6cb320f 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -523,8 +523,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	 * writing the corresponding bit into the Control Register.
 	 */
 
-	dev_dbg(dev->dev, "transfer: %s %zu bytes.\n",
-		(dev->msg->flags & I2C_M_RD) ? "read" : "write", dev->buf_len);
+	dev_dbg(dev->dev, "transfer: %s %zu bytes.\n", i2c_str_read_write(dev->msg), dev->buf_len);
 
 	reinit_completion(&dev->cmd_complete);
 	dev->transfer_status = 0;
diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index b812d1090c0f..cbac64042760 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -744,8 +744,7 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 	if (ret < 0) {
 		exynos5_i2c_reset(i2c);
 		if (ret == -ETIMEDOUT)
-			dev_warn(i2c->dev, "%s timeout\n",
-				 (msgs->flags & I2C_M_RD) ? "rx" : "tx");
+			dev_warn(i2c->dev, "%s timeout\n", i2c_str_read_write(msgs);
 	}
 
 	/* Return the state as in interrupt routine */
diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 61ae58f57047..fefa5db52138 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -332,8 +332,7 @@ static int hix5hd2_i2c_xfer_msg(struct hix5hd2_i2c_priv *priv,
 	if (timeout == 0) {
 		priv->state = HIX5I2C_STAT_RW_ERR;
 		priv->err = -ETIMEDOUT;
-		dev_warn(priv->dev, "%s timeout=%d\n",
-			 msgs->flags & I2C_M_RD ? "rx" : "tx",
+		dev_warn(priv->dev, "%s timeout=%d\n", i2c_str_read_write(msgs),
 			 priv->adap.timeout);
 	}
 	ret = priv->state;
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 8e987945ed45..772443059f49 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -950,9 +950,8 @@ static irqreturn_t img_i2c_isr(int irq, void *dev_id)
 			    INT_FIFO_EMPTY |
 			    INT_FIFO_FULL))) {
 		dev_crit(i2c->adap.dev.parent,
-			 "fatal: clock low timeout occurred %s addr 0x%02x\n",
-			 (i2c->msg.flags & I2C_M_RD) ? "reading" : "writing",
-			 i2c->msg.addr);
+			 "fatal: clock low timeout occurred when %s addr 0x%02x\n",
+			 i2c_str_read_write(&i2c->msg), i2c->msg.addr);
 		hret = ISR_FATAL(EIO);
 		goto out;
 	}
diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 72f024a0c363..2b569403ce71 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -409,8 +409,7 @@ static irqreturn_t sh_mobile_i2c_isr(int irq, void *dev_id)
 	pd->sr |= sr; /* remember state */
 
 	dev_dbg(pd->dev, "i2c_isr 0x%02x 0x%02x %s %d %d!\n", sr, pd->sr,
-	       (pd->msg->flags & I2C_M_RD) ? "read" : "write",
-	       pd->pos, pd->msg->len);
+		i2c_str_read_write(pd->msg), pd->pos, pd->msg->len);
 
 	/* Kick off TxDMA after preface was done */
 	if (pd->dma_direction == DMA_TO_DEVICE && pd->pos == 0)
diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 7279ca0eaa2d..74a435d7c308 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -71,10 +71,8 @@ static int usb_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
 
 		pmsg = &msgs[i];
 
-		dev_dbg(&adapter->dev,
-			"  %d: %s (flags %d) %d bytes to 0x%02x\n",
-			i, pmsg->flags & I2C_M_RD ? "read" : "write",
-			pmsg->flags, pmsg->len, pmsg->addr);
+		dev_dbg(&adapter->dev, "  %d: %s (flags %d) %d bytes to 0x%02x\n",
+			i, i2c_str_read_write(pmsg), pmsg->flags, pmsg->len, pmsg->addr);
 
 		/* and directly send the message */
 		if (pmsg->flags & I2C_M_RD) {
diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 8b5322c3bce0..dec12e904aca 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -278,10 +278,8 @@ static int vprbrd_i2c_xfer(struct i2c_adapter *i2c, struct i2c_msg *msgs,
 	for (i = 0 ; i < num ; i++) {
 		pmsg = &msgs[i];
 
-		dev_dbg(&i2c->dev,
-			"  %d: %s (flags %d) %d bytes to 0x%02x\n",
-			i, pmsg->flags & I2C_M_RD ? "read" : "write",
-			pmsg->flags, pmsg->len, pmsg->addr);
+		dev_dbg(&i2c->dev, "  %d: %s (flags %d) %d bytes to 0x%02x\n",
+			i, i2c_str_read_write(pmsg), pmsg->flags, pmsg->len, pmsg->addr);
 
 		mutex_lock(&vb->lock);
 		/* directly send the message */
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 94c0663a39a6..9811bb44a2e0 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2004,8 +2004,7 @@ module_exit(i2c_exit);
 static int i2c_quirk_error(struct i2c_adapter *adap, struct i2c_msg *msg, char *err_msg)
 {
 	dev_err_ratelimited(&adap->dev, "adapter quirk: %s (addr 0x%04x, size %u, %s)\n",
-			    err_msg, msg->addr, msg->len,
-			    msg->flags & I2C_M_RD ? "read" : "write");
+			    err_msg, msg->addr, msg->len, i2c_str_read_write(msg));
 	return -EOPNOTSUPP;
 }
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..3cfaad39cc24 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -20,7 +20,9 @@
 #include <linux/rtmutex.h>
 #include <linux/irqdomain.h>		/* for Host Notify IRQ */
 #include <linux/of.h>		/* for struct device_node */
+#include <linux/string_helpers.h>	/* for str_read_write() */
 #include <linux/swab.h>		/* for swab16 */
+
 #include <uapi/linux/i2c.h>
 
 extern struct bus_type i2c_bus_type;
@@ -934,6 +936,11 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
 	return (msg->addr << 1) | (msg->flags & I2C_M_RD ? 1 : 0);
 }
 
+static inline const char *i2c_str_read_write(const struct i2c_msg *msg)
+{
+	return str_read_write(msg->flags & I2C_M_RD);
+}
+
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
 void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred);
 
-- 
2.35.1


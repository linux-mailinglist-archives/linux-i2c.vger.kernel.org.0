Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69DDB694B12
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Feb 2023 16:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjBMP0f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Feb 2023 10:26:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjBMP0e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Feb 2023 10:26:34 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4980AEC4F;
        Mon, 13 Feb 2023 07:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676301991; x=1707837991;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Myql0AbsOX9YiON7G1lqeSB9ZHXoG2jmKJVBF9XTC/o=;
  b=S227U5XbPha63EGMRnjeuTyqtVYLC+21ZhYpLBmJ9ValcsdjRPABAhij
   8PSSL0vacphdGNBPJkf9BC7zn0exUBEywbH7WpLYV08Y0Zf36JPcIcIF5
   EB+1S6bWabgpkj73yh4bL2mt1o7hflsb8QQTAs3rkuV8PkPIFNls0fCbf
   +2GPw2tyxHVxTiuidGMBVZhHDYHW7fI1K6QSA6yiPR35DLsbYHlirjNsg
   q6s+hgvo9WMGGDaomwCy5QiobmzPFr0+gGC3TsZGCU48hsibaoHTgzKEK
   A2tX8ZG4cKQiXWhUYZpkheYMSNbJ/6uPj8BMj7ec081Y0PaW8gxWaUsPr
   w==;
X-IronPort-AV: E=Sophos;i="5.97,294,1669071600"; 
   d="scan'208";a="29048553"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Feb 2023 16:26:29 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 13 Feb 2023 16:26:29 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 13 Feb 2023 16:26:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676301989; x=1707837989;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Myql0AbsOX9YiON7G1lqeSB9ZHXoG2jmKJVBF9XTC/o=;
  b=IhCEx5kjYziJa9SK7o38BdNzhTgGaeUqUld2ytvHLW+dVfCtpEQZ784z
   59kHJ0HXtOOfsTGoncggL+Xe751ZeVOxS3OLRQCg/XUehFYDeyIlHtDKr
   odwhxyaA9sNOevmhlkoWcf3wHlwye/U20YMy3FottDtj8PPaOq3WHuhEO
   5eMCetMMvxSxGPEyB8Yaxm/Chemk6z+yGJ0+9yd0fovCdCwiAtdwN+CwE
   CILZQet9cb5sSgrLi3KF+sqphPij6fxuw0yKlnZ3NPRuCeuN03blIDZQy
   A9/HCHZGtVaPUWJr04i+YopeDUOO+DVsVRTmaGyfgvnCT0pZVCZJ8PenU
   g==;
X-IronPort-AV: E=Sophos;i="5.97,294,1669071600"; 
   d="scan'208";a="29048552"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Feb 2023 16:26:29 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.14])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id BF54F280056;
        Mon, 13 Feb 2023 16:26:28 +0100 (CET)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] i2c: mxs: ensure that DMA buffers are safe for DMA
Date:   Mon, 13 Feb 2023 16:25:50 +0100
Message-Id: <20230213152550.1776352-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We found that after commit 9c46929e7989
("ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems"), the
PCF85063 RTC driver stopped working on i.MX28 due to regmap_bulk_read()
reading bogus data into a stack buffer. This is caused by the i2c-mxs
driver using DMA transfers even for messages without the I2C_M_DMA_SAFE
flag, and the aforementioned commit enabling vmapped stacks.

As the MXS I2C controller requires DMA for reads of >4 bytes, DMA can't be
disabled, so the issue is fixed by using i2c_get_dma_safe_msg_buf() to
create a bounce buffer when needed.

Fixes: 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/i2c/busses/i2c-mxs.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index d113bed795452..e0f3b3545cfe4 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -171,7 +171,7 @@ static void mxs_i2c_dma_irq_callback(void *param)
 }
 
 static int mxs_i2c_dma_setup_xfer(struct i2c_adapter *adap,
-			struct i2c_msg *msg, uint32_t flags)
+			struct i2c_msg *msg, u8 *buf, uint32_t flags)
 {
 	struct dma_async_tx_descriptor *desc;
 	struct mxs_i2c_dev *i2c = i2c_get_adapdata(adap);
@@ -226,7 +226,7 @@ static int mxs_i2c_dma_setup_xfer(struct i2c_adapter *adap,
 		}
 
 		/* Queue the DMA data transfer. */
-		sg_init_one(&i2c->sg_io[1], msg->buf, msg->len);
+		sg_init_one(&i2c->sg_io[1], buf, msg->len);
 		dma_map_sg(i2c->dev, &i2c->sg_io[1], 1, DMA_FROM_DEVICE);
 		desc = dmaengine_prep_slave_sg(i2c->dmach, &i2c->sg_io[1], 1,
 					DMA_DEV_TO_MEM,
@@ -259,7 +259,7 @@ static int mxs_i2c_dma_setup_xfer(struct i2c_adapter *adap,
 		/* Queue the DMA data transfer. */
 		sg_init_table(i2c->sg_io, 2);
 		sg_set_buf(&i2c->sg_io[0], &i2c->addr_data, 1);
-		sg_set_buf(&i2c->sg_io[1], msg->buf, msg->len);
+		sg_set_buf(&i2c->sg_io[1], buf, msg->len);
 		dma_map_sg(i2c->dev, i2c->sg_io, 2, DMA_TO_DEVICE);
 		desc = dmaengine_prep_slave_sg(i2c->dmach, i2c->sg_io, 2,
 					DMA_MEM_TO_DEV,
@@ -563,6 +563,7 @@ static int mxs_i2c_xfer_msg(struct i2c_adapter *adap, struct i2c_msg *msg,
 	struct mxs_i2c_dev *i2c = i2c_get_adapdata(adap);
 	int ret;
 	int flags;
+	u8 *dma_buf;
 	int use_pio = 0;
 	unsigned long time_left;
 
@@ -588,13 +589,20 @@ static int mxs_i2c_xfer_msg(struct i2c_adapter *adap, struct i2c_msg *msg,
 		if (ret && (ret != -ENXIO))
 			mxs_i2c_reset(i2c);
 	} else {
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
+		if (!dma_buf)
+			return -ENOMEM;
+
 		reinit_completion(&i2c->cmd_complete);
-		ret = mxs_i2c_dma_setup_xfer(adap, msg, flags);
-		if (ret)
+		ret = mxs_i2c_dma_setup_xfer(adap, msg, dma_buf, flags);
+		if (ret) {
+			i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 			return ret;
+		}
 
 		time_left = wait_for_completion_timeout(&i2c->cmd_complete,
 						msecs_to_jiffies(1000));
+		i2c_put_dma_safe_msg_buf(dma_buf, msg, true);
 		if (!time_left)
 			goto timeout;
 
-- 
2.34.1


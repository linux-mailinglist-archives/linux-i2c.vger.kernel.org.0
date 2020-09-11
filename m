Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974E326658D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 19:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgIKRE3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 13:04:29 -0400
Received: from mx1.tq-group.com ([62.157.118.193]:10397 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgIKPCg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Sep 2020 11:02:36 -0400
IronPort-SDR: xAo6en6rEUfu6F1AMIgNOA39SC5hKt1QbgHPE1wbvLbovX07L8xr9rkv0QLAngULZRJVcl7gn3
 joeuHL6LpSPU3RBcFPUDBkEH4Rr5dstqYIPcgRQnKDj7k7AyrciYEQaX6dBMtr+O8mfPjnSJRt
 LzoN5bQ9wAnofYQEpjlt2AWrx0Qh7ZeIGZ8HwNms964WmhMKd+6BsfPqf6OChsM1buaU4nXvLv
 kB9HGpGP5qjB0xpQZ8kgARiD9iIAKw891T45xINMSjLwOl7p8ZdSw8lZIS5vCzZU/RgoKDFaQm
 bg0=
X-IronPort-AV: E=Sophos;i="5.76,415,1592863200"; 
   d="scan'208";a="13831338"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Sep 2020 17:01:49 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 11 Sep 2020 17:01:49 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 11 Sep 2020 17:01:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1599836509; x=1631372509;
  h=from:to:cc:subject:date:message-id;
  bh=rGnbFBeV98YZ6Jj0PFhBZ+Pm9hlOkM3MIOQgmK98Tx8=;
  b=S7RNZ5vCOf6ybbKaiTe+UBeKM+64f2hKOTGlGlFHHgAWyfZ8HOT4atbi
   ERMhgSm6Ou7mHsWrfDkkgVfjRa5zL6b/2J5VCUs2U4jAvyn75RDjJOSxo
   K/Zwew2ZPZia4+dcHLC4Jj879HETcevXYMbhPF5Ltqmf6PL9wdvhxcCAR
   s/2LJcuHDo38k+6CL6P6VL3hPZgKngRVKo99529URnupq2bl30ueGJZNi
   /rljbQhQhuByBulmejlAMyWpslzRcOaoCgMKDBVKZ9QYRGoxlVCPb0pRw
   bmFTEhc4FysZBLs37JQZt/yOs5C7cBm7WqRuh3i12lm2+4N0vqNhlfT+U
   Q==;
IronPort-SDR: Z2Qh7HYOE9HEncPGGLxSJmyY6VUNxlaZXWQOlMXLamvJHIJcJB1oWm8TZ2YLNFdwtyyc/j7/qs
 Vl58Or6OOHMRuFISr9rrnI2uxVmWjd8glrNfbg4uuYAzV+OpZTLVnrToEAmrWCNycyfHSjdese
 RmACkYqLTsefdqB+zW6dDpYivyg+zUfiHB5wXKydOkiU6TWrEImH7ajRd8G8koOJ9Vn5UAY1Cs
 3+17mAQHA45LU51cO882Ft9BnY7OESr749kX42eBAHfRFR31UzeTMhfJJdBGLmU2NMZHGIT7vQ
 Tq4=
X-IronPort-AV: E=Sophos;i="5.76,415,1592863200"; 
   d="scan'208";a="13831337"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Sep 2020 17:01:49 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.117.49.134])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id D138D280070;
        Fri, 11 Sep 2020 17:01:48 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] i2c: mxs: use MXS_DMA_CTRL_WAIT4END instead of DMA_CTRL_ACK
Date:   Fri, 11 Sep 2020 17:01:39 +0200
Message-Id: <20200911150139.13690-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver-specific usage of the DMA_CTRL_ACK flag was replaced with a
custom flag in commit ceeeb99cd821 ("dmaengine: mxs: rename custom flag"),
but i2c-mxs was not updated to use the new flag, completely breaking I2C
transactions using DMA.

Fixes: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

I'm a bit out of my depth here - I have no idea what these flags are
supposed to do. Looking at ceeeb99cd821, this is what I came up with,
and it fixes I2C communication with multiple devices (an EEPROM and a
PCF85063TP RTC) on one of our i.MX28 boards.

I run-tested this on a 5.4.y kernel; given how little is happening in
these drivers nowadays, I assume that the fix is still valid on newer
kernels...


 drivers/i2c/busses/i2c-mxs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 9587347447f0..c4b08a924461 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -25,6 +25,7 @@
 #include <linux/of_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/dma/mxs-dma.h>
 
 #define DRIVER_NAME "mxs-i2c"
 
@@ -200,7 +201,8 @@ static int mxs_i2c_dma_setup_xfer(struct i2c_adapter *adap,
 		dma_map_sg(i2c->dev, &i2c->sg_io[0], 1, DMA_TO_DEVICE);
 		desc = dmaengine_prep_slave_sg(i2c->dmach, &i2c->sg_io[0], 1,
 					DMA_MEM_TO_DEV,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+					DMA_PREP_INTERRUPT |
+					MXS_DMA_CTRL_WAIT4END);
 		if (!desc) {
 			dev_err(i2c->dev,
 				"Failed to get DMA data write descriptor.\n");
@@ -228,7 +230,8 @@ static int mxs_i2c_dma_setup_xfer(struct i2c_adapter *adap,
 		dma_map_sg(i2c->dev, &i2c->sg_io[1], 1, DMA_FROM_DEVICE);
 		desc = dmaengine_prep_slave_sg(i2c->dmach, &i2c->sg_io[1], 1,
 					DMA_DEV_TO_MEM,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+					DMA_PREP_INTERRUPT |
+					MXS_DMA_CTRL_WAIT4END);
 		if (!desc) {
 			dev_err(i2c->dev,
 				"Failed to get DMA data write descriptor.\n");
@@ -260,7 +263,8 @@ static int mxs_i2c_dma_setup_xfer(struct i2c_adapter *adap,
 		dma_map_sg(i2c->dev, i2c->sg_io, 2, DMA_TO_DEVICE);
 		desc = dmaengine_prep_slave_sg(i2c->dmach, i2c->sg_io, 2,
 					DMA_MEM_TO_DEV,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+					DMA_PREP_INTERRUPT |
+					MXS_DMA_CTRL_WAIT4END);
 		if (!desc) {
 			dev_err(i2c->dev,
 				"Failed to get DMA data write descriptor.\n");
-- 
2.17.1


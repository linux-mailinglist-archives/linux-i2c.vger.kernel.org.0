Return-Path: <linux-i2c+bounces-1254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5537829A2A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 13:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 518A128AA42
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 12:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4307F482EC;
	Wed, 10 Jan 2024 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gCfkSN+e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0A433BA
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704888361; x=1736424361;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eFAQIEmv6F17OXZMoPcqkW3lx9vM18qRW5zOUoZFNI0=;
  b=gCfkSN+ein3Wn1G0snDT/DXtH2zvrmNYkloUfVpkE+77zZ+AcfBIE5k1
   csWoZiAx/+qntU6CzZS5XwYaEMWJXBMTV8OBngTh7dNBSJH7zYlQwBEUv
   dCGq5E0X1tfKRMWxU+l3Jl2xMFD/Oj0vDemdEOAOX6WfMmUBMj7E5CWBj
   ykEH58t/sjrZrSqin2ehPvB+UcK4HBGGFI1mZC37mA0GJs/l/slLXKd5u
   gfzf9TKg03mA63HBemvYfEuYfiLakHm0vTFmANAAR0/LDk4nLeZZag9vy
   Pr4BNipNlkqPedRhT8VXoUZL2Kyhryy9bLO3M8Gahzojhri+tLuCitlx0
   A==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="34828407"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2024 13:05:59 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DF2BB280075;
	Wed, 10 Jan 2024 13:05:58 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v8 1/1] i2c: lpi2c: use clk notifier for rate changes
Date: Wed, 10 Jan 2024 13:05:56 +0100
Message-Id: <20240110120556.519800-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Instead of repeatedly calling clk_get_rate for each transfer, register
a clock notifier to update the cached divider value each time the clock
rate actually changes.
A deadlock has been observed while adding tlv320aic32x4 audio codec to
the system. When this clock provider adds its clock, the clk mutex is
locked already, it needs to access i2c, which in return needs the mutex
for clk_get_rate as well.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v8:
* Improved commit message describing an actual observed deadlock

Changes in v7:
* Use dev_err_probe
* Reworked/Shortened the commit message
 It is not about saving CPU cycles, but to avoid locking the clk subsystem
 upon each transfer.

 drivers/i2c/busses/i2c-imx-lpi2c.c | 40 +++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 678b30e90492a..3070e605fd8ff 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -5,6 +5,7 @@
  * Copyright 2016 Freescale Semiconductor, Inc.
  */
 
+#include <linux/atomic.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -99,6 +100,8 @@ struct lpi2c_imx_struct {
 	__u8			*rx_buf;
 	__u8			*tx_buf;
 	struct completion	complete;
+	struct notifier_block	clk_change_nb;
+	atomic_t		rate_per;
 	unsigned int		msglen;
 	unsigned int		delivered;
 	unsigned int		block_data;
@@ -197,6 +200,20 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 	} while (1);
 }
 
+static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct clk_notifier_data *ndata = data;
+	struct lpi2c_imx_struct *lpi2c_imx = container_of(nb,
+							  struct lpi2c_imx_struct,
+							  clk_change_nb);
+
+	if (action & POST_RATE_CHANGE)
+		atomic_set(&lpi2c_imx->rate_per, ndata->new_rate);
+
+	return NOTIFY_OK;
+}
+
 /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
 static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 {
@@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	clk_rate = atomic_read(&lpi2c_imx->rate_per);
 	if (!clk_rate)
 		return -EINVAL;
 
@@ -590,6 +607,27 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	lpi2c_imx->clk_change_nb.notifier_call = lpi2c_imx_clk_change_cb;
+	ret = devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
+					 &lpi2c_imx->clk_change_nb);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't register peripheral clock notifier\n");
+	/*
+	 * Lock the clock rate to avoid rate change between clk_get_rate() and
+	 * atomic_set()
+	 */
+	ret = clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't lock I2C peripheral clock rate\n");
+
+	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx->clks[0].clk));
+	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
+	if (!atomic_read(&lpi2c_imx->rate_per))
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "can't get I2C peripheral clock rate\n");
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
-- 
2.34.1



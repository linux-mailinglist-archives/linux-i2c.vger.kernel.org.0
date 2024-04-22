Return-Path: <linux-i2c+bounces-3041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F68ACC19
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 13:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EABA1F214F3
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 11:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2B31465BE;
	Mon, 22 Apr 2024 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="P4aoMHOs";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jPo7Kp3i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E31D1465B3;
	Mon, 22 Apr 2024 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713785800; cv=none; b=uN6uq6hb2t49KFUWW4Nsu/dNKct1Cq2USL4BvBW5OeKl/5ietR+GTpPGtqrqksLRybdlwxBrEqDm7kB4kL67pTMmVCUWrG6Yx6h+gxBR3Mvv/OSDQWMbPVzR6Tj+X+D9shzDMeXblaasqaTWcLJ77SX9stQKftErKJzvqD25Nag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713785800; c=relaxed/simple;
	bh=ItdicYmLWZdbJ4/E+0SqxN1tOW9mkHu6tubEIWymiTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ql4Y1mkxB/ni/ghVv5u2pZdDQNVq9IGseEehOgpNjHiDSFEvkNN45DaSNsWwKdPXD4ezpDk/8V/rOPCG5TbO506estdf2i/vKYKZESNOW25S+A3y2jp6g/a60z0QZbeMDi3Ef7l0/HsuNu3a+F+QJeNUC5jJgixSNrY+Td6j1p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=P4aoMHOs; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jPo7Kp3i reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1713785797; x=1745321797;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a8tmUfcLbDKINV4lHr1PNpryxyZNz/7RC/mYXxPwibE=;
  b=P4aoMHOs3qnnOcMnTAupO0DLpd8FLXQZBzVcNORzQnFBGH8CNHfuOoPc
   Ka0IP6KH29rHY6Nr9lCdfGVLPLZRk2FfTgYybi8N73Vc4uEsQd7XTCPur
   P/6olANW891IhEI0SHZMX7aQ7JLUoCvQuPBejYWh59rhNnwAfjoXN0FWa
   yY9w19HSmp0ndwBQWB6AcZb9XbfhDzhQAVxVfj9yFQOK9xhYFpmxRfVGw
   By+CEUBkJAK8vlte1bNiBTbMqtX9OjenOCzCnYUJlTHrW3YLy8Scw1KT2
   qMVIDKzSb4zm7BXh1krly1RpJMmWzTAzWJl5h/XoAgEsQtRbGew6wuGlp
   Q==;
X-IronPort-AV: E=Sophos;i="6.07,220,1708383600"; 
   d="scan'208";a="36541302"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Apr 2024 13:36:34 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E08EE160AEF;
	Mon, 22 Apr 2024 13:36:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1713785790;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=a8tmUfcLbDKINV4lHr1PNpryxyZNz/7RC/mYXxPwibE=;
	b=jPo7Kp3ibDT+vTxxqzArMmj6CmwpJ7g3V7e3im9iqmjqM1dBgGoVXLfeMQ+uQNyHiV16+F
	Xh6Kujzotm/mBwjLTyI5q54L+4dAW8h+PyoZWqezTsuogWqKX/DWVtfuLxsfklbNUHL/bu
	NAcczu1W2rejJjDZsapvY8zyjzGbyz/VINKkZKVB1fWM1BlZGQN6raq2fdOS2sOjRrC8rv
	0ai1XFjyWlX9k4jEK5QsGV2pYc4U+g9BlxIdjFiCk9UUdIYw0+sUdMK3TzQA4EJ6uvh/iP
	Vb3YKvXUX/ayvFAGxqVZHg3dJ3Sg1gFYHIYb9PQFd3kQwimWvSpzrCIy5KbuQg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] i2c: lpi2c: Avoid calling clk_get_rate during transfer
Date: Mon, 22 Apr 2024 13:36:29 +0200
Message-Id: <20240422113629.1629891-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Instead of repeatedly calling clk_get_rate for each transfer, lock
the clock rate and cache the value.
A deadlock has been observed while adding tlv320aic32x4 audio codec to
the system. When this clock provider adds its clock, the clk mutex is
locked already, it needs to access i2c, which in return needs the mutex
for clk_get_rate as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
This is an alternative, lightweight approach replacing the patch [1].
The issue to address is still removing the call to clk_get_rate() during each
transfer, which might reuslt in a deadlock. lockdep also complains about this
call chain.
The dependency from v2 has already been merged in commit b0cde62e4c548
("clk: Add a devm variant of clk_rate_exclusive_get()").

Instead of adding a clock notifier, lock the peripheral clock rate and cache
the peripheral clock rate.
Currently LPI2C is available in the following SoC:
* i.MX7ULP
* i.MX8ULP
* i.MX8DXL
* i.MX8X
* i.MX8
* i.MX93

Additionally I expect both i.MX91 and i.MX95 to also use this driver.

This patch assumes the parent clock rate never changes. This is apparently true
for i.MX93 as each I2C has it's own lpi2c*_root clock. On i.MX8 and i.MX8X
clocks are managed by SCU with it's own dedicated firmware. I can't say if the
clock never changes though. I have no idea about the other SoC.

Changes in v3:
* Rebased to next-20240422

Changes in v2:
* Removed redundent clk_rate check in lpi2c_imx_config (I opted to keep
  the local variable to not extent the calculation code lines)
* Collected R-b

Best regards,
Alexander

[1] https://lore.kernel.org/all/20240110120556.519800-1-alexander.stein@ew.tq-group.com/

 drivers/i2c/busses/i2c-imx-lpi2c.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 6d72e4e126dde..36e8f6196a87b 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -99,6 +99,7 @@ struct lpi2c_imx_struct {
 	__u8			*rx_buf;
 	__u8			*tx_buf;
 	struct completion	complete;
+	unsigned long		rate_per;
 	unsigned int		msglen;
 	unsigned int		delivered;
 	unsigned int		block_data;
@@ -212,9 +213,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
-	if (!clk_rate)
-		return -EINVAL;
+	clk_rate = lpi2c_imx->rate_per;
 
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
@@ -611,6 +610,20 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Lock the parent clock rate to avoid getting parent clock upon
+	 * each transfer
+	 */
+	ret = devm_clk_rate_exclusive_get(&pdev->dev, lpi2c_imx->clks[0].clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't lock I2C peripheral clock rate\n");
+
+	lpi2c_imx->rate_per = clk_get_rate(lpi2c_imx->clks[0].clk);
+	if (!lpi2c_imx->rate_per)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "can't get I2C peripheral clock rate\n");
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
-- 
2.34.1



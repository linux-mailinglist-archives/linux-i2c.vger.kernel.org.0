Return-Path: <linux-i2c+bounces-1376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1AC8324FD
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 08:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2E291F239CD
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 07:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2448F61;
	Fri, 19 Jan 2024 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Lq+51E+J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9757484
	for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648955; cv=none; b=i1zI/0THrIhgzf2va/ErPRDvsY6EahMBN13zx58gWC3EDa96YkLxacw3eZgfOD2WYibaTEeeJNGLMibAwN55AGdeTiF4tW2W5Ecy+h8Ko/gIwm+n2iotTAUdg2KdAtoQFeGF3t4PCjVWnkgykHjn13lmW622MDek0/NmPNmaYRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648955; c=relaxed/simple;
	bh=nnWfCzzOtGl2qmTPtruKnwqq4F+2FkHRy/q7ecIu840=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ErhkN8rQvbLLtC9dWE9TiVECzyZNDBafRtiP2CpqfNl2Md/k4WVBgCvQeVtQWgXAhr0Bth1RSmOPBtpOj0KiT0bQDfzb/80EYs9RLIt6MBtwTGVxsnAewDvnPnsamk1kTNt6w5QZTf2gSNOJyjIunn/I+mQtUwBkDs8Z3TO2om0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Lq+51E+J; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705648952; x=1737184952;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ToCD64IZyp9R5KDsXQDCPabTKt3AQPT7ipiSDB71oLo=;
  b=Lq+51E+JfEyW7tiMLG5RSlez2pRNde+8obGeRNbYD73T+qoC0JWN7Mpj
   27Mc2hev8WlbA9QjLJL2atkAhlti9ZSlGmlxBiuvRn+NWpUkXoyF4ldQr
   3XK/lTOeyilvtJAV4N0KYQcguYa3tjfl0SpGbTB09HBE5DHWp8G1989rP
   zD3lWyTUCEeWMdNAJl0ohf00/3mrhc342eYotHyjNKd112sN1kR8b3lnQ
   ObEkGvJIEk6Ga5jRhk5ul6Jmao+vABLGxCch/9hk+Kf0vyL5zDvbRhIp7
   JSTlbihe3cNy5dyFjnToLkrNyxj4EFPtJWQw+5vHSuCdIYQaSkmPSc3eU
   g==;
X-IronPort-AV: E=Sophos;i="6.05,204,1701126000"; 
   d="scan'208";a="34974265"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2024 08:22:29 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 13478280075;
	Fri, 19 Jan 2024 08:22:29 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v2 1/1] i2c: lpi2c: Avoid calling clk_get_rate during transfer
Date: Fri, 19 Jan 2024 08:22:23 +0100
Message-Id: <20240119072223.3986183-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
This is an alternative, lightweight approach replacing the patch [1] and
depends on [2].
The issue to address is still removing the call to clk_get_rate() during each
transfer, which might reuslt in a deadlock. lockdep also complains about this
call chain.

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

Changes in v2:
* Removed redundent clk_rate check in lpi2c_imx_config (I opted to keep
  the local variable to not extent the calculation code lines)
* Collected R-b

Best regards,
Alexander

[1] https://lore.kernel.org/all/20240110120556.519800-1-alexander.stein@ew.tq-group.com/
[2] https://lore.kernel.org/all/20240104225512.1124519-2-u.kleine-koenig@pengutronix.de/

 drivers/i2c/busses/i2c-imx-lpi2c.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 678b30e90492a..14473c223cfa7 100644
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
@@ -207,9 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
-	if (!clk_rate)
-		return -EINVAL;
+	clk_rate = lpi2c_imx->rate_per;
 
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
@@ -590,6 +589,20 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
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



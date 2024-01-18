Return-Path: <linux-i2c+bounces-1368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB7831349
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 08:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45DCDB20D23
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 07:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731F5BE47;
	Thu, 18 Jan 2024 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="J6QBKi+O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF15944D
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jan 2024 07:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705563828; cv=none; b=CB4fxqTPiV2Lr46QGee/PvgGFVqqOOFajp8HtqlcNVkV6cDSuCDQKR7Mzy4iAM2XB8MBF+yzxWW+iGCF7N2/NcL7knMO182R6jkZYFm3r0pEEbttD8lZqlYK9WLdZrpZ32erzCJ4l5Qwz82I0F/YFIAIKa9wAes8d+Ow8/uWCT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705563828; c=relaxed/simple;
	bh=GiylUNqyft6eVH3nj1nNBVeofWfjHavpsf12888zFvQ=;
	h=DKIM-Signature:X-IronPort-AV:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	b=VUoZ9zpL0gzQOM4dGHtIAq7JkMgDwd8voP31qA6m04kcgTgUkI3NNjkUuZItoo3araDtFTMJrI5rL4kmPKsLSbEAQ74retteFN57tHr8x0FVJsjxjHSBIFIxQQMEsaQJnOS4LFCH3rlKwR2ZXvRKCUIV9/sLy2OP3whzRu/p6w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=J6QBKi+O; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705563824; x=1737099824;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iMvDzT/pnlDEMFn2AAFzFj4w+xvdojYftR+/GmN7PG0=;
  b=J6QBKi+OeWsXu1Rqtz8+rSLilXivBhBjxACVjmyTMsynLD2kR6ZpkSuQ
   StD8wNai8Hf9qLVw1O8Dm/d9S3BszwAe0kjtbJk5oAJthXVpmaDf6eetx
   kRUkdQuXjH0z3Yn3rUdRBLLzAL46heiyk7F3/toXrMeOoc6H6hpyBbli7
   1JJfJuuXM03rYdSixP19nEXtPUOClI2L9IUuh0HDcdaQ3lu5Law0ZQyWe
   hRqWQG0VEXwyHr3ELM5Zz4Z5XyD1t9QF7014cyhaxzhdi9dG5SEaoGibK
   rTFKphh0zHqTMijAWagVf0fYhhqPU1pyNTdmLTV0YNhTBrCE6+DNOcsLC
   Q==;
X-IronPort-AV: E=Sophos;i="6.05,201,1701126000"; 
   d="scan'208";a="34953047"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jan 2024 08:43:35 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 29EC0280075;
	Thu, 18 Jan 2024 08:43:35 +0100 (CET)
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
Subject: [PATCH 1/1] i2c: lpi2c: Avoid calling clk_get_rate during transfer
Date: Thu, 18 Jan 2024 08:43:32 +0100
Message-Id: <20240118074332.3633533-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of repeatedly calling clk_get_rate for each transfer, lock
the clock rate and cache the value.
A deadlock has been observed while adding tlv320aic32x4 audio codec to
the system. When this clock provider adds its clock, the clk mutex is
locked already, it needs to access i2c, which in return needs the mutex
for clk_get_rate as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
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

Best regards,
Alexander

[1] https://lore.kernel.org/all/20240110120556.519800-1-alexander.stein@ew.tq-group.com/
[2] https://lore.kernel.org/all/20240104225512.1124519-2-u.kleine-koenig@pengutronix.de/

 drivers/i2c/busses/i2c-imx-lpi2c.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 678b30e90492a..6cbcb27a3b280 100644
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
@@ -207,7 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	clk_rate = lpi2c_imx->rate_per;
 	if (!clk_rate)
 		return -EINVAL;
 
@@ -590,6 +591,20 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
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



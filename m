Return-Path: <linux-i2c+bounces-3808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B978FCB32
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 13:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 198ED1C21B88
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 11:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E494D1990DE;
	Wed,  5 Jun 2024 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMskRonR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818A1990D4;
	Wed,  5 Jun 2024 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588217; cv=none; b=H8GOXRzqVxLPrU2xvy/XBvH7Wb9lOzoqy7YSuUYXhLhtTkas1uqQhWiN7GjBMprzBcVw3u7u4R7HWoow3sTvZOxeNT7fNfDj9dCpdaqU2sL4TYmAq8zEI9IbjYXN5pwVgBFDxVK4TxVFSsrBh1/FIbTSr7Wb2O6+dRQRnkaGMo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588217; c=relaxed/simple;
	bh=ofMFuZutyc8UqgcT5XmcJ+uqQ0V9bPSOejxM9gZ7iic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKM0ZhqMUVYdPSee2tbHRxLuvqNaIuWp5KnTsIO0BPZfFZRBLL3Hu1+gFCS3bcB8AGmRwHLIBymP3vLy3+wA2lYl3riCN4sjXJlbuFnE2pXijLgeBn33hgq2GqyhELADSd5D2n4VGD/Apl6SG+KwK83uAGhZIcPVrHQZUrmBQaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMskRonR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FE3C4AF07;
	Wed,  5 Jun 2024 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588217;
	bh=ofMFuZutyc8UqgcT5XmcJ+uqQ0V9bPSOejxM9gZ7iic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fMskRonRrRM6NmUpu7eFzU4ZWSt+5/GZnDifC3g5BBKW+cIyLqr00OYR8rRxZ9UsL
	 5WFQvNnsU6NRPay7sxnmi/L7cbw0Twi85pDxxneGixBjvBodQdw3ntmd2a4kpJbbRN
	 rQhIXHckPbbWOtUKKwfNUJ/y0iR/067B76ZOOaX0r1/NSCsgwu2S5yRBMiY7iBuZf1
	 fDuz2gjYcniE5jgW7mJBrOKynD0taRtEo6ScCGWMZTZ0bXlUrkdbNHdvJ9KKf9MHtt
	 NWHD4YX2sJyOfTOieCbn7d3dMJgHM9Ixc1KEi4aFpSuHw/ItNh6xukkB0zQYke9+J1
	 c4NeqYaU1cVBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	aisheng.dong@nxp.com,
	shawnguo@kernel.org,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.9 21/28] i2c: lpi2c: Avoid calling clk_get_rate during transfer
Date: Wed,  5 Jun 2024 07:48:50 -0400
Message-ID: <20240605114927.2961639-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114927.2961639-1-sashal@kernel.org>
References: <20240605114927.2961639-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
Content-Transfer-Encoding: 8bit

From: Alexander Stein <alexander.stein@ew.tq-group.com>

[ Upstream commit 4268254a39484fc11ba991ae148bacbe75d9cc0a ]

Instead of repeatedly calling clk_get_rate for each transfer, lock
the clock rate and cache the value.
A deadlock has been observed while adding tlv320aic32x4 audio codec to
the system. When this clock provider adds its clock, the clk mutex is
locked already, it needs to access i2c, which in return needs the mutex
for clk_get_rate as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
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
2.43.0



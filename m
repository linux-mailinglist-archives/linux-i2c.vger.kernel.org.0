Return-Path: <linux-i2c+bounces-1450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CB283C428
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jan 2024 14:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DDF61C21DCA
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jan 2024 13:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833E75F879;
	Thu, 25 Jan 2024 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="WxpbIOG2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125235F550;
	Thu, 25 Jan 2024 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706191011; cv=none; b=kxbxZDXFn0WsEeyiIkh273nFyVSfTug4t4+SVLXv8JvMk80kJ8ceIaVDnEhdXz4gQ1T49QGEagpXddFr2oh+gv9s1HWtsu/5/HsH0+GlIKHN1FUrr272Uwi8MXCy0W5EPnDxitrhfgoBmUqFCULY08n86xRZnoL5Vs6WYDEFU7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706191011; c=relaxed/simple;
	bh=IWxzAboRtoqhPNg96zAmR2aFVe/sEUWlekCOypdoGZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=moItPQDhpP1cDLbaUe4vMNL9nnJYz4jmBsR13iGioXGRGD+U60UwCdcVlzgTg0OMrN6FUe3B4n1b4CQdVtabOQLd1EyzsPzw1PJxURV2dkGxW1RtEuZXgDYPCDFQNRI/my0DoQsm3Tpb/0QONMr+Nmak9bh0Uyvbl0WLw+c8yyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=WxpbIOG2; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=BXTaDkjKbGZFujbFyojexlThA3BDT146mWz3iNiQZ8s=; b=WxpbIOG29WAmDI2K86rMX3Ng3v
	/dc5W1rkYCrTsUhgML11N8bQPY1iN+nvMlyIy6elcuJwdr6HjctT6waGfWkWfvDPwZZIQ5BVNEJM2
	O2iJElkelLO/CkC+zNdkAFvo8rlrXPaOszv+NjNohFSm9GWLx8FfjFz5uQOnZd54noEFuTsmwccRM
	IS/L0HBarJAhXTh8lB2Rcz9z3nHHA8ArKIOkd1onDx1Hiwsftf/qPeDjBWVtGatDeivWbucnqWxDa
	PLwx4jdUB+L0QiXVyYXzoUraX7vLsXCwF+7T8umEDYobf0sHveeSgAlhqoRilFC9DXV7CMr8D4kFv
	RJN/1Qag==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1rT0De-000MN1-31; Thu, 25 Jan 2024 14:56:38 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <esben@geanix.com>)
	id 1rT0Dd-0001ma-9X; Thu, 25 Jan 2024 14:56:37 +0100
From: Esben Haabendal <esben@geanix.com>
To: linux-i2c@vger.kernel.org,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: imx: move to generic GPIO recovery
Date: Thu, 25 Jan 2024 14:56:36 +0100
Message-ID: <01abf8ccc0af74b4fb0124977ed6bdfb9d7107b6.1706190706.git.esben@geanix.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)

Starting with
commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
GPIO bus recovery is supported by the I2C core, so we can remove the
driver implementation and use that one instead.

As a nice side-effect, pinctrl becomes optional, allowing bus recovery on
LS1021A, which does not have such luxury, but can be wired up to use extra
fixed GPIO pins.

Note: The previous error messages about bus recovery not being supported is
dropped with this change. Given that it is perfectly possible to have platforms
where bus recovery works without pinctrl support, I happen to work on one such,
both error messages does not really make sense in those cases. And I don't see
how to know if this is the case or not.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/i2c/busses/i2c-imx.c | 62 +++---------------------------------
 1 file changed, 5 insertions(+), 57 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 88a053987403..d6ba93fc7fee 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -212,10 +212,6 @@ struct imx_i2c_struct {
 	const struct imx_i2c_hwdata	*hwdata;
 	struct i2c_bus_recovery_info rinfo;
 
-	struct pinctrl *pinctrl;
-	struct pinctrl_state *pinctrl_pins_default;
-	struct pinctrl_state *pinctrl_pins_gpio;
-
 	struct imx_i2c_dma	*dma;
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
@@ -1357,24 +1353,6 @@ static int i2c_imx_xfer_atomic(struct i2c_adapter *adapter,
 	return result;
 }
 
-static void i2c_imx_prepare_recovery(struct i2c_adapter *adap)
-{
-	struct imx_i2c_struct *i2c_imx;
-
-	i2c_imx = container_of(adap, struct imx_i2c_struct, adapter);
-
-	pinctrl_select_state(i2c_imx->pinctrl, i2c_imx->pinctrl_pins_gpio);
-}
-
-static void i2c_imx_unprepare_recovery(struct i2c_adapter *adap)
-{
-	struct imx_i2c_struct *i2c_imx;
-
-	i2c_imx = container_of(adap, struct imx_i2c_struct, adapter);
-
-	pinctrl_select_state(i2c_imx->pinctrl, i2c_imx->pinctrl_pins_default);
-}
-
 /*
  * We switch SCL and SDA to their GPIO function and do some bitbanging
  * for bus recovery. These alternative pinmux settings can be
@@ -1385,43 +1363,13 @@ static void i2c_imx_unprepare_recovery(struct i2c_adapter *adap)
 static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 		struct platform_device *pdev)
 {
-	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
-
-	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!i2c_imx->pinctrl) {
-		dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
-		return 0;
-	}
-	if (IS_ERR(i2c_imx->pinctrl)) {
-		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
-		return PTR_ERR(i2c_imx->pinctrl);
-	}
-
-	i2c_imx->pinctrl_pins_default = pinctrl_lookup_state(i2c_imx->pinctrl,
-			PINCTRL_STATE_DEFAULT);
-	i2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(i2c_imx->pinctrl,
-			"gpio");
-	rinfo->sda_gpiod = devm_gpiod_get_optional(&pdev->dev, "sda", GPIOD_IN);
-	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
-
-	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
-	    PTR_ERR(rinfo->scl_gpiod) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (IS_ERR(rinfo->sda_gpiod) ||
-		   IS_ERR(rinfo->scl_gpiod) ||
-		   IS_ERR(i2c_imx->pinctrl_pins_default) ||
-		   IS_ERR(i2c_imx->pinctrl_pins_gpio)) {
-		dev_dbg(&pdev->dev, "recovery information incomplete\n");
-		return 0;
-	}
+	struct i2c_bus_recovery_info *bri = &i2c_imx->rinfo;
 
-	dev_dbg(&pdev->dev, "using scl%s for recovery\n",
-		rinfo->sda_gpiod ? ",sda" : "");
+	bri->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(bri->pinctrl))
+		return PTR_ERR(bri->pinctrl);
 
-	rinfo->prepare_recovery = i2c_imx_prepare_recovery;
-	rinfo->unprepare_recovery = i2c_imx_unprepare_recovery;
-	rinfo->recover_bus = i2c_generic_scl_recovery;
-	i2c_imx->adapter.bus_recovery_info = rinfo;
+	i2c_imx->adapter.bus_recovery_info = bri;
 
 	return 0;
 }
-- 
2.43.0



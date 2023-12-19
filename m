Return-Path: <linux-i2c+bounces-858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF14081831F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 09:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6BE284CE5
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 08:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B0111C9F;
	Tue, 19 Dec 2023 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="0eHkGldz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38BB11C88;
	Tue, 19 Dec 2023 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ibU7eg0z0uiFU9/s/3+6t+5Fs4lzRvL9ofz4jQb4xO8=; b=0eHkGldz0gqBXDpUGKKVYwIoW8
	YdSyGS6p8JgB2Hyp+JjsEtlRmCHCkgpyKd0k7gz6s2r5MC74sIr/AW98hHhUPl8bIYK26v2O/v+Qs
	d95CTEqAELFkuQvQ/tlR22ljc80CGaRd/zUmLHHRWu8T0Y4uoexyQtARwRI/P00Ef5vyPLEBGq34Z
	sZnC4zkwKXJehFD9LqU8c8INPk5k6yF0EF/9vD5QGU+bfbV8Mv18TivBJWoECR5nE/rN38u5+zFzf
	XU2sLf+JQb9omqa9A6M6fG3zsUsYsgZ+GohB3m1yFgCKHF4E698ZSGoxUsBJDEW9ImuFm2xONx2Xw
	HxD8e8ww==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1rFUl0-000GId-Pc; Tue, 19 Dec 2023 08:43:14 +0100
Received: from [80.62.117.166] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <esben@geanix.com>)
	id 1rFUl0-000PHd-2Q; Tue, 19 Dec 2023 08:43:14 +0100
From: esben@geanix.com
To: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Andi Shyti <andi.shyti@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,  Fabio
 Estevam <festevam@gmail.com>,  NXP Linux Team <linux-imx@nxp.com>,
  linux-i2c@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux@ew.tq-group.com
Subject: Re: [PATCH] i2c: i2c-imx: allow bus recovery on non-muxable pads
In-Reply-To: <20231218-i2c-imx-recovery-v1-1-f69fa85b228c@ew.tq-group.com>
	(Gregor Herburger's message of "Mon, 18 Dec 2023 18:06:12 +0100")
References: <20231218-i2c-imx-recovery-v1-1-f69fa85b228c@ew.tq-group.com>
Date: Tue, 19 Dec 2023 08:43:13 +0100
Message-ID: <87frzyprhq.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27127/Mon Dec 18 10:39:04 2023)

Gregor Herburger <gregor.herburger@ew.tq-group.com> writes:

> Currently the i2c-imx driver assumes that for bus recovery the i2c pins
> can be reconfigured as gpio via pinctrl.
>
> But bus recovery can also be done with a gpio electrically connected to
> i2c scl.
>
> Modify i2c_imx_init_recovery_info to allow bus recovery on platforms
> without pinctrl. In this case only use scl-gpio and
> i2c_generic_scl_recovery.

Why not move to use the generic GPIO recovery instead?  Will something
like this be able to cover at least the same scenarios as your change?

From 7e432496bae8c7ac35c21504bc1cd03f1dfef97f Mon Sep 17 00:00:00 2001
Message-ID: <7e432496bae8c7ac35c21504bc1cd03f1dfef97f.1702971634.git.esben@geanix.com>
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 25 May 2021 11:25:44 +0200
Subject: [PATCH] i2c: imx: move to generic GPIO recovery

Starting with
commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
GPIO bus recovery is supported by the I2C core, so we can remove the
driver implementation and use that one instead.

As a nice side-effect, pinctrl becomes optional, allowing bus recovery on
LS1021A, which does not have such luxury, but can be wired up to use extra
fixed GPIO pins.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/i2c/busses/i2c-imx.c | 62 ++++--------------------------------
 1 file changed, 7 insertions(+), 55 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1775a79aeba2..824d8bbb9be5 100644
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
@@ -1385,43 +1363,17 @@ static void i2c_imx_unprepare_recovery(struct i2c_adapter *adap)
 static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 		struct platform_device *pdev)
 {
-	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
+	struct i2c_bus_recovery_info *bri = &i2c_imx->rinfo;
 
-	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!i2c_imx->pinctrl) {
-		dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
+	bri->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (PTR_ERR(bri->pinctrl) == -ENODEV) {
+		bri->pinctrl = NULL;
 		return 0;
 	}
-	if (IS_ERR(i2c_imx->pinctrl)) {
-		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
-		return PTR_ERR(i2c_imx->pinctrl);
-	}
-
-	i2c_imx->pinctrl_pins_default = pinctrl_lookup_state(i2c_imx->pinctrl,
-			PINCTRL_STATE_DEFAULT);
-	i2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(i2c_imx->pinctrl,
-			"gpio");
-	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
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
-
-	dev_dbg(&pdev->dev, "using scl%s for recovery\n",
-		rinfo->sda_gpiod ? ",sda" : "");
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


/Esben


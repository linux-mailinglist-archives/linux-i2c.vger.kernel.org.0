Return-Path: <linux-i2c+bounces-856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D68A817826
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Dec 2023 18:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0BCD284B31
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Dec 2023 17:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16365BF8A;
	Mon, 18 Dec 2023 17:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="WSxQJaxt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990CD4FF9F;
	Mon, 18 Dec 2023 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702919188; x=1734455188;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=S2gUuVNTEJ/Mk6mRDuFWFq7L6gFeHwDmMi/57lMUPvo=;
  b=WSxQJaxtn0F3E44xUeWHhoHg0gwcWWcHU6/kCEzAVN24tR23irbSYMj1
   pJ+jqNOx+5TWQqnuTORMzzv6BkUDVLJSIMfu/qYtw+TqrWjppqeNq6vak
   YfZdmYR6bOJdlI0EmS2qo8dPX9zC40aR7b6puMnxLNVYSKALuJvxKBrgY
   K3OFY1H1dAaRDYHmFuLAUIN/DajVyrhX7BlRwkY5AZfSisQ42Ix7d4hQs
   PjyRExhmEkN/uucN7px2Ko0JiQKsrdDIpatrXx0sqvq09v2aC6k1X6jcH
   QjCJ/5xkUe1pLIM2aFe8A9YuFjaQ9AEXOSLE6UdxcNKjl3zM2LrVlX4eq
   w==;
X-IronPort-AV: E=Sophos;i="6.04,286,1695679200"; 
   d="scan'208";a="34568401"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Dec 2023 18:06:20 +0100
Received: from [127.0.1.1] (herburgerg-w2.tq-net.de [10.122.52.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DAC54280075;
	Mon, 18 Dec 2023 18:06:18 +0100 (CET)
From: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Date: Mon, 18 Dec 2023 18:06:12 +0100
Subject: [PATCH] i2c: i2c-imx: allow bus recovery on non-muxable pads
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231218-i2c-imx-recovery-v1-1-f69fa85b228c@ew.tq-group.com>
X-B4-Tracking: v=1; b=H4sIAAN8gGUC/x3MTQqAIBBA4avErBvwB0S6SrQIHWsWaYwQRXj3p
 OW3eO+FSsJUYRpeELq4cskdehwg7GveCDl2g1HGaqM9sgnIx41CoVwkD7q4OpeU9Tom6NkplPj
 +l/PS2geIvHk9YgAAAA==
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 gregor.herburger@ew.tq-group.com
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702919179; l=3178;
 i=gregor.herburger@ew.tq-group.com; s=20230829; h=from:subject:message-id;
 bh=p1iMSV8UId0zezOPOEITodjFEkpmIHiOCQIb5jeSM8I=;
 b=D966ipN6vH2FDSHYE4txEvdIYmkKeXpnSGCiJ4Y8ODCPVy3W0lbS8OTdF29k37nPuaU6vPtMK
 bt0QCfb9miWATUVvQOmGapUccEndAugw8Cu/sAzHa/UB0MPKAo7s3iC
X-Developer-Key: i=gregor.herburger@ew.tq-group.com; a=ed25519;
 pk=+eRxwX7ikXwazcRjlOjj2/tbDmfVZdDLoW+xLZbQ4h4=

Currently the i2c-imx driver assumes that for bus recovery the i2c pins
can be reconfigured as gpio via pinctrl.

But bus recovery can also be done with a gpio electrically connected to
i2c scl.

Modify i2c_imx_init_recovery_info to allow bus recovery on platforms
without pinctrl. In this case only use scl-gpio and
i2c_generic_scl_recovery.

Signed-off-by: Gregor Herburger <gregor.herburger@ew.tq-group.com>
---
 drivers/i2c/busses/i2c-imx.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1775a79aeba2..7d71accb031b 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1388,20 +1388,23 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
 
 	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!i2c_imx->pinctrl) {
-		dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
-		return 0;
-	}
+
+	if (PTR_ERR(i2c_imx->pinctrl) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	if (IS_ERR(i2c_imx->pinctrl)) {
-		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
-		return PTR_ERR(i2c_imx->pinctrl);
+		i2c_imx->pinctrl = NULL;
+		dev_info(&pdev->dev, "can't get pinctrl, trying non-pinctrl gpio recovery.\n");
 	}
 
-	i2c_imx->pinctrl_pins_default = pinctrl_lookup_state(i2c_imx->pinctrl,
-			PINCTRL_STATE_DEFAULT);
-	i2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(i2c_imx->pinctrl,
-			"gpio");
-	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
+	if (i2c_imx->pinctrl) {
+		i2c_imx->pinctrl_pins_default = pinctrl_lookup_state(i2c_imx->pinctrl,
+				PINCTRL_STATE_DEFAULT);
+		i2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(i2c_imx->pinctrl,
+				"gpio");
+	}
+
+	rinfo->sda_gpiod = devm_gpiod_get_optional(&pdev->dev, "sda", GPIOD_IN);
 	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
 
 	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
@@ -1415,11 +1418,15 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 		return 0;
 	}
 
-	dev_dbg(&pdev->dev, "using scl%s for recovery\n",
+	if (i2c_imx->pinctrl_pins_default && i2c_imx->pinctrl_pins_gpio) {
+		rinfo->prepare_recovery = i2c_imx_prepare_recovery;
+		rinfo->unprepare_recovery = i2c_imx_unprepare_recovery;
+	}
+
+	dev_dbg(&pdev->dev, "using %sscl%s for recovery\n",
+		i2c_imx->pinctrl ? "pinctrl " : "",
 		rinfo->sda_gpiod ? ",sda" : "");
 
-	rinfo->prepare_recovery = i2c_imx_prepare_recovery;
-	rinfo->unprepare_recovery = i2c_imx_unprepare_recovery;
 	rinfo->recover_bus = i2c_generic_scl_recovery;
 	i2c_imx->adapter.bus_recovery_info = rinfo;
 

---
base-commit: ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
change-id: 20231218-i2c-imx-recovery-6da66f0381df

Best regards,
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/



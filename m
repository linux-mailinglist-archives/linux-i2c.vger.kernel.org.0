Return-Path: <linux-i2c+bounces-564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABAE7FEC66
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 10:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0892E1C20D35
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 09:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48C22E403;
	Thu, 30 Nov 2023 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="N3Ibd4cj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F16D7F
	for <linux-i2c@vger.kernel.org>; Thu, 30 Nov 2023 01:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701338276; x=1732874276;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l2YmISjzorPYeE/jsxQPle8Nr81ohOrF30/kQc+QbxI=;
  b=N3Ibd4cjdFQYSfmhRZSdIkAGnuM8HJ09tv2oB3ky9/6eNTaKLUCRWbR/
   6rgqgfecxCXBK0iFhiK4j9g6+1rkVU3Lrgts70JNEoNj5B2Y4ltZLrfor
   FZDYUqMms5aU1SWdo4mmYZzUh9Z4VfUedPiMiKAHBT3UK5OH7bA3tIfzf
   H8zW4zZH0W4xdy8iQwJgD2q12/5nZEgwYD0WVKjQaCmcmY3YTS0FqOSoN
   FvZ6UzsZo8MdksbdAZoeVX2EwqjQtdROI2c3eBq0Hm33SIRuDEQk/tNgo
   azh1yFBmrNTN7WW1fy5Maz04XXWXZYph4Hu73OkYliDtwmhbaRpoMyWbT
   A==;
X-IronPort-AV: E=Sophos;i="6.04,237,1695679200"; 
   d="scan'208";a="34256378"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 30 Nov 2023 10:57:54 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 14E62280075;
	Thu, 30 Nov 2023 10:57:54 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] i2c: imx: Make SDA actually optional for bus recovering
Date: Thu, 30 Nov 2023 10:57:51 +0100
Message-Id: <20231130095751.65773-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both i2c_generic_scl_recovery() and the debug output indicate that SDA is
purely optional for bus recovery. But devm_gpiod_get() never returns NULL
making it mandatory. Fix this my calling devm_gpiod_get_optional instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1775a79aeba2a..88a053987403c 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1401,7 +1401,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 			PINCTRL_STATE_DEFAULT);
 	i2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(i2c_imx->pinctrl,
 			"gpio");
-	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
+	rinfo->sda_gpiod = devm_gpiod_get_optional(&pdev->dev, "sda", GPIOD_IN);
 	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
 
 	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
-- 
2.34.1



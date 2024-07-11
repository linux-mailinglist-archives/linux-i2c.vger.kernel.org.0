Return-Path: <linux-i2c+bounces-4890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 960BF92E264
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33683B24A67
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D9E15A876;
	Thu, 11 Jul 2024 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="akx8IgIN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25A15748C
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686659; cv=none; b=mBtTylkh71M627KIngveLO66LBDbpBFSAjo1tb1h/xJUiSxHEPr3zzpVi9GEgPU79W0W1Tq3Rcpgjw7xXbUF/yNcFADYcUl+oxW8G/skuNXZ4VYn2j6jua+iOf9VMiXiDwsRwFaH2yp1sfPxEhsiKvN5YljIkbppXMesAlobYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686659; c=relaxed/simple;
	bh=GNnb2pMEpLCZWuU8exB1G4Ok1i/56wOMag9mtFIm49I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MjXLvQWxEtF+wyx0KISi3JW8t+Ck5wSeIwo3ap6/2w/LwfKY5r10dWZzzqvpN0mW3uAKqx6+ZUM39SBwBKXozuWQjPtBUKtoSna4ONjUNgz9G0AGuSEGk2AgK4wj9005b7KIUOuApWXWbbmAjSTo54giyNpwrAlQUZ2NeGMA0jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=akx8IgIN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=P+uBeegXTfrwt6
	z+MKaVDcauEQ2cMUwbT1jXu03xNsk=; b=akx8IgINx6+frcTynwYHGUMx3B3S/B
	6ccUemnF+1fVjBblUeDVehwjMuW/h7tnSgoIq/EUmu4Oc7dpAkuqnsOy/Hb09sps
	+QejBZW8wHdMGxZs8Topwla9ASdY7RvkNv0Q3YpBWi+en+utY/y2IhW+NoJ0Zi7s
	WWSI2y8jTResX39Sx/Y9+tUWNUPY9i6VSnDvdcXtBm0HZnn/r7P+voEGijpjWn8w
	USBSS02d/m2VxyL4JdOg4syIJDbrE71yjaQazLLnsm+VNz8CyiZBY1VpQTi68hXr
	iOx2Lc1rQKN82y4iBSmygSgD7wDOKR2xmARP7atm3FHvg1FWZ1H7E7YQ==
Received: (qmail 777695 invoked from network); 11 Jul 2024 10:30:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 10:30:52 +0200
X-UD-Smtp-Session: l3s3148p1@0iKxlPQcOoQgAwDPXwmZAIsFIv4n+Dpm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: rcar: ensure Gen3+ reset does not disturb local targets
Date: Thu, 11 Jul 2024 10:30:44 +0200
Message-ID: <20240711083043.8334-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car Gen3+ needs a reset before every controller transfer. That erases
configuration of a potentially in parallel running local target
instance. To avoid this disruption, avoid controller transfers if a
local target is running. Also, disable SMBusHostNotify because it
requires being a controller and local target at the same time.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 8f2ede534f30..29cbeda59f3e 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -884,6 +884,10 @@ static int rcar_i2c_do_reset(struct rcar_i2c_priv *priv)
 {
 	int ret;
 
+	/* Don't reset if a slave instance is currently running */
+	if (priv->slave)
+		return -EISCONN;
+
 	ret = reset_control_reset(priv->rstc);
 	if (ret)
 		return ret;
@@ -1176,6 +1180,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(dev->of_node, "smbus"))
 		priv->flags |= ID_P_HOST_NOTIFY;
 
+	/* R-Car Gen3+ needs a reset before every transfer */
 	if (priv->devtype >= I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (IS_ERR(priv->rstc)) {
@@ -1186,6 +1191,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		ret = reset_control_status(priv->rstc);
 		if (ret < 0)
 			goto out_pm_put;
+
+		/* hard reset disturbs HostNotify local target, so disable it */
+		priv->flags &= ~ID_P_HOST_NOTIFY;
 	}
 
 	ret = platform_get_irq(pdev, 0);
-- 
2.43.0



Return-Path: <linux-i2c+bounces-4595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B600925474
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 09:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B36611C24BF2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 07:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40830136678;
	Wed,  3 Jul 2024 07:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gDY8nuV8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78D31DA31E
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jul 2024 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719990999; cv=none; b=kIP96BulTxQTlUTJwHMFMmKlD/KWUSWzMI0Gp5l2HusU4BaxKt8y2+K95vWJWJaH17BHQuGXquALcODpzYFEo/ccEstTZoWDmQ7SxnHlk//KE1d9G0blOBeTB8ts6hwJmO3rxSBX24CcsQNQu+v1n7GbPxOBrHzKWEmgJE6F5Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719990999; c=relaxed/simple;
	bh=KTDcWsE7q4CAGrggP1GbK428gemPHQuwGvTGjC4cR9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSH9KtZ+SBYv6PXIbCYvH0I8d/tBimL/26OC0BJVv8de7Vimvc5HLOJL+1b/7uV7gncecLGF7xiLuI8lbU5ZM4R+1ceX3ORek2C1w+EO/yuCzykG21nkRx/ksVB3AB3KDJliRRsiYMs+B1u/ycNW/mDZUNtjZ7MQ69L1qP02Nlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gDY8nuV8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=3YHgR2kPNRh6LD
	6XnaVo+nlQknMU0QRGpA7uAzZVuBs=; b=gDY8nuV8rZhIxJHTHPkdNHFsOmkRiR
	6KMji7NU9ODVPWP9ByB4CKCHwTA4wTY+SkuhsFG459pr6Pbne0C4Lu3EeMysjkqy
	cSKnAi6WtcC7L5v5mMd2l/0v9W7REa63RO9z/4wNBrVedG6gq98mBuOtjd9L64Tj
	cgHHqTUqoQVRS6bQwMXOKBewGiQdUKlmxC++QwPh/d5ISDXyhc95ZSCUPULAjiqX
	2zHkFD9HN3Aa8+PvSKa5mVJZIs2VaNrbH5TDCeYF/30S/GVg7bOemSAIjjZZO0TO
	ShPxqS8hW0N4hSfnhbbIeTURDIG0C5q+it1oQG1GTB+Qw3aRjoUpJS6A==
Received: (qmail 2715603 invoked from network); 3 Jul 2024 09:16:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2024 09:16:32 +0200
X-UD-Smtp-Session: l3s3148p1@Zq8ZnFIcBK9ehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] i2c: rcar: bring hardware to known state when probing
Date: Wed,  3 Jul 2024 09:12:03 +0200
Message-ID: <20240703071625.5389-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probably due to a lot of refactorization, the hardware was not brought
into a known state in probe. This may be a problem when a hypervisor
restarts Linux without resetting the hardware, leaving an old state
running. Make sure the hardware gets initialized, especially interrupts
should be cleared and disabled.

Reported-by: Dirk Behme <dirk.behme@de.bosch.com>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/r/20240702045535.2000393-1-dirk.behme@de.bosch.com
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Here is my proposal to fix the issue reported by Dirk. Build tested.
I can do proper testing on HW only tomorrow. But so you know already...

It is strange to add another "_slave" function to the driver while I
work on removing such language from I2C somewhere else. "Consistency" is
the answer here. The driver will be converted as well. But then as a
whole.

 drivers/i2c/busses/i2c-rcar.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 828aa2ea0fe4..00a885205075 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -257,6 +257,14 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 	}
 }
 
+static void rcar_i2c_init_slave(struct rcar_i2c_priv *priv)
+{
+	rcar_i2c_write(priv, ICSIER, 0);
+	rcar_i2c_write(priv, ICSSR, 0);
+	rcar_i2c_write(priv, ICSCR, SDBS);
+	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
+}
+
 static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 {
 	int ret;
@@ -1033,11 +1041,8 @@ static int rcar_unreg_slave(struct i2c_client *slave)
 
 	/* ensure no irq is running before clearing ptr */
 	disable_irq(priv->irq);
-	rcar_i2c_write(priv, ICSIER, 0);
-	rcar_i2c_write(priv, ICSSR, 0);
+	rcar_i2c_init_slave(priv);
 	enable_irq(priv->irq);
-	rcar_i2c_write(priv, ICSCR, SDBS);
-	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
 
 	priv->slave = NULL;
 
@@ -1152,7 +1157,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		goto out_pm_disable;
 	}
 
-	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
+	/* Bring hardware to known state */
+	rcar_i2c_init(priv);
+	rcar_i2c_init_slave(priv);
 
 	if (priv->devtype < I2C_RCAR_GEN3) {
 		irqflags |= IRQF_NO_THREAD;
-- 
2.43.0



Return-Path: <linux-i2c+bounces-9114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678FEA123DC
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 13:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085833A490B
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 12:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A981BEF9E;
	Wed, 15 Jan 2025 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TtQiBbtv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED7E1DFEF
	for <linux-i2c@vger.kernel.org>; Wed, 15 Jan 2025 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736944602; cv=none; b=f8vrR3GPhZM6jBgh5x7cbv3JP6h+BvdpZf4rqaRUAduyhOgnQhXNW7bQl3sia2FtItl5pnssXWY8wetSnV0Mzo8F83DAFXpbP2gUeS+8LyzqWiUbM6dEnwdzV+fiQzSL4j3u4l8Y38O5tQxugEaKxgP2O36xHzNi/pCZX2Vb5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736944602; c=relaxed/simple;
	bh=hxYCtRu7R2P51q5lKORyJrX2G0PHUDX3inoOjaT2TzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ylx8Eo+uidUISoNzltdOyDv1jOPjVlw0mPhnxFHwrhPwyaI/2V3OjiYQbBzWgFG/ON14Xzi8OWo9M8ZX+XZUuSNpCV/EvDLkns58N03EgKVwQ2LH7YjNKJHKMycNXY5Z7bCr3Peu+3Sah3tl7vNLGnn+cUYvbsYCbc75kEX2C2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TtQiBbtv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ZHczWYxNtbKrLD
	uLcc6SxPMQrrxHXt2o8QgzmLeFCn4=; b=TtQiBbtvt3Eacr6K1Rk79ohF0KehsZ
	vLo2SpkhFQ7M9yxbxLHQUDlnK2HyZxT/jGN4eewIX0pZXZfc8rvEAtTMWOlUMyVZ
	Ayl/jfvX74MCMzVuMviWAW7xSoap40ckbwUCh10G8j0+1R2Vk1C9CFxwzXZ8cL2C
	duGHl2vdYT70SjIzmG2wGmUe8E1TeWVfvli2JrJUvOmPSbpkzDtm8WP5zjeVZn5u
	Mh891gfW4MPk86vjJ5EV63YBIEl2HjaGQ490Xa+xcYUhD1eI4u4MIgDYrgT+Rd60
	PwE4GtXYPj240e8fohiPYzd3botOVX3WIUAXxq4e8hJkS+gnT5pD2POA==
Received: (qmail 553904 invoked from network); 15 Jan 2025 13:36:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jan 2025 13:36:30 +0100
X-UD-Smtp-Session: l3s3148p1@+9dP7b0rQq4ujnut
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: rcar: fix NACK handling when being a target
Date: Wed, 15 Jan 2025 13:36:23 +0100
Message-Id: <20250115123624.31172-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When this controller is a target, the NACK handling had two issues.
First, the return value from the backend was not checked on the initial
WRITE_REQUESTED. So, the driver missed to send a NACK in this case.
Also, the NACK always arrives one byte late on the bus, even in the
WRITE_RECEIVED case. This seems to be a HW issue. We should then not
rely on the backend to correctly NACK the superfluous byte as well. Fix
both issues by introducing a flag which gets set whenever the backend
requests a NACK and keep sending it until we get a STOP condition.

Fixes: de20d1857dd6 ("i2c: rcar: add slave support")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Debugged, scoped, tested on a Renesas Lager Board (R-Car H2).

 drivers/i2c/busses/i2c-rcar.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index a7b77d14ee86..5693a38da7b5 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -130,6 +130,8 @@
 #define ID_P_PM_BLOCKED		BIT(31)
 #define ID_P_MASK		GENMASK(31, 27)
 
+#define ID_SLAVE_NACK		BIT(0)
+
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
 	I2C_RCAR_GEN2,
@@ -166,6 +168,7 @@ struct rcar_i2c_priv {
 	int irq;
 
 	struct i2c_client *host_notify_client;
+	u8 slave_flags;
 };
 
 #define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
@@ -655,6 +658,7 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
 {
 	u32 ssr_raw, ssr_filtered;
 	u8 value;
+	int ret;
 
 	ssr_raw = rcar_i2c_read(priv, ICSSR) & 0xff;
 	ssr_filtered = ssr_raw & rcar_i2c_read(priv, ICSIER);
@@ -670,7 +674,10 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
 			rcar_i2c_write(priv, ICRXTX, value);
 			rcar_i2c_write(priv, ICSIER, SDE | SSR | SAR);
 		} else {
-			i2c_slave_event(priv->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+			ret = i2c_slave_event(priv->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+			if (ret)
+				priv->slave_flags |= ID_SLAVE_NACK;
+
 			rcar_i2c_read(priv, ICRXTX);	/* dummy read */
 			rcar_i2c_write(priv, ICSIER, SDR | SSR | SAR);
 		}
@@ -683,18 +690,21 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
 	if (ssr_filtered & SSR) {
 		i2c_slave_event(priv->slave, I2C_SLAVE_STOP, &value);
 		rcar_i2c_write(priv, ICSCR, SIE | SDBS); /* clear our NACK */
+		priv->slave_flags &= ~ID_SLAVE_NACK;
 		rcar_i2c_write(priv, ICSIER, SAR);
 		rcar_i2c_write(priv, ICSSR, ~SSR & 0xff);
 	}
 
 	/* master wants to write to us */
 	if (ssr_filtered & SDR) {
-		int ret;
-
 		value = rcar_i2c_read(priv, ICRXTX);
 		ret = i2c_slave_event(priv->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
-		/* Send NACK in case of error */
-		rcar_i2c_write(priv, ICSCR, SIE | SDBS | (ret < 0 ? FNA : 0));
+		if (ret)
+			priv->slave_flags |= ID_SLAVE_NACK;
+
+		/* Send NACK in case of error, but it will come 1 byte late :( */
+		rcar_i2c_write(priv, ICSCR, SIE | SDBS |
+			       (priv->slave_flags & ID_SLAVE_NACK ? FNA : 0));
 		rcar_i2c_write(priv, ICSSR, ~SDR & 0xff);
 	}
 
-- 
2.39.2



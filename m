Return-Path: <linux-i2c+bounces-4672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74D9292D5
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68CE6282EF1
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CC2137932;
	Sat,  6 Jul 2024 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hC7cMulZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB95127E0D
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264902; cv=none; b=GdC00LVb76fhCPX7LdEyUtAE2xCRhnoCFtJLfNEaCvdfcUnOCTqcFIQNA80R9cpQ5H9sU7VWie8Tm/y1I68tQPOwPU5pEuBqXhBUfn4jUi9YtVSlbH+atLq/HWV+PWzp7clgaOoP7Wv/Ertq6IyJ5LX/UQt0irMU5halqlmiQv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264902; c=relaxed/simple;
	bh=R3ERekSmwO8UxRD5OZgnmyUxVuR60ld5jYHEFvD7Ols=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l874sB0V7bbAC6DJ/6J0BOlNir0ZZfWzdciebece5IDSdmlcARnw5k12MqWuHXcDaAcBLa0DJIusBxASUpTkTek4Qg2wzg8lziG2M6lHqT5YWhc8L4Pt3ZsqR+w0clfyFqJCclevCztenlNT2v8v0/RCYKIM9rbcQH9semD39wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hC7cMulZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=wHzq1UCnJh9pa5kOBbvthE0Pf+Oc7V69Wus2sqqvdAQ=; b=hC7cMu
	lZ8TDaLtArdgwe7QQvB2qC0p0WdQ3dAtLtuM3r7qBuN7HMyVTfGkNn4NVfigVu8b
	QG49tPsmiCRgc+h7XWkBzwAAc3IRzJVvq7Exx7A2Co1ZIAdieP1Evok6yr2l8plO
	HDyqqynbfm23frTfCmRRcqpDIrwoBGj2s+t+V7ZEqiMo3Ju/JdV9mM2i6QG5a4iJ
	bW0XtmbA9BXNqp9STPp3AyNmcjniaoIrJ6329Eji8W/TMHtXgYpLG6xh98FdizNA
	cyeVXeSn9hwpoJ4MzUaUB49QRlhIMIiLxYlYzCoLXHfbP4UO242w98ii8x8ZVSUq
	HJRj7by6qLe4lAvA==
Received: (qmail 3809563 invoked from network); 6 Jul 2024 13:21:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:25 +0200
X-UD-Smtp-Session: l3s3148p1@7V1tYZIcSpBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/60] i2c: bcm-kona: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:05 +0200
Message-ID: <20240706112116.24543-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.
Remove a useless comment while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index a57088ec2b06..eb5c46a8f824 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -85,7 +85,7 @@
 #define STD_EXT_CLK_FREQ		13000000UL
 #define HS_EXT_CLK_FREQ			104000000UL
 
-#define MASTERCODE			0x08 /* Mastercodes are 0000_1xxxb */
+#define CONTROLLER_CODE			0x08 /* Controller codes are 0000_1xxxb */
 
 #define I2C_TIMEOUT			100 /* msecs */
 
@@ -544,8 +544,8 @@ static int bcm_kona_i2c_switch_to_hs(struct bcm_kona_i2c_dev *dev)
 {
 	int rc;
 
-	/* Send mastercode at standard speed */
-	rc = bcm_kona_i2c_write_byte(dev, MASTERCODE, 1);
+	/* Send controller code at standard speed */
+	rc = bcm_kona_i2c_write_byte(dev, CONTROLLER_CODE, 1);
 	if (rc < 0) {
 		pr_err("High speed handshake failed\n");
 		return rc;
@@ -587,7 +587,6 @@ static int bcm_kona_i2c_switch_to_std(struct bcm_kona_i2c_dev *dev)
 	return rc;
 }
 
-/* Master transfer function */
 static int bcm_kona_i2c_xfer(struct i2c_adapter *adapter,
 			     struct i2c_msg msgs[], int num)
 {
@@ -637,7 +636,7 @@ static int bcm_kona_i2c_xfer(struct i2c_adapter *adapter,
 			}
 		}
 
-		/* Send slave address */
+		/* Send target address */
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
 			rc = bcm_kona_i2c_do_addr(dev, pmsg);
 			if (rc < 0) {
@@ -697,7 +696,7 @@ static uint32_t bcm_kona_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm bcm_algo = {
-	.master_xfer = bcm_kona_i2c_xfer,
+	.xfer = bcm_kona_i2c_xfer,
 	.functionality = bcm_kona_i2c_functionality,
 };
 
@@ -722,7 +721,7 @@ static int bcm_kona_i2c_assign_bus_speed(struct bcm_kona_i2c_dev *dev)
 		dev->std_cfg = &std_cfg_table[BCM_SPD_1MHZ];
 		break;
 	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
-		/* Send mastercode at 100k */
+		/* Send controller code at 100k */
 		dev->std_cfg = &std_cfg_table[BCM_SPD_100K];
 		dev->hs_cfg = &hs_cfg_table[BCM_SPD_3P4MHZ];
 		break;
-- 
2.43.0



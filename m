Return-Path: <linux-i2c+bounces-2494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8A886CEE
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C0F8B23485
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF976535B5;
	Fri, 22 Mar 2024 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jH0S0RmE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A94F214
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114005; cv=none; b=D1sioJsy5TBOt38S4gTCI20RoBCqW33A9zif2+xgcD6RYmRZTxaeDqcS+ZKFQnyu5dbX3w8nI5+0GjnJsEOjtl907kJxD7lUmLLbAGCajSKMfyfjf3I76/2Wg7zwzm56BBcMlfXQTroTRbrJMkk848GIgpRZ5NSInEJvUIsPaeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114005; c=relaxed/simple;
	bh=B4ReNbu8S7a6//nPDZgwwrBg8qKewed+zLRZx5ip9hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjDx6BxHtpBLHXHzOaJMO21TFtDCjbjA05jIEYKZKcB/V2wDS+9RTi824/OytrmsxjZ2hGm2LdT7hcUtjL09mMrgSUMmVdQMpDzlM7NkSdGKBMHPm4s9Jerc7nAbljIP1AjJwUdaqTWf4xPzLGfQK/t+g6ADYlXVTsiv4yG7Ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jH0S0RmE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=l6CZIbqe7dMVk4Q3Jwl0QEHuMmQPTAQmTQxq/RmOdUU=; b=jH0S0R
	mEt4m2m8wz9yIHsAZesX4EbEpPfEqis4fl6lrHusEnr/iuEkokkeu8Nk+5hOE/m8
	2eo1zz/37CRvbhyL7xjLyHt2+JByau4y9Uj1Uve8gq69WYyC3baW0i+YatxixlSE
	X/JtGFZBVadAjL6OStq7b2EVzlYhdLhV3bQHRHXHoBdH3zTGECSHxDP2nKwd7e0d
	i1hs9u9mIKI8HO/ESrv/Eoxh+rLtk5a7hiskRox1oQQBivO2LQa0DATEXOlAxCxC
	YHtSZT2xTAO0mIjUiU1qKj8ooB6q5U2u5mvRmvGsKcx1FO6rKvr43cNZVN/4sLXr
	tQsC+lofdb5gbx6g==
Received: (qmail 3870215 invoked from network); 22 Mar 2024 14:26:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:27 +0100
X-UD-Smtp-Session: l3s3148p1@oMdhxT8UeJNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/64] i2c: bcm-kona: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:01 +0100
Message-ID: <20240322132619.6389-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index a57088ec2b06..404388e65eb4 100644
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
@@ -587,7 +587,7 @@ static int bcm_kona_i2c_switch_to_std(struct bcm_kona_i2c_dev *dev)
 	return rc;
 }
 
-/* Master transfer function */
+/* Host transfer function */
 static int bcm_kona_i2c_xfer(struct i2c_adapter *adapter,
 			     struct i2c_msg msgs[], int num)
 {
@@ -637,7 +637,7 @@ static int bcm_kona_i2c_xfer(struct i2c_adapter *adapter,
 			}
 		}
 
-		/* Send slave address */
+		/* Send client address */
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
 			rc = bcm_kona_i2c_do_addr(dev, pmsg);
 			if (rc < 0) {
@@ -697,7 +697,7 @@ static uint32_t bcm_kona_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm bcm_algo = {
-	.master_xfer = bcm_kona_i2c_xfer,
+	.xfer = bcm_kona_i2c_xfer,
 	.functionality = bcm_kona_i2c_functionality,
 };
 
@@ -722,7 +722,7 @@ static int bcm_kona_i2c_assign_bus_speed(struct bcm_kona_i2c_dev *dev)
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



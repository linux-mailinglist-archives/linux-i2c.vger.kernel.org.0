Return-Path: <linux-i2c+bounces-4674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 961069292D9
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB5551C20FA6
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1D313A88D;
	Sat,  6 Jul 2024 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XFkqYOFc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6F74BED
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264904; cv=none; b=pBPMVFkzRbTgdpRAtIy/F9QjxU40Mmo74SQqVvKhzA8gG8ppkNDQVhuEiB30CcI9P45vM6EUKomTDz+y/ZpU+HgdNF5HkLCwGe/zAfv90dgYhA55T9A3k+UBWTfAqyPHWiLjkD3gWzACd1p85y9hNRtTzDvQ8eMA3VgtDwXefDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264904; c=relaxed/simple;
	bh=7naUJZQki/G2mEWdYCGkSyTcv9ZwC7D/i4bEmhvvpnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1DV7Gf6MHFW3DFAHes+tHMnMmrHHAafeiZpeWbiIbEIzljRtufcKrTuW9Dl7W5MGJIqQC0kzkeu/L1TwUwGtCzqvIN50w/QeR2flTGrC2EcuuoKSOR/OxkhmR7vddGyRBnPG7Ivl1Cz/XMi6E7Z9uYSFoZRLZqXRW3wje4h0UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XFkqYOFc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=V1gvYkKbbk1D9KkI/4jZO0TrJg/YPs1bwwmD0YXlqzA=; b=XFkqYO
	Fc8ztL0yqyjjiiUBKqfWZGDl6UHVcCNY6+TQ4j9p7F41PQQ1mAYJ62a9tSqoRxvp
	Fxk41ZfWYVAGhSAMRI5bYjVbb4VKs0+7ttAQ5jDpy88st/ZukxUGz4MmQ6riomX1
	2Bq11weLKUuoMMDlU52E22AJdpHlFg1uA6UPipZFHIh89ZqL2S3/KW4jlZatXWRG
	S7EeH6GsWwfeZT96k19Wlx8QHuhavlrqYHpZn5vFs65frMgyxcEnY5A6ZAxPQK3e
	vBgoqasK1z9g08yv2GT5e/B12tYAAs2sGuRQb1DczX95qv5UG/5lde7E/lkqfT55
	c8nWvNdRu0qXnyZg==
Received: (qmail 3809604 invoked from network); 6 Jul 2024 13:21:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:27 +0200
X-UD-Smtp-Session: l3s3148p1@VPWCYZIcVJBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/60] i2c: brcmstb: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:07 +0200
Message-ID: <20240706112116.24543-8-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-brcmstb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 38f276c99193..83b85011e377 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -67,7 +67,7 @@
 
 /* BSC block register map structure to cache fields to be written */
 struct bsc_regs {
-	u32	chip_address;           /* slave address */
+	u32	chip_address;           /* target address */
 	u32	data_in[N_DATA_REGS];   /* tx data buffer*/
 	u32	cnt_reg;		/* rx/tx data length */
 	u32	ctl_reg;		/* control register */
@@ -320,7 +320,7 @@ static int brcmstb_send_i2c_cmd(struct brcmstb_i2c_dev *dev,
 	return rc;
 }
 
-/* Actual data transfer through the BSC master */
+/* Actual data transfer through the BSC controller */
 static int brcmstb_i2c_xfer_bsc_data(struct brcmstb_i2c_dev *dev,
 				     u8 *buf, unsigned int len,
 				     struct i2c_msg *pmsg)
@@ -441,7 +441,6 @@ static int brcmstb_i2c_do_addr(struct brcmstb_i2c_dev *dev,
 	return 0;
 }
 
-/* Master transfer function */
 static int brcmstb_i2c_xfer(struct i2c_adapter *adapter,
 			    struct i2c_msg msgs[], int num)
 {
@@ -473,7 +472,7 @@ static int brcmstb_i2c_xfer(struct i2c_adapter *adapter,
 
 		brcmstb_set_i2c_start_stop(dev, cond);
 
-		/* Send slave address */
+		/* Send target address */
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
 			rc = brcmstb_i2c_do_addr(dev, pmsg);
 			if (rc < 0) {
@@ -545,8 +544,8 @@ static u32 brcmstb_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm brcmstb_i2c_algo = {
-	.master_xfer = brcmstb_i2c_xfer,
-	.master_xfer_atomic = brcmstb_i2c_xfer_atomic,
+	.xfer = brcmstb_i2c_xfer,
+	.xfer_atomic = brcmstb_i2c_xfer_atomic,
 	.functionality = brcmstb_i2c_functionality,
 };
 
-- 
2.43.0



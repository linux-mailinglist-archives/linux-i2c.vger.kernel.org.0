Return-Path: <linux-i2c+bounces-2496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DF886CF1
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E5BA1F223A4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E0C5676E;
	Fri, 22 Mar 2024 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hnc1nTnR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2B952F9B
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114007; cv=none; b=Ae/caeh7QeVjSKlP+p22O/FLps0IqLrIOm2vEtEVlc7p0V0UGXgx7InJb2lIblxTsrjcGUH8bKgI9sQsMJ6Os/dFTQi345buY7VsjwpoU8F7cky7JneJmGTsqwe6dGA4p5r7El6c5KYy9VirpTizjZe3GdHWbmih4xJXAl/axR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114007; c=relaxed/simple;
	bh=CpC8HnbTVThB6S+/pqooGf78jzq4no+HCFzgg6Qt6mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAz1D+Q2gR0GkDIvl2TWM0cYwrDbg2Po8NGgzbeL7fuGL3veWDxjQjsm4ZbJ0ynVfVgUGquMl5t89GYDUYMtVlOoXFDgLiv2ygxR8MA31cASJEVDXPORJ0xLux8tCKiLFxNg2LMWqbBilyzuMr7SWOu2SkNGTf3KosqBGE7re/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hnc1nTnR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=erf4Z8JIr6B+tpx1tzGIDc6Yy5XmMXEq/omWmLHe34o=; b=hnc1nT
	nRvT/YfV2ENjunXaB9nkkUUgozZNzCz9iQF0lQOPxzv3mHFBnxBVw0xg/I89kH4I
	cRoveeo8ka7Iw9lc6w8e9e/VJ5G5luTv+P6Zwc4FVwqewV6bQmsc77QTH882R7nO
	CG0h8SSo0H5CTeKT8k0u3vyfHkzwKVZDF1Vkn0hwDnfJ/un3MHM85mp/vdPntxFr
	FvLbg77zq2OCzqXCbtswGjaNC1vddHPUL3c7eFNwtihckkjk3ptzmXPcVtXs3khM
	KZxdHuc5R9uCShZH0tsPUw1yswB5uH0qM2VCiRU7LrOb98pwdH3fISVV7EQ3LfOV
	q3u3EiM7b9ft5gnw==
Received: (qmail 3870244 invoked from network); 22 Mar 2024 14:26:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:29 +0100
X-UD-Smtp-Session: l3s3148p1@A5t7xT8UkJNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/64] i2c: brcmstb: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:03 +0100
Message-ID: <20240322132619.6389-11-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-brcmstb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 38f276c99193..dfdf465e6f8c 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -67,7 +67,7 @@
 
 /* BSC block register map structure to cache fields to be written */
 struct bsc_regs {
-	u32	chip_address;           /* slave address */
+	u32	chip_address;           /* client address */
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
@@ -441,7 +441,7 @@ static int brcmstb_i2c_do_addr(struct brcmstb_i2c_dev *dev,
 	return 0;
 }
 
-/* Master transfer function */
+/* Host transfer function */
 static int brcmstb_i2c_xfer(struct i2c_adapter *adapter,
 			    struct i2c_msg msgs[], int num)
 {
@@ -473,7 +473,7 @@ static int brcmstb_i2c_xfer(struct i2c_adapter *adapter,
 
 		brcmstb_set_i2c_start_stop(dev, cond);
 
-		/* Send slave address */
+		/* Send client address */
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
 			rc = brcmstb_i2c_do_addr(dev, pmsg);
 			if (rc < 0) {
@@ -545,8 +545,8 @@ static u32 brcmstb_i2c_functionality(struct i2c_adapter *adap)
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



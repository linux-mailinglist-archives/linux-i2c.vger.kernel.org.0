Return-Path: <linux-i2c+bounces-10482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD22A93F72
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D0811B65E81
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 21:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A582E1C84D3;
	Fri, 18 Apr 2025 21:24:33 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net [188.165.53.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8411A70805
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.53.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745011473; cv=none; b=K1Zzlovkd23CmpkcrCHJZYCW+rZn1doLgkWr6AS9/LbJrNuwG6BH4/1GRjEbRz/p6DA33wIBNms0HZoT0EmxQg+DkeI8zIuU8U1UlxQgfkIQQ97sYBpuwl0z7TpqGcBKdlobhWXA0qigDlv1sRs7+Dx520x8HkR0FdBbtZN72nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745011473; c=relaxed/simple;
	bh=5WGaPSP3M6rjl6ltEI23zJBvWJjlBN14l/WwAD8CP+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVaoiMOEZwU/uzgXkM446qRbhCwmJQ0chdHtHquzSRhsOoNmfPwTYB2Y4u0SdzNWKDgU1I9pUR3PhHECOExazWsIz2zt+cOSXZqQzYjQGL4xZ0ZMH3TC9C8lx7bQPOlXO/cO95wZMQvQL+hAGvlpz5mAiEZaBEZJC9HyVqVDSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.53.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.176.118])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJ43Tflz1ggW
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:52 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-5pxxj (unknown [10.110.178.32])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 257AC1FD1E;
	Fri, 18 Apr 2025 21:16:52 +0000 (UTC)
Received: from etezian.org ([37.59.142.100])
	by ghost-submission-5b5ff79f4f-5pxxj with ESMTPSA
	id Zc0eOEPBAmh+9AMAoF5Zmg
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:52 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-100R00316932784-a669-42cb-80d9-70e09e47d080,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 02/10] i2c: iproc: Use dev_err_probe in probe
Date: Fri, 18 Apr 2025 23:16:27 +0200
Message-ID: <20250418211635.2666234-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418211635.2666234-1-andi.shyti@kernel.org>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13926255948694686279
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht

Use dev_err_probe() instead of dev_err() and then return.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 31 ++++++++++++------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 5d846ab91e6f..2e24959bc9af 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1014,17 +1014,14 @@ static int bcm_iproc_i2c_cfg_speed(struct bcm_iproc_i2c_dev *iproc_i2c)
 		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
-	if (bus_speed < I2C_MAX_STANDARD_MODE_FREQ) {
-		dev_err(iproc_i2c->device, "%d Hz bus speed not supported\n",
-			bus_speed);
-		dev_err(iproc_i2c->device,
-			"valid speeds are 100khz and 400khz\n");
-		return -EINVAL;
-	} else if (bus_speed < I2C_MAX_FAST_MODE_FREQ) {
+	if (bus_speed < I2C_MAX_STANDARD_MODE_FREQ)
+		return dev_err_probe(iproc_i2c->device, -EINVAL,
+				     "%d Hz not supported (out of 100-400 kHz range)\n",
+				     bus_speed);
+	else if (bus_speed < I2C_MAX_FAST_MODE_FREQ)
 		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
-	} else {
+	else
 		bus_speed = I2C_MAX_FAST_MODE_FREQ;
-	}
 
 	iproc_i2c->bus_speed = bus_speed;
 	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
@@ -1066,11 +1063,9 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 		ret = of_property_read_u32(iproc_i2c->device->of_node,
 					   "brcm,ape-hsls-addr-mask",
 					   &iproc_i2c->ape_addr_mask);
-		if (ret < 0) {
-			dev_err(iproc_i2c->device,
-				"'brcm,ape-hsls-addr-mask' missing\n");
-			return -EINVAL;
-		}
+		if (ret < 0)
+			return dev_err_probe(iproc_i2c->device, ret,
+					     "'brcm,ape-hsls-addr-mask' missing\n");
 
 		spin_lock_init(&iproc_i2c->idm_lock);
 
@@ -1090,11 +1085,9 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 		ret = devm_request_irq(iproc_i2c->device, irq,
 				       bcm_iproc_i2c_isr, 0, pdev->name,
 				       iproc_i2c);
-		if (ret < 0) {
-			dev_err(iproc_i2c->device,
-				"unable to request irq %i\n", irq);
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(iproc_i2c->device, ret,
+					     "unable to request irq %i\n", irq);
 
 		iproc_i2c->irq = irq;
 	} else {
-- 
2.49.0



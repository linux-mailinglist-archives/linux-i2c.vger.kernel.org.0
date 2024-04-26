Return-Path: <linux-i2c+bounces-3199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0E48B30B0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6C0A1F24862
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 06:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6634313A888;
	Fri, 26 Apr 2024 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hNBveKLM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55A717721
	for <linux-i2c@vger.kernel.org>; Fri, 26 Apr 2024 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714113871; cv=none; b=EZkaOlIU8iExOGQqT8Uk2lWDRI32CmOrBwm+gPBkjITb3SZHGoC3G7Ykr+h235HA8KMq73jA/3AzL1ey9punSDKePrxmMpMbSlk++SDj4gLOtupaGmTavrbU1eO8HZtT2IqUsGmZKt1OYzczIK7smvka4Kubkwpb9+05/rY/dqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714113871; c=relaxed/simple;
	bh=aCF9YJ/3AVcp7Uo4nJ5GWEg/vMZeJEHnYrSYZ1gdY0s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UBIb4dkSjKoTNfn2SmOVNpXNejt5H3CuoxkqnNVu4R7yXm6YEyArVsFSVQ0l797weBKZGxj0jb6Oh035nL4ZBCPzSRyM0E1LMl1BLBi9j3geJ0f62wB1dE/5ihP4RWDfQjRitUTHKM577hpkrCqiSEEOyMjEHpyEvwEJliAPEpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hNBveKLM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=HMLrUoCgVuOtf+
	mCDqUTfN9K6VIrEPm+iJ7p/Jm5Smw=; b=hNBveKLMvWmdd10rWkWc9ObrARjlmo
	qeTnQzbnWKvNvTBUJRp239X1uzAlM0Yg+hw8dC6dxP9TwmFg+N51EFrSGvnY8AB2
	wn5oWy3t443NX8SlGbPxan04lqvef/0Ip+gtLXC/n9VxMSHLveLDmhId8Bw+oKq0
	ppXKdqCEDk4lRyG6o8EsIShHN2EB2BlcmDpxAzqWw/qnn56Jgnmg93iH96qsf2a0
	InRggodGaQ7aenH5KunSdsZVtRLG4pGSIRaDSA+8lKtIABPn75il3GR2WJfiIltG
	tBNdu1Kn/wsk4zpYb5U4m5r0ii4AETKZ6y3aFKJNA9inB5o1N7aHLKuA==
Received: (qmail 1204080 invoked from network); 26 Apr 2024 08:44:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Apr 2024 08:44:26 +0200
X-UD-Smtp-Session: l3s3148p1@TPgdPPoWSMIujnvp
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: smbus: fix NULL function pointer dereference
Date: Fri, 26 Apr 2024 08:44:08 +0200
Message-Id: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Brauch reported an OOPS when using the designware controller as target
only. Target-only modes break the assumption of one transfer function
always being available. Fix this by always checking the pointer in
__i2c_transfer.

Reported-by: Baruch Siach <baruch@tkos.co.il>
Closes: https://lore.kernel.org/r/4269631780e5ba789cf1ae391eec1b959def7d99.1712761976.git.baruch@tkos.co.il
Fixes: 4b1acc43331d ("i2c: core changes for slave support")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c  | 12 ++++++------
 drivers/i2c/i2c-core-smbus.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ff5c486a1dbb..db0d1ac82910 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2200,13 +2200,18 @@ static int i2c_check_for_quirks(struct i2c_adapter *adap, struct i2c_msg *msgs,
  * Returns negative errno, else the number of messages executed.
  *
  * Adapter lock must be held when calling this function. No debug logging
- * takes place. adap->algo->master_xfer existence isn't checked.
+ * takes place.
  */
 int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	unsigned long orig_jiffies;
 	int ret, try;
 
+	if (!adap->algo->master_xfer) {
+		dev_dbg(&adap->dev, "I2C level transfers not supported\n");
+		return -EOPNOTSUPP;
+	}
+
 	if (WARN_ON(!msgs || num < 1))
 		return -EINVAL;
 
@@ -2273,11 +2278,6 @@ int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	int ret;
 
-	if (!adap->algo->master_xfer) {
-		dev_dbg(&adap->dev, "I2C level transfers not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	/* REVISIT the fault reporting model here is weak:
 	 *
 	 *  - When we get an error after receiving N bytes from a slave,
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e3b96fc53b5c..a942c5306a4e 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -596,7 +596,7 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 				break;
 		}
 
-		if (res != -EOPNOTSUPP || !adapter->algo->master_xfer)
+		if (res != -EOPNOTSUPP)
 			goto trace;
 		/*
 		 * Fall back to i2c_smbus_xfer_emulated if the adapter doesn't
-- 
2.39.2



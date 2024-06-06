Return-Path: <linux-i2c+bounces-3894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 221058FF607
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 22:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0FA61F22024
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 20:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A025E745C0;
	Thu,  6 Jun 2024 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WBcs6GA7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD423FB87
	for <linux-i2c@vger.kernel.org>; Thu,  6 Jun 2024 20:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717706239; cv=none; b=iBhMIVBMEzCwSdwOtaBdoRQER5Xk5yK277IMGTxaIbR8NhEguNPK/sKFGJX4/AYOixKkuEp1R8QDAIdr76Zh/8CvuNmqDrkS1uU5dXveDA3uPe8H0kWqZZCbr12jAAynGbO7+Tpa+ZbZF8LQWtnZ0vPPmQ+U7pnu0OTOnseKpc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717706239; c=relaxed/simple;
	bh=MbKcToJ9jfMjRqclWrbv9+0f9nqvfRhx2gNEtc4Uh/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgEsk8wga8Fle0Sq9bCTiOBW2qxs+IRShQFH4EdBP+87WbX38to9egGocfhLsuQF1bd2xInbrG7gRToPCDpMdCrkdqWVfzjU1GLgE7P++Q/skZKOZvH8CpkPfJiHo46KGJGh3clL7tjJS2knKw6ZgEwD9X733WMi9/4xhw2VZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WBcs6GA7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=YPzYhUA/ql+8i4
	z/cGDM/TzZ261D4WX/ce6UaCwmjwY=; b=WBcs6GA7OtVp+xbr6OzfxNTVuGV3AM
	BppGTauf8o3iZ69TVuiS2kC8GVEemD8F4iNU6Xyej0ulsA3c8YCDrTm9WfjwaTMz
	pBPULB1HBK/OOMf2zxFiJcdrG7PABUD38vDOc0xFGpwI3prtMoBYMKPwxamevfS8
	d2v17FykmiHU+GolsOSqyEiAM/nCH1SlKGnAeBcCJI6tdNkJ9iB09TuWXe/Q6v7M
	Mx9YaCkJHBznKdKj1fGkKe8t8+sb/r3XpPBCCstxlJaa4HWqbqA+qoRHR2O18If2
	NgyzO5CKihWjSv1kkY0CyFUxGXEkv8zPfivVH/wk4O38kKXZMdJFWCmg==
Received: (qmail 3107283 invoked from network); 6 Jun 2024 22:37:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jun 2024 22:37:08 +0200
X-UD-Smtp-Session: l3s3148p1@Ov+MpT4aAoJehhrL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: complain loudly if __i2c_transfer has no proper callback
Date: Thu,  6 Jun 2024 22:36:58 +0200
Message-ID: <20240606203657.22286-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a discussion we concluded that having no working callback in
__i2c_transfer is a serious bug, so dev_dbg() is not enough. Turn it
into a WARN.

Link: https://lore.kernel.org/r/20240604171113.232628f9@endymion.delvare
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index db0d1ac82910..e5fd899c28c3 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2207,10 +2207,8 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	unsigned long orig_jiffies;
 	int ret, try;
 
-	if (!adap->algo->master_xfer) {
-		dev_dbg(&adap->dev, "I2C level transfers not supported\n");
+	if (WARN_ON_ONCE(!adap->algo->master_xfer))
 		return -EOPNOTSUPP;
-	}
 
 	if (WARN_ON(!msgs || num < 1))
 		return -EINVAL;
-- 
2.43.0



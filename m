Return-Path: <linux-i2c+bounces-3264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E010C8B4809
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97B3F1F215EC
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FC615B97B;
	Sat, 27 Apr 2024 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bZBZ1isp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D5E15B13E
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250198; cv=none; b=YIZ6zXQq5c53SX48VeSBUB0UY1Pn2EDexERZ5AM67YsOsvWqnVZDjJ8e1DaaY4hENG9FDZSQ8Tvhcm/AUOK03RzLrJxSKzuKtdlf/r22XC3df/5DkY4vP2gtSwM8/fD1u1XNFlsejhBkK51PInpQKkHXMepOxs/qJwuYrBiDPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250198; c=relaxed/simple;
	bh=Vr6FJGRmH65/Z+SbGDHhY+dUnDZnbqoip1Sy/Q8SJio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sc0JFICvmNIltaLHoaVV3ZSEgKW5FAOr3hvIgzyzbovHBXAgZsQ0MwUV1C/tCvsoZgOjtxbCAz8VqGnQj9bUyl0SzmAF9FzB9S9FJoyhRojU+TqPxWxRByuy8mchtuMMjMapWx0ukbMOVzZJM0p5N686lukaHw0YLRFFVDZBS18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bZBZ1isp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=wxBftEHkYMQUmyq9eqJI/NqAPsdhyx/MQOFdHVmTJFI=; b=bZBZ1i
	spPigwswTyePXwpc39oBGmZ4zvAHVdFIS4CJQshYU094QHut33dW4aqiCNUO8Wt6
	OcrK/ADcvb51QkO65EuSr65gz45DiXUfyqLXfGFIMVcUk6/CcaoJvRKU45hMmT0w
	0SSRhKfof4aR6E36w/SdP3kUbcHgGWfQfmUvSN5BT5uwLU0ZkGRFRj4euNRhhhhw
	oWFzu0sSTof4uICSb0Gs23/c5yGCwkioIIMeRwpcQfw22SW6jo2A+g/hiCCoBis1
	3JVIMP8sKT2JGKUfXpYAysXmXa2bqJC6dQI1awnDvTGQAVQvLaIYxTWjyAUOuUaF
	xDNkIVIhtJhAlprw==
Received: (qmail 1782144 invoked from network); 27 Apr 2024 22:36:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:25 +0200
X-UD-Smtp-Session: l3s3148p1@7Phd+RkXBtBehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/15] i2c: s3c2410: use 'time_left' variable with wait_event_timeout()
Date: Sat, 27 Apr 2024 22:36:06 +0200
Message-ID: <20240427203611.3750-15-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_event_timeout() causing patterns like:

	timeout = wait_event_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 275f7c42165c..01419c738cfc 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -685,7 +685,7 @@ static void s3c24xx_i2c_wait_idle(struct s3c24xx_i2c *i2c)
 static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 			      struct i2c_msg *msgs, int num)
 {
-	unsigned long timeout = 0;
+	long time_left = 0;
 	int ret;
 
 	ret = s3c24xx_i2c_set_master(i2c);
@@ -715,7 +715,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 				dev_err(i2c->dev, "deal with arbitration loss\n");
 		}
 	} else {
-		timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
+		time_left = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
 	}
 
 	ret = i2c->msg_idx;
@@ -724,7 +724,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 	 * Having these next two as dev_err() makes life very
 	 * noisy when doing an i2cdetect
 	 */
-	if (timeout == 0)
+	if (time_left == 0)
 		dev_dbg(i2c->dev, "timeout\n");
 	else if (ret != num)
 		dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
-- 
2.43.0



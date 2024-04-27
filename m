Return-Path: <linux-i2c+bounces-3253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F78B47EE
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9688B21552
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9EE14601D;
	Sat, 27 Apr 2024 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jefq8255"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A28144D22
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250181; cv=none; b=r0M7f0Tj/gB5c6NxU6e7RiDGJGD+nBIJ7kDXSVdYdg0y7yUPgGDjdGi8J5ZKdcHLoA+KO9/Sq5ad7GEWfMeNrFe7MSXuttddyM3+SKdfkWJ90v1CNvgR/RI3s5tbexDtJ1MUkGPEHbyThMgCjKFvctdLHOOeY8U0ynyW+/CKHpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250181; c=relaxed/simple;
	bh=h1YZllPsTaiaLlHfe955GjP37jjK7/WEfEpoM+4afYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXYrL5vB+BMY0FfYT3CYIR991PUkbICasK117Mu5Lp7NcPLpJIdVV8wncuVg7BIh3PVYiOaBAwSq8eUTTMhPVBF7Mqsjgx6F91ZlrG3WHLTOdGL8wB1mJaZaZdohdpzS4Kr0B/bv2zi60ZYybMiJgcPwJv6bR3ZUqOIeqAH/mJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jefq8255; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZLv8hXeiJlISzozbBZSXzJgescsNzyHh+xzwSX3kxuA=; b=jefq82
	55sCtSyVsbvE4qhoIJRG1DsC8Hp+LjOZ9MhXyN/4kndV5BHe2xsXpRwPsggVXrhB
	lfcl1zRCCW1JxdLc9pIohqFaf8nMK/oSyqbtoXwwl0P3+eYd0Ox/N1BbNlmN1cKa
	IFfeG1Mi4UKfSM+4FpzqAxW5J1E6yl7MeQpMSwyLofFxDj5UNp++FkGtQgFJtN+x
	qfn0vMbp7b9dQjsVp7x9HZsNciSFYcaly07YAJyFv4XsdRHHFA5P5d6EZW74AtMw
	lDtXev+q36Sc7/AokIA5z/QLYTa+0CcUE7xQJcxu2ru6BR2nKbrYXb5h6OcXHF6N
	lNZGIvO4Rd3u+OVA==
Received: (qmail 1781843 invoked from network); 27 Apr 2024 22:36:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:15 +0200
X-UD-Smtp-Session: l3s3148p1@Wh/C+BkXuI9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/15] i2c: digicolor: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:35:54 +0200
Message-ID: <20240427203611.3750-3-wsa+renesas@sang-engineering.com>
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
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-digicolor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 3462f2bc0fa8..737604ae11fc 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -213,7 +213,7 @@ static irqreturn_t dc_i2c_irq(int irq, void *dev_id)
 static int dc_i2c_xfer_msg(struct dc_i2c *i2c, struct i2c_msg *msg, int first,
 			   int last)
 {
-	unsigned long timeout = msecs_to_jiffies(TIMEOUT_MS);
+	unsigned long time_left = msecs_to_jiffies(TIMEOUT_MS);
 	unsigned long flags;
 
 	spin_lock_irqsave(&i2c->lock, flags);
@@ -227,9 +227,9 @@ static int dc_i2c_xfer_msg(struct dc_i2c *i2c, struct i2c_msg *msg, int first,
 	dc_i2c_start_msg(i2c, first);
 	spin_unlock_irqrestore(&i2c->lock, flags);
 
-	timeout = wait_for_completion_timeout(&i2c->done, timeout);
+	time_left = wait_for_completion_timeout(&i2c->done, time_left);
 	dc_i2c_set_irq(i2c, 0);
-	if (timeout == 0) {
+	if (time_left == 0) {
 		i2c->state = STATE_IDLE;
 		return -ETIMEDOUT;
 	}
-- 
2.43.0



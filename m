Return-Path: <linux-i2c+bounces-3265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B68B480A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488DB1C20C98
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749CE15B985;
	Sat, 27 Apr 2024 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aM1UUK0o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AC015B147
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250198; cv=none; b=Kwl6Ikvksjyvix5az4tDvedW8eSGtSiowasYbp0IFIyUBob1ymnS88yN2ZwGnD7KnNw3THxYgxgRWi+fNaKNkeQfzTZ807exOftFcKh0hJHxg84Og5Zr0QdMsp9rUIewRH/8TlRaRgPGyjH8kIxvqN1BeD2S1FShoRRgTaalXLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250198; c=relaxed/simple;
	bh=ICJxO/oSoreCPN4scyq2cUFCghZPxBGHSD5xgC0rDFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/EVwKHtUSGWt0rRiN4pMPXnN+1GvEjIYeZ55fmlDt5c26r6aWrA7+g1WNt+NP3t8zLFaSgKcM9Q/kxCLPPPhJ0UQrWapXeI44dGn7ndF/wW8dKZsMB/XcCenx0nR78kci+xsQ01rB+cwhkdJH6keC/21t+n70h3gHzhLeUlyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aM1UUK0o; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Mqxa2PoRjYYBR4TQvcaMfBjEHimjCGFPRonW4OLsXg0=; b=aM1UUK
	0ob0Dn1guHJxPMrE1lLm/SPHStcdwkVQLew562thX6mna5R/Eq7H38PKiLYDFjNw
	AvZE/2YHutuyWnenR8vGOrC1lzVizEfWj7mFHEaRAjc9IOzg34sGj4BPYpdfpLK2
	jGCxEtGRnxcsEo3ayNe+2qOF9jMK6AMstMX5gjJnBHJinWS5TvxbjYH1HNWlMPtX
	aAAIHK3wO8PKKZwtk+DC1RyXw/wAp8gldZqHVVckF/Gc2+eCZyfwfPaTvDb4PrWU
	fFlLppn+xVHWqddAFCNyZapTgGXCt9JnbZ+g9rxlERvRuyISt5cb4Ae8KNjmXHL3
	//dirk2CdNRzy6tg==
Received: (qmail 1782108 invoked from network); 27 Apr 2024 22:36:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:25 +0200
X-UD-Smtp-Session: l3s3148p1@WgJR+RkX/s9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] i2c: rk3x: use 'time_left' variable with wait_event_timeout()
Date: Sat, 27 Apr 2024 22:36:05 +0200
Message-ID: <20240427203611.3750-14-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-rk3x.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 8c7367f289d3..beca61700c89 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1060,7 +1060,8 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 				struct i2c_msg *msgs, int num, bool polling)
 {
 	struct rk3x_i2c *i2c = (struct rk3x_i2c *)adap->algo_data;
-	unsigned long timeout, flags;
+	unsigned long flags;
+	long time_left;
 	u32 val;
 	int ret = 0;
 	int i;
@@ -1092,20 +1093,20 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 		if (!polling) {
 			rk3x_i2c_start(i2c);
 
-			timeout = wait_event_timeout(i2c->wait, !i2c->busy,
-						     msecs_to_jiffies(WAIT_TIMEOUT));
+			time_left = wait_event_timeout(i2c->wait, !i2c->busy,
+						       msecs_to_jiffies(WAIT_TIMEOUT));
 		} else {
 			disable_irq(i2c->irq);
 			rk3x_i2c_start(i2c);
 
-			timeout = rk3x_i2c_wait_xfer_poll(i2c);
+			time_left = rk3x_i2c_wait_xfer_poll(i2c);
 
 			enable_irq(i2c->irq);
 		}
 
 		spin_lock_irqsave(&i2c->lock, flags);
 
-		if (timeout == 0) {
+		if (time_left == 0) {
 			/* Force a STOP condition without interrupt */
 			i2c_writel(i2c, 0, REG_IEN);
 			val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;
-- 
2.43.0



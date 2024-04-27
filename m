Return-Path: <linux-i2c+bounces-3266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1488B480D
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C482B227C5
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8612E15D5A2;
	Sat, 27 Apr 2024 20:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bmUe8aId"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917C315B56C
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250199; cv=none; b=J2onMfGkSeVlxOYIU7EK0nFPKIHUcKs4dIHUe8QAHZu/ElNFwcnwHA1cOj6SEc7OIFZf3xJC3CG7QKqaMRkzIU6EoyM1w83+LDhImXAscak2Qa0PsI0Wsflb/LoUcbumtXb1qWcQEOiL1GairMdvNNqIhipA97K/LqV4sD5BZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250199; c=relaxed/simple;
	bh=BA9bKWx4nrZdq7zvoPVntWdYdyVT2NvRtG21GKlQIxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3X3oqZV4GN2RNjFF+sTTgaqGtdvhdppKKX0X/ULLBMjs1W+QGSnb/fquCxbrmlD62HWv9OYDEfK/qUmgTk+nXhZXAvoEVthlozyLxzUowHlFvbPtjtn2knbE+cMLqX6JH+QndNcYcuyDHNPmTP8kEIdsAlljD1iQf9XfmW23bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bmUe8aId; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3uCHmpzl3WtCK5SCHOPVCTNXQWYJSoA3BmOOvRjEviM=; b=bmUe8a
	IdlDGSajE+mYdkF4MF3n0m3YjFrl89uuW+ZZ2QAH2Ipm70JwAiFZ1utJGIxfRWxa
	j4SeE0874pDNNNmB0KewZw+KAHKtCTlGH6jugUI/WfvDoGVapoBKYM6KN37sTqVR
	SqieJYdAnN6ul13QhFYRSDMokj4/rofPpfBrWfuFJzcbXNXVQUcLXj1z6FfRCSaV
	AzySbw8iXVMNxbUA6i6r8JdaUTj/SlGpQeyrYh22Q6xrm5lT/M6jobhY3Ti2boEE
	k2GaiJJJGixcRTd1l+2VazGNR5qBdWRRARa+oNx2AQJslIPTagM1e0Zv79JTjcH9
	3Z8fl8WbN19pzxOg==
Received: (qmail 1782179 invoked from network); 27 Apr 2024 22:36:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:26 +0200
X-UD-Smtp-Session: l3s3148p1@A2Rq+RkXCtBehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/15] i2c: pxa: use 'time_left' variable with wait_event_timeout()
Date: Sat, 27 Apr 2024 22:36:07 +0200
Message-ID: <20240427203611.3750-16-wsa+renesas@sang-engineering.com>
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

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-pxa.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 888ca636f3f3..f495560bd99c 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -826,7 +826,7 @@ static inline void i2c_pxa_stop_message(struct pxa_i2c *i2c)
 static int i2c_pxa_send_mastercode(struct pxa_i2c *i2c)
 {
 	u32 icr;
-	long timeout;
+	long time_left;
 
 	spin_lock_irq(&i2c->lock);
 	i2c->highmode_enter = true;
@@ -837,12 +837,12 @@ static int i2c_pxa_send_mastercode(struct pxa_i2c *i2c)
 	writel(icr, _ICR(i2c));
 
 	spin_unlock_irq(&i2c->lock);
-	timeout = wait_event_timeout(i2c->wait,
-			i2c->highmode_enter == false, HZ * 1);
+	time_left = wait_event_timeout(i2c->wait,
+				       i2c->highmode_enter == false, HZ * 1);
 
 	i2c->highmode_enter = false;
 
-	return (timeout == 0) ? I2C_RETRY : 0;
+	return (time_left == 0) ? I2C_RETRY : 0;
 }
 
 /*
@@ -1050,7 +1050,7 @@ static irqreturn_t i2c_pxa_handler(int this_irq, void *dev_id)
  */
 static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
 {
-	long timeout;
+	long time_left;
 	int ret;
 
 	/*
@@ -1095,7 +1095,7 @@ static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
 	/*
 	 * The rest of the processing occurs in the interrupt handler.
 	 */
-	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
+	time_left = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
 	i2c_pxa_stop_message(i2c);
 
 	/*
@@ -1103,7 +1103,7 @@ static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
 	 */
 	ret = i2c->msg_idx;
 
-	if (!timeout && i2c->msg_num) {
+	if (!time_left && i2c->msg_num) {
 		i2c_pxa_scream_blue_murder(i2c, "timeout with active message");
 		i2c_recover_bus(&i2c->adap);
 		ret = I2C_RETRY;
-- 
2.43.0



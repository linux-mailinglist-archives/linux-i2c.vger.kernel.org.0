Return-Path: <linux-i2c+bounces-2515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCC3886D1E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD0F283587
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B9A60DE2;
	Fri, 22 Mar 2024 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ewDbTvO/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E0346558
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114024; cv=none; b=jK7ey6OVdUMaSZ8VnyJitPfihiDVEal72CD/LXKNuV2wawiO8OLaXHOnbVzqLRjmJxJkjKBerSMD3Qho6FeIrXSUqBXAV9SyYdPV9tEF45miALNWdVAppxaYpOFKybcTd+NaloUURAZLH49QfdVLHdyWLh5ShQKQb0v8Us8K8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114024; c=relaxed/simple;
	bh=AAok3TR/hDjTzx7rUMsoBzmbQBA2Sf7tkal4DuSe3wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjHuY99FiFVn0dlx5tcJLOsiJNLgc+gHvrnsQ7l2hs8H4JR9gY+Ap3uZ/4Y4OBP1x+DxEKZMDeXcU12I6bW6RWNRfOlhPl0/sfXIFnSCZux7iqIIIuL886k18PkIxzgJufyRLPEvp89x4E/2fOkYwBjiPG8n6ojNZBhWJ6dy5vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ewDbTvO/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bxTOjroMQTFdH0tamjYqLu6EXC9WA3N/+/W5k3pAme4=; b=ewDbTv
	O/KmCvY4DF9BpDUr32mSq6++5TXqeP7aIBnT2Fi+pL7afcGap5lAI91qqjgSNlD1
	ikSM+5pgzN47cyyzG+LAMTlplOurxuEYeFIsrMfKx47B2G0yzFgb7T3FNja1qjT3
	H45X54rBZSO9k3H80mfuFM1466I2Ov9aBP81i5UPT7jb+bxPVE6qtInjYE5Z7wcR
	CBzhdxDOP3KSj/rv8rQWsM/P9Fmhjc0Bdv5oAINB1oxeRFzU3OqNWqapQVXzHLAe
	U79ydGjQYFbdvoU8gJu7bGslIBAFGa060s1zSu1iI3NA/PIPbg6u72nnIOyiqyPf
	9Mimqz9l+BlUkoaQ==
Received: (qmail 3871008 invoked from network); 22 Mar 2024 14:26:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:46 +0100
X-UD-Smtp-Session: l3s3148p1@RjaHxj8U6pRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 31/64] i2c: lpc2k: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:24 +0100
Message-ID: <20240322132619.6389-32-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-lpc2k.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index e3660333e91c..f0cb217973c1 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -50,7 +50,7 @@
 
 /*
  * 26 possible I2C status codes, but codes applicable only
- * to master are listed here and used in this driver
+ * to host mode are listed here and used in this driver
  */
 enum {
 	M_BUS_ERROR		= 0x00,
@@ -157,7 +157,7 @@ static void i2c_lpc2k_pump_msg(struct lpc2k_i2c *i2c)
 		break;
 
 	case MR_ADDR_R_ACK:
-		/* Receive first byte from slave */
+		/* Receive first byte from client */
 		if (i2c->msg->len == 1) {
 			/* Last byte, return NACK */
 			writel(LPC24XX_AA, i2c->base + LPC24XX_I2CONCLR);
@@ -196,7 +196,7 @@ static void i2c_lpc2k_pump_msg(struct lpc2k_i2c *i2c)
 		}
 
 		/*
-		 * One pre-last data input, send NACK to tell the slave that
+		 * One pre-last data input, send NACK to tell the client that
 		 * this is going to be the last data byte to be transferred.
 		 */
 		if (i2c->msg_idx >= i2c->msg->len - 2) {
@@ -338,7 +338,7 @@ static u32 i2c_lpc2k_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm i2c_lpc2k_algorithm = {
-	.master_xfer	= i2c_lpc2k_xfer,
+	.xfer	= i2c_lpc2k_xfer,
 	.functionality	= i2c_lpc2k_functionality,
 };
 
-- 
2.43.0



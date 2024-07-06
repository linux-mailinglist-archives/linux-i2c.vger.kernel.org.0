Return-Path: <linux-i2c+bounces-4694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E0929306
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E40471C2115C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7B314F9E6;
	Sat,  6 Jul 2024 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="efM9bYrw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C8714B092
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264918; cv=none; b=rlQBnbSg25wabormeltqGCspg+dupEyDYiBgz8NxoLY6kgneZ8PCddIipgHpjd3wdBy9cfAEIqR5UORorI0vFRZKAvMCS6/OMu1vOmwPSmgxXLr0Y98QWigUHwjwOvFKLUvstD9kfs8dEcNQws1NmFDoXajua3izcohnWkYVXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264918; c=relaxed/simple;
	bh=9QWvlSczun9moMCOETWvHJGW+Uh7dk/ns0ejbWRYdP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeI5f5+fCVg07tPKnTkoZX8cBI44EBbWu0lDBKSa8TXqfuApOLbpOSW+JtFQzDzcmI0YmXiaYwfP1dOA5+AmLGy0zhHACdbWNbnORDqJFnzvtUah77uv2TETig0Umu268ljgWyjRS+d3e0uE3kK1AUCoITWjV4TuKeT0bEUPtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=efM9bYrw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Hx9gDFXCtpqgkO9P5FolartfjY2YrLB3I4D/2wnut1Q=; b=efM9bY
	rwWk6x+sRL4PXlgbzPJPxa0L8ZkD2nq9dXimn81cssIy8DnQ4RtdLvCIKFmqDvqd
	9reoeVoCV3snixD3Bj3MTrlaaCbi5mmZdpN9z/8mdZu0LgKs7wtsA6+lnE6Bkdb/
	E33hv+ZMxKab1hHIUOq2h857ktQMOCh16EED3ngihq08G7jU1v1/qRKn6IWsEs75
	KDyUnXeAbeJb9O6TUdbTRTjFmYh2prFhdd5Uj3uwhDjU5Ak0HoDxs11h9LDChWc5
	XQYL/csCev/r4KsKgEY06fSzf7ZrHEDwPMCsFdmXKOgj10RoK2zulTp/uPpnlRLt
	HP3yxCask96zYHHQ==
Received: (qmail 3810263 invoked from network); 6 Jul 2024 13:21:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:41 +0200
X-UD-Smtp-Session: l3s3148p1@gGJcYpIcZIZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/60] i2c: lpc2k: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:27 +0200
Message-ID: <20240706112116.24543-28-wsa+renesas@sang-engineering.com>
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

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-lpc2k.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index e3660333e91c..9fb33cbf7419 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -50,7 +50,7 @@
 
 /*
  * 26 possible I2C status codes, but codes applicable only
- * to master are listed here and used in this driver
+ * to controller mode are listed here and used in this driver
  */
 enum {
 	M_BUS_ERROR		= 0x00,
@@ -157,7 +157,7 @@ static void i2c_lpc2k_pump_msg(struct lpc2k_i2c *i2c)
 		break;
 
 	case MR_ADDR_R_ACK:
-		/* Receive first byte from slave */
+		/* Receive first byte from target */
 		if (i2c->msg->len == 1) {
 			/* Last byte, return NACK */
 			writel(LPC24XX_AA, i2c->base + LPC24XX_I2CONCLR);
@@ -196,7 +196,7 @@ static void i2c_lpc2k_pump_msg(struct lpc2k_i2c *i2c)
 		}
 
 		/*
-		 * One pre-last data input, send NACK to tell the slave that
+		 * One pre-last data input, send NACK to tell the target that
 		 * this is going to be the last data byte to be transferred.
 		 */
 		if (i2c->msg_idx >= i2c->msg->len - 2) {
@@ -338,8 +338,8 @@ static u32 i2c_lpc2k_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm i2c_lpc2k_algorithm = {
-	.master_xfer	= i2c_lpc2k_xfer,
-	.functionality	= i2c_lpc2k_functionality,
+	.xfer = i2c_lpc2k_xfer,
+	.functionality = i2c_lpc2k_functionality,
 };
 
 static int i2c_lpc2k_probe(struct platform_device *pdev)
-- 
2.43.0



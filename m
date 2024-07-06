Return-Path: <linux-i2c+bounces-4722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F391F929341
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89E44B22231
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57A217A92C;
	Sat,  6 Jul 2024 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BhHMmA2M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEE6137C37
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264942; cv=none; b=sJybUMRbQjm3Uupy7pozyyK/3DJIPWpzIndgek/aBfb6FqHnIe3TZlmPPTlSrWS9Qd33fp1twIwqVQBEZXMqeq394Pv5OAZ5pzFFFnH6hf0GkGIrFtU4DWonut3hftimZoMdNXzeQX802ChQnJKKuSDMHO30H8oGT7eT372c9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264942; c=relaxed/simple;
	bh=ILpyGAT8PH5cBPd/u77XyqG3keeBSAhNNTzknC5K6B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKwx2W41IeOl/yspuonXEVHxmDGdz9e2U60VIFXIpqTrFJHi8KkyWuRwBR0cA2boIlbvdtLN3IbUOLGalO+Zdq/gSwCy+zKvO9Lpx2Q+Pz6f3fcfJFpUYlJXo90/zYAJoozRFfc1kkzCMIVae82xIF9syChFYmRuCU/oyzX0UF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BhHMmA2M; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zqYCUBvfBDZC4N4gYZQotgieK/uKq8Y98h1CwEc6O/8=; b=BhHMmA
	2MJObwxT32OjiAFdwaPl377lcNswQUA9m9rriVeO7WIeRfLBqqjPd2cYhpZzYrk+
	sEJxZk9e40HKGNHmO06npLXdJc1bH9Fh2JQ7lzQqhETBRERGMnS8Z4zc1iFnQGkq
	FckJfrRIvKgJJjMiSbt3QtLqnDPjkl731qHnUcL9OJvCwsuhiTyMlxiiIptgkegu
	7hMKTOXS8kU+sGtMLUkAszepmE3BdiGkcUWdI/uhyG/GvAXNpIkaJ8asHhZqn+uJ
	sdS9ZoR6+05B4JbhVAuOtUfpyb9rGV7mZV3qSc1YbMZLR9yj0HldIP6AecovqBnp
	IDRi+JsHmklqmrkw==
Received: (qmail 3811159 invoked from network); 6 Jul 2024 13:22:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:22:01 +0200
X-UD-Smtp-Session: l3s3148p1@esmFY5IcpOFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 55/60] i2c: viperboard: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:55 +0200
Message-ID: <20240706112116.24543-56-wsa+renesas@sang-engineering.com>
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
Remove a superfluous debug output which is already available via
tracing.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-viperboard.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 3784b07f5371..2ed4130c0339 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *  Nano River Technologies viperboard i2c master driver
+ *  Nano River Technologies viperboard i2c controller driver
  *
  *  (C) 2012 by Lemonage GmbH
  *  Author: Lars Poeschel <poeschel@lemonage.de>
@@ -273,8 +273,6 @@ static int vprbrd_i2c_xfer(struct i2c_adapter *i2c, struct i2c_msg *msgs,
 		(struct vprbrd_i2c_addr_msg *)vb->buf;
 	struct vprbrd_i2c_status *smsg = (struct vprbrd_i2c_status *)vb->buf;
 
-	dev_dbg(&i2c->dev, "master xfer %d messages:\n", num);
-
 	for (i = 0 ; i < num ; i++) {
 		pmsg = &msgs[i];
 
@@ -345,8 +343,8 @@ static u32 vprbrd_i2c_func(struct i2c_adapter *i2c)
 
 /* This is the actual algorithm we define */
 static const struct i2c_algorithm vprbrd_algorithm = {
-	.master_xfer	= vprbrd_i2c_xfer,
-	.functionality	= vprbrd_i2c_func,
+	.xfer = vprbrd_i2c_xfer,
+	.functionality = vprbrd_i2c_func,
 };
 
 static const struct i2c_adapter_quirks vprbrd_quirks = {
@@ -460,6 +458,6 @@ static void __exit vprbrd_i2c_exit(void)
 module_exit(vprbrd_i2c_exit);
 
 MODULE_AUTHOR("Lars Poeschel <poeschel@lemonage.de>");
-MODULE_DESCRIPTION("I2C master driver for Nano River Techs Viperboard");
+MODULE_DESCRIPTION("I2C controller driver for Nano River Techs Viperboard");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:viperboard-i2c");
-- 
2.43.0



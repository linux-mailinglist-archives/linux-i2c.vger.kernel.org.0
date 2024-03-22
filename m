Return-Path: <linux-i2c+bounces-2547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC9886D6B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B581F2249B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7DF692F6;
	Fri, 22 Mar 2024 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HrbMRJPe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290F067A01
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114055; cv=none; b=IaXxEQQde1GDk9TqJ7zJOvvOqECDbhQMcCl029+xN0BFMnxlazsTZK/gGtxVsPf20z3/6eE79epFsQQUEN2ylZLbyDRM4wXvEuIyuG2/5x80mqkpUa/JDR+dRDoz+fPo97GmHHh3iO5mjQ52SQ3XSgPFWb6RRHhHhtJqJeiXgDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114055; c=relaxed/simple;
	bh=LCHmmTcTk+2vjiSobJRMbTT798hMptAxCnXzrq2f7Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSvdWFR33uUTysE0SJqhXtoZzNfhfRXBkqxPVt2OydeksAMvgo8sQxV/VfF4Og6oy0qIln9fVoe7xDPxQJAqPcU2CeZdztUO1MJCi2XPSi6EBPU022ke7CVecVbj8f7QsQYZnVyKC0YCUN3qOwpXv//uUIZoQkbOsVN2+8BwXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HrbMRJPe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=wxqg7Z+kFkA+aeNqnWAOKnhOCtUPYChybJW2GTLiINU=; b=HrbMRJ
	PexTlwFW20IcjqbefYKUVB2puOBaT1IT+sYNMqukbLvde7B5zCVp5wwO2DkBs78/
	uj3qyO5QJ6P4fkdF2k2r9UK+dtHe/2zbCJs2SgcHfId+DwR9KJbITD3kZeLBUtBx
	ppX8mMyCf/7EA+u4PIa6fID7M+2RFhePz6DLJZH4myqPdqYksCxOgMIQ6fCFnP62
	SXtC4NugdZ1kQRuf1XRP+txGUtdBnGUcvylRxOxI5Vztft4mLtJEPjCri+jtx2RP
	EZOQS85Ppnza1TJPtUT0Npgc21mr1foVOjYFlFvllh6ks+SjYe8qUf4rvKxuC8uo
	yPcxFhn4WsBsog8A==
Received: (qmail 3872246 invoked from network); 22 Mar 2024 14:27:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:11 +0100
X-UD-Smtp-Session: l3s3148p1@qgoFyD8UjoVehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 61/64] i2c: viperboard: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:54 +0100
Message-ID: <20240322132619.6389-62-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-viperboard.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 9e153b5b0e8e..810424bc7a04 100644
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
 
@@ -345,7 +343,7 @@ static u32 vprbrd_i2c_func(struct i2c_adapter *i2c)
 
 /* This is the actual algorithm we define */
 static const struct i2c_algorithm vprbrd_algorithm = {
-	.master_xfer	= vprbrd_i2c_xfer,
+	.xfer	= vprbrd_i2c_xfer,
 	.functionality	= vprbrd_i2c_func,
 };
 
@@ -461,6 +459,6 @@ static void __exit vprbrd_i2c_exit(void)
 module_exit(vprbrd_i2c_exit);
 
 MODULE_AUTHOR("Lars Poeschel <poeschel@lemonage.de>");
-MODULE_DESCRIPTION("I2C master driver for Nano River Techs Viperboard");
+MODULE_DESCRIPTION("I2C controller driver for Nano River Techs Viperboard");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:viperboard-i2c");
-- 
2.43.0



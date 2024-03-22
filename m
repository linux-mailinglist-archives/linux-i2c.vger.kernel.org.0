Return-Path: <linux-i2c+bounces-2518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29868886D24
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D32F81F2756A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20A860EF1;
	Fri, 22 Mar 2024 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ef2WfHRK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDDF60BB1
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114025; cv=none; b=UHH9xTbulru1b2UZ7Lt90oM/42vKAxSRgEyQC9atkdiUpnzyu51LJSH7eaTxB4h5Ds3yNv5GjX2rlyK5Svd3xPYGccL8c5mW8jUlEKNCCXBEBP6jVOIKFgonmENGf0bTpAoS6bDGDdhmkdrJKi7SyDEyTnzXFAuNqW8j+r0uthA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114025; c=relaxed/simple;
	bh=LqqomsdktA9PTDP493BWKLGoi/VPntCQe2jcifDjxWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7EJLzzdZf+AKuKQOncz3mHG7Vp9h/eOLlauv6+xAONal33NUaRFHqo4saZm4p2fjkjEfpydvp11RgnAiaL9Ufnq5OeQVWgMejcSxwcFucaZXuNvXOuREmr21BeWq+7FqBGiDPiz78cGoVsmlE//+JkXcd6efpmJ3RIl4BH+LmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ef2WfHRK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=sbE/F8+G/icLLI8X84PqoQEotRP5kSI8t6RtImPL4Eo=; b=ef2WfH
	RKpBRv/nQII0Z9hDSaM4KgARYRCWVeIjqsmxpdBuwfUsoGpAsGv0s5pocRBAGwTk
	a/Z7pt1wBDHhWQPWba7vRsJCkAGtmSVS1cf4O0o5KhCPaQxuzS7pHcEpkSTriZtE
	JiMks0bWOeDVhImRqeC0xwh2CCr2b/ecXWQjvn+ot+TGeRu4agwtY1Rx8+R4uh5H
	7Slg3aJJh4JEEy1lGxOUjczxcu3nySlBL5dDCI7t8MiSM/EKe28Pqm0js1qRp2Dr
	iIYNw0nABiqFdMAyc4F7OcQNMk5G2cHvE6oUm8jY20ik/xQE2FjTZeVwnfum4hGv
	GBIlJfkP9a55KS1A==
Received: (qmail 3871041 invoked from network); 22 Mar 2024 14:26:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:47 +0100
X-UD-Smtp-Session: l3s3148p1@RKGTxj8U8pRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 32/64] i2c: ls2x: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:25 +0100
Message-ID: <20240322132619.6389-33-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-ls2x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
index ebae6035701d..99fbc561e7f6 100644
--- a/drivers/i2c/busses/i2c-ls2x.c
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Loongson-2K/Loongson LS7A I2C master mode driver
+ * Loongson-2K/Loongson LS7A I2C host controller mode driver
  *
  * Copyright (C) 2013 Loongson Technology Corporation Limited.
  * Copyright (C) 2014-2017 Lemote, Inc.
@@ -51,7 +51,7 @@
 /* Control Register Bit */
 #define LS2X_CTR_EN		BIT(7) /* 0: I2c frequency setting 1: Normal */
 #define LS2X_CTR_IEN		BIT(6) /* Enable i2c interrupt */
-#define LS2X_CTR_MST		BIT(5) /* 0: Slave mode 1: Master mode */
+#define LS2X_CTR_MST		BIT(5) /* 0: Target mode 1: Host mode */
 #define CTR_FREQ_MASK		GENMASK(7, 6)
 #define CTR_READY_MASK		GENMASK(7, 5)
 
@@ -251,7 +251,7 @@ static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
 	return ret;
 }
 
-static int ls2x_i2c_master_xfer(struct i2c_adapter *adap,
+static int ls2x_i2c_xfer(struct i2c_adapter *adap,
 				struct i2c_msg *msgs, int num)
 {
 	int ret;
@@ -273,7 +273,7 @@ static unsigned int ls2x_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm ls2x_i2c_algo = {
-	.master_xfer	= ls2x_i2c_master_xfer,
+	.xfer	= ls2x_i2c_xfer,
 	.functionality	= ls2x_i2c_func,
 };
 
-- 
2.43.0



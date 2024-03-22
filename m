Return-Path: <linux-i2c+bounces-2532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A8D886D49
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2490F1F29391
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383CC626B2;
	Fri, 22 Mar 2024 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xppii2Pj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5CC6311F
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114041; cv=none; b=uab5trKmvMQ1/YTvD2D+IbkXHNcZu8y5saf1quuY/Z4D691eZDECpNoYK3/rg8unJdHNrz9Wb5TXQVA1vlvunG2MbVnuoX2HSQrMNsPvU35Vm3HmTcZhjqmd0b66pe31EBCHNH9TW0jaY5Y7D4pQTI7S1RKHgaqSXhpE8fzzGz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114041; c=relaxed/simple;
	bh=DlphXw+PfNwwdHim1IX+oCGQAydGlsH9nRSJ1RNWhdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpKBwmLFcIMS2E2x9Py883SoOf/nfulurg+aQ+SioU3C4QgfWPsfWNphB4Tz3/+r1dpmPf45xKMMD/NsxJTIymKvESUPv3ddU4ISFEUFp4e6odX85jqb5G6oqFf7FOjx92y7uu8N/XwQ6rfgg/XzWqvNefiEfgNunnEMwC5a+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xppii2Pj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=9k0vNAOFbxWmwwP3EGdtCr1xKoYDgECbQng1/UH7/wo=; b=Xppii2
	PjOww9HnQK208URk5exVXFAAJ7w6iu7c+tZt7hkzr0wVle2Olx0zTHPx6ALn1/Ml
	o6724hiZGCL45ph01FOubplwHMe48WIip001udORfrSPnPu2o4gOMPe/8eGkZ6N/
	RWpoXcJh+1VMCLh5oGSExGWE5r1RUPKImbipVfeBWqhtq2uRTi0mttR/wWGqh8o5
	KY90rhOCrtqHolZYaC0Ky7pvqx51yEiQ/triTl4C62BudoX6hrAVQ+WJZupmUAuU
	Ul/uSgd3hbaIZbXNnaDh8JbWU7ILC+/HID5ofn2JCPvUWJnO1XHujIW/w1CVxJ/t
	HgTtDthHseqvSjXQ==
Received: (qmail 3871677 invoked from network); 22 Mar 2024 14:26:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:59 +0100
X-UD-Smtp-Session: l3s3148p1@FohIxz8UnrBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 46/64] i2c: riic: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:39 +0100
Message-ID: <20240322132619.6389-47-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-riic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index e43ff483c56e..685a65153fa8 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -12,9 +12,9 @@
  *
  * 1) The main xfer routine kicks off a transmission by putting the start bit
  * (or repeated start) on the bus and enabling the transmit interrupt (TIE)
- * since we need to send the slave address + RW bit in every case.
+ * since we need to send the client address + RW bit in every case.
  *
- * 2) TIE sends slave address + RW bit and selects how to continue.
+ * 2) TIE sends client address + RW bit and selects how to continue.
  *
  * 3a) Write case: We keep utilizing TIE as long as we have data to send. If we
  * are done, we switch over to the transmission done interrupt (TEIE) and mark
@@ -276,7 +276,7 @@ static u32 riic_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm riic_algo = {
-	.master_xfer	= riic_xfer,
+	.xfer	= riic_xfer,
 	.functionality	= riic_func,
 };
 
-- 
2.43.0



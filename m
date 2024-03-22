Return-Path: <linux-i2c+bounces-2489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E758886CE1
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C89101F233B8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD0A47A66;
	Fri, 22 Mar 2024 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NgxOpyOw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2738045C0B
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711113998; cv=none; b=QDAuXGPQ//aH1+MRpwLf3enuc6uSv222fV40/4v3aEq6d3YRZubfb3xA56KCfNhDvliZ0VphjF1iqwFbZAXZ6QCEICSVom5EQyVBdwfMoeBRyVTncwmHybMJ/tr6tpWUmgphRJZJn4MlWx8TMPnhlRq3myse0455ESeEHhsjf2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711113998; c=relaxed/simple;
	bh=0eqF1EZ5//2m7IOZIH/6WKxxgiYpU+vphX44onzpqRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2YzliYG9d57DMFS8P2RE4OB+060Mpxm00imHLqn+Nsv5Y38Hgx8falk2DWQbsg7TLBi9jn6mLUpt2PootpvX1oQVUrESxkxkJRfSBiKFX4Ln1JzbzS7j9JMOOzL1zvYL0DqCpcG/g/z/JGLohMfqRwH/MsrCxsGIZ/8XGVEb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NgxOpyOw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=o02kBYEnft414jyQ74NQkV+FMLMQv2lOI3Wx7oPtptA=; b=NgxOpy
	OwJdAPzp5OLNUSi+sT/hYXvyXe217psAAFpnVNwTZPCiWGcRjVRWNNgcXaiDblqb
	+0HtIJHeUwyceh2iBQNzvyghr+h42rDb/kHGXvL/4bCDYva76IqLQMP7cTiJPPCm
	PvyIi/4gZE4PfrgfdiFfnvXydnZHjSA5hSQAV+u2RUqFiUqOsE7cOwgV/shdpv6b
	EmEpNZkPcRWE4x65vlCli5YuL5dbB8Yx9KdQEQDVp2K0S6WAKY3GRP9V/4gdZ7CM
	Km/GmQgbo6F+E4b8wx30s02/oWhUejSaBmYbWP0+O9YXsaZaeOo4vziZzZMmhplj
	WdlXBelM16CxYFvA==
Received: (qmail 3870139 invoked from network); 22 Mar 2024 14:26:23 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:23 +0100
X-UD-Smtp-Session: l3s3148p1@Q54cxT8UWJNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thor Thayer <thor.thayer@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/64] i2c: altera: reword according to newest specification
Date: Fri, 22 Mar 2024 14:24:56 +0100
Message-ID: <20240322132619.6389-4-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-altera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 252fbd175fb1..f4dde08a3b92 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -168,7 +168,7 @@ static void altr_i2c_init(struct altr_i2c_dev *idev)
 	/* SDA Hold Time, 300ns */
 	writel(3 * clk_mhz / 10, idev->base + ALTR_I2C_SDA_HOLD);
 
-	/* Mask all master interrupt bits */
+	/* Mask all interrupt bits */
 	altr_i2c_int_enable(idev, ALTR_I2C_ALL_IRQ, false);
 }
 
@@ -376,7 +376,7 @@ static u32 altr_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm altr_i2c_algo = {
-	.master_xfer = altr_i2c_xfer,
+	.xfer = altr_i2c_xfer,
 	.functionality = altr_i2c_func,
 };
 
-- 
2.43.0



Return-Path: <linux-i2c+bounces-2544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF37886D65
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFA31C24688
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C3266B5C;
	Fri, 22 Mar 2024 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fPZ5Bd2N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5FF664D6
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114052; cv=none; b=r+2+jOAvZmFuq3kEyTnxfaju49qkoYe7bXXtPYuZCcuIwlCNEtXrvJGNkhDkfT9QHR2q8pJKfZ1t5m8mNHsBHkvxTZ65XbJUdkbL/wYPFAeJj+BYo9kq8JOFqXqxE9ohlbivuuVrRDdg/Cb9t/Zv8IgRLk2Ql8/Z5LUTpdEznys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114052; c=relaxed/simple;
	bh=DFgZgIWojfRwew+B4gtaz8Ua4P4wxDuCpqQg8yqbp9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwamrCiXY+axWZuRwoCkPPsueYv5X9BTPEYDM06H0eSQLL2IFnBgFcv34Sh2FhFJGmfIvO2CcN8Tyf5EqFBdesuMWjrI1HtPF4IAFO4+p0aEQePeFRKnkmTLSg7DdSOz8UOyAO0h8KuoSxT0dfpHZVH6jigmrObGWuU9mPInbYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fPZ5Bd2N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=hhFcH9ZTNGEANydu8nWsC7JwiC16KFzrlwifPam1sfA=; b=fPZ5Bd
	2N89JEqXBCKfiZjRTShinhLRMOsdndhUz1yn1wvYdYLfNXIHkbE1kfmkzImUQ6Qz
	kQfMpAI9dJgV1zysr80npZbezBnvioUZPA1qHeFAxL003Rwzdu7gf6GJeHvYVKKk
	pJidfepYIBAjv/vWAVbSESV1mL14d/i+x9TMEsC0IYzZv6GncWSqfmCNKxX8T2Cv
	AcRcLyW1W6SpV3bfnRwAEBy9F0OMlaDiazu7YZijjGoPdF1CWc5Bs5ZLOkPJzteB
	3PEPXayPI7enYB1eyNctlXWmp6bGe/F1GWY0iHiyZtqc0l04ANLLTvEXHIJvPWiv
	eR2Wweob/8BZwsHw==
Received: (qmail 3872130 invoked from network); 22 Mar 2024 14:27:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:09 +0100
X-UD-Smtp-Session: l3s3148p1@oEfexz8UWJRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Till Harbaum <till@harbaum.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 58/64] i2c: tiny-usb: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:51 +0100
Message-ID: <20240322132619.6389-59-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-tiny-usb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 1bffe36c40ad..da06d1be0a2b 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -54,8 +54,6 @@ static int usb_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
 	struct i2c_msg *pmsg;
 	int i, ret;
 
-	dev_dbg(&adapter->dev, "master xfer %d messages:\n", num);
-
 	pstatus = kmalloc(sizeof(*pstatus), GFP_KERNEL);
 	if (!pstatus)
 		return -ENOMEM;
@@ -142,7 +140,7 @@ static u32 usb_func(struct i2c_adapter *adapter)
 
 /* This is the actual algorithm we define */
 static const struct i2c_algorithm usb_algorithm = {
-	.master_xfer	= usb_xfer,
+	.xfer	= usb_xfer,
 	.functionality	= usb_func,
 };
 
-- 
2.43.0



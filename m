Return-Path: <linux-i2c+bounces-4720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C82892933D
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC84D283876
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD24136E18;
	Sat,  6 Jul 2024 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g4Y8iwaz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301DC176ADB
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264941; cv=none; b=XAwV/K+wbM66jTIVVPq06/NlcaN7isg1cukUK+vzfV1JOfm7y9P8Bzt5+YLQMAJdVT2eszwhrrMH+zUkb9ZusZjKBxs4DejYc3M5okb2rZxeMv4zZNSo78Aou2HUu+KrcuZSQXCqG/jkHPPGKoWAi0PE+K/TMWgBODcffpZxeK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264941; c=relaxed/simple;
	bh=44/VerjRMZA30NequQC9tYr2rT1O0nD1yDM4lmWDf14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhLL/OYfwAID90oU3PM1FQK2A2vhCVL2JJWivynfudeKUKLfwGs8ILD8afi4ck0/HVnTgCe1E3moHf8Tg6NAxDp0+crwu1272j/eNPM69gjmfiwwK1JWNlvS8kjd3a0LmU6Vx1pRCLB5K8/9pnk+NShvnRhq78gfWpT3gvzMKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g4Y8iwaz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7dHCK1HMmymfMi5aVj2Q/0weiMMX5OpcY1dlNcQSBpM=; b=g4Y8iw
	az+TME0+XuqsqIVOYWJ+GH6ikN0ag8QbSc07b+se3kPLeKjlfyJMYu/NlTekywy8
	2/q7MbN7rB0ooaK8bEoS3v4Z2jridsyOS3MtIz2KcKMjP4+/+j25zS2QIBk6B5QJ
	HS6e+btes3HneBVgeuQ/w9QGXR9dLdLMp55zkVItaIQK7KvuVjz2Elk0vg7BL/Pb
	pEWXLws1l0Jm+mWtsqk0//n2OmaEqvs5xCOJXBzao7TkH5SzE641WyH55TcAugxU
	cLG6MkeJbhBWybICHJOugm0bqsuu6IQWO0V08LeiRRIg9MGTgNEsV84qZCbtRPHu
	iaePH14vcfncEhfw==
Received: (qmail 3811044 invoked from network); 6 Jul 2024 13:21:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:58 +0200
X-UD-Smtp-Session: l3s3148p1@j7RlY5IchuFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Till Harbaum <till@harbaum.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 52/60] i2c: tiny-usb: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:52 +0200
Message-ID: <20240706112116.24543-53-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-tiny-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 1bffe36c40ad..0f2ed181b266 100644
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
@@ -142,8 +140,8 @@ static u32 usb_func(struct i2c_adapter *adapter)
 
 /* This is the actual algorithm we define */
 static const struct i2c_algorithm usb_algorithm = {
-	.master_xfer	= usb_xfer,
-	.functionality	= usb_func,
+	.xfer = usb_xfer,
+	.functionality = usb_func,
 };
 
 /* ----- end of i2c layer ------------------------------------------------ */
-- 
2.43.0



Return-Path: <linux-i2c+bounces-14732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58393CD96C8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 14:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 224DF3012751
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A50339875;
	Tue, 23 Dec 2025 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2e1H5KUo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018432F616C
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496177; cv=none; b=U2TqE4lttJ6Cg+dt9eTP804XLPLw/DeKpX6BrhaJc+pW4ekQD9IIj6Xxdrv54G02ilr+VX4S13sl4i/xQLCfAxvVPk/HVA4e6Gfuxf2CMAPupYQ8cwif4vvOXF0MW3PfuGV5Q0A6o41Wz+mPld3/ktEANwdFfKI51N5sMUIjTuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496177; c=relaxed/simple;
	bh=3IMkVmGSMYvUDDeh6yxFErC4eVe7SC/IvKNxl35TdWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZMEcLTe12OhUhJUllRHJmhh8CdDClD0RoGgZJ1DNDW8OaiDdkrQErk93z3GWa644ZHRcLRCY5PkaWM1TtfzZShnNrt514KGUAo8S0J6bIXuv7sO9QlcunA2aRAZPNxVSzFTI+iGB3nqkMfbkBBqhRsz9eiOTcyLdoWzzUZXrLzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2e1H5KUo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 75B594E41D5D
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 13:22:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A60160716;
	Tue, 23 Dec 2025 13:22:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB3C410AB0AA4;
	Tue, 23 Dec 2025 14:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766496172; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0aDNrJ76T3ry44+9Cy7nDXEbONQg+FsvPstGEphdCio=;
	b=2e1H5KUolGvXfYE+jZ0WowMt/e+jvyIrbQCYR9gPIO4BesAGctaqE7qI3CMCDazBAfsvCO
	frEecQ+TsUR6QzamezlsKyvJ7nfanTHYXcf/UIt7ClCwVpBruZvsmQ13Ow5shJG2RDTT6V
	Ym/ACRAWP5FrzsmmLRAWThN+3BDprnIekIMfJECNN0VUlgWAPnKD550jlftwNYWlTouBHs
	kAk7zK3fuZhgyruFJ5vuKsegYGxvOCbyZGRsEwywr+QzXYwOe4kLhA8bbIpfvItZ+zkGeF
	9H4/EyjQ1pwX4dd6wObZInKaxQfkRmiqgLfLNU9vfsNoBwxtpforYRv/8fegng==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 14:22:42 +0100
Subject: [PATCH i2c-tools v2 1/2] i2cdetect: Display mangling and nostart
 support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-msg-flags-v2-1-8d934a4366e2@bootlin.com>
References: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
In-Reply-To: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Show the support of protocol mangling and repeated start elision in the
list of fonctionnalities displayed with '-F'.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 tools/i2cdetect.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
index bb2f146..70b585d 100644
--- a/tools/i2cdetect.c
+++ b/tools/i2cdetect.c
@@ -165,6 +165,10 @@ static const struct func all_func[] = {
 	{ .value = I2C_FUNC_SLAVE,
 	  .name = "Target mode" },
 #endif
+	{ .value = I2C_FUNC_PROTOCOL_MANGLING,
+	  .name = "Protocol mangling" },
+	{ .value = I2C_FUNC_NOSTART,
+	  .name = "Skip repeated start" },
 	{ .value = 0, .name = "" }
 };
 

-- 
2.52.0



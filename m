Return-Path: <linux-i2c+bounces-4679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE70D9292E4
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E08631C2105A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300F113C9C7;
	Sat,  6 Jul 2024 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GKgM0udf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F267313A268
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264908; cv=none; b=WDnhR3LgJfUpTYHrkp/bAfUAck9w/uPvl7do7E27qsuX+Ucl/UsIJbflXOshwPDmCi6v30qTOwKO9nduGHkXBVzgZdL2XbCkJgWNIJfFRcGG4WmoB1yErp91B1TNK5+hho9UXR7jOmqko3YFZrGpgaFwc5AYqDUOs96pzu4X8qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264908; c=relaxed/simple;
	bh=7oO8BCLJcy+iMfb7nWbA9HN4VXkyrI7WBsPWI7Ns588=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKf6N32gHQGVsK8pmK9DNC2JwgIdUkXo5nnV+cgqQHgcMx+RuhnIkpJ7xaNwMCZyYLFvBwGDtJNhumVpdonAcgw4pOBulMmn/ba+oMLEfKZVWMaaky5PumbcQ6vfFNcdMlnRn4GdQS1UiE8InPv5xPUEZELzonJpJeXBMMiHXBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GKgM0udf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Q8fwtYWq5NjvfAYaeNUI0UE8b4oJ3/6m8r1pPrhS05I=; b=GKgM0u
	dfdiDntucXOClb1Mq1ZBd7KtOuRWYIfMZHCdP5HTFXm5pX/NefIYmFBTxKggv2cG
	L0T9dbaDdIZxsGgcngEvuFqGze4HHQHgL/qXyG5i7MWllXnhUdTJGUhgTqkjxKWF
	fVkupa3e2sL8+h7l+OiSj4P1qFAUhjdrdqdL0P5MV6l3KD3/quKVPXse5/Lfvaqj
	7r9zDHbTfbkqouI3MuZjJSM2aqxGdscTKsPpby579N041Go1j8R3QPh1PuxSnYcT
	cNGSuhfxLtZO36LS+0TOgZyQt38FWww75URODTZV6t3j11cpM8Z4EWG9dcUXWOo2
	KL2jvQ9aBllHDymw==
Received: (qmail 3809721 invoked from network); 6 Jul 2024 13:21:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:30 +0200
X-UD-Smtp-Session: l3s3148p1@z9K5YZIcjpBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/60] i2c: digicolor: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:12 +0200
Message-ID: <20240706112116.24543-13-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-digicolor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 737604ae11fc..3e6b80e59b90 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -281,8 +281,8 @@ static u32 dc_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm dc_i2c_algorithm = {
-	.master_xfer	= dc_i2c_xfer,
-	.functionality	= dc_i2c_func,
+	.xfer = dc_i2c_xfer,
+	.functionality = dc_i2c_func,
 };
 
 static int dc_i2c_probe(struct platform_device *pdev)
@@ -372,5 +372,5 @@ static struct platform_driver dc_i2c_driver = {
 module_platform_driver(dc_i2c_driver);
 
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
-MODULE_DESCRIPTION("Conexant Digicolor I2C master driver");
+MODULE_DESCRIPTION("Conexant Digicolor I2C controller driver");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0



Return-Path: <linux-i2c+bounces-4681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3C9292E9
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC112831EA
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA3113DB98;
	Sat,  6 Jul 2024 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IyccCOk8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F15A13C697
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264909; cv=none; b=d+xTLEYhk3fhvCiodhFWJ9VVhsbSrR1vyhsRF0K74iDqJF/csAEDs1GyquNUvjDh+OI/kX9SIp558sLDpEgHHDckNonN+16l+y64P3I8KS23motVK4EvK2S/UVeUf6yCfEMZye1Bek7sclZh2mGz/TuNGUWP3WuqfzpPFF5HlbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264909; c=relaxed/simple;
	bh=v+kC+x8BAXHTESQ4t5HlKIn3i7LFkD8XW+OC7jG6D6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeRbukNY0BVdciFjGW4auFqDBQXNWFdfJYtoK01Q7HZCIVMPayePZfNsYF+ztTCzCmeIj0oDxxlReyXe4ib35htVolKqGyTWR1MwwhL8gs4J1S/FjMyYRv/oAAogYCkBTjOxoH9NQVQDQzXlZHJbwbK9Ptcj1r4X/6js/1e2b/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IyccCOk8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=omQ86OPhxmbCCLS3LFui1sAFN0oi2l5Hf+KSD1OT1QA=; b=IyccCO
	k86gXm3ptCruc0SlbrlKklTxnrSUojAVv4PUxSvIRMp2XZBqt26FYCwfccInLHSH
	kBC7mHiA2jUtrmjNTsTOyM/KcVNMUkrjZ+GZAtFDf7eX+L6jL+Buoyc4tBiy7+1M
	wmIuR4UAwWNpBPvS0Jkwa45Z+DGnOhknukHeMpk3blj/8DQhoT3SU1lT70NDAR03
	0P2ngURXpP6SkCFOATIJubi9wpQXAYvuTd3gSpWGCfuXB693MYx05aFD/MfyJ3Ib
	wwGzdLeUJYe71CBUt7rEJGM0br0m5fIX+G7ezt22PyKwb0RF5pZMQanRv2qYYHhW
	CB640D/utDdtQ0OA==
Received: (qmail 3809787 invoked from network); 6 Jul 2024 13:21:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:32 +0200
X-UD-Smtp-Session: l3s3148p1@IVvPYZIcopBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/60] i2c: dln2: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:14 +0200
Message-ID: <20240706112116.24543-15-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-dln2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-dln2.c b/drivers/i2c/busses/i2c-dln2.c
index 631109c7a098..11ed055143d3 100644
--- a/drivers/i2c/busses/i2c-dln2.c
+++ b/drivers/i2c/busses/i2c-dln2.c
@@ -175,7 +175,7 @@ static u32 dln2_i2c_func(struct i2c_adapter *a)
 }
 
 static const struct i2c_algorithm dln2_i2c_usb_algorithm = {
-	.master_xfer = dln2_i2c_xfer,
+	.xfer = dln2_i2c_xfer,
 	.functionality = dln2_i2c_func,
 };
 
@@ -251,6 +251,6 @@ static struct platform_driver dln2_i2c_driver = {
 module_platform_driver(dln2_i2c_driver);
 
 MODULE_AUTHOR("Laurentiu Palcu <laurentiu.palcu@intel.com>");
-MODULE_DESCRIPTION("Driver for the Diolan DLN2 I2C master interface");
+MODULE_DESCRIPTION("Driver for the Diolan DLN2 I2C controller interface");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:dln2-i2c");
-- 
2.43.0



Return-Path: <linux-i2c+bounces-4675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 376339292DC
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68D981C20F6A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFC06BFB5;
	Sat,  6 Jul 2024 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AxRKST6o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14735139CF6
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264904; cv=none; b=aiUTfDEiQjLENJ1kuPt2KRT5L/HEzG4Gp81XvAPmp4RAu+Qam7KtmhiB1GXmjYgqWvePA+7E7UwcqHWYTP9XNqTaNfuaGde5N4StIDCI/8Gv4s9lh9jotyZbFnrZ2Ugf8nb5o+xb5bp34/uE9BnumC+e8V+oq+/b+KGkMx+XZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264904; c=relaxed/simple;
	bh=cwNpm6cmcedvTmgJYIYI4r4UZQAz03n1V0IomcLiY0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvGOU1Kz3/KuvSToFn4iFTsKi0tJgh9IR/Fq0bpe6yxWfSnheB9Hjcyj+5hTC4qxV/NLU4HEjhWGlUBquDvRrG2ege8B80yKQmhL36jxXSKyPlgAQqW4ZsJNGH0ciE/MIbG5lKqYEA+TV7rp9bgRodKK2ZazeDv4TeGib8coweo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AxRKST6o; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=TMNlMppsr5FIbxubOxKOX/t6YvbAqQy3FZPHU9s/HeA=; b=AxRKST
	6owM2BX3j5eLjdDlGHoMEOhwE5BhUBUadV7GyyxLy7JTrKsANLs3WpOj4ZFfOgWN
	Iv/y3hC3tKDpigZ4NC1qBPuIGMed4h898yWEHrd6kGqbPLkfwVgHp5Dny6YB637i
	sOIX9uhchew+25pmsQANwxbIRF7wfT43w6Eo0ya3zj+GwxTKiU738rsNv2M9DCel
	qkHB63gTaHuNOv48CnO8MoniEPWNimWwr68dsz+jQpUathyHK6ES8lEoKABn8EdZ
	KrPrDAhCB9lbjaMkXBbmYOHNvsUCx6IQXYqgU4NoW1yELZHpTpj7LwzphIFj4t++
	ZiAMow8yXOJLRO9Q==
Received: (qmail 3809622 invoked from network); 6 Jul 2024 13:21:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:27 +0200
X-UD-Smtp-Session: l3s3148p1@BaGMYZIcZJBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/60] i2c: cht-wc: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:08 +0200
Message-ID: <20240706112116.24543-9-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-cht-wc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 0209933b9a84..52e3000626c5 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Intel CHT Whiskey Cove PMIC I2C Master driver
+ * Intel CHT Whiskey Cove PMIC I2C controller driver
  * Copyright (C) 2017 Hans de Goede <hdegoede@redhat.com>
  *
  * Based on various non upstream patches to support the CHT Whiskey Cove PMIC:
@@ -106,7 +106,7 @@ static irqreturn_t cht_wc_i2c_adap_thread_handler(int id, void *data)
 	return IRQ_HANDLED;
 }
 
-static u32 cht_wc_i2c_adap_master_func(struct i2c_adapter *adap)
+static u32 cht_wc_i2c_adap_func(struct i2c_adapter *adap)
 {
 	/* This i2c adapter only supports SMBUS byte transfers */
 	return I2C_FUNC_SMBUS_BYTE_DATA;
@@ -168,7 +168,7 @@ static int cht_wc_i2c_adap_smbus_xfer(struct i2c_adapter *_adap, u16 addr,
 }
 
 static const struct i2c_algorithm cht_wc_i2c_adap_algo = {
-	.functionality = cht_wc_i2c_adap_master_func,
+	.functionality = cht_wc_i2c_adap_func,
 	.smbus_xfer = cht_wc_i2c_adap_smbus_xfer,
 };
 
@@ -554,6 +554,6 @@ static struct platform_driver cht_wc_i2c_adap_driver = {
 };
 module_platform_driver(cht_wc_i2c_adap_driver);
 
-MODULE_DESCRIPTION("Intel CHT Whiskey Cove PMIC I2C Master driver");
+MODULE_DESCRIPTION("Intel CHT Whiskey Cove PMIC I2C controller driver");
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0



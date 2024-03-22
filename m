Return-Path: <linux-i2c+bounces-2499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E228D886CF6
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FF7F1C21E7B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE3455C0A;
	Fri, 22 Mar 2024 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ME6arAZI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1656B91
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114010; cv=none; b=DSrpi67Lm1TzOnBLKIWsbUzZFI2mTVGeZjm7xOvbEHt4/RDa9FEhPuAZPHiysfuuKdWy96c/HjrHlUUx0Vu2faD75GCNLQhmoJccKjCjiUYvhwJR1UXF5v8S7yFsTocMThLcj0MRMiAW0Er33wyKrzrz02m+8Xxp1BGwjGayTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114010; c=relaxed/simple;
	bh=pdslGmCg7UYS904SRehvA69DAu8yAAOzUDQVvWox858=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=md0CEd8YQZ+7Y/Dmvai6UYZ5w2HCLh68W7NXEye161gAFjnvFEtybUU4FRvGMVmtLE+1wUdX1bjrfuy+xQPfdQ0Q1+RTQNVHx9n20kOwTHKq5YQ59CLUKz+/zzXNA3IH5kOQm+ICs3gysa0vK3QmmjHVCvzfFaSrG+EKFYOCJrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ME6arAZI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Hb6ygo2gDcXeza4LMpivX7Jc9uJy+bbFjc6SX1hTOtQ=; b=ME6arA
	ZI2cusTJpPWViEnC9zUp/QZTz4Yc5gDU6uW6Ul0aHucW3lnFG66aB2hIGGvriPJo
	hZUcl1DX5x76PhoSiz4u1L7gmr88M2WEe5WUS6XOXqcrDsJ0ZEA0MW6qRVznJ7jn
	uaKyPZ8PZdMvDk7GBEbbZCUiL+3udddtWqbFXMikgBDArHIb46dXzRlP/NOUqLVh
	DOVYxjq7nKPMM/gdkn9MlHYCK3Wx07TFhaACIiAMYDzpmG+0XgVkpNmrcabAqO3s
	Wr+zUyjtkzUHWA8ren9RCUORiHqUceHl9JM4Oye+zzILXhRz7Qc/Qonu+55SpEW8
	S6hq4FLuUErkY9qQ==
Received: (qmail 3870300 invoked from network); 22 Mar 2024 14:26:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:31 +0100
X-UD-Smtp-Session: l3s3148p1@JxqWxT8UnuBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/64] i2c: cht-wc: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:05 +0100
Message-ID: <20240322132619.6389-13-wsa+renesas@sang-engineering.com>
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



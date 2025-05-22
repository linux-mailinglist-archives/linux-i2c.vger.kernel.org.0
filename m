Return-Path: <linux-i2c+bounces-11096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC00AC04C0
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24ECC4E1F91
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 06:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F913221F0C;
	Thu, 22 May 2025 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="czexWMaV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A544D4317D
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896227; cv=none; b=gbZZBTABXpsMlIDGEZxrf1h7x5RY2gXuJ7SQh8IvG3q+WUQ+D8baJqiG39NTzKdYub9+xYwbmDUHprdMUShteEGPtjoQ8l5fAOHMIQ5W90Gwd9b0vwjE2IfVXv9nAc03rRyrw6cg2AXdmqX9s9u4mOom4FGDRHV+dsNdocXYaLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896227; c=relaxed/simple;
	bh=mH3fmbl7refCg1HHhe13TwvWENwPLSE30fOG0HIsIP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0t5QvG1J8r9cy3Ak55GSHRzbYPJss79MVtmp4ZV4EdPFr5VWcZ6HDbbVQdl6u8Jvfy/BGGa0ldvdelD50gqMlox6ka2t4v/P4lcl5RCdMeUpCrQwtO114fnA+sPc8R814N7VOznxJ3MPGc/Q6A578/ZGLko6cWLJjDnpEBXtQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=czexWMaV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=X4ywNBT+2ixEDx
	gCJhbD21DvdI8ZosRQ3D/wNsbS894=; b=czexWMaVqv6xKW+2BYobY+uW6K+kbA
	uK37NXJb4qhi1JHyT4DZI3nIGh4mvekPQJNchdjO1B+GZbwWL8fWe7fcJpwWdTOG
	tWCe0f4Xjr0vh8iKGnauIauTFWvjI/L6ImyzKsQaFApus3jBIPzPLhe6kxV+ATye
	Oess59/Ul+cOXP9jnkyZgkoF/dcFIbjZVoRKVHNf8jleGsJh2Cb8q336X1kZbiEM
	/imrJHuk3XM4DNr7Oot6WpiBChs9tAqAry3Ds90bHpwsD+xdsA0DX0EcoYKDzUse
	IH8sgApPa+2mwaOE1XKC/+jjd7VFvregEswvclH2Zziuu397OpYW+tFA==
Received: (qmail 3533900 invoked from network); 22 May 2025 08:43:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 08:43:38 +0200
X-UD-Smtp-Session: l3s3148p1@i7ktzbM1LrMgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] i2c: robotfuzz-osif: disable zero-length read messages
Date: Thu, 22 May 2025 08:42:35 +0200
Message-ID: <20250522064234.3721-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver passes the length of an i2c_msg directly to
usb_control_msg(). If the message is now a read and of length 0, it
violates the USB protocol and a warning will be printed. Enable the
I2C_AQ_NO_ZERO_LEN_READ quirk for this adapter thus forbidding 0-length
read messages altogether.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-robotfuzz-osif.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-robotfuzz-osif.c b/drivers/i2c/busses/i2c-robotfuzz-osif.c
index 80d45079b763..e0a76fb5bc31 100644
--- a/drivers/i2c/busses/i2c-robotfuzz-osif.c
+++ b/drivers/i2c/busses/i2c-robotfuzz-osif.c
@@ -111,6 +111,11 @@ static u32 osif_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
+/* prevent invalid 0-length usb_control_msg */
+static const struct i2c_adapter_quirks osif_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 static const struct i2c_algorithm osif_algorithm = {
 	.xfer = osif_xfer,
 	.functionality = osif_func,
@@ -143,6 +148,7 @@ static int osif_probe(struct usb_interface *interface,
 
 	priv->adapter.owner = THIS_MODULE;
 	priv->adapter.class = I2C_CLASS_HWMON;
+	priv->adapter.quirks = &osif_quirks;
 	priv->adapter.algo = &osif_algorithm;
 	priv->adapter.algo_data = priv;
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
-- 
2.47.2



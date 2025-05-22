Return-Path: <linux-i2c+bounces-11097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED3AC04C3
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25F694E07DB
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 06:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C985221719;
	Thu, 22 May 2025 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HWRHeBA3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF9F221D9A
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896238; cv=none; b=rSZxWauQN89dNirBRd8GD0TGjADwojR9pPCsfYrZyHBTveGyIJHIzJj2ir56XKLZwyZe4DfswGhcOjumxvvCPdVtPJQIgN9PXT46jfKQSfHs2EqApN3JGdT9jyiHn1TFjLA2rV41kiqtYSnivVg8/2iKgagVESo9CvkgEnRHBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896238; c=relaxed/simple;
	bh=iwosjGa1+dzWBytJRhObLGPI10QCu4QJwWEIdpV9VJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzbVCGuvQTpjBe+6aqSH8bEVIcC9KLuP1pB5fJ4D2WC1LYh4FhzLl7RvC13HEZ6wMALtw663XHeVZZwxyvIPZxp6cagVQGHmzYhn8A96/3HerR6SvekSG/piZwGdRpMAQBqbgampx3CutLrjZQZ9A5xX8H35mlK3nT9xjF7jl/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HWRHeBA3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=z2uDdfs7vPu+Qu
	xVOd6pqSgCZscHMGXP4l/SvREWjyk=; b=HWRHeBA3Oq87zKwCth8mb5wk8hkjt1
	dBkZCSg+f7Ik5ziMbjESmzoB4txYiUzGTTqRwfB6g4afumJXRRxdx4bVjc79ZFtk
	iZN7uqB8iFdIphWUIUG5fvE4wde0sYy7HrPdlqp/TL1vZW1Vrg3DDIp0OR5iPVNg
	tQUQMPtjIGqeJgAxroPysxJe7OONr0fy9f9Wqu43f0uX+EwXXnRzceLy1NXFjST1
	5aGVMVqdlyaVFYF6XN2juI74XwtKlT8zy1CM8g8quilapsuXOxFRuN9o1/awhhLW
	KUK+IYm7zUsbOGsEMyYQBU2swDN3dCi2HS0JXVHLRHd0sm7bcMjjfVYg==
Received: (qmail 3533990 invoked from network); 22 May 2025 08:43:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 08:43:52 +0200
X-UD-Smtp-Session: l3s3148p1@OfIDzrM1yM4gAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Till Harbaum <till@harbaum.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] i2c: tiny-usb: disable zero-length read messages
Date: Thu, 22 May 2025 08:43:49 +0200
Message-ID: <20250522064349.3823-2-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-tiny-usb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 0f2ed181b266..0cc7c0a816fc 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -138,6 +138,11 @@ static u32 usb_func(struct i2c_adapter *adapter)
 	return ret;
 }
 
+/* prevent invalid 0-length usb_control_msg */
+static const struct i2c_adapter_quirks usb_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 /* This is the actual algorithm we define */
 static const struct i2c_algorithm usb_algorithm = {
 	.xfer = usb_xfer,
@@ -246,6 +251,7 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 	/* setup i2c adapter description */
 	dev->adapter.owner = THIS_MODULE;
 	dev->adapter.class = I2C_CLASS_HWMON;
+	dev->adapter.quirks = &usb_quirks;
 	dev->adapter.algo = &usb_algorithm;
 	dev->adapter.algo_data = dev;
 	snprintf(dev->adapter.name, sizeof(dev->adapter.name),
-- 
2.47.2



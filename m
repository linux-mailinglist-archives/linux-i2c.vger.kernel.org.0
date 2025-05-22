Return-Path: <linux-i2c+bounces-11098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B2AC04D8
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B894E265B
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 06:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C4C221FBD;
	Thu, 22 May 2025 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Aa4frr0x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795F5221DA1
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896932; cv=none; b=KUtDVIW15il7t+D8UK6FT1v4C81Rc++cXH5sDtA4BnA474uf1l3tofL8nkqZRFUQi/cXaaRglB62P1qPBYE+yg1hhHFiSHC7BNk0CCK1UtNH3+L6a7sTJzQ4aEHLeslnNGiLlVDgjsunI84XnbeQiDxudCPuxPjCmv8ijnF7lRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896932; c=relaxed/simple;
	bh=kX3lA6xbLFDI7GwHRqpD3CrIjbTxB4QnGjk4qZHIbXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkUDJlydD17XJiERiMYLUSmAWrhgaaQbhx9GxJFtXJTHQsEbBAexlpGBgZF6hu1NPY1G4qOa0bNI2OIdXUkehm5TO/A0ByRM9NDMjWEEeWFLuHntS84vs2nQN6e+MMnYtl4L8Fz1FqMROdmhUqUrf06eR0xQbxRe1vWbJVEGTJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Aa4frr0x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=li2hueNGb80HQajMxhsw5y3PVxDex5x6jF/Yuik3CTM=; b=Aa4frr
	0xbKDdxfQeaXOWz3S+LVJ8yJHygztFCFbhw69DQ7cXbyjNg1yPGLC4zQsaTcCNJ7
	elHRguw/aDEM1tJmZ/f8q7IvQMsE3xENkITVSTDBBVFoVF8WYJv5wVHQCWan0d6/
	OFTc5QfPL7863JM6PgiQjkoZdOAER4ZI8YpynlJEF+zd1DeRDhiAV+fC9y4TLKhH
	2Afs/XX0lhrjdGHYaMeDOmwJdQT+YyNX9Xy/EYdxMj7LPitzYGNoZQcTPYpseX5n
	k5PRbiGw8nEYUMJ4YpjuKrQOCF/guT9btPfbbJYV0w1eBJZCYe7xWmKuiRo5fb53
	kD0SIiYEqk4SuR6w==
Received: (qmail 3537921 invoked from network); 22 May 2025 08:55:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 08:55:28 +0200
X-UD-Smtp-Session: l3s3148p1@d/GA97M1OOYgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Janne Grunau <j@jannau.net>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: usb: hdpvr: disable zero-length read messages
Date: Thu, 22 May 2025 08:55:20 +0200
Message-ID: <20250522065519.4138-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250522065519.4138-4-wsa+renesas@sang-engineering.com>
References: <20250522065519.4138-4-wsa+renesas@sang-engineering.com>
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

Fixes: 9aba42efe85b ("V4L/DVB (11096): V4L2 Driver for the Hauppauge HD PVR usb capture device")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/usb/hdpvr/hdpvr-i2c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index 070559b01b01..54956a8ff15e 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -165,10 +165,16 @@ static const struct i2c_algorithm hdpvr_algo = {
 	.functionality = hdpvr_functionality,
 };
 
+/* prevent invalid 0-length usb_control_msg */
+static const struct i2c_adapter_quirks hdpvr_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 static const struct i2c_adapter hdpvr_i2c_adapter_template = {
 	.name   = "Hauppauge HD PVR I2C",
 	.owner  = THIS_MODULE,
 	.algo   = &hdpvr_algo,
+	.quirks = &hdpvr_quirks,
 };
 
 static int hdpvr_activate_ir(struct hdpvr_device *dev)
-- 
2.47.2



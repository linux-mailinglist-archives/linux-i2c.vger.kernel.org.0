Return-Path: <linux-i2c+bounces-11105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CCDAC06B4
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 10:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5C077B1DA6
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2029262FF2;
	Thu, 22 May 2025 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CcpEC7Eh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7348024EF90
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901418; cv=none; b=hJqiov7dtPkFePxqXzWbJv4RGNYpFoSEXwZ0PG8uCqFu6411AyXhL18+pA0AdF4N9I0P5SPXCSyKhnl5bun8OuJui9Tnn8ExIi7JkBzawbf50qZgGdQ9iD5ji8TuX/IfumyHhi7Si6uk4hYT/bePdl67TBHjgy+ZlcWM0EZwx0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901418; c=relaxed/simple;
	bh=HFFAb0Lk0mw0G7zFblrqjg/2eT5TseIuXDJcPmd5Yyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3vDnYvyxMe/WxTtOxYHrfu97hAKj9juXOYSSVd692tJMoWCtmJ5Mat42SfK8sGxWCtKiELQrdgqukAzO20NqmDc6WMsOYU36oP13BU6kZRZkjKfKlphW8hO7Y74ZrXb+EA83LEkYdZPJ4oUNFGOhbSjYfGYM5umE7tc3S0k0G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CcpEC7Eh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=21pRsaR4ksDx6+MvixpJ8QaHqt3mZ65P1LMLxaR5cZM=; b=CcpEC7
	EhXwTrq87jX0m1j13NSkvjU254GLnShsPP9pykN0ziQMd4DjBbjmuNL5lo30bEF5
	o1wfh/Nh1BDx3BI+dd+MAsWC3uWqMdoS576sRQ/++rCKmYliV+K5ZN63ejVAOqO/
	+4Mv404QSyS2OsMMzCf9+/JppGDa6YPj7cZE9P7RGMrBk497+X22OWeUGBrZMQEc
	yBMYdRqRcYClp7ISQtV+bt7DkR5PsssjDti72mL9jpWEKfa2mZfZY9h9iIFYEi9t
	wiVegzsJxnrpHBiMAw+eA2P6gfEsl9VuMzVDcuwiu4qCB0a5Y8qE1sJLTwTK+g13
	/R5Yp10Lij/Cl56Q==
Received: (qmail 3566362 invoked from network); 22 May 2025 10:10:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 10:10:13 +0200
X-UD-Smtp-Session: l3s3148p1@v6PUArU1YrYgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] media: usb: hdpvr: disable zero-length read messages
Date: Thu, 22 May 2025 10:09:54 +0200
Message-ID: <20250522080953.27323-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250522080953.27323-4-wsa+renesas@sang-engineering.com>
References: <20250522080953.27323-4-wsa+renesas@sang-engineering.com>
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



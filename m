Return-Path: <linux-i2c+bounces-11104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF7AC06AE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 10:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFB7C7B1943
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598CE262FF6;
	Thu, 22 May 2025 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dGPutsic"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A09261577
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901418; cv=none; b=UiTzPqp/2wDW3n+jVFXAf2sB/zD+koRaiWVh2X8Ps2l51zmvzTCaLhCpm8YNIujZFovFgCVpZ4cKtKha2Ue9KP3KHKsZY8cuoQt/MqbMWdsmusA9J5V5U/iQ1J4jXKUjziMfp00Kxlbo3tuTIPUYeOjsJ6XoyEoh2g/I2It6MJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901418; c=relaxed/simple;
	bh=gZWzDNVHebgWuR8z8h4rKqz8GkgN8bzDRZ+jWx+po4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkAQ7D6Cjj0styWdS9PU/nmn7BnPI91KeJyMsYDafw/7mHQQfM24xap0mA8fvYYSBiWk2L9MivXkY0cS4fC2N18AzJeK6Bl+IjNpK2w2iyfcHaInpA3jDK6Jt/EWm5sJ6Z0hFsEfBmgpLAv2Wj2R3is1EeOO9hmr3OP2cH+lkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dGPutsic; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=B6MicjzLPnyPCnz7tSEQQ+cqSUWh42SmXecwz3n+3vE=; b=dGPuts
	icMerJ91wSZVAS0epL4OE2VdbWv6m3sk0b3Pw+Gmtb+TGDoY/gBkxv8p+znC5M5K
	qjj+yhNPWSEBfAEmreeLWUngl3ZoCtATUPRPdtxBJVjrw3JaVZPO1Wly01obFdIn
	CcoQcwjIPZrNXZwD0eCJb3w5OOaRk0kJwkTEH83qboPOT5V4K3cGOj9xI/F3QehT
	RcNmb6IDBVTzfYmasI8RcpxS0YvPXU1pIaSrQfaseSw7+fviyHSzQHjupSthK0Cn
	5Ucn+83MCEGx/Jt06lSIghql96FRURiaDbzHcPSUYOVWAkS8+5S7RiWJa2cZsvWH
	lZ3wBthVVWKKUgag==
Received: (qmail 3566416 invoked from network); 22 May 2025 10:10:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 10:10:14 +0200
X-UD-Smtp-Session: l3s3148p1@YNHgArU1aLYgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: usb: hdpvr: use I2C core to handle only supported messages
Date: Thu, 22 May 2025 10:09:55 +0200
Message-ID: <20250522080953.27323-6-wsa+renesas@sang-engineering.com>
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

The HW can only do write-then-read transactions. This is a common
limitation, so we can add an adapter quirk flag to let the I2C core
enforce the checks instead of open coding them.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/usb/hdpvr/hdpvr-i2c.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index 54956a8ff15e..9eacc85e3f11 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -124,32 +124,12 @@ static int hdpvr_transfer(struct i2c_adapter *i2c_adapter, struct i2c_msg *msgs,
 		else
 			retval = hdpvr_i2c_write(dev, 1, addr, msgs[0].buf,
 						 msgs[0].len);
-	} else if (num == 2) {
-		if (msgs[0].addr != msgs[1].addr) {
-			v4l2_warn(&dev->v4l2_dev, "refusing 2-phase i2c xfer with conflicting target addresses\n");
-			retval = -EINVAL;
-			goto out;
-		}
-
-		if ((msgs[0].flags & I2C_M_RD) || !(msgs[1].flags & I2C_M_RD)) {
-			v4l2_warn(&dev->v4l2_dev, "refusing complex xfer with r0=%d, r1=%d\n",
-				  msgs[0].flags & I2C_M_RD,
-				  msgs[1].flags & I2C_M_RD);
-			retval = -EINVAL;
-			goto out;
-		}
-
-		/*
-		 * Write followed by atomic read is the only complex xfer that
-		 * we actually support here.
-		 */
+	} else {
+		/* do write-then-read */
 		retval = hdpvr_i2c_read(dev, 1, addr, msgs[0].buf, msgs[0].len,
 					msgs[1].buf, msgs[1].len);
-	} else {
-		v4l2_warn(&dev->v4l2_dev, "refusing %d-phase i2c xfer\n", num);
 	}
 
-out:
 	mutex_unlock(&dev->i2c_mutex);
 
 	return retval ? retval : num;
@@ -165,9 +145,9 @@ static const struct i2c_algorithm hdpvr_algo = {
 	.functionality = hdpvr_functionality,
 };
 
-/* prevent invalid 0-length usb_control_msg */
+/* prevent invalid 0-length usb_control_msg and support only write-then-read */
 static const struct i2c_adapter_quirks hdpvr_quirks = {
-	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+	.flags = I2C_AQ_NO_ZERO_LEN_READ | I2C_AQ_COMB_WRITE_THEN_READ,
 };
 
 static const struct i2c_adapter hdpvr_i2c_adapter_template = {
-- 
2.47.2



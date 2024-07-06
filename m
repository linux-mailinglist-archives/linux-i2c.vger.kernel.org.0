Return-Path: <linux-i2c+bounces-4671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F059292D2
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 360B01F21E9B
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3426131E41;
	Sat,  6 Jul 2024 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IAdTkFFw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3F57D3E2
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264901; cv=none; b=nYU9Rd4fqBIqUeOX6+vmfUUPJyoLf0SHAoQRh2lRbr1Ud3gQKom+ySm08ggG4g7aCKykBQ5H0Qvmm0H1JMyy1We5GQbYule2mTRU7KBqBHEO6ov6ahpEsGrkkJzkQfHVBGG29rDyVdJwq1RPrNMdZo/NXkfj58y1Oj2kk/3HB0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264901; c=relaxed/simple;
	bh=SsZkd7/wUKCNjap4XGTF3u+PewuEnckoqoHnf1CfVGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsIBwNOE5UXMGZJ0GDCVs79OLbTTT2kjPnTk5pD/Ym51p7xBj3BxIzz7AXprFyodT+Vr90TcPP1Esjf/4kz1Rhz6nL8AGqiIqPu63OgrjAfmFUlIrN4N4vg0SP7aEUKKnWwMDxZn7jcv+yNddXi11gkaeIDplIXcLjgSrjvsXkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IAdTkFFw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Z/gR8NXtX5QcB96VIv6XVRelpEFREJaI1Em8IfJabs0=; b=IAdTkF
	Fw2pTebfAREEvpWowgJyf6To7rPDxoGi281TDKYnp0fwsnzREfuzpRof0rbhD6n/
	CT7JKqclZsP4GxHvHN+V23scqHfER6Wsvo5appkt7rldve74re+gZz7AgOwamok+
	GAi9qvAjZ8397KviBPm9jzPtqGPI+0notEPEkiSaowom58+7v/vMIAWGwKNqdn4D
	Ma0H01ZrHPmf8/Wes4OzbPshS/IQNB5/vxrwo0SDLsk4CioAMtypHI9f6hmCi6Ic
	nc7n9o+vqyNoktip+DvO3PcRc9epCxh/kpe4kZhZ6F9qiqVc94KMKW0SV5BfVIn9
	GBWpsCrpO+e8O7Qw==
Received: (qmail 3809530 invoked from network); 6 Jul 2024 13:21:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:25 +0200
X-UD-Smtp-Session: l3s3148p1@xQRjYZIcxtJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/60] i2c: au1550: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:04 +0200
Message-ID: <20240706112116.24543-5-wsa+renesas@sang-engineering.com>
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
Remove a useless comment while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-au1550.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-au1550.c b/drivers/i2c/busses/i2c-au1550.c
index 8e43f25c117e..902e420e761e 100644
--- a/drivers/i2c/busses/i2c-au1550.c
+++ b/drivers/i2c/busses/i2c-au1550.c
@@ -81,11 +81,10 @@ static int wait_ack(struct i2c_au1550_data *adap)
 	return 0;
 }
 
-static int wait_master_done(struct i2c_au1550_data *adap)
+static int wait_controller_done(struct i2c_au1550_data *adap)
 {
 	int i;
 
-	/* Wait for Master Done. */
 	for (i = 0; i < 2 * adap->xfer_timeout; i++) {
 		if ((RD(adap, PSC_SMBEVNT) & PSC_SMBEVNT_MD) != 0)
 			return 0;
@@ -120,12 +119,12 @@ do_address(struct i2c_au1550_data *adap, unsigned int addr, int rd, int q)
 	if (q)
 		addr |= PSC_SMBTXRX_STP;
 
-	/* Put byte into fifo, start up master. */
+	/* Put byte into fifo, start up controller */
 	WR(adap, PSC_SMBTXRX, addr);
 	WR(adap, PSC_SMBPCR, PSC_SMBPCR_MS);
 	if (wait_ack(adap))
 		return -EIO;
-	return (q) ? wait_master_done(adap) : 0;
+	return (q) ? wait_controller_done(adap) : 0;
 }
 
 static int wait_for_rx_byte(struct i2c_au1550_data *adap, unsigned char *out)
@@ -175,7 +174,7 @@ static int i2c_read(struct i2c_au1550_data *adap, unsigned char *buf,
 
 	/* The last byte has to indicate transfer done. */
 	WR(adap, PSC_SMBTXRX, PSC_SMBTXRX_STP);
-	if (wait_master_done(adap))
+	if (wait_controller_done(adap))
 		return -EIO;
 
 	buf[i] = (unsigned char)(RD(adap, PSC_SMBTXRX) & 0xff);
@@ -204,7 +203,7 @@ static int i2c_write(struct i2c_au1550_data *adap, unsigned char *buf,
 	data = buf[i];
 	data |= PSC_SMBTXRX_STP;
 	WR(adap, PSC_SMBTXRX, data);
-	if (wait_master_done(adap))
+	if (wait_controller_done(adap))
 		return -EIO;
 	return 0;
 }
@@ -246,8 +245,8 @@ static u32 au1550_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm au1550_algo = {
-	.master_xfer	= au1550_xfer,
-	.functionality	= au1550_func,
+	.xfer = au1550_xfer,
+	.functionality = au1550_func,
 };
 
 static void i2c_au1550_setup(struct i2c_au1550_data *priv)
-- 
2.43.0



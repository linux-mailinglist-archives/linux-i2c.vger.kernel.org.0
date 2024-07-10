Return-Path: <linux-i2c+bounces-4814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B672D92CB47
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 533B8B21B03
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 06:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766E478C8D;
	Wed, 10 Jul 2024 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dQDNDdZ7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787577115
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720593747; cv=none; b=sx2tOHpoQKoNFGa4XjGi/BNpGhmQ8m5qyszJqvjxdAbHCqNHROJsKnUhMCTxNm8JOyNDBGur6RzfIk5KV+fu6v624kLgk4sPROBnmMKYDthj4BY03I4dv2KZPfOTAHNaOoos+t5oNp9loIrOC2PIglHJpIfPLACb8rqgUzM3Dps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720593747; c=relaxed/simple;
	bh=Kj5begewwvgpjSAJTWMhDgtQuivvptNKrI+AMPbO1SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bw0ETMZM0tVM/IW9M0PI1Ilg0rEr3kDOSf1zYfBp2MjOvyoj7rHQZHIcnTpAGT09CzHWFQ38IA+szqKcGXkzA1st1aPSZRF4iVkeJ7eUwo0BsfLBHOmzZEc44L1zyDhMkZ4kTC/sR9vzeeeSrh6sfWInRwLDIdKhOiUQfdIFZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dQDNDdZ7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=uUilxxdTgFT3yoGo3ECHRRYIkr8ZMska7k5sSrD+0VQ=; b=dQDNDd
	Z7gwIqqVVF9I8Uubiv3ZKkOz+Ki4bWZFkjJbEAP+7avGs/LXyLAE260HU0MI8TS+
	HdufHQRwJWScLNnoV9cHRxAd2a/FWWolThZxrMgOFbhPHQFAHxYkl/fBNxnXx1kZ
	8b078nGKssacJzepoJqeeaA+GWUGG11xk2rvPvpptnrkgphXEAuRe3/u+bCdhWM8
	4eWzMJ2a7iDfeGoSb0KEQEx5FMxqlKhxDPnEHC0VErqwcNkx0cw0YcBbWcc1UjDI
	AiyR1QyfSRaLZBSMaE+5mikpg3nEbTQ5CYTzlrlrALdDQCEwwweWaKLvqBDxqetl
	rb7Zp8jylLJjzWJg==
Received: (qmail 433033 invoked from network); 10 Jul 2024 08:42:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jul 2024 08:42:23 +0200
X-UD-Smtp-Session: l3s3148p1@Z9HX8t4cdsgujnsa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: cp2615: reword according to newest specification
Date: Wed, 10 Jul 2024 08:41:23 +0200
Message-ID: <20240710064219.6800-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-10-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-10-wsa+renesas@sang-engineering.com>
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

Change since v2:
* reworded comment about NAK for consistency as well (Thanks, Bence!)

 drivers/i2c/busses/i2c-cp2615.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
index cf3747d87034..e7720ea4045e 100644
--- a/drivers/i2c/busses/i2c-cp2615.c
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -60,11 +60,11 @@ enum cp2615_i2c_status {
 	CP2615_CFG_LOCKED = -6,
 	/* read_len or write_len out of range */
 	CP2615_INVALID_PARAM = -4,
-	/* I2C slave did not ACK in time */
+	/* I2C target did not ACK in time */
 	CP2615_TIMEOUT,
 	/* I2C bus busy */
 	CP2615_BUS_BUSY,
-	/* I2C bus error (ie. device NAK'd the request) */
+	/* I2C bus error (ie. target NAK'd the request) */
 	CP2615_BUS_ERROR,
 	CP2615_SUCCESS
 };
@@ -211,7 +211,7 @@ static int cp2615_check_iop(struct usb_interface *usbif)
 }
 
 static int
-cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+cp2615_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct usb_interface *usbif = adap->algo_data;
 	int i = 0, ret = 0;
@@ -250,8 +250,8 @@ cp2615_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm cp2615_i2c_algo = {
-	.master_xfer	= cp2615_i2c_master_xfer,
-	.functionality	= cp2615_i2c_func,
+	.xfer = cp2615_i2c_xfer,
+	.functionality = cp2615_i2c_func,
 };
 
 /*
-- 
2.43.0



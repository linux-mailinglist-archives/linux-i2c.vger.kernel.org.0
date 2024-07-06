Return-Path: <linux-i2c+bounces-4676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D049292DD
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E627928295F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF3013B288;
	Sat,  6 Jul 2024 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ipzTI/Pl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E20E13A268
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264905; cv=none; b=GqWHC2HcjaySdpFJmnt72zxwWSGOHF9+AOnTaW7YF/8dgJ0RGJgcAPtTH1ZwJnwdRld+pwTG1mR6G5TdzrdNFmq57WBpYlFpo8waYa4X/iDUvYU+Oo6PVlI+jTdh6Y/C7vgeewcCIOcHXBpe5qzD6A44L2d0JxWDU0eQdp+mcPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264905; c=relaxed/simple;
	bh=g8q1Tud1Xuimagm8NaVB4lsNz4s2Nu7CuhX2XQnallY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lwm36EfadkhGIUBOMGHRlHjLynTX69BvYcBs2TZmvRf8HA7WoEZSacKYANafm0zYFT0k8AdGNIEcHDMBe1bzFHcN03EctuBFPoq2FXiJV/GKdGQ/ZLjvePDjBZ8cb+M0I3bdHqsAdGWJKzF2VOP3P+LZoWKHV6moBea8C7oCaaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ipzTI/Pl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=JrEULlm4gyDDgxEjqP3uJVh7L9gHtGAIiuGV0SotmWc=; b=ipzTI/
	PlQidifvbvkmI8Zm2hKzAH30/Ght/t7Kymfa3JKqgw3bLiyWxlrgCOjsRVfOIMRU
	gSYOTK/OtQCoBYr1v6ck1tb7vKcuRxN9xSGOeoA7LBX7uw2HlNPnra0+T8CSC+ZI
	gTSnlQ3JjRN7pwNc9sq08jij3LmkXD38mkLJw8LD8FF3m5rl0FFI7roOVBEw1/n1
	GjSztyl9WbUjCnRzGtDX+O8NDHtfofMCbZDQYJjAhbX+9JnrmUyMWLITyGJ9jLsP
	0fVy+aN/8FPIyIjFFD7UJ73L+39CSXgOUL4+S117T8DT+k2bKw8B0qoh55qAU5Um
	TUzREtVhze4R0s/Q==
Received: (qmail 3809642 invoked from network); 6 Jul 2024 13:21:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:28 +0200
X-UD-Smtp-Session: l3s3148p1@+8WXYZIcbJBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/60] i2c: cp2615: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:09 +0200
Message-ID: <20240706112116.24543-10-wsa+renesas@sang-engineering.com>
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
---
 drivers/i2c/busses/i2c-cp2615.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
index cf3747d87034..315a37155401 100644
--- a/drivers/i2c/busses/i2c-cp2615.c
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -60,7 +60,7 @@ enum cp2615_i2c_status {
 	CP2615_CFG_LOCKED = -6,
 	/* read_len or write_len out of range */
 	CP2615_INVALID_PARAM = -4,
-	/* I2C slave did not ACK in time */
+	/* I2C target did not ACK in time */
 	CP2615_TIMEOUT,
 	/* I2C bus busy */
 	CP2615_BUS_BUSY,
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



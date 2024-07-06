Return-Path: <linux-i2c+bounces-4727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6392934C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C3DE1C21205
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF5517C9E9;
	Sat,  6 Jul 2024 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OHVEBbyH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4F17BB2B
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264946; cv=none; b=l3IOuh4mX4wkMSYjQyD1m385XIkVJ1+spaXOlcuqAcK9ctdNYPJVZWEqv0DLfDG/EsnE4EZ5yBpXqEZutlsPhcqkWbtasE4xzmm2T/jCdBsI/Vr3YrSxbBFY1sggSVnek55r6CrqYUahFUR8NyOYYciOasu0CR8LgQJj5oZz+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264946; c=relaxed/simple;
	bh=65HBA5AoKxDKUriyLfXIeeIR8lK7hXBV17mOOB5kzcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCwBzk804mHcW59YdYPuKnsO67VUy512XZlCitWoQH0h66BOfR/n4mWLzAFP++w4SP3Yaa8XdGH4SUpQ1yJFCEAjZsp18FpkpHE7m9OV84QQaWAiRNAB2H4uYIKEaYkk1K9FMmzSAqXefPSeFKWf2PCxeUj1Zz8qaGtE2ayl0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OHVEBbyH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=21CzCZ7VMAwEdtjnkGDCPoX24C9KiOgPmWGJZ44YprI=; b=OHVEBb
	yHj9zjmXvtsm3o+W+bgQZedbU3DiUl/2iAMkC7kCEAZWzD9W8VJVWr7oSj9XP5om
	pnVm0ajuKEX8oTuO/lCcahMbn7bq6xojIEryUs7IyTH/mBKYei+qOrOtlHSzwTK3
	YXdFCSGTW86YKVdzRha+aDKbar557QA70dvPWdO0MVxudlgAMEIqfrtVo45JBQik
	qb+quSYbjeUIoSenzN1OHr28xR0BBssa8sMZ0n7Qcvsa3gLw6HNgA2A8/OWZGodv
	vulJQyIjtIzTn5ggvl5KvW3qm3S2awkwLeMWc3gYHDBEWVjPgB3xrzsQS29Jbgpp
	iZuqQP3MeBfiCt7Q==
Received: (qmail 3811339 invoked from network); 6 Jul 2024 13:22:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:22:04 +0200
X-UD-Smtp-Session: l3s3148p1@Mxm9Y5Ic0OFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 60/60] i2c: st: reword according to newest specification
Date: Sat,  6 Jul 2024 13:21:00 +0200
Message-ID: <20240706112116.24543-61-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-st.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 5e01fe3dbb63..05b19ede65a0 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 STMicroelectronics
  *
- * I2C master mode controller driver, used in STMicroelectronics devices.
+ * I2C controller driver, used in STMicroelectronics devices.
  *
  * Author: Maxime Coquelin <maxime.coquelin@st.com>
  */
@@ -150,7 +150,7 @@ struct st_i2c_timings {
 
 /**
  * struct st_i2c_client - client specific data
- * @addr: 8-bit slave addr, including r/w bit
+ * @addr: 8-bit target addr, including r/w bit
  * @count: number of bytes to be transfered
  * @xfered: number of bytes already transferred
  * @buf: data buffer
@@ -667,7 +667,7 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
 		i2c |= SSC_I2C_ACKG;
 	st_i2c_set_bits(i2c_dev->base + SSC_I2C, i2c);
 
-	/* Write slave address */
+	/* Write target address */
 	st_i2c_write_tx_fifo(i2c_dev, c->addr);
 
 	/* Pre-fill Tx fifo with data in case of write */
@@ -766,7 +766,7 @@ static u32 st_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm st_i2c_algo = {
-	.master_xfer = st_i2c_xfer,
+	.xfer = st_i2c_xfer,
 	.functionality = st_i2c_func,
 };
 
-- 
2.43.0



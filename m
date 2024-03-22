Return-Path: <linux-i2c+bounces-2539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65260886D5A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968291C24BCF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B981E65BC8;
	Fri, 22 Mar 2024 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WXjSqLKr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56567481DB
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114047; cv=none; b=Kp4DuUoqBXX+TYtFQGVGFfNCCJdlMQJsMGF5XEvjY2GIfJahmZoHFYufMJzMi+FzzS9mbwRBT8UTJNLsoecakRTwfSUpFor7ZEbVtXuqmNMei63une2xwJuBnDYQIOrjNGg+0ebMJ0qPdfoiIbz7aP9+moExggg2b9Va7GPSgLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114047; c=relaxed/simple;
	bh=Vnl7xgaAkjx+04bzp8e0wepchmi5dvt8Fv1N7l11klg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQUHAFtYwJgmA3geFrA5Z2SKLxs2fe61fsjIqeBZeSyeTJFHIWAhpSg6+jZDY/BBxDwNn11ohtmh7V7ateFeo6oVFYq73+uGqaGk/zHHkQG/yYJ3w47g5ITN6UJtK5S5E0r5VBzdvb2WetDDwdiRFbRDbIaM+QU80sAJv++bKD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WXjSqLKr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=q9awUK66ih3cxClf+OK6PD+a5C0mloAeIXzXtRewe0s=; b=WXjSqL
	KrBBsD1jGigAfGAL+K4qkhUyPMVxqmUNq+ABWOAYICUcC/yz7dGMFFTbEHGwjuQC
	ul49r+QkL8I8OJZLIIJ/s/VWr8PtA7dYORzVfmKv/YdEq3cu4VS+gqVYGLFeOFgB
	R0KK1ufbVJhh5UNICcd1LCCtGKfNZHCyZK/axqPlXdKF+VC4xlNvfH/J86nuD3Ut
	eNJmFKbMTEeCPW4pw7+7MmLhYmiZr4mFnk4VoPMbMpixRnv/JNYvkuRV2gqb/G4r
	jBJEp+wvuHL9/CXABQu4L8T70zUjJPkdm2Ra4ewakHivIbPPfZLlsQu8Ae5FwApt
	3afwCr5rpMG2G0rg==
Received: (qmail 3871926 invoked from network); 22 Mar 2024 14:27:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:05 +0100
X-UD-Smtp-Session: l3s3148p1@HMKfxz8UPpRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 53/64] i2c: st: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:46 +0100
Message-ID: <20240322132619.6389-54-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-st.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index ce2333408904..9bd45ae83c0c 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 STMicroelectronics
  *
- * I2C master mode controller driver, used in STMicroelectronics devices.
+ * I2C host controller driver, used in STMicroelectronics devices.
  *
  * Author: Maxime Coquelin <maxime.coquelin@st.com>
  */
@@ -150,7 +150,7 @@ struct st_i2c_timings {
 
 /**
  * struct st_i2c_client - client specific data
- * @addr: 8-bit slave addr, including r/w bit
+ * @addr: 8-bit client addr, including r/w bit
  * @count: number of bytes to be transfered
  * @xfered: number of bytes already transferred
  * @buf: data buffer
@@ -647,7 +647,7 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
 {
 	struct st_i2c_client *c = &i2c_dev->client;
 	u32 ctl, i2c, it;
-	unsigned long timeout;
+	unsigned long time_left;
 	int ret;
 
 	c->addr		= i2c_8bit_addr_from_msg(msg);
@@ -667,7 +667,7 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
 		i2c |= SSC_I2C_ACKG;
 	st_i2c_set_bits(i2c_dev->base + SSC_I2C, i2c);
 
-	/* Write slave address */
+	/* Write client address */
 	st_i2c_write_tx_fifo(i2c_dev, c->addr);
 
 	/* Pre-fill Tx fifo with data in case of write */
@@ -685,15 +685,12 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
 		st_i2c_set_bits(i2c_dev->base + SSC_I2C, SSC_I2C_STRTG);
 	}
 
-	timeout = wait_for_completion_timeout(&i2c_dev->complete,
+	time_left = wait_for_completion_timeout(&i2c_dev->complete,
 			i2c_dev->adap.timeout);
 	ret = c->result;
 
-	if (!timeout) {
-		dev_err(i2c_dev->dev, "Write to slave 0x%x timed out\n",
-				c->addr);
+	if (!time_left)
 		ret = -ETIMEDOUT;
-	}
 
 	i2c = SSC_I2C_STOPG | SSC_I2C_REPSTRTG;
 	st_i2c_clr_bits(i2c_dev->base + SSC_I2C, i2c);
@@ -769,7 +766,7 @@ static u32 st_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm st_i2c_algo = {
-	.master_xfer = st_i2c_xfer,
+	.xfer = st_i2c_xfer,
 	.functionality = st_i2c_func,
 };
 
-- 
2.43.0



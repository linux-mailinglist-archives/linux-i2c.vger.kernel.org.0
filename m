Return-Path: <linux-i2c+bounces-2522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93837886D2E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C58501C24230
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2844A62163;
	Fri, 22 Mar 2024 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FgprhwLl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A161671
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114029; cv=none; b=ejed5+DUKaZrr3x/INB6JC272ZNeza7Ln1rkyHp2p2g5WKx8dP3A3xI0oxbdnUb0zISg45MEWPgG/dKK2FZrzqd+DV3vxJ4VEuH3GwR+WJkRCoyTlj8Mnwc+3ajpCsV9wrocjSRT0+ex+xKGudPWM2LTnWwKsLbhjsWfZUyGtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114029; c=relaxed/simple;
	bh=PaE14FgF8utjw+iOuMQaOI1ODl2G/f5apZi+i46cVdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGcrmdwF8tWtZAjjtz4VznrVz8mCPw5H/fJIJzOAsUMZrkcgDpihypwaeM45V+wMdCrZ744DoXTQFk874XF1i5RQzbHoXZxNWZK07CKsQ6L7h06vD3HspQVHZ4fqm4KJvl24wyNO12r5K3e9dlUTA4slgXve6jBflMa2qipJnw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FgprhwLl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1r2o49i7iw+BKKFei4mEIEQYijZQXuvYnywkJfqsTjQ=; b=Fgprhw
	Llnp5iR3M6IPiI56wO8nJCI7jZd/zEbWlbLTVXlQRy+gGmcLyYL+fNvI/TinEqsv
	M5ZWaf2y8ehQ8skw+bJFc0sPlXZOQW2JNNJBSRCBZTDKb/mxj0c/7TSdFEULFfa+
	fGcZP1emXrPg4GRIhwYZ9ku4mjpVfi+EacxIc6wpQaCEs5hLSnLILkmowsTCVsoz
	mk5htHbmdauGJp43DeRm3yfvyBzWbt8wzSo7IUR6WWSUGMYOzQ6UHB/yd0eT0cqf
	3qhIETDK7LVEAKSN7dCrRelO4AnpnerlxuYfqEQmAnOFu3NDsEOGdvDk/c0b/HDq
	WkEuPqtaykzHvvaw==
Received: (qmail 3871212 invoked from network); 22 Mar 2024 14:26:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:51 +0100
X-UD-Smtp-Session: l3s3148p1@OKTIxj8USLBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 36/64] i2c: mpc: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:29 +0100
Message-ID: <20240322132619.6389-37-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-mpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 8d73c0f405ed..135889fdb43e 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -115,7 +115,7 @@ static inline void writeccr(struct mpc_i2c *i2c, u32 x)
 	writeb(x, i2c->base + MPC_I2C_CR);
 }
 
-/* Sometimes 9th clock pulse isn't generated, and slave doesn't release
+/* Sometimes 9th clock pulse isn't generated, and client doesn't release
  * the bus, because it wants to send ACK.
  * Following sequence of enabling/disabling and sending start/stop generates
  * the 9 pulses, each with a START then ending with STOP, so it's all OK.
@@ -762,7 +762,7 @@ static int fsl_i2c_bus_recovery(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm mpc_algo = {
-	.master_xfer = mpc_xfer,
+	.xfer = mpc_xfer,
 	.functionality = mpc_functionality,
 };
 
-- 
2.43.0



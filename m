Return-Path: <linux-i2c+bounces-2546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C174D886D69
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 426D7B2749F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2B667C73;
	Fri, 22 Mar 2024 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eoToXGTC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8238267735
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114054; cv=none; b=n6AyJgt4BIjDXxUHpuM3UCzZtcLg91KW3XS2B105oubnEvSWTT32RamuSePjJs7oIKuisnyjtH4scQzoY+bJLp9SPdfibF/xwT2eTF8XTSUHHs4iEIIsK3gj/O8aKPGIIrd3QFWX0sgKIt+bnmoKSnzht8ZaXXzGRth6mXOv94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114054; c=relaxed/simple;
	bh=71qy+/Hhrai+g8rz7D7PGltz104vOwWAlJxoPRdeEPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRNPuH8ppvJzIKmAYSv9OVkhxVjoQCU2m/HqWIpqzmmpkKeGwrzyQUQJPlwsnVjgSmrL8Y4mNrfencM6RScRTyN3KnpEAcu0dslj1wXzFic5TaVIC5Tgr6ZttS8/ilyzYJ9S2LSjbk+c+u5naLpq9D+bnDENZkptV3ks6HCj/AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eoToXGTC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pNDXCQJWEJcm+0I8ITtre6MA5ngwubwyMT7G66YGQs8=; b=eoToXG
	TCFgYji2g71PGFtc8kW6niXi3BT91uP+mrg4nlIDALWADXsH0tweq8adp+cRKyOd
	NEo5E3JvPGaRbQ171hjJKDzrlMDycM3M0C2SfN5x9aTTbxbY23FTDTDR+xTbiBZf
	3of3Pewm309EgmqBkToOUE4AE6HI30lhQwVyvQnUWG3mA9fJnESFF9enRLkpiykY
	CanLLS2cTxc7DUBuP7ZNvRPr1EQ2vNvn4jRVwyZO44AgWsvvgBtqfypEcaaKrrVU
	0MMESwya4AEq0ndk+5TGtEh9dq8jcJ7sGXChvb6pdWc2JTAr8y1IRNQV5VI6eIQO
	94MxS3uV5joGXmBw==
Received: (qmail 3872213 invoked from network); 22 Mar 2024 14:27:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:10 +0100
X-UD-Smtp-Session: l3s3148p1@rsz3xz8UhoVehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 60/64] i2c: uniphier: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:53 +0100
Message-ID: <20240322132619.6389-61-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-uniphier.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index 854ac25b5862..24fa15c92845 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -17,13 +17,13 @@
 #define     UNIPHIER_I2C_DTRM_NACK	BIT(8)	/* do not return ACK */
 #define     UNIPHIER_I2C_DTRM_RD	BIT(0)	/* read transaction */
 #define UNIPHIER_I2C_DREC	0x04	/* RX register */
-#define     UNIPHIER_I2C_DREC_MST	BIT(14)	/* 1 = master, 0 = slave */
+#define     UNIPHIER_I2C_DREC_MST	BIT(14)	/* 1 = host, 0 = target */
 #define     UNIPHIER_I2C_DREC_TX	BIT(13)	/* 1 = transmit, 0 = receive */
 #define     UNIPHIER_I2C_DREC_STS	BIT(12)	/* stop condition detected */
 #define     UNIPHIER_I2C_DREC_LRB	BIT(11)	/* no ACK */
 #define     UNIPHIER_I2C_DREC_LAB	BIT(9)	/* arbitration lost */
 #define     UNIPHIER_I2C_DREC_BBN	BIT(8)	/* bus not busy */
-#define UNIPHIER_I2C_MYAD	0x08	/* slave address */
+#define UNIPHIER_I2C_MYAD	0x08	/* target address */
 #define UNIPHIER_I2C_CLK	0x0c	/* clock frequency control */
 #define UNIPHIER_I2C_BRST	0x10	/* bus reset */
 #define     UNIPHIER_I2C_BRST_FOEN	BIT(1)	/* normal operation */
@@ -154,7 +154,7 @@ static int uniphier_i2c_stop(struct i2c_adapter *adap)
 				      UNIPHIER_I2C_DTRM_NACK);
 }
 
-static int uniphier_i2c_master_xfer_one(struct i2c_adapter *adap,
+static int uniphier_i2c_xfer_one(struct i2c_adapter *adap,
 					struct i2c_msg *msg, bool stop)
 {
 	bool is_read = msg->flags & I2C_M_RD;
@@ -213,7 +213,7 @@ static int uniphier_i2c_check_bus_busy(struct i2c_adapter *adap)
 	return 0;
 }
 
-static int uniphier_i2c_master_xfer(struct i2c_adapter *adap,
+static int uniphier_i2c_xfer(struct i2c_adapter *adap,
 				    struct i2c_msg *msgs, int num)
 {
 	struct i2c_msg *msg, *emsg = msgs + num;
@@ -227,7 +227,7 @@ static int uniphier_i2c_master_xfer(struct i2c_adapter *adap,
 		/* Emit STOP if it is the last message or I2C_M_STOP is set. */
 		bool stop = (msg + 1 == emsg) || (msg->flags & I2C_M_STOP);
 
-		ret = uniphier_i2c_master_xfer_one(adap, msg, stop);
+		ret = uniphier_i2c_xfer_one(adap, msg, stop);
 		if (ret)
 			return ret;
 	}
@@ -241,7 +241,7 @@ static u32 uniphier_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm uniphier_i2c_algo = {
-	.master_xfer = uniphier_i2c_master_xfer,
+	.xfer = uniphier_i2c_xfer,
 	.functionality = uniphier_i2c_functionality,
 };
 
-- 
2.43.0



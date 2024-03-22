Return-Path: <linux-i2c+bounces-2534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E4B886D4F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFF8728AC83
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B246350E;
	Fri, 22 Mar 2024 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="apZjvTY7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9ED47F64
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114043; cv=none; b=lmWKGfMYru/yNcPBS8S8GogX6xJTeS08dqjVEBavjr723ypiBD7FL6ecWTshZgsU3nVeW7w1iyIXQ1dZ3M8FqaWXHbpUsIr70A4s8PEnI2bW0KTgzsKxxkjwQQUX3IUdTJVm0AljAojvtsPw5EBZEiWH3oDH1qp2OY2ySs2e1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114043; c=relaxed/simple;
	bh=IyxDQg3Eeu2VTbNzfWVfCI3dAf1Hdea1OkK2fa+bIDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSyaN3azHktcntetkZlSDO+5NA7NHe23FKWB3bWFIHJpD54TOy9aPbwbXZZOgPQnxf16HIMlLXdRVdTqT2UC4LM1i98L6YHqIEezrcRoRhRxDTRYwfFodTvsd04Yy3jiQiAQkhkLoyrsxBM4dGbpeGxCjBhH1mEP0vGX9z5Z4nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=apZjvTY7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=k7I/P2iBDaF4EwyJ0IZtGeh8AwgbSdfw3r/JA/5EzLM=; b=apZjvT
	Y7pq6/gOGSSsqKRLFQTCMDskrdvPc+xYxN9q6UvrhEAos7v1dVWG96qbcqyXkBkg
	9XKnvgMW2HUHLMUd8boOWv01jpptuBNemhPxYs0H4Odwtx6EG4rvBD7MH2xuuoZU
	ZOHL7w5dim79P3/vZKJHqdwxGkXUulLSwpw6S3vNmKL8vJreTrBZIOPOQeAvBcbP
	WEx8mm27Ew/PFPjyvNSBJgnNDkO1Ubg4J3908GCkfYb22SeciQlwZKrb4AAZ72bE
	j5ZjX9yqbzsu7+qCdGBPe7iviVpT5uWz84eMlS2YEO2+l3lKfXcaol5osg8/hlI3
	Bglwy3sg7DTlQ6TQ==
Received: (qmail 3871771 invoked from network); 22 Mar 2024 14:27:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:01 +0100
X-UD-Smtp-Session: l3s3148p1@SMBhxz8UDJRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 48/64] i2c: sh7760: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:41 +0100
Message-ID: <20240322132619.6389-49-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-sh7760.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh7760.c b/drivers/i2c/busses/i2c-sh7760.c
index 8a043f5fca1e..49e83ca89101 100644
--- a/drivers/i2c/busses/i2c-sh7760.c
+++ b/drivers/i2c/busses/i2c-sh7760.c
@@ -55,7 +55,7 @@
 #define MSR_MDE		0x08
 #define MSR_MDT		0x04
 #define MSR_MDR		0x02
-#define MSR_MAT		0x01		/* slave addr xfer done	*/
+#define MSR_MAT		0x01		/* addr xfer done	*/
 
 #define MIE_MNRE	0x40		/* nack irq en		*/
 #define MIE_MALE	0x20		/* arblos irq en	*/
@@ -154,7 +154,7 @@ static irqreturn_t sh7760_i2c_irq(int irq, void *ptr)
 		goto out;
 	}
 
-	/* i2c slave addr was sent; set to "normal" operation */
+	/* i2c client addr was sent; set to "normal" operation */
 	if (msr & MSR_MAT)
 		OUT32(id, I2CMCR, MCR_MIE);
 
@@ -236,14 +236,14 @@ static irqreturn_t sh7760_i2c_irq(int irq, void *ptr)
 }
 
 
-/* prepare and start a master receive operation */
+/* prepare and start a host receive operation */
 static void sh7760_i2c_mrecv(struct cami2c *id)
 {
 	int len;
 
 	id->flags |= IDF_RECV;
 
-	/* set the slave addr reg; otherwise rcv wont work! */
+	/* set the target addr reg; otherwise rcv won't work! */
 	OUT32(id, I2CSAR, 0xfe);
 	OUT32(id, I2CMAR, (id->msg->addr << 1) | 1);
 
@@ -262,14 +262,14 @@ static void sh7760_i2c_mrecv(struct cami2c *id)
 	OUT32(id, I2CFIER, FIER_RXIE);
 }
 
-/* prepare and start a master send operation */
+/* prepare and start a host send operation */
 static void sh7760_i2c_msend(struct cami2c *id)
 {
 	int len;
 
 	id->flags |= IDF_SEND;
 
-	/* set the slave addr reg; otherwise xmit wont work! */
+	/* set the target addr reg; otherwise xmit won't work! */
 	OUT32(id, I2CSAR, 0xfe);
 	OUT32(id, I2CMAR, (id->msg->addr << 1) | 0);
 
@@ -300,7 +300,7 @@ static inline int sh7760_i2c_busy_check(struct cami2c *id)
 	return (IN32(id, I2CMCR) & MCR_FSDA);
 }
 
-static int sh7760_i2c_master_xfer(struct i2c_adapter *adap,
+static int sh7760_i2c_xfer(struct i2c_adapter *adap,
 				  struct i2c_msg *msgs,
 				  int num)
 {
@@ -362,7 +362,7 @@ static int sh7760_i2c_master_xfer(struct i2c_adapter *adap,
 	OUT32(id, I2CMIER, 0);
 	OUT32(id, I2CFIER, 0);
 
-	/* reset slave module registers too: master mode enables slave
+	/* reset target module registers too: host mode enables target
 	 * module for receive ops (ack, data). Without this reset,
 	 * eternal bus activity might be reported after NACK / ARBLOST.
 	 */
@@ -379,7 +379,7 @@ static u32 sh7760_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm sh7760_i2c_algo = {
-	.master_xfer	= sh7760_i2c_master_xfer,
+	.xfer	= sh7760_i2c_xfer,
 	.functionality	= sh7760_i2c_func,
 };
 
-- 
2.43.0



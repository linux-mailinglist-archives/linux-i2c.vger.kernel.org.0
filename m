Return-Path: <linux-i2c+bounces-4721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D15892933E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D40DAB22BBE
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB79E179647;
	Sat,  6 Jul 2024 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AJqSrama"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B9176FD8
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264941; cv=none; b=ILAKJtExNpPqGXBUMlM18Rr0pvs3IWhRIRkwtCZiInxaMO5VGmTAD73OwR2bpJcMS20VDdNEAGxSQLITR3loNeQp+KGubKvkN5WXdtcBy5DhB6aCRMIEPphE8PNPIGvhj8vN+mfLR4VnVti0T9cD2hm275kIjyuPOZaEDOTYrx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264941; c=relaxed/simple;
	bh=2WiRw4A0uUfalWQnZpq8MFlR6BSfUDjxmFD2sxusIwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsmYhIoxIvLAvgb/LCjb/kYj17EKrr84+wbFgSF+xEjM+39ccRaRsE6zz7ky9xpkpHP2Tgv9SLRafF7MKAJF0ajZHZE7DDPPJOnuBGkVvW84FCwkVeSgjNkcWE9kXc5B+G8qwQF2vfMs9JxQMSWrzDDy+Iex8jdnJB9Lk2eUWro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AJqSrama; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4qXUrk5KAHzrtwDMU1DkIhzAt95pjR+KOVOKj2arxqI=; b=AJqSra
	maXntsJieNarI7/rB1lShi3982jeKDaQEDgO6AW5DXWkT6OMvk8FZJfEDOhNlu24
	s3d/m9LwRYwhNqn/THis+/E2OuT5SDbYOuwHeb3U4KTG0jWTShsLvHHanNwCn/VW
	K4pG67/NkZTrT0b/DcBSdprtU7bAfCAlhjJgUqEYvzD8Rr3GZbCVamlB9j/qf/5P
	oogERZHjCSo9s4MzcXrhlAQnnCG8LTtbjN0Rhg6remVSxxaNvZtdLFPjpbtTqYKm
	Cf1upAzqu9U59OPz/vAEmuGKp/jZR+LIDl2tDDADerWAIBgnDIb6z2kBOYgD3/3N
	CwxxTX1iTBQJDHCA==
Received: (qmail 3811121 invoked from network); 6 Jul 2024 13:22:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:22:00 +0200
X-UD-Smtp-Session: l3s3148p1@bTV7Y5IcluFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 54/60] i2c: uniphier: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:54 +0200
Message-ID: <20240706112116.24543-55-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-uniphier.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index e1b4c80e0285..ef5753307469 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -17,13 +17,13 @@
 #define     UNIPHIER_I2C_DTRM_NACK	BIT(8)	/* do not return ACK */
 #define     UNIPHIER_I2C_DTRM_RD	BIT(0)	/* read transaction */
 #define UNIPHIER_I2C_DREC	0x04	/* RX register */
-#define     UNIPHIER_I2C_DREC_MST	BIT(14)	/* 1 = master, 0 = slave */
+#define     UNIPHIER_I2C_DREC_MST	BIT(14)	/* 1 = controller, 0 = target */
 #define     UNIPHIER_I2C_DREC_TX	BIT(13)	/* 1 = transmit, 0 = receive */
 #define     UNIPHIER_I2C_DREC_STS	BIT(12)	/* stop condition detected */
 #define     UNIPHIER_I2C_DREC_LRB	BIT(11)	/* no ACK */
 #define     UNIPHIER_I2C_DREC_LAB	BIT(9)	/* arbitration lost */
 #define     UNIPHIER_I2C_DREC_BBN	BIT(8)	/* bus not busy */
-#define UNIPHIER_I2C_MYAD	0x08	/* slave address */
+#define UNIPHIER_I2C_MYAD	0x08	/* local target address */
 #define UNIPHIER_I2C_CLK	0x0c	/* clock frequency control */
 #define UNIPHIER_I2C_BRST	0x10	/* bus reset */
 #define     UNIPHIER_I2C_BRST_FOEN	BIT(1)	/* normal operation */
@@ -152,8 +152,8 @@ static int uniphier_i2c_stop(struct i2c_adapter *adap)
 				      UNIPHIER_I2C_DTRM_NACK);
 }
 
-static int uniphier_i2c_master_xfer_one(struct i2c_adapter *adap,
-					struct i2c_msg *msg, bool stop)
+static int uniphier_i2c_xfer_one(struct i2c_adapter *adap,
+				 struct i2c_msg *msg, bool stop)
 {
 	bool is_read = msg->flags & I2C_M_RD;
 	bool recovery = false;
@@ -211,8 +211,7 @@ static int uniphier_i2c_check_bus_busy(struct i2c_adapter *adap)
 	return 0;
 }
 
-static int uniphier_i2c_master_xfer(struct i2c_adapter *adap,
-				    struct i2c_msg *msgs, int num)
+static int uniphier_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct i2c_msg *msg, *emsg = msgs + num;
 	int ret;
@@ -225,7 +224,7 @@ static int uniphier_i2c_master_xfer(struct i2c_adapter *adap,
 		/* Emit STOP if it is the last message or I2C_M_STOP is set. */
 		bool stop = (msg + 1 == emsg) || (msg->flags & I2C_M_STOP);
 
-		ret = uniphier_i2c_master_xfer_one(adap, msg, stop);
+		ret = uniphier_i2c_xfer_one(adap, msg, stop);
 		if (ret)
 			return ret;
 	}
@@ -239,7 +238,7 @@ static u32 uniphier_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm uniphier_i2c_algo = {
-	.master_xfer = uniphier_i2c_master_xfer,
+	.xfer = uniphier_i2c_xfer,
 	.functionality = uniphier_i2c_functionality,
 };
 
-- 
2.43.0



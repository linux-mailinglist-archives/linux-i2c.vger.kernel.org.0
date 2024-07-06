Return-Path: <linux-i2c+bounces-4712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2192932C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD5BB1C21602
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02E716C6A3;
	Sat,  6 Jul 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xj/BlVad"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A36C16133E
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264934; cv=none; b=FeQkqs7KUpI3mZqOLdxQZgnjErCbwfR40yZUgR1v7w5pp/5jrBfeAjSKMZvYA6XB3P68n1Uhz8/RJC0MInrAfhqaNdKWa4vuJObnr4vRJ2/4foi0O5jQjb65ORCS9mLqUC1Tr4iN0Haa6Q/sYG9V3QavqV7lgBi3gAk6sYUpqOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264934; c=relaxed/simple;
	bh=NqPUGmY4yPckXxebl+IF1xCeops/RXKYXBxYsfQOsj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dcTlVpUv+MPqWvRZWW62+qAW/GOUXjlCewxRuPzAsfq4NcGfH2Ikp1W2xuSMOm88cZGnj6tkCqXimryFBjMLDa2uBkc2FW3OT+2EXRjL7BTCbwDmfkBhXqM/Ckem+33EucK/aX4zwGDSYkIWzAOOZS3tRLGxb/k5KFGO96TcMRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xj/BlVad; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SgAWAHCm2OkArTMAHN6HKOX3gXJ4UsWc8pEfBk8i5mY=; b=Xj/BlV
	adxaqmUG5/jeVIRP4JtcifKgj705u3ftXAcDiZwh9nX0kGzmhEZcyAlbi2tUlii7
	DT7S/hTiSrc7cMaxqDIxUosN/KEH/hwYsZnnydtlhSud1GEH5u520D5IohU8B4WT
	C/0O+j0/skUvttwNbkyJcXe4kaiUluQdMeJEqf1WdN+mpJX+j4lvDaB0MdwOJqEz
	FyqllzLrqTqe8bq6z33tUz4TXfR7T3cxiBDhxH/7hKDwbvyYBhLnXnxtRsbIAAPT
	1Qd+E1Vz5IPRy6sweIDBT9s8gC9NTyXTcaTrcwUZe/TAspmnoE37U1c/ZybAYJbP
	JkMthf+GDmqR1ttw==
Received: (qmail 3810868 invoked from network); 6 Jul 2024 13:21:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:54 +0200
X-UD-Smtp-Session: l3s3148p1@kBAoY5IcbsJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 46/60] i2c: sprd: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:46 +0200
Message-ID: <20240706112116.24543-47-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-sprd.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 28c88901d9bc..9c45e75b9187 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -283,8 +283,8 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 	return i2c_dev->err;
 }
 
-static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
-				struct i2c_msg *msgs, int num)
+static int sprd_i2c_xfer(struct i2c_adapter *i2c_adap,
+			 struct i2c_msg *msgs, int num)
 {
 	struct sprd_i2c *i2c_dev = i2c_adap->algo_data;
 	int im, ret;
@@ -314,7 +314,7 @@ static u32 sprd_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm sprd_i2c_algo = {
-	.master_xfer = sprd_i2c_master_xfer,
+	.xfer = sprd_i2c_xfer,
 	.functionality = sprd_i2c_func,
 };
 
@@ -378,12 +378,12 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 		i2c_tran = i2c_dev->count;
 
 	/*
-	 * If we got one ACK from slave when writing data, and we did not
+	 * If we got one ACK from target when writing data, and we did not
 	 * finish this transmission (i2c_tran is not zero), then we should
 	 * continue to write data.
 	 *
 	 * For reading data, ack is always true, if i2c_tran is not 0 which
-	 * means we still need to contine to read data from slave.
+	 * means we still need to contine to read data from target.
 	 */
 	if (i2c_tran && ack) {
 		sprd_i2c_data_transfer(i2c_dev);
@@ -393,7 +393,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 	i2c_dev->err = 0;
 
 	/*
-	 * If we did not get one ACK from slave when writing data, we should
+	 * If we did not get one ACK from target when writing data, we should
 	 * return -EIO to notify users.
 	 */
 	if (!ack)
@@ -422,7 +422,7 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
 		i2c_tran = i2c_dev->count;
 
 	/*
-	 * If we did not get one ACK from slave when writing data, then we
+	 * If we did not get one ACK from target when writing data, then we
 	 * should finish this transmission since we got some errors.
 	 *
 	 * When writing data, if i2c_tran == 0 which means we have writen
@@ -653,5 +653,5 @@ static struct platform_driver sprd_i2c_driver = {
 
 module_platform_driver(sprd_i2c_driver);
 
-MODULE_DESCRIPTION("Spreadtrum I2C master controller driver");
+MODULE_DESCRIPTION("Spreadtrum I2C controller driver");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0



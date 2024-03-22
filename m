Return-Path: <linux-i2c+bounces-2538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB81886D56
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D6A7B26B7C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920E9657AD;
	Fri, 22 Mar 2024 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FZdxy/ub"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134EB64A87
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114046; cv=none; b=djK97JCTWBTkvg1AqY/BnLZ9SA/luPElFl+UFx95K+zMMbpqXe/jwzvhFZbvUcAx0/vLO8/aeBR/j2l7h3iRI3nT1Rl66okxV2lbh6kxR+kOubu4LpIQjt5NgTJWeoT/ZTfbEuT62tJ7z4UcQRNDjIL1M3zc58MaGM/2K0u1f84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114046; c=relaxed/simple;
	bh=KsrGCMJkM/BN/H4+pbAJYnvwKmCMdAIEIfiSmEJTKbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYW5LALIgF6NH5sRnBL+FcJJSneX7uGYyeXigsZlZtyx4z/84pMKF91ht3LytDDW7VmWPra57OcUeZf+cExmJ7uM4Aj2x20stkmE4bpDjuIH7P+F8Ua8nMMP02l5S8hZmPAJxjk5je+/bHi36CTWG5KZyhS92Yy3eNQzts3fOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FZdxy/ub; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=lqe4UEUa872JnIqAlpZ6cZkudSkhxFiVgkhEQslGLLU=; b=FZdxy/
	ubvyPfwY1+sfcFyAWR5w89KmNRJ9dFMb/qACNko50UMeOQzignrqEOej+8BH1Yj1
	J9kXJpGF4uEmPcBFblwRrfWiepiSmPXZg+iAW/08lbNEbbu5BWxUHs5fDbpf2tCz
	l48b54Nyuo4kJ52Df/hiM9XkoeUJTxFQpzgq50CS7FBsy4qRVgrXVZvxQaeNylmy
	GBYfoRJmPpEpVnb5EPq7pFMRixWN7z4x6gUm5Cwk+uylaQsWJCrgSQXxtfqvBPSo
	+Kr0nvaZ1FTyi1nfQu5ft4hBWR67BxLBBfJo2bOkDFKiCuJpKu76zlWjWoSFr8cz
	Ao8y1tGm5j3agh0g==
Received: (qmail 3871891 invoked from network); 22 Mar 2024 14:27:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:04 +0100
X-UD-Smtp-Session: l3s3148p1@REiSxz8UNpRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 52/64] i2c: sprd: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:45 +0100
Message-ID: <20240322132619.6389-53-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-sprd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 28c88901d9bc..f1a8375ccc17 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -283,7 +283,7 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 	return i2c_dev->err;
 }
 
-static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
+static int sprd_i2c_xfer(struct i2c_adapter *i2c_adap,
 				struct i2c_msg *msgs, int num)
 {
 	struct sprd_i2c *i2c_dev = i2c_adap->algo_data;
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
+	 * If we got one ACK from client when writing data, and we did not
 	 * finish this transmission (i2c_tran is not zero), then we should
 	 * continue to write data.
 	 *
 	 * For reading data, ack is always true, if i2c_tran is not 0 which
-	 * means we still need to contine to read data from slave.
+	 * means we still need to contine to read data from client.
 	 */
 	if (i2c_tran && ack) {
 		sprd_i2c_data_transfer(i2c_dev);
@@ -393,7 +393,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
 	i2c_dev->err = 0;
 
 	/*
-	 * If we did not get one ACK from slave when writing data, we should
+	 * If we did not get one ACK from client when writing data, we should
 	 * return -EIO to notify users.
 	 */
 	if (!ack)
@@ -422,7 +422,7 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
 		i2c_tran = i2c_dev->count;
 
 	/*
-	 * If we did not get one ACK from slave when writing data, then we
+	 * If we did not get one ACK from client when writing data, then we
 	 * should finish this transmission since we got some errors.
 	 *
 	 * When writing data, if i2c_tran == 0 which means we have writen
@@ -653,5 +653,5 @@ static struct platform_driver sprd_i2c_driver = {
 
 module_platform_driver(sprd_i2c_driver);
 
-MODULE_DESCRIPTION("Spreadtrum I2C master controller driver");
+MODULE_DESCRIPTION("Spreadtrum I2C host controller driver");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0



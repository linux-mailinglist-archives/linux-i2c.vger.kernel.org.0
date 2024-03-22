Return-Path: <linux-i2c+bounces-2512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06F886D16
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAF072887A2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF4360B87;
	Fri, 22 Mar 2024 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dsjJPEhA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B43605C9
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114020; cv=none; b=cLBuCxMenGxiMrP5SM/kNANXXVu0ro6LD75HPZqxTxJvFDMF1ksxh2CYQdQPi2IAUBnY+j8sYmn2zEXRgoE06ndU0Ny64lTRdjy/jRY8M3k3Hcpjx/54pmGu2YPyRL+4vHNSNlhRzumf5a53+/7/9ediQY1QFAelFKF7xm6ktwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114020; c=relaxed/simple;
	bh=IT1cLzX/MW7DWta6VFhg4vcgUE19Sls0w1v03CPRnGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxyYQdSWDWsRMsHWS3cym4ijQijak7VdfDQi+hbbKwZKhVB2o9v5mxPuAQmzWQkqAJea6QCTNiIRsP6jT0OHium2iR9GieK7mVrt9LRZCmVK+eCd32JwKRwG/2fQv8tsaY5DWAwrP/K5ZZbxyq++gMGeBLSzJ27wMKtKvUPXyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dsjJPEhA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=vWbyFOf4V5PXU0iX7KbH4cd/yxRPi16DHsMc4aLJqy8=; b=dsjJPE
	hALiYPDPqtAFQ9EyzYechmRJCyKo2h6c35ksfOQrlgN1rmUEg4Y7fLngd2J9G9p+
	Oz0qQTHVz4dyoVxysc3oIAd6aqrD8dQRVBORRlMCPZGEdR4jQ2LW/DqZfTAfoosv
	+biP1HBKQbD508GCkIiyb+YRG9E/PbE7lFGuIFBsw79gPg0F2oH+mWImZLKKIpzs
	9MltKvpsXhxOhqVMhDQwY4xWK9SoMDk6X9kz/J5121N3QLsWaVz5j4ZSUuswAA9g
	V3CWKqHMUpyk6P94HcL5l5ldZJhTATEzYi8BfVlUOJHG53Mw+tVekPrFcBCnzfwW
	gbk3bi9HmsyGDb7A==
Received: (qmail 3870775 invoked from network); 22 Mar 2024 14:26:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:42 +0100
X-UD-Smtp-Session: l3s3148p1@rQJJxj8UupRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 26/64] i2c: imx-lpi2c: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:19 +0100
Message-ID: <20240322132619.6389-27-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-imx-lpi2c.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 6d72e4e126dd..337a55804463 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -262,7 +262,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 	return 0;
 }
 
-static int lpi2c_imx_master_enable(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_host_enable(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned int temp;
 	int ret;
@@ -292,7 +292,7 @@ static int lpi2c_imx_master_enable(struct lpi2c_imx_struct *lpi2c_imx)
 	return ret;
 }
 
-static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_host_disable(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	u32 temp;
 
@@ -459,7 +459,7 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 	unsigned int temp;
 	int i, result;
 
-	result = lpi2c_imx_master_enable(lpi2c_imx);
+	result = lpi2c_imx_host_enable(lpi2c_imx);
 	if (result)
 		return result;
 
@@ -502,7 +502,7 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		result = -EIO;
 
 disable:
-	lpi2c_imx_master_disable(lpi2c_imx);
+	lpi2c_imx_host_disable(lpi2c_imx);
 
 	dev_dbg(&lpi2c_imx->adapter.dev, "<%s> exit with: %s: %d\n", __func__,
 		(result < 0) ? "error" : "success msg",
@@ -554,7 +554,7 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm lpi2c_imx_algo = {
-	.master_xfer	= lpi2c_imx_xfer,
+	.xfer	= lpi2c_imx_xfer,
 	.functionality	= lpi2c_imx_func,
 };
 
-- 
2.43.0



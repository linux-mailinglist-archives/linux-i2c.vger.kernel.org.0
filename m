Return-Path: <linux-i2c+bounces-2521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D8886D2C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B94651F27FDB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1D06214B;
	Fri, 22 Mar 2024 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ivy4xdl7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8E612FB
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114029; cv=none; b=F5NgecHdeCj/mS8FbOPuvS8IW9luqpFDdcCNpQOvrm3y43IZU7EJN4L8OpkIxSsvDLHVfnD9n/7Cpkgu6d2LhmTsFi89oppAUuSyhJeFBY9kzVeOO1QtiBBLbytIt7iQ2hoOdV84GZYixe5v8o77SDOzUzQdiWXSsPoFpKv7fjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114029; c=relaxed/simple;
	bh=Utw2r13APhGJGHRgleJw24zaHa7nQwrB1ATDLUDnkXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHtkk725WC4O25e6RsK2r4coPPwAEG9b0+bQZFFMS0DXjdGu1UEZI8dpLEMbI1zva7bWlZNFOw2ve3vGs7Hp8i2X3EM4sl/uSW/ZYZsUFm27d2e2TxO9ioBS2SCNztluJEeqil/F9GEF71SshSlDGMKCbmGXVu152iQdqDKM2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ivy4xdl7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=p70V7uufpI7lQfL99SKyvMzqYL4U7/6gT69ebNmbx34=; b=Ivy4xd
	l7vl8AflXMIp2nU8MBQ+KFx+gieGuMV6jrQHPOOyVef/7Fj7mdxdKJ/7La3Zckks
	6Dz6NdUfQRN/QsYzFffOK813xU3QV184aVxnfYY68S+OCSg2aqZOfzNZyawj8Q78
	tt1OUUmqtCYpcITNcas2T3xk0102w4wn2PXzjbH8ZerSNgyQDuL1AQWizmNTANEj
	cefoiCz0C7iy0J9IUpwITEgD5cJyqRMafW5R9tna/lNUWO3LhJsVEUGocYZnzlkx
	434vgwuPDsL5Ax4l4I/A0Qiy6PfpWOZOcyL7l48tm85DGIx86+770MP5dXxyrqzg
	XTCqAVqnl6xJs9vw==
Received: (qmail 3871173 invoked from network); 22 Mar 2024 14:26:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:50 +0100
X-UD-Smtp-Session: l3s3148p1@D5S7xj8UPLBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Michael Shych <michaelsh@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 35/64] i2c: mlxcpld: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:28 +0100
Message-ID: <20240322132619.6389-36-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-mlxcpld.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 099291a0411d..786d4c51f65a 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -197,8 +197,8 @@ static int mlxcpld_i2c_check_status(struct mlxcpld_i2c_priv *priv, int *status)
 	if (val & MLXCPLD_LPCI2C_TRANS_END) {
 		if (val & MLXCPLD_LPCI2C_STATUS_NACK)
 			/*
-			 * The slave is unable to accept the data. No such
-			 * slave, command not understood, or unable to accept
+			 * The client is unable to accept the data. No such
+			 * client, command not understood, or unable to accept
 			 * any more data.
 			 */
 			*status = MLXCPLD_LPCI2C_NACK_IND;
@@ -280,7 +280,7 @@ static int mlxcpld_i2c_wait_for_free(struct mlxcpld_i2c_priv *priv)
 }
 
 /*
- * Wait for master transfer to complete.
+ * Wait for host transfer to complete.
  * It puts current process to sleep until we get interrupt or timeout expires.
  * Returns the number of transferred or read bytes or error (<0).
  */
@@ -315,7 +315,7 @@ static int mlxcpld_i2c_wait_for_tc(struct mlxcpld_i2c_priv *priv)
 		/*
 		 * Actual read data len will be always the same as
 		 * requested len. 0xff (line pull-up) will be returned
-		 * if slave has no data to return. Thus don't read
+		 * if client has no data to return. Thus don't read
 		 * MLXCPLD_LPCI2C_NUM_DAT_REG reg from CPLD.  Only in case of
 		 * SMBus block read transaction data len can be different,
 		 * check this case.
@@ -375,7 +375,7 @@ static void mlxcpld_i2c_xfer_msg(struct mlxcpld_i2c_priv *priv)
 	}
 
 	/*
-	 * Set target slave address with command for master transfer.
+	 * Set client address with command for host transfer.
 	 * It should be latest executed function before CPLD transaction.
 	 */
 	cmd = (priv->xfer.msg[0].addr << 1) | priv->xfer.cmd;
@@ -449,7 +449,7 @@ static u32 mlxcpld_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm mlxcpld_i2c_algo = {
-	.master_xfer	= mlxcpld_i2c_xfer,
+	.xfer	= mlxcpld_i2c_xfer,
 	.functionality	= mlxcpld_i2c_func
 };
 
-- 
2.43.0



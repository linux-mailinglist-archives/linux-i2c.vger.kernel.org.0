Return-Path: <linux-i2c+bounces-4695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C49929308
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B6D41F223F6
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C156B1527B7;
	Sat,  6 Jul 2024 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mk4MGwqt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF4214C5AA
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264919; cv=none; b=ZnG+/RAEPJQ3+kWOU/JE+hdAJGo6+zzU87taiILlOhLWF+IwlUbHfiMrXL68pV+qLZMK5MiekhviBpfXAoqTHFhtEgg8kFf5DioZTzoAh1Idb/nrTeOK/Ja0aNK1fLPyWWA3J7SaPMCIAp1mtU/f91OhKxVpD76zwZ/AfMVMwwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264919; c=relaxed/simple;
	bh=saJXPg+uSqStEGQa2wIjQFqCMf8tfELwrH75EGCUDq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHWn8XprCQ8wkKMEEw/8yyH95fVZOCxI9I9DhrejdfeYjeTZ3c7JlB1CAp1A3fsf/pfgqgHzK6LBkSYcMiUmckaS7FpF2pgqbLmiAtcOVDAsGj1H/rEuVT5raS9wqJmM2fZapH5ziX2j9MRZwg2X0PlGbQIsAOF+AY0unUVt2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Mk4MGwqt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=lfy80e6d4DUyOSyxafEW8neOKGy3kSepWSUjXkXFp1Y=; b=Mk4MGw
	qtFhu0JMd5G7tMIR7etieKyTzZ67HWYaBxzFCjcSI3gDaxQwiYxwomTkPxJ8xsba
	Zzbsi+yfsNVUFQu5e79OKDIdcEo/q3mqRzinMoODxjdo6eNPACT8mENaM6lIFcNe
	OBVmAvwf9iWnZ70OWiK9h1vyWZHmun6uKreqNtCv3sBNHqEDtLoGRlCwPaydlbj/
	o2/ZJJ7z8jcIrF1o0N8tOqzr9ikD/bCa/W+QxRjNe0+GzeXZc3AajY9xkFIm7Bel
	ih6evBYVz/4l5BZ2u4FhfzHCdUVRvzE7smwqAu7m78vCNAvndzL3SBNoKTSbKVlo
	fwoYfECXsE7K3n0w==
Received: (qmail 3810313 invoked from network); 6 Jul 2024 13:21:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:42 +0200
X-UD-Smtp-Session: l3s3148p1@0sBxYpIccIZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Michael Shych <michaelsh@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 29/60] i2c: mlxcpld: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:29 +0200
Message-ID: <20240706112116.24543-30-wsa+renesas@sang-engineering.com>
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
Acked-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 099291a0411d..8223f6d29eb3 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -197,8 +197,8 @@ static int mlxcpld_i2c_check_status(struct mlxcpld_i2c_priv *priv, int *status)
 	if (val & MLXCPLD_LPCI2C_TRANS_END) {
 		if (val & MLXCPLD_LPCI2C_STATUS_NACK)
 			/*
-			 * The slave is unable to accept the data. No such
-			 * slave, command not understood, or unable to accept
+			 * The target is unable to accept the data. No such
+			 * target, command not understood, or unable to accept
 			 * any more data.
 			 */
 			*status = MLXCPLD_LPCI2C_NACK_IND;
@@ -280,7 +280,7 @@ static int mlxcpld_i2c_wait_for_free(struct mlxcpld_i2c_priv *priv)
 }
 
 /*
- * Wait for master transfer to complete.
+ * Wait for transfer to complete.
  * It puts current process to sleep until we get interrupt or timeout expires.
  * Returns the number of transferred or read bytes or error (<0).
  */
@@ -315,7 +315,7 @@ static int mlxcpld_i2c_wait_for_tc(struct mlxcpld_i2c_priv *priv)
 		/*
 		 * Actual read data len will be always the same as
 		 * requested len. 0xff (line pull-up) will be returned
-		 * if slave has no data to return. Thus don't read
+		 * if target has no data to return. Thus don't read
 		 * MLXCPLD_LPCI2C_NUM_DAT_REG reg from CPLD.  Only in case of
 		 * SMBus block read transaction data len can be different,
 		 * check this case.
@@ -375,7 +375,7 @@ static void mlxcpld_i2c_xfer_msg(struct mlxcpld_i2c_priv *priv)
 	}
 
 	/*
-	 * Set target slave address with command for master transfer.
+	 * Set target address with command for transfer.
 	 * It should be latest executed function before CPLD transaction.
 	 */
 	cmd = (priv->xfer.msg[0].addr << 1) | priv->xfer.cmd;
@@ -449,8 +449,8 @@ static u32 mlxcpld_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm mlxcpld_i2c_algo = {
-	.master_xfer	= mlxcpld_i2c_xfer,
-	.functionality	= mlxcpld_i2c_func
+	.xfer = mlxcpld_i2c_xfer,
+	.functionality = mlxcpld_i2c_func
 };
 
 static const struct i2c_adapter_quirks mlxcpld_i2c_quirks = {
-- 
2.43.0



Return-Path: <linux-i2c+bounces-2531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC09886D43
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A01628B748
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4429C633E7;
	Fri, 22 Mar 2024 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G2hiM6Ye"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0755663103
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114040; cv=none; b=Iq49LZjf2SbviLB9V0iSWFWxpS8O4UNs8P5JFh9ESMH0pwtM/6LeA7v6dDPwdd2GGxRHba14jyriBAzxC9wYtVVz4PfgtumswAc203bxJ97WB+XQ5NoTkcOkk+3A03hrtNDlzNcZNiwNeI9JlIbXEkx5a/SvFLh8xf1rMZdL268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114040; c=relaxed/simple;
	bh=Z2Hc75yQ/GB7kDy0hCnplUfj/Lhtq/ZVfUNTGDEWA0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4HAd5I8LDK28/2NbrsZxAFmgArGfk9yYouvTa9ENukCSRzWzjqKsBTQOxzkLsY0NIRnI/eFKycxhrX7Yxubj7GXKhrL9PGMJYtw8vRPEY0BJEBAmMXtvkvDgC9CctaMjOEu+o8WW4muhi042tEvxDynlgTkvuYmglZGlRKoq/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G2hiM6Ye; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=YFfxxcM7IZESAWxygyHRNhKxCiTmb92VHtczUKfIfeI=; b=G2hiM6
	YehXH0uSM5XIHYFm7Xy7zSp8zjyQwmDvYLxHCtZYxwcqNjeGubqIp/7E7fHDhHb+
	ot1cenyeZVBldWjgFHPtkAYmJms0uHAszgBXoTHdF2IjRbtvRoYTMbBKzmpm9Xgu
	vzxlMnVIzDS+CtsxEU/hWNM1D64cCanznLdGUYTe72P/yQ2ldBwyzHhgLZsVQL/+
	pg/3Y4wSgfUri6P7m5TXhnbpS2WjXj+35oBw67+8t05D1bO3VVMq2CM28o5NXeQi
	M0ICcFOhWoWNLyVKOdncjiYTiFt0PyERC/0qZZJ209P1lIpg36zA66IdBUpRywCI
	o+iJKQQHsRwl7EmQ==
Received: (qmail 3871631 invoked from network); 22 Mar 2024 14:26:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:58 +0100
X-UD-Smtp-Session: l3s3148p1@i0o8xz8UmLBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 45/64] i2c: rcar: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:38 +0100
Message-ID: <20240322132619.6389-46-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-rcar.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 828aa2ea0fe4..4be75fdc7187 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -883,7 +883,7 @@ static int rcar_i2c_do_reset(struct rcar_i2c_priv *priv)
 					100, false, priv->rstc);
 }
 
-static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
+static int rcar_i2c_xfer(struct i2c_adapter *adap,
 				struct i2c_msg *msgs,
 				int num)
 {
@@ -944,7 +944,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 	return ret;
 }
 
-static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
+static int rcar_i2c_xfer_atomic(struct i2c_adapter *adap,
 				struct i2c_msg *msgs,
 				int num)
 {
@@ -1003,7 +1003,7 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
 	return ret;
 }
 
-static int rcar_reg_slave(struct i2c_client *slave)
+static int rcar_reg_target(struct i2c_client *slave)
 {
 	struct rcar_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
 
@@ -1025,7 +1025,7 @@ static int rcar_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int rcar_unreg_slave(struct i2c_client *slave)
+static int rcar_unreg_target(struct i2c_client *slave)
 {
 	struct rcar_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
 
@@ -1066,11 +1066,11 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm rcar_i2c_algo = {
-	.master_xfer	= rcar_i2c_master_xfer,
-	.master_xfer_atomic = rcar_i2c_master_xfer_atomic,
+	.xfer	= rcar_i2c_xfer,
+	.xfer_atomic = rcar_i2c_xfer_atomic,
 	.functionality	= rcar_i2c_func,
-	.reg_slave	= rcar_reg_slave,
-	.unreg_slave	= rcar_unreg_slave,
+	.reg_target	= rcar_reg_target,
+	.unreg_target	= rcar_unreg_target,
 };
 
 static const struct i2c_adapter_quirks rcar_i2c_quirks = {
-- 
2.43.0



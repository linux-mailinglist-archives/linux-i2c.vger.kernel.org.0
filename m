Return-Path: <linux-i2c+bounces-2505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8680886D04
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16BAE1C21F92
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE2960248;
	Fri, 22 Mar 2024 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="geNmA+Xk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F25D72B
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114015; cv=none; b=BlZZgn6t8WY85qgofzL96ISN78ee1kj+Pk171kVmxaGMJzvP22a84//tqsK82LJwdNrwW3h5NwerS6sNWjzx+ENi4XthJqiixuzdPR3OXdtr/FUpTG6eEOZbN4tDlukfQDh/im1yjhpNnFtkW9HKTY4qdOhkEP79lcEwxJS8K7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114015; c=relaxed/simple;
	bh=FVpP8gUoUPw0PWyX7HyL4JNCQPt2zkfreDGXWCxyGkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDIRCnlHwCUdThV92RgaqXew8mshJmSwFZ1tiFzVlEsSXnPOaQcMlplbYlKZCg5/8/QkkWd/7luml//QLr4zqL2lwOlA8g/jrAsjaqcf0yoIQXNNQV+HqqbGIFufGb6qFsaf7iAwD0/KoD5r0GVgh06ES3wUpBWtrzIWFH1sS0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=geNmA+Xk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zciHgMoD1B5iI7bHKqcQfg5mAImSqokaqFAlMo9s3zY=; b=geNmA+
	Xk/PkFxVZEpN7uQ41IheFU2gZ6VVyNAwPcLDqO2/ncFPSH04tw3JAA8PscIsFTrX
	zM607Lfpi1SUxvdbHOdMqMNW76WlsIr1DPZPaj0MMQNd7SYvvX5efVOpwXlGISyq
	TB7CsEpCFrKWjZTMxTmm6yn20lx98Gx2bLwdaQ577YjNKNrXwC5z6W6+kOy0ch1Q
	olQ7ExyfLv6Ag6vqno7GkWwUZ5qjesRjQefYFO+Qe9FgodY0wy24cbXsFHpm7rHt
	D4U/WTFn8+GIAGz8ycOiu1Ot3nusrbwI7Z1qW2+XMmZDZrw7s7k06xtxFcCTEprb
	u0idRjxNCvcMjhCA==
Received: (qmail 3870529 invoked from network); 22 Mar 2024 14:26:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:36 +0100
X-UD-Smtp-Session: l3s3148p1@+rvuxT8U6uBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/64] i2c: emev2: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:12 +0100
Message-ID: <20240322132619.6389-20-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-emev2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 557409410445..e67c55abff88 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -314,7 +314,7 @@ static u32 em_i2c_func(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SLAVE;
 }
 
-static int em_i2c_reg_slave(struct i2c_client *slave)
+static int em_i2c_reg_target(struct i2c_client *slave)
 {
 	struct em_i2c_device *priv = i2c_get_adapdata(slave->adapter);
 
@@ -332,7 +332,7 @@ static int em_i2c_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int em_i2c_unreg_slave(struct i2c_client *slave)
+static int em_i2c_unreg_target(struct i2c_client *slave)
 {
 	struct em_i2c_device *priv = i2c_get_adapdata(slave->adapter);
 
@@ -352,10 +352,10 @@ static int em_i2c_unreg_slave(struct i2c_client *slave)
 }
 
 static const struct i2c_algorithm em_i2c_algo = {
-	.master_xfer = em_i2c_xfer,
+	.xfer = em_i2c_xfer,
 	.functionality = em_i2c_func,
-	.reg_slave      = em_i2c_reg_slave,
-	.unreg_slave    = em_i2c_unreg_slave,
+	.reg_target      = em_i2c_reg_target,
+	.unreg_target    = em_i2c_unreg_target,
 };
 
 static int em_i2c_probe(struct platform_device *pdev)
-- 
2.43.0



Return-Path: <linux-i2c+bounces-2497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB09886CF3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A25A1F23144
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E4157305;
	Fri, 22 Mar 2024 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jgZFWcE8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA653E33
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114008; cv=none; b=qKp07T8uCm0tbTT67T4GP+zftrO5dECpy75Y6kuItRb0CWFcZ8N67XS+E0LKfcmOK9gdlrdtDWz9Z2jNDg5Hg85cJDR+tA2P5h6fjfnRRMZnj1lyo9SO5Gt1dcfFyq8PVMKmAi/IcJAFYOrTf0pHscfF8mEF2RCExfVxFOa9lLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114008; c=relaxed/simple;
	bh=RdpvTecA4tz3IWeF3JWv+DS2tIVcREHLGWPjN6GdG0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUDj/TL6L2WUojSr+Pzr/e/2/FZqibILxJrl5ZkcM9cDgNSY4LgQTfARhEQZLkSXnSYOLKdAyZ1FwR3ThQts5+GI0r1K70LenKehaOkHuTh8GsUTsavQE58SsEE4AwEtPK/scnHN7k+kwlpiI0lQ670jmgFN/nC/eUAu/l2PoSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jgZFWcE8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=sPIndfoTUi+H7yC2Vw2N54ArxxcZ9SSScdyIHb5qHpg=; b=jgZFWc
	E83WdTi0EfWJTud1ynqA2PplpkcyePEsxtQ20N51vsqmi7751ncZqB2hZfcSgEcR
	M97D6YCIAedDg71nlBfDvaMYMC5pMR/zdTvAEYuFMihhZf7zkksHYU+lsvX5YBLG
	oLny3r+tT+vkOGAabF/qJP32PiiehoOGiqoaa4bxQOQeicwUdhkiRzAcVWQYFwlP
	wKTCMciq3j4A0eFnEgP8StB+eaEkpYcpSMLACW/Z5hEhHI0KuXB4RtNtIJcIVsxL
	cZKJv71ldw6lYAiM3SRJ1XXuRiBcXbXpWF11UFGeRT1XrLtAFnkbfcRou8nbuGB+
	Mg96S92tGG4xCD3w==
Received: (qmail 3870265 invoked from network); 22 Mar 2024 14:26:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:30 +0100
X-UD-Smtp-Session: l3s3148p1@phGJxT8UjuBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/64] i2c: cadence: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:04 +0100
Message-ID: <20240322132619.6389-12-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-cadence.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 4bb7d6756947..91085e719689 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -808,7 +808,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 }
 
 /**
- * cdns_i2c_master_xfer - The main i2c transfer function
+ * cdns_i2c_xfer - The main i2c transfer function
  * @adap:	pointer to the i2c adapter driver instance
  * @msgs:	pointer to the i2c message structure
  * @num:	the number of messages to transfer
@@ -817,7 +817,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
  *
  * Return: number of msgs processed on success, negative error otherwise
  */
-static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+static int cdns_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				int num)
 {
 	int ret, count;
@@ -947,7 +947,7 @@ static u32 cdns_i2c_func(struct i2c_adapter *adap)
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-static int cdns_reg_slave(struct i2c_client *slave)
+static int cdns_reg_target(struct i2c_client *slave)
 {
 	int ret;
 	struct cdns_i2c *id = container_of(slave->adapter, struct cdns_i2c,
@@ -972,7 +972,7 @@ static int cdns_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int cdns_unreg_slave(struct i2c_client *slave)
+static int cdns_unreg_target(struct i2c_client *slave)
 {
 	struct cdns_i2c *id = container_of(slave->adapter, struct cdns_i2c,
 									adap);
@@ -990,11 +990,11 @@ static int cdns_unreg_slave(struct i2c_client *slave)
 #endif
 
 static const struct i2c_algorithm cdns_i2c_algo = {
-	.master_xfer	= cdns_i2c_master_xfer,
+	.xfer	= cdns_i2c_xfer,
 	.functionality	= cdns_i2c_func,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	.reg_slave	= cdns_reg_slave,
-	.unreg_slave	= cdns_unreg_slave,
+	.reg_target	= cdns_reg_target,
+	.unreg_target	= cdns_unreg_target,
 #endif
 };
 
-- 
2.43.0



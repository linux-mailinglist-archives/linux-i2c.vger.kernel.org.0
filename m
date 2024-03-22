Return-Path: <linux-i2c+bounces-2513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A380E886D1A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBBE51C23326
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D2647A5D;
	Fri, 22 Mar 2024 13:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NJwmyVON"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B42460897
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114022; cv=none; b=IIX343mDAXhdfRz5hOo9q08LXzV9HYec0nogzqYD8hE9EA2l0iDtshhkNr9tInz8/05RCrN6eOziO0vTbPBaC3AQWh56QEEXk8zFY6nb1aemqiuGeasmV7GWjeSNeMVG9DBd1AaiBPGwe5/ksZV29/YhIT6ZUyvP65M6BwF3fxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114022; c=relaxed/simple;
	bh=q7JRzLfJ8eThPTGrFEoS5oDExGETXR2V5D9xqAe4mLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dyt+ORld5NViRB2QNM5HNLaoLbD93iEJNYHDoD/B4sn4cscubh5qzfWKCaFXkyIsxKx1P93bzQSsTT+wijCuOxZTvepHfecct1DCx1uKUK7T1Jk8EMK/BG5QJlC0RqRQcD9fWJEJ0fJEh7KfqEBco5wqniYxBrXMQPZbf653Qj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NJwmyVON; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ItvkqPOxxoAxX6wP7vqtFYes8mnGS8tDMPsJtLe0c/I=; b=NJwmyV
	ONyXHx43Ket4ijy0PAu5NZ/Gq58i9u8de1ufZvKAFznoF4R/5fxqFMN8GLLxzlRH
	X6rQ9CzdCnO7pboqDfwxGWJ5a6Ah3b4bCyoJmAt75wWCCLFa6G5C09CdaNj//vFC
	MwpARqcLpkBenCPLCqii5Dz2jFmZGIEQPFfcmcqdAFf5YsrmFOO1APdhQqFKRtUr
	jYlnocSCLj7+HgcobbG1eeQLOuq3a4CzrcANVd4IzmNtI3J8aKWbH1/0IRx9bU9y
	iAI/DLoYVopoPnMvSgHgueinejOLizZNjpJpcdbjkOIXzlF2bza81/NGMymJvA3M
	pMdxdVg61oa+SxrA==
Received: (qmail 3870828 invoked from network); 22 Mar 2024 14:26:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:43 +0100
X-UD-Smtp-Session: l3s3148p1@kuNVxj8UwJRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 27/64] i2c: iop3xx: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:20 +0100
Message-ID: <20240322132619.6389-28-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-iop3xx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-iop3xx.c b/drivers/i2c/busses/i2c-iop3xx.c
index 2e5f0165c3d3..9973f7d83205 100644
--- a/drivers/i2c/busses/i2c-iop3xx.c
+++ b/drivers/i2c/busses/i2c-iop3xx.c
@@ -22,7 +22,7 @@
  * - Make it work with IXP46x chips
  * - Cleanup function names, coding style, etc
  *
- * - writing to slave address causes latchup on iop331.
+ * - writing to own client address causes latchup on iop331.
  *	fix: driver refuses to address self.
  */
 
@@ -234,7 +234,7 @@ iop3xx_i2c_send_target_addr(struct i2c_algo_iop3xx_data *iop3xx_adap,
 	int status;
 	int rc;
 
-	/* avoid writing to my slave address (hangs on 80331),
+	/* avoid writing to my client address (hangs on 80331),
 	 * forbidden in Intel developer manual
 	 */
 	if (msg->addr == MYSAR) {
@@ -350,10 +350,10 @@ iop3xx_i2c_handle_msg(struct i2c_adapter *i2c_adap, struct i2c_msg *pmsg)
 }
 
 /*
- * master_xfer() - main read/write entry
+ * xfer() - main read/write entry
  */
 static int
-iop3xx_i2c_master_xfer(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
+iop3xx_i2c_xfer(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 				int num)
 {
 	struct i2c_algo_iop3xx_data *iop3xx_adap = i2c_adap->algo_data;
@@ -384,7 +384,7 @@ iop3xx_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm iop3xx_i2c_algo = {
-	.master_xfer	= iop3xx_i2c_master_xfer,
+	.xfer	= iop3xx_i2c_xfer,
 	.functionality	= iop3xx_i2c_func,
 };
 
-- 
2.43.0



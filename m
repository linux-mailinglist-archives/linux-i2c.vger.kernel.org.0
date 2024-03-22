Return-Path: <linux-i2c+bounces-2548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FE886D6F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE8E1F228B0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7332669958;
	Fri, 22 Mar 2024 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aFMrpUaq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98A67C52
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114056; cv=none; b=cjmqAHGRrZbknrPD5ogQ3fXsOUn4QMNUScMf3sagkURQBaISUGSPfiUdzac7/xahprdJ2R7n/Sx4O8hjYxdXFNzqRw6Aak4IrPn3AArJQOrXbxth0DMq3eeeRNynHX30Ed9cI67E/rl4Cq4cfPcBEvPdhN21zExOhWMBtzqEqaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114056; c=relaxed/simple;
	bh=Ko5/Z2nRc5pMm4ibUjoyOnYGFwAgUhQpC5SCZht4oZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxfvpHRwQ44Xa4jW2g6ISctWfs+Ewc8U1sxMO0PwpARGj1B7NYziwexH54DMPZ21zN35ukljlwSyUIM7wk2QbIiQ8opiwex0XVQKkyeCAU5J5N9K3TD66yu4FsjkImZL4J492IMEeq9Dk9/lxVy+G6FGcrJ68Fq3ZsSjK3M6vzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aFMrpUaq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zPO/AyVegLzL+94blha3Sj3ZjxaXY7bBsokNTRDxIaY=; b=aFMrpU
	aqyfQC2+TlCAp0lKshmBAIQXLRphVEA8CbmzbF3bJDEb+bIHnZDe1pFZApxWOndX
	MhiTY7zJpHrIdMnNHpnUrjAc+gJfikij8bCYBTem2OchZ3mAnQThvUqStZOGXP2j
	dMM5X8LjcbpkhNeAhisxrWb3WsAMeAn79epDqevzwVRRJUuuVjDN6+gFA9fgjPwe
	ElEbASERUG6Fvnkb1n67OPIiekm+y9od3LFhgjfHBAqrlzjbHAteqRdy+h3TkzRo
	Jsyg0i+kLFKAnISxYVGbvSILqfBv7dapEE/b2fTcDhr/AOabyX35iI01BjO8jYTg
	+DSuCucWLh5vAMkw==
Received: (qmail 3872279 invoked from network); 22 Mar 2024 14:27:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:12 +0100
X-UD-Smtp-Session: l3s3148p1@+ngRyD8UloVehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	George Cherian <gcherian@marvell.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 62/64] i2c: xlp9xx: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:55 +0100
Message-ID: <20240322132619.6389-63-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-xlp9xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 08a59a920929..9a0a1c5f5c6f 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -336,7 +336,7 @@ static int xlp9xx_i2c_xfer_msg(struct xlp9xx_i2c_dev *priv, struct i2c_msg *msg,
 	xlp9xx_write_i2c_reg(priv, XLP9XX_I2C_MFIFOCTRL,
 			     XLP9XX_I2C_MFIFOCTRL_RST);
 
-	/* set slave addr */
+	/* set client addr */
 	xlp9xx_write_i2c_reg(priv, XLP9XX_I2C_SLAVEADDR,
 			     (msg->addr << XLP9XX_I2C_SLAVEADDR_ADDR_SHIFT) |
 			     (priv->msg_read ? XLP9XX_I2C_SLAVEADDR_RW : 0));
@@ -452,7 +452,7 @@ static u32 xlp9xx_i2c_functionality(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm xlp9xx_i2c_algo = {
-	.master_xfer = xlp9xx_i2c_xfer,
+	.xfer = xlp9xx_i2c_xfer,
 	.functionality = xlp9xx_i2c_functionality,
 };
 
-- 
2.43.0



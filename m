Return-Path: <linux-i2c+bounces-2540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB73886D5D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B357D1F246E8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D02664A3;
	Fri, 22 Mar 2024 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dZ9TpqDj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B76519E
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114048; cv=none; b=AdPfwmvweQS+QOO8DMZCga2zCne7lWn5mgP0LZhTuBStv5sWHfd3lIUqqIOZoS8sPen7uQ9MFAUaodu8mTJXzp6bpWavq1+2dO6e9zCH+Cvjt9RhnmyAPCAFmfo918RVK3d0ZwA5jKB3SOpsCOGTpGgZmzGJDO6vnFOk8Y5p4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114048; c=relaxed/simple;
	bh=fHpjjT7VWPlWf89q6pOUOQOpJIvNvwHkfmzjVoejNB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1PlFGp9Nx5Df6AGO1R19gxYPCQeATO7Dnz3lVu6vDu2OIjNfI9fB75tT+3RY2L7nGB06idlYtPGOy1UtKszOZ2xwYCYQPx53NEaGOewotXoD4DCPHpzyaUMnqJ7rl01tZGcW9S2BFG7URmWsUAZKzjVIgSmjA36xTgGFXQ8tV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dZ9TpqDj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=v5icbxJz6JkP2dpvAuHf8kDHkY/a+aKxThUJ7RMnku8=; b=dZ9Tpq
	DjfvPnqYwJtDQcHEgBqxDnzAKKnJ3VU1tjc/rrXPkf+9nnGOnfOqlSGafJGIVZP6
	ROpLbnxNrSAowYXsvgKf+8YD27AVoKRd+CVNAIrkcowPWR5gaxqRMM/5kKWpycTs
	D5ChfZAmfkQqsFyFXea1/goq4Df0dQqRWeyXY+XuloF9LqgKrxpGJJtGazDyhLIW
	D4dHOqL1MLnS0EXK+ZDAhjzcDoqPvyr79MbAQ0tNAz5bWtMSBDoXvnpp0N3O8qXV
	AcN1wn7/pHqFLP9Dksau7EbNIhSSyHUDyg2N6+2NCu+RZ+0JUigNg3+k01lDOpU3
	vnczVBL9ntCLhMbg==
Received: (qmail 3871957 invoked from network); 22 Mar 2024 14:27:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:05 +0100
X-UD-Smtp-Session: l3s3148p1@liKsxz8UQpRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 54/64] i2c: stm32f4: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:47 +0100
Message-ID: <20240322132619.6389-55-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-stm32f4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 859ac0cf7f6c..297f2ace6b94 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -95,7 +95,7 @@
 
 /**
  * struct stm32f4_i2c_msg - client specific data
- * @addr: 8-bit slave addr, including r/w bit
+ * @addr: 8-bit client addr, including r/w bit
  * @count: number of bytes to be transferred
  * @buf: data buffer
  * @result: result of the transfer
@@ -480,7 +480,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 
 /**
  * stm32f4_i2c_handle_rx_addr() - Handle address matched interrupt in case of
- * master receiver
+ * host receiver
  * @i2c_dev: Controller's private data
  */
 static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
@@ -643,7 +643,7 @@ static irqreturn_t stm32f4_i2c_isr_error(int irq, void *data)
 
 	/*
 	 * Acknowledge failure:
-	 * In master transmitter mode a Stop must be generated by software
+	 * In host transmitter mode a Stop must be generated by software
 	 */
 	if (status & STM32F4_I2C_SR1_AF) {
 		if (!(msg->addr & I2C_M_RD)) {
@@ -749,7 +749,7 @@ static u32 stm32f4_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm stm32f4_i2c_algo = {
-	.master_xfer = stm32f4_i2c_xfer,
+	.xfer = stm32f4_i2c_xfer,
 	.functionality = stm32f4_i2c_func,
 };
 
-- 
2.43.0



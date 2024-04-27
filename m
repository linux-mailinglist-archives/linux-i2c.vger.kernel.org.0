Return-Path: <linux-i2c+bounces-3260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0978B47FE
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C5E71C20C2E
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDE415AABB;
	Sat, 27 Apr 2024 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HseIkXQe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F615884D
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250193; cv=none; b=LAwYx7kcdMMjaZMYZQOl3g679VCx3z255DqmX4vhmwswyigvTWDJDWoo3G6Yz65SNEP59hmVYHnnl2wtXcC40355dT6qj5g3cNO9cP2GByJ7G34bbhHAWPSF5YeC/Uf9n/VWTO7iGBtREkX7D3JiQqD+vugKDv6EBA57sRktYoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250193; c=relaxed/simple;
	bh=+MzugzJWD0ePnwNN8kUfm/oNioMUuBkwypU7J8gu1eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clQIKcY6CYLnFYW8J1HaeMp05mktTVRAF0sQFKSiJy0rIKbljEuvMI8+u0528FDKA44+r1CadXOQq+r/uSW9L+XZkooaHxx+VUq9hbJ3SVsBuFLsDwkchXP3yutWnrEM+kdE97kdivH19HdABgTX5cWTTNENQsDpLVQJ9uhBBOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HseIkXQe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=gZ01Lhe4pAwdcuNCxaIYgv6RGXpiS5mlcEHdQcrIkWs=; b=HseIkX
	QeeKpgVS9jKY4BFhE/0UABE1zW0Qtb4VnivHX577i1yOEm/I+47oowrPMH9LHqnb
	MkwiKA+2NOg+KZwq2G91nlmmV01I+/7mZayTfWuToS6V/yewif7lNRllCbkQTXIj
	3lSqVJV6CX4HrrakUN+dmjXfh3gU6Xy+TzgG3pr5sQF8yThqDDl17yCg0mOuET2O
	gqYIHau5mkauEbFYudMXLFdHwIW9Lbx9Ipej6NRnPPUTGAB4dAlJfoWgWKaioOJ1
	gYBEpL6ZHriOdPz8Gfo3FviY/0Jy1BhXWB36135S/GSfv94r8K5x52vqVqCMpivg
	OVycBaShXiLV6cBg==
Received: (qmail 1781964 invoked from network); 27 Apr 2024 22:36:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:20 +0200
X-UD-Smtp-Session: l3s3148p1@P+gS+RkX0s9ehh9l
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
Subject: [PATCH 08/15] i2c: stm32f4: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:36:00 +0200
Message-ID: <20240427203611.3750-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 859ac0cf7f6c..f8b12be6ef55 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -681,7 +681,7 @@ static int stm32f4_i2c_xfer_msg(struct stm32f4_i2c_dev *i2c_dev,
 {
 	struct stm32f4_i2c_msg *f4_msg = &i2c_dev->msg;
 	void __iomem *reg = i2c_dev->base + STM32F4_I2C_CR1;
-	unsigned long timeout;
+	unsigned long time_left;
 	u32 mask;
 	int ret;
 
@@ -706,11 +706,11 @@ static int stm32f4_i2c_xfer_msg(struct stm32f4_i2c_dev *i2c_dev,
 		stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
 	}
 
-	timeout = wait_for_completion_timeout(&i2c_dev->complete,
-					      i2c_dev->adap.timeout);
+	time_left = wait_for_completion_timeout(&i2c_dev->complete,
+						i2c_dev->adap.timeout);
 	ret = f4_msg->result;
 
-	if (!timeout)
+	if (!time_left)
 		ret = -ETIMEDOUT;
 
 	return ret;
-- 
2.43.0



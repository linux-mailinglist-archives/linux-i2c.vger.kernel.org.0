Return-Path: <linux-i2c+bounces-3259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FB88B47FA
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83B24B216F1
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B896E1586D5;
	Sat, 27 Apr 2024 20:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gOYqFv1h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7F81581EB
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250190; cv=none; b=ghUWCxHWAUqtb/I/vdi8SIcLjbMJ2TT7/zfAJkg6Q3dTJ7NHNoidjabkridLgnIiWwwv2CCqS9DaXBBu7oanLwD58NGZPZT8DTXdb20ff7vJoFxVuCZn8rtjthX4qK4MZ67uJ7IOkU05unt7HVM3Qq7LeAWLOjtfA68ojZLoozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250190; c=relaxed/simple;
	bh=zMu+yNewBqoDipSU74HvvlkDLWwOVjxUjGnxsnMRywE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjqgpOqWBC6jb6952tuuDWQ4fzJyIEH6lQ7D5+vJh/v0fELwYl1gVf36QF+wJBuxnAIxe5cIlB2m4YzYTxzROWaKJnJa8FdqdWPW1hsT6dSFuBd4E5wQc5711/ctvUSZmU65Pr6OBIJ1RrrbyN54OGYLugSO+9nufQjqxgke1Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gOYqFv1h; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=YtBKETUeeWdigupUNh1poF2adUaIr8Z2d3RrJ3sCaV0=; b=gOYqFv
	1h+vS8r2Jh7ErStywwggdVCLpThEUHqOT3Pr9Yl8/Bj3LNrIuZKYrWRJs6jd8fpL
	YWuTmxexa05QoXMra0ELDpsHesZVfBelM2P6CO2Yyg5Ok+eucKHhso1HJf0dKvlN
	hHyfEibxw7g1vs8jvFH2DyDozOdipgzZ/mt1pALZr5DR0LVz9eS9upzO6KDsmBMa
	t5qA9bQKCtNvax/YPaPkA5dUsRVckAMvHZTt1uXtldzNryidwLL7hImJnsTIN2Rq
	360HMvNXGh0c2uDI22nZaXEW0Mb3okLZhDgA7JIt94wq4J4IdVD7+CoccN57tKA/
	hWzfRSZ1Y4sk1qtw==
Received: (qmail 1782013 invoked from network); 27 Apr 2024 22:36:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:21 +0200
X-UD-Smtp-Session: l3s3148p1@8rwe+RkX2s9ehh9l
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
Subject: [PATCH 09/15] i2c: stm32f7: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:36:01 +0200
Message-ID: <20240427203611.3750-10-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 01210452216b..cfee2d9c09de 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1789,7 +1789,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
 	struct device *dev = i2c_dev->dev;
-	unsigned long timeout;
+	unsigned long time_left;
 	int i, ret;
 
 	f7_msg->addr = addr;
@@ -1809,8 +1809,8 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	if (ret)
 		goto pm_free;
 
-	timeout = wait_for_completion_timeout(&i2c_dev->complete,
-					      i2c_dev->adap.timeout);
+	time_left = wait_for_completion_timeout(&i2c_dev->complete,
+						i2c_dev->adap.timeout);
 	ret = f7_msg->result;
 	if (ret) {
 		if (i2c_dev->use_dma)
@@ -1826,7 +1826,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 		goto pm_free;
 	}
 
-	if (!timeout) {
+	if (!time_left) {
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
 		if (i2c_dev->use_dma)
 			dmaengine_terminate_sync(dma->chan_using);
-- 
2.43.0



Return-Path: <linux-i2c+bounces-2869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0989F0C1
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 361361C21065
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7D915FCE9;
	Wed, 10 Apr 2024 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IViNnxeH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C072315F40A
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748326; cv=none; b=Hj/4KVpu9REtjWppIDAbiQaWUrDj9KVltnr3wtNYXAs1jLL4WoGghjvcZasptBmlt4Q8rej9a7b8/A/HKO7IaoSAGT40NQ+r+O2ngGp7pmqaeDy1DTx5hvTh8yj0yq0hYx1iPjmnvFr7bm6HQmPpW8Bdvs3ELa50es2rm2+WJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748326; c=relaxed/simple;
	bh=ZiIjtM/8yvx4TeW2A4HFmO5GY6NQemF+7DUdEnuG66E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWIFNLETI1+LeJ1P2z1A9wW8LMyNIXXMq/axGEIRE45PHVN2g5Pxl6VJFrLsyIXm1pjglAlv+Q2DYHCS/ogdLvJNmlqUn21swUADUirzm5oyl3ZhVkV7kDKNrG59sGN+goq/UAfX1NdKFiyrmE5/FucX0wUY06o6Fd9XYP/dDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IViNnxeH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=61Yt0QJyesrW2fxW1vjW+vSic4XhfkDmhgxF5NliaQY=; b=IViNnx
	eHj5O7F0ATf1ZZxzzvdVQShvxXYAouzRxRIxxXNaHE6LWqn5DqSsZEc2Zs0Q4tbY
	LNAG8XFS2dYtwS6Z79oh8bi3bFWPTp2k8OO41KzviQFrX4OYBsLoZkWWjdssFGb8
	gXL3C/0XjyZUDsaG+77QnuyuY+OCMho73iTthf3YS9WAFiFNETFTD9IT0d7tMkPY
	wc/FlE4DsHk2WncjxqpAdEvpy/7k/zOd9FTdFOcIED0ZywK7pDkE81XnkqrIrw7m
	NSLNbw2gZfg65WUxHxWM1226ovjfS3RByq9vRwKXYAnJfmVMNwhcueb0fujWHKXG
	Qs2aPyepbCwSftYg==
Received: (qmail 522049 invoked from network); 10 Apr 2024 13:25:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:20 +0200
X-UD-Smtp-Session: l3s3148p1@u+osS7wV6xNtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/18] i2c: uniphier: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:32 +0200
Message-ID: <20240410112418.6400-38-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-uniphier.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index 854ac25b5862..e1b4c80e0285 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -71,10 +71,8 @@ static int uniphier_i2c_xfer_byte(struct i2c_adapter *adap, u32 txdata,
 	writel(txdata, priv->membase + UNIPHIER_I2C_DTRM);
 
 	time_left = wait_for_completion_timeout(&priv->comp, adap->timeout);
-	if (unlikely(!time_left)) {
-		dev_err(&adap->dev, "transaction timeout\n");
+	if (unlikely(!time_left))
 		return -ETIMEDOUT;
-	}
 
 	rxdata = readl(priv->membase + UNIPHIER_I2C_DREC);
 	if (rxdatap)
-- 
2.43.0



Return-Path: <linux-i2c+bounces-2230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ECF873E07
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 19:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5143D1C230CC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABDB1420C6;
	Wed,  6 Mar 2024 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bRNlrbr9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EA613E7EE;
	Wed,  6 Mar 2024 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747978; cv=none; b=P4/pemyY88dPxJoYTX8zltYIaFxazF/sqQccJCxBOZGvGH2Aq4aqQv/A3egi13IMInvujnqmc09wL21KdkAGeo4CVBhJsxjM9pploRsoYf40NfYjrCql8t1QX+iQ4bEyS2BirZwIVE52piwK+kWFnU7Li5yA/6m+gXidJW0rb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747978; c=relaxed/simple;
	bh=ws24+Zs9mxrDI5wpDlzobBBqDQejGpMk5Rg8hsTS6qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vE6GxMfV4AvQCuSq7AOqcehv+3k7pnR70Vr8xiHuxNCQfRj+wItalfXNyVCKmebcO5fJtqHQ7PYxtB0Xtw+s3Y89JDPUFS3KmrrJnajJ6ga9BcGPD4xSXSImmapQ9nfUsRundYEpeub3oGhUmpR6DKsCtgK459q/gaCj7r9oGvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bRNlrbr9; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 846BE4000A;
	Wed,  6 Mar 2024 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruosRsxnZAVuAbjSZ1Tkcvh8FUYtJ2NEV2SFjU36MSI=;
	b=bRNlrbr9721jKdozWmacEKjBD/uk/CQvKOtzeVxjFoj4bQU/XgFmo02THbU7SsmG8+0wrb
	yWokx6S1DQNGISlXEmvFigm4ZyhEgtkeIVauA5Fh9xGEdlzwAeRC6Hmc0oFLr+X1Fo3l/v
	9FSPmVC9ZK/xS0tRpYyleBNq9AvE0PzbkRBTdE3Lf2KycKQcEDzPkID3VafDk+z1YXpBnn
	z0kCgwfWLhSKL9a30nQ+9f/PuXrIJHM/uUMacU/SXFoaTaSGQiioN40MTv04Hp6+iFQdT2
	VKN2V3ox6CsTDZm7V+T78EOgq9yznsnJ/9Wl/A80gml1PcXbjl2vcKdV+08Qmw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:27 +0100
Subject: [PATCH v3 07/11] i2c: nomadik: fetch i2c-transfer-timeout-us
 property from devicetree
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-7-605f866aa4ec@bootlin.com>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
In-Reply-To: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Allow overriding the default timeout value (200ms) from devicetree,
using the generic i2c-transfer-timeout-us property.

The i2c_adapter->timeout field is an unaccurate jiffies amount;
i2c-nomadik uses hrtimers for timeouts below one jiffy.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 020beb8ffa17..2e738b18677e 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -975,6 +975,8 @@ static const struct i2c_algorithm nmk_i2c_algo = {
 static void nmk_i2c_of_probe(struct device_node *np,
 			     struct nmk_i2c_dev *priv)
 {
+	u32 timeout_usecs;
+
 	/* Default to 100 kHz if no frequency is given in the node */
 	if (of_property_read_u32(np, "clock-frequency", &priv->clk_freq))
 		priv->clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
@@ -986,7 +988,12 @@ static void nmk_i2c_of_probe(struct device_node *np,
 		priv->sm = I2C_FREQ_MODE_FAST;
 	priv->tft = 1; /* Tx FIFO threshold */
 	priv->rft = 8; /* Rx FIFO threshold */
-	priv->timeout_usecs = 200 * USEC_PER_MSEC; /* Slave response timeout */
+
+	/* Slave response timeout */
+	if (!of_property_read_u32(np, "i2c-transfer-timeout-us", &timeout_usecs))
+		priv->timeout_usecs = timeout_usecs;
+	else
+		priv->timeout_usecs = 200 * USEC_PER_MSEC;
 }
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)

-- 
2.44.0



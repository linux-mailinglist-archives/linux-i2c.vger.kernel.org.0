Return-Path: <linux-i2c+bounces-4684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86CF9292F4
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9B521C20FCE
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7D2146597;
	Sat,  6 Jul 2024 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AKGIETuz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274E613E3E7
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264912; cv=none; b=cmaOEnb06UuRCFyq7QoDgoOxIuGR1mFmPv1Gl/7KltRSwkY0/P6DmPmdZn50iO49wpLBSULqYjrfBRiVrHltmtqVQyJfktRius6t6rITwuwa4JzuYzNt82mmxKhXcicjMV5oP2izCHRcuWCwsMd8b1OxOOyzklTm3GmafeRxkZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264912; c=relaxed/simple;
	bh=4iyZ2tieeSbkKbsXmcNxflXF9XVpqKjimPDraqZRuSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cddr9rssun38/L+w0CaXdyLU1liVytv+4Guz7Wq4UGzP1VVvJz1eW4Eanpc4DVqLdzUV1knKpqb/jkJH2FUNoJQnD1jG01oKz4cQDFOAhC8onNGP3UCuThYAQGO7uThsVIz08MV7XZUidxFZqWxB+WGfCwe3K9zamgPRjcPUy10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AKGIETuz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Sl3thxJk6qHTgqFe9vsesmVZL8XNJ7POlGLqw2o7k9Y=; b=AKGIET
	uzshD0ISFPIUqjWRwaNqu9Th/ZLj1v2tSm4NuJLMph07DPhCgnlteVtdkSQEfHEm
	IYlp8dV71Id1uRwM88ocHcax4UDO4vQdy1Uz3fBT/em5i5v/4I+v3Q0TOGB5hHDR
	eYnp9nCxyh1d1IBLRGIiaxhHr3b007bqq9Tt/5LeFz6rA52V+tfaQGehrTHfpFXU
	Txnu33VQ/ZMMi0WxGnjKSrOU+8YbstMOMh82v2Yr9QNovO665qF/LOvMDAtRVhiG
	fKKlCw3t1pv9XsKXk1e/0r05ou/X1y0yG0JhTzCuOTmzGXd9WIdKZs/oBvcxcD9K
	NJO0SN0mkX0VcvjA==
Received: (qmail 3809865 invoked from network); 6 Jul 2024 13:21:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:34 +0200
X-UD-Smtp-Session: l3s3148p1@Ji/xYZIcvJBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/60] i2c: highlander: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:17 +0200
Message-ID: <20240706112116.24543-18-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index 7922bc917c33..ec1ebacb9aa8 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -331,7 +331,7 @@ static int highlander_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	/* Ensure we're in a sane state */
 	highlander_i2c_done(dev);
 
-	/* Set slave address */
+	/* Set target address */
 	iowrite16((addr << 1) | read_write, dev->base + SMSMADR);
 
 	highlander_i2c_command(dev, command, dev->buf_len);
-- 
2.43.0



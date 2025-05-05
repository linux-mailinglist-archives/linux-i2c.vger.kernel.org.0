Return-Path: <linux-i2c+bounces-10804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610DBAAB3C8
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 06:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5643C467C0F
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 04:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A496D3988C4;
	Tue,  6 May 2025 00:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YA1tXWto"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8383984B0;
	Mon,  5 May 2025 23:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486447; cv=none; b=ISuKhwCHGaZn5R6WOb0jqYq/R20G92VuHX6G/Bxv2F7cnLb+rTOXKq+7JtADabQlgGhEQ9FbCDVgpCgVWZAvEfZsEYBDawXnt2pa/XySoRwRIBrsrgHXQ24wHWt5RWPd96AqLqwrwSfV7JgQNEZM68k9L89rWosRVLQRYvvdwYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486447; c=relaxed/simple;
	bh=FSRqsNp9wuYN8pCB7g2cHNhJUzSd2U3NRrvkAc0kugo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=te9t7Cx+O/giSAVJj5Jsv6oHnKj6DvmxOA4K06HJGZSg6lfO26gGsuHHEqVofVLpa+7Sh5YOHhilnju9j8R704b4FJcNctH6NaIo7lhYa6wRIoGA1Gd03mmuCDzzbaNGon8xJqxMf+5VTndVUSwmtgQdukY/SHz88XsDDPtkfcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA1tXWto; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7705C4CEF1;
	Mon,  5 May 2025 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486446;
	bh=FSRqsNp9wuYN8pCB7g2cHNhJUzSd2U3NRrvkAc0kugo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YA1tXWtog5a5qCvz6VI9oexLp8JPdzYfYgoVbbHLm92D4fcaoJtQCLre6xlV3f4ZE
	 GB1uuD6+JNypXOYk7bVM97L9QbtDW8RPimBtA4GsGRADxwG0IYVxByobYpY3KKeT5U
	 LalKZxl19bJPrLFclf67pcl2NFkymTxmg9qmvMt5V0NMXvhd6O9IEYLwztrR0P3Psw
	 Ud5k41TDgbiTycDDFWOaozb0lh/6A/RkM1IOeh9pRCcvT8JcLuXAuMeqTPsYaL0WFz
	 MPqz9h3uRGcZhiM2joqOQyBDhunrc+uqrtbedNNhKO31HAV8GkuufWoEnaU3iY0Aoo
	 JTXzJJrxRHjCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 033/212] i2c: pxa: fix call balance of i2c->clk handling routines
Date: Mon,  5 May 2025 19:03:25 -0400
Message-Id: <20250505230624.2692522-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit

From: Vitalii Mordan <mordan@ispras.ru>

[ Upstream commit be7113d2e2a6f20cbee99c98d261a1fd6fd7b549 ]

If the clock i2c->clk was not enabled in i2c_pxa_probe(), it should not be
disabled in any path.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20250212172803.1422136-1-mordan@ispras.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-pxa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index ade3f0ea59551..8263e017577de 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1508,7 +1508,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret,
+				     "failed to enable clock\n");
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
-- 
2.39.5



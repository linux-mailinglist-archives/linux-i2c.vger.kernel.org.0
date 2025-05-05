Return-Path: <linux-i2c+bounces-10798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03376AAAC63
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 04:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E637F163500
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 02:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7933C7D63;
	Mon,  5 May 2025 23:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4NBE2fd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD82E5DFE;
	Mon,  5 May 2025 23:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486851; cv=none; b=cNXI4AisUzIX9IvWPksStjh6ICkfcNkAvHj+4/N3EHgFZGPOuEfWMRui3l3JISp83GZHnGkLndtpZeiH0lOP93XVFExRJB/rMDQqWTWk2jQ+J618zit0MnawGr5U0+uCZbW08+/hntKWPkSVwGqaq6Qwef80YcRbESba6fnngF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486851; c=relaxed/simple;
	bh=2pjdD08KhMw6FeRr9Qku1Tz+bsPUVl0cVg+Ep97vitY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q9xOuuyVsb5l8U+qLtRBgOwiJSyaut/MrBpushNOkBml0bVIwucWOq/5mSoJNOen+jrskbl5pWJomMQQ8tIesiTlWNFqdFBiu0Gs8DyEBZy9nAjwRQwwJp4Gy31cWc0ZAJS07iO1VV3S0/I5q2IraXKKQ62q5qqEzL4h6X4kDTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4NBE2fd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EC0C4CEEE;
	Mon,  5 May 2025 23:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486850;
	bh=2pjdD08KhMw6FeRr9Qku1Tz+bsPUVl0cVg+Ep97vitY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U4NBE2fdArxrWYzNJ6h0GYRbSzTFl7wiWfe/foAZZwVXPo+TlwUhtrLlgxdLQZX6V
	 8z4Knu+A95VvYkDPuBLh34UeaAL9kk4QGjLYu5U5r5eXjTc4GP3wzQBoygBd9hrDs3
	 5qIZp69WGJNKLjzgdjeLutb5vELl/2+lRkFa+fy8VaZmEwy3F6DfQNgNSqF6bHV+74
	 Za38XRIq/ZhjdxQs6eX9gQUdryxU80NnNJkknFjhiLmkr3/yC/DYIsaphvZKSgOIh9
	 1qtvppZScjti78hYk3KyJ/Hd+r2Zz0WW4poj3sFM3ZJn5fKCtc6iHSGvtDBTxrgUK6
	 yaexMygzSYdbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 023/153] i2c: pxa: fix call balance of i2c->clk handling routines
Date: Mon,  5 May 2025 19:11:10 -0400
Message-Id: <20250505231320.2695319-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index 35ca2c02c9b9b..7fdc7f213b114 100644
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



Return-Path: <linux-i2c+bounces-379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 145AE7F4A55
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 16:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4611D1C209F4
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 15:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF115647B;
	Wed, 22 Nov 2023 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKVL98Sn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB3C5102E
	for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 15:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC25AC433CC;
	Wed, 22 Nov 2023 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700667149;
	bh=Vke/WsVUVdJfzO3oG5YqlpUBQ/G44MKFPXW5jDOVGBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKVL98SnNQuRB63QjXW0y6l8J0ukXcSIFKUkBaR2A8CAzGULLbtPqTdRPKBm7ddwa
	 3qIWH1kQLAeSkb8Ie/MIbi3hQAsXvyiXYgkMAqdqvNDMvBPYRRcxDfFBqp4OBI2xnx
	 IEMr3hdoHOLvCNfp1kn+0V65aocB41S47vHhVuTVSKTuNs/z8VfIaWHYBHcIBnitmQ
	 F77cMv7k0w8Nu9ULH2vKuKdJ0x6hTDL34VOmfZ3KOFBlbGwII0mF/C2UYeFiipd0cO
	 cHvZtAEPC+xQk+54c09y5gQp6Mhou2OGopQy9TYfqN6HHD6cq32aZGxKjItR2buRd6
	 PryH6tEpMv5PA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andrew@lunn.ch,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 05/17] i2c: ocores: Move system PM hooks to the NOIRQ phase
Date: Wed, 22 Nov 2023 10:31:34 -0500
Message-ID: <20231122153212.852040-5-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153212.852040-1-sashal@kernel.org>
References: <20231122153212.852040-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.2
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel.holland@sifive.com>

[ Upstream commit 382561d16854a747e6df71034da08d20d6013dfe ]

When an I2C device contains a wake IRQ subordinate to a regmap-irq chip,
the regmap-irq code must be able to perform I2C transactions during
suspend_device_irqs() and resume_device_irqs(). Therefore, the bus must
be suspended/resumed during the NOIRQ phase.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-ocores.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 041a76f71a49c..e106af83cef4d 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -771,8 +771,8 @@ static int ocores_i2c_resume(struct device *dev)
 	return ocores_init(dev, i2c);
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(ocores_i2c_pm,
-				ocores_i2c_suspend, ocores_i2c_resume);
+static DEFINE_NOIRQ_DEV_PM_OPS(ocores_i2c_pm,
+			       ocores_i2c_suspend, ocores_i2c_resume);
 
 static struct platform_driver ocores_i2c_driver = {
 	.probe   = ocores_i2c_probe,
-- 
2.42.0



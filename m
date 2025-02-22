Return-Path: <linux-i2c+bounces-9534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63477A408C1
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 14:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25BA2420DFD
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 13:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E47141987;
	Sat, 22 Feb 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4q+Ybtj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D213AD11;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740231523; cv=none; b=P6YmAHR2gAZdq+OPUJZ+k3/cJV3adIQw+833O8+dTHprq4+JpQm+Y7arajwJSnCpxHebymHvx/MVp3ZyqOFH+Gpsyzi0WNssaCO5Guxo/HlBUQT9zJIH6TTM80gXlHbFMLlo8aPxi/yLbV7CbQeG6gqAy3PUDFDcAbgOmszKk84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740231523; c=relaxed/simple;
	bh=3b399MgkPbalzkt0UKL/iAOTcLxAkop81OzJJhuZ+Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2GNrwZGPd1+8YnlIghdbvgIYOOfvOGam0amiJCUB/tSmIAtaTr88Bgjs/YpkBF+JF1wGo2O+sQ+aWQnjhV4IIXN3jWGnrDw9yzSYuOI+0/1Iau9Mj5XGUIgkk1OLIja5hcvCJW7BD49irzBLVt7jZL4e0h0cm35cuzyq3CbsmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4q+Ybtj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D15FC4CEEA;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=3b399MgkPbalzkt0UKL/iAOTcLxAkop81OzJJhuZ+Qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s4q+Ybtj7eNZQ0gHWEM4mrhT5OZ5IHP4VQg29ucZqQ7rG2UtOHhHajlwxnaesYENz
	 NoQogjKJVa3BpJPJFh7YkRsv4WhDpiMXmGZPRMGFwCbNd8+zgBf6wfERZ1itsxyXQ0
	 XFnKFUrhnGHqb0Z1/FcjlQOkXZkTcz8LmRrlxzqccHYi9ZBrA0YNZGPr6TW2kJgGbD
	 Esm97bCU05N+ABKPtOl10s3g/kmWCg9bmi1Urpm0+XWXrnGU/46ZVMRHI15JVwIWVl
	 XilqBoMGVdrBNkHE0xllGmfOY/M26Kkg1UDXHSf214+hRcSCALiYdMqz8zogTOvt7f
	 8/RJZgv2qb8lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60716C021BB;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:35 +0000
Subject: [PATCH 3/4] i2c: pasemi: Enable the unjam machine
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-pasemi-fixes-v1-3-d7ea33d50c5e@svenpeter.dev>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=2vIJw3C8UuzlR0vDYIDEMzK/yjJe3TCpkfiUQCAlb68=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy3GzHj/dEP3xtk/58bMGC1Ys+l3dfPtjVbnC09wJz
 A+sr00M6ChlYRDjYJAVU2TZvt/e9MnDN4JLN116DzOHlQlkCAMXpwBMpPMyI8OxM6p5HBcKLa7/
 X7/syeXHrYtiGiofibCW1W198dqFXfQ5w19Z0ZporoRI5wvvvpebbs1Z9PQ7Z0SBR/BzDuu5TXW
 zL3ABAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Hector Martin <marcan@marcan.st>

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 770b86b92a10..8f0ba975172f 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -73,7 +73,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;

-- 
2.34.1




Return-Path: <linux-i2c+bounces-11391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18603AD7D23
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2217B18945D1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D26B2E1757;
	Thu, 12 Jun 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kA5XHzVq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0962DECA3;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=fqDiTfLpZEx5x/HEkWirnXEAA3vvZaYWtkmlS6W+82EArLueAZLG7ig6/3lLNLaa+o2JkILjR+hRRI6QGbkVosQ5rA7RhL69OEdpunSTXPtk+zaQi8RBe9Wb+3HWST3NBjdLR+kJbDC6FCe2MrCDBuxTU0UWv4vh8J5AJzL3qvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=F/Z4decNsz4B5o9bV+TnqdRPSE6G0uWtE1olsYTJyJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfKlm5hbzGLodH/mnyF9y8SlnYPtZYnXh0IVS0IcmQWl92hX5Qih23MFa4RzwDEQcdmNj1FEn8KJTmoIEEWmzCMCaxSVuFkWI4bfV68mDCM6JeODcMliCYfa8jDz+M0op7vibLkwPz48yZ/RC4VtJ0yRrvHYdDCoKX4bgsnqfFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kA5XHzVq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C75B0C4AF1C;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=F/Z4decNsz4B5o9bV+TnqdRPSE6G0uWtE1olsYTJyJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kA5XHzVqJvgGcVKM9DXo7DqZXxZRzPNluPUT67R3nqfpYeewQtfAdlM0Lij/aERAj
	 jqplxG/MYLbXxhcd/DB1QJVt5TT0666VO6gvruTPFZGCpwFDaHL5PUX1KJEwXgyZ8X
	 e4fN4LVfF8DRBJc4YjfCEzGNvxCqrrDs0m8DOqxSdTaVZcFoL6JLaAkrFKKtygAYJs
	 o4TXZKw69sNPcyJLmEwDezwdmY5vZJZUUjw65osYte2zTSUN7AJHBHkrFBIQ1fIB65
	 LLX/jzFuc41sN8JRkSpF1kQNCXhEWgCIP4HfvdzN7Sn/JeQJAmLrzy3hFmBK9PhbKU
	 Rj0DHmAxJ2S1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92EFC71148;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:29 +0000
Subject: [PATCH 05/11] i2c: apple: Drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-5-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=F/Z4decNsz4B5o9bV+TnqdRPSE6G0uWtE1olsYTJyJw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a309Tjlzsdfh/YrRvMdvlWd/X9b492KIXyqdx64bvnh
 ea2t4u0OkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATMV3G8IfjxgbDMtONC+JW
 vj3Zcn/W0gvHX8tm3fhgcvNZsNPBjuRbjAxL6xJk8nXf2sqf7lvLznvmksb5tFtZEtVWLD1LZf0
 8zJkA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

When the first driver for Apple Silicon was upstreamed we accidentally
included `default ARCH_APPLE` in its Kconfig which then spread to almost
every subsequent driver. As soon as ARCH_APPLE is set to y this will
pull in many drivers as built-ins which is not what we want.
Thus, drop `default ARCH_APPLE` from Kconfig.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/i2c/busses/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 48c5ab8320090cc383cea32337fb391c2b01a904..93440702b8eaf0fba4cca337eb2fd2959801a570 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -992,7 +992,6 @@ config I2C_APPLE
 	tristate "Apple SMBus platform driver"
 	depends on !I2C_PASEMI
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  Say Y here if you want to use the I2C controller present on Apple
 	  Silicon chips such as the M1.

-- 
2.34.1




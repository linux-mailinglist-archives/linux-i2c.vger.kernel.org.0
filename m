Return-Path: <linux-i2c+bounces-11387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8A2AD7D00
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70ADE3B6573
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F082DECC7;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo5g9o6i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047522D8DA8;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=cbonydtdXjcHb139B0AnGQb0a58f+7U3bsDmXqCuxIYKnYLPFhSkLkfp5+RtYNByfGQ6VEbAJQxTYqFRWjYb0AB2MPa6WYdI0BoDzWr8N3tHnODih3Xb8icW6m6rekHPTR2vv3sYb+C+NlzcxHMSnAmxehmaerjYuAo+yGtMD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=/FOvHL4JoMW59flXeN8dYOocFIaMHLLAYyfKjZ5n94I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhM2Ojs0vqwa6NpSnq8jNNC31qjVw1i6bo6eHr1eSN8pEj56IUBYUL8frLJD6TNK8tqoWHg52vjeHjjofMdz/s0vh41OhNdmIwUHl5HOsUVnoP9OejhG4NHv15pku1/nnKsekVYVYlM87LdIpBfz6bF49Wm/5GUS3rViJ1R0RS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo5g9o6i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CB62C4CEF4;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=/FOvHL4JoMW59flXeN8dYOocFIaMHLLAYyfKjZ5n94I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eo5g9o6i1JomDM6VcBR+WurO2DOSDU/niQawU+oxH/fXYlNz37XffXLszSnqjqUEe
	 3Jn6L45WIH1Rl20iOdyGddZOwB3VsmB1g0fU383Dv564AnAvdYhPjcWqYbCUxJ6ONB
	 /cHKSflKTI7WSWOqjcO+E+8giyBPz0axluyyz8ho9xKC7a+FOqAhsrgq4CfNJyvreB
	 ZA+QNME+gpYZ2yVHv0NNFXilQahY082xCo8ITQ8gk1DR0z0ebYZSHNaPUYUugxxboM
	 XUzvdNcNRWJF1Vtt6T6vCHu+l6zupyPq1qb1GZYPJdV0X58Mswat3+7/r4GpoJl8uB
	 C9G0Tjej2amIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E476C61CE8;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:27 +0000
Subject: [PATCH 03/11] clk: apple-nco: Drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-3-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=986; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=/FOvHL4JoMW59flXeN8dYOocFIaMHLLAYyfKjZ5n94I=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a306Q4L2fzPrPu0KMm66q9vrjfcTsSv2dnxWFfleKmF
 tnzpXYdpSwMYhwMsmKKLNv325s+efhGcOmmS+9h5rAygQxh4OIUgIkoajEyrL1kd7lz5asWXk4N
 rwfitxTVZobZLD506GTIw/mSsuH9Exj+5z094fuhjFeg8LaiolDTXumOMpO4NYcmL5+62iNA47M
 NEwA=
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
 drivers/clk/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 19c1ed280fd7f6958a4144975337abe1728e1e85..561fbc9eef2d82133cab0f165c6c55c5e6ab7fdd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -61,7 +61,6 @@ config LMK04832
 config COMMON_CLK_APPLE_NCO
 	tristate "Clock driver for Apple SoC NCOs"
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  This driver supports NCO (Numerically Controlled Oscillator) blocks
 	  found on Apple SoCs such as t8103 (M1). The blocks are typically

-- 
2.34.1




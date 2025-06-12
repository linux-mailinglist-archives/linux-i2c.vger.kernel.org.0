Return-Path: <linux-i2c+bounces-11397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2E4AD7D24
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E7E3A6B8F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FBF2E2F0E;
	Thu, 12 Jun 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m35W7jBM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98432DFA29;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=aBbRfZx3VVz0njGRjggnN7ndi53NGvpYQif0UThQqGAc2GLwXeLLsySpjazQfqMA5o9Ghm8Wvac0Aa1h9BotRUmiw2U232oe55NJ3wsNFUeVWIw3Lhw4HQRdJDQqJIDTW3xMIYx2U+sRSadgg7nn0dN/34N88zrOsHy2tqqASV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=B+ULNUySL/tycF45z4MninBMMkdPrQZ7s9hDSWM0yxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVqg5lgQZ/qb5UnhRIU18hn804ba7F8YdsOC5orkRBfeLY5VDZFv6N5ENgfmWooHiAD9F8o4pUx33j7FboKh4Uq7ZpbfnzM7ST7lMbflQoisZLDyRYZ6BW/T/OhoWby0/iMarPO3wCipQjaa5KY+YPakly98rhymftLfXVDUmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m35W7jBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58A89C4CEF2;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=B+ULNUySL/tycF45z4MninBMMkdPrQZ7s9hDSWM0yxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m35W7jBMER4m6jU1aOYfYRGE65aZVPlqPralPHRh7vzQtkVF1PXTO0WdOCGKidAJt
	 m5uPMOOPI8JI0PQpqqoCnpImSVurGu1WI48v7iSXPL8PbaCzDT71OmiqZXkiPUbMOp
	 ukjvjXtK/P/1/krRa6H3DL1+ETLjQ4gsC1oCYqp07nkVbtbns1BGUGppQGenjAdJaI
	 wBjizqsFaDz254MXAK0PfyOOmAlST0X4r2HmBsxqD7FC78TblUWuUXkAA9g/r2SDXf
	 +zt/4oI6e0+XpFYxiV+Wy8cvW1be48RCNQ7vR5uPaX5rgbDFb7p2nlLR3ttuUhvfzX
	 jIRUYvyhTXEjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D429C61CE8;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:34 +0000
Subject: [PATCH 10/11] ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-10-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=B+ULNUySL/tycF45z4MninBMMkdPrQZ7s9hDSWM0yxs=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a30xydBbpqq5VXvmSptO66k2MZp11785gtr2j91R8CB
 z+4Rst0lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACZy4A0jw98cpg0xd0T3ip64
 w7XKZO5Mrz1FD550BPhdlurgZ9hxqY+RYebbP+6/fRZ9VZJTvKSwN+B0xcNfM58VqXYtWZGu86s
 9mhsA
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
 sound/soc/apple/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/apple/Kconfig b/sound/soc/apple/Kconfig
index 793f7782e0d721a1778a82e3515665c3f9f14ede..e9c777cdb6e39c5446f00faea0e617e51b318000 100644
--- a/sound/soc/apple/Kconfig
+++ b/sound/soc/apple/Kconfig
@@ -2,7 +2,6 @@ config SND_SOC_APPLE_MCA
 	tristate "Apple Silicon MCA driver"
 	depends on ARCH_APPLE || COMPILE_TEST
 	select SND_DMAENGINE_PCM
-	default ARCH_APPLE
 	help
 	  This option enables an ASoC platform driver for MCA peripherals found
 	  on Apple Silicon SoCs.

-- 
2.34.1




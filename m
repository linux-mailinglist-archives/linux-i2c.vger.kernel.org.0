Return-Path: <linux-i2c+bounces-11386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1EAAD7D02
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB8B37AE494
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACE12DCC12;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iiihbi9s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09112D8794;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=bpMR33PdQNw9cc4puy3I+g99EKKJc6hKnsmVGTIh+XCg6/YE64sLrEEQ4t0vzJAFTwfrbERJeaGORxvT8nioWrnjW+E9lBIkjNcQ0H6VguS6KRoLfpsRg8pmpd9h88qGOnquVxsr/9iO3nYbNi2pX7DTP4hE7hVQmJgPhw68ZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=NJlC89e85kPwnIrRRCWxs5BdJsq3vAE6W0Ymwg3gpew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PvzzpjVZrOzwObPREVKQht5euquvJu3KqSuGWpD9aCD+DDxM83OSR6ATRMq10VClQDaxSkIwDakGFU3q5d2W4356f73dRCgNvVVVZ0i4OaXoL1akZ6Oz+rH4kRsJtm28Stpe+v9vHIWnUKoBv4krwyRw4Vxcrn/77aBX+Ohtteo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iiihbi9s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66850C4CEEA;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=NJlC89e85kPwnIrRRCWxs5BdJsq3vAE6W0Ymwg3gpew=;
	h=From:Subject:Date:To:Cc:From;
	b=Iiihbi9s+/pIYtVo3kda9DFbAQHj1W5wOvWbbRaeqNxsjpNokpWuj6L45S2eONyuJ
	 z5ZjNdbX6l3tfFmftfHTp2/1teSRAWg/3EeiNYV+GJ4wmmedWnf5QH60wONxMU3lTy
	 n/rRSvlzhpTklFRslxFI2jWl2fc1S88YMZTYYDX0/O7KMgVMucqRcyeOTKlzCOYcrp
	 Dk80UcrIXXSOdPfmQmlfEosrkWM1jO1oLXrO60K6tLwQgjbUQW3Mx3aLF39efZBQWV
	 giDzstIr1fU4T6X5SZIjlEt8qb9eLedQQAgFYRM9atModgeD+cb+g6RVGxbR4XjaGt
	 kFfPnUccqezKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB4DC61CE8;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 00/11] Drop default ARCH_APPLE from Kconfig and use
 defconfig instead
Date: Thu, 12 Jun 2025 21:11:24 +0000
Message-Id: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHxCS2gC/y2MQQqAIBAAvxJ7biELw/pKdFBbaylMFCII/55Et
 5nDzAOJIlOCsXog0sWJT19E1BXYTfuVkJfi0DatbHohUIdwEO729I5XXMj9ZKRUqu+0smaAUod
 Iju/vPM05vx3OGPppAAAA
X-Change-ID: 20250611-apple-kconfig-defconfig-b558863a8cb9
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=NJlC89e85kPwnIrRRCWxs5BdJsq3vAE6W0Ymwg3gpew=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a3U6dZ4Ztcjq5zQonza32t3J9YGMQ0PjDSnbD/jIi18
 ITHgQc6SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABN5Zs/wP5kp4uxT2Zp2YWsl
 +cmOLgVCpo7J3D+thMpvP3pTXrp6IcP/nIMz18Rev6yRM+OVyuwn8YGHl875+rOvr9AyS+ldk5g
 6BwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

When support for Apple Silicon was originally upstreamed we somehow
started using `default ARCH_APPLE` for most drivers. arm64 defconfig
also contains ARCH_APPLE=y such that this will turn into `default y`
there by default which is neither what we want nor how this is usually
done.
Let's fix all that by dropping the default everywhere and adding the
drivers to defconfig as modules instead of built-ins.
None of these patches depend on each other so we can just take them all
independently through the respective subsystem trees.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (11):
      pmdomain: apple: Drop default ARCH_APPLE in Kconfig
      soc: apple: Drop default ARCH_APPLE in Kconfig
      clk: apple-nco: Drop default ARCH_APPLE in Kconfig
      nvmem: apple: drop default ARCH_APPLE in Kconfig
      i2c: apple: Drop default ARCH_APPLE in Kconfig
      cpufreq: apple: drop default ARCH_APPLE in Kconfig
      iommu/apple-dart: Drop default ARCH_APPLE in Kconfig
      Input: apple_z2: Drop default ARCH_APPLE in Kconfig
      dmaengine: apple-admac: Drop default ARCH_APPLE in Kconfig
      ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig
      arm64: defconfig: Enable Apple Silicon drivers

 arch/arm64/configs/defconfig      | 19 +++++++++++++++++++
 drivers/clk/Kconfig               |  1 -
 drivers/cpufreq/Kconfig.arm       |  1 -
 drivers/dma/Kconfig               |  1 -
 drivers/i2c/busses/Kconfig        |  1 -
 drivers/input/touchscreen/Kconfig |  1 -
 drivers/iommu/Kconfig             |  1 -
 drivers/nvmem/Kconfig             |  1 -
 drivers/pmdomain/apple/Kconfig    |  1 -
 drivers/soc/apple/Kconfig         |  3 ---
 sound/soc/apple/Kconfig           |  1 -
 11 files changed, 19 insertions(+), 12 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-apple-kconfig-defconfig-b558863a8cb9

Best regards,
-- 
Sven Peter <sven@kernel.org>




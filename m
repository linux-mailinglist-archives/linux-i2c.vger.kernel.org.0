Return-Path: <linux-i2c+bounces-11392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A9AD7D31
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E097189675F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7812B2E2EE8;
	Thu, 12 Jun 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB0F4K/L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F91C2DECA4;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=j3vnT2EIMRWa2aBOxZ+WdSLzDsK932h5Efx/m0tZI47Sqc+f6tTTyGL+5qTPjqmS28ufXfCBoSajWDeF1G0uV7vCqt1LLQOhKv4jxaVKcU6rJBoCY99KKso9/qcK7sg2M+zc5WZ88Cg+HKy+b6Fy09ew4cs43fBD+1+u+djllvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=f2vJ1VzynNUJ83xEH0r0BrVBF2l+dxGM7bRjxCpAZXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTHpwSjrTPJrSSNh9mxDV7JQIkyzmmKQWY4hk/oB6ZB0ETCgCDhs6dVH/wJCZlaN549vqb9ssV5MHOl1/OiaRhFU76NemoF9BYnDPtIKgVIBQ10z7iXBF9AkczaiaOZL4gHu/V1zVew1W4aVDyPmRzI+xM8vJ6kbFSOswm8Llbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB0F4K/L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD166C4AF51;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=f2vJ1VzynNUJ83xEH0r0BrVBF2l+dxGM7bRjxCpAZXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OB0F4K/L7lc/PtRHOqI0eRMdaNRq0kctxOUqZjpE9Q/Ps6RKplVUuMsSH6glkpqey
	 BYaiDbzKmrvuB/bYB4e3A2c25FTWW+fj5N73AzJm5MOowKsQ9sJiNQbyd68LveCi/T
	 xnEAtBRvqAti5YljKNAEUH13Qx/bkYUrC1+VmVVczsTBBrHLYgtkEdEZKz3z381AuT
	 6yDlvO/kfw0+/VWD9lnedqe1z+FIZqxYNi6QRQvs+tB4wvsqdluhxFVQAzugPVOuuR
	 d+b7wzV63Ezmi8qfK1zpvx3jLw20KVda26PhF0f2ZJkBiYfXdJE32HcIJm6sFOQ46N
	 e8G/H+IsbT/8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED25C71136;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:30 +0000
Subject: [PATCH 06/11] cpufreq: apple: drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>
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
 bh=f2vJ1VzynNUJ83xEH0r0BrVBF2l+dxGM7bRjxCpAZXQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a30/RTmaqcaVp+85SlLPYmb9cKfWvcKHVPJTr4cH+58
 Mba8jsdpSwMYhwMsmKKLNv325s+efhGcOmmS+9h5rAygQxh4OIUgIksnMXwT9dFNZKh4Volw7T5
 31edEetf94fJrK262MdAxKtred/8ywz/g0s5NPudk45vitnnr2a0/OUfpcTCHwrH94ke2XC/4qQ
 xIwA=
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
 drivers/cpufreq/Kconfig.arm | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 0d46402e30942e3d15e9aae757d27895c2568fe1..4346629d3bc094cb3317ddff8b45e12ae5c5ca09 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -28,7 +28,6 @@ config ARM_APPLE_SOC_CPUFREQ
 	tristate "Apple Silicon SoC CPUFreq support"
 	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
 	select PM_OPP
-	default ARCH_APPLE
 	help
 	  This adds the CPUFreq driver for Apple Silicon machines
 	  (e.g. Apple M1).

-- 
2.34.1




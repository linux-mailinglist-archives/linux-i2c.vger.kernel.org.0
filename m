Return-Path: <linux-i2c+bounces-11393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A1AD7D2D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA9C03B576B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B34C2E2EEB;
	Thu, 12 Jun 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lqm1mW9z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739C02DECBE;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=YLXIIWglsYVTRV3IAsQ0UCbfZS4I7C9IPOQED/uRsTifjqCPoZHCxlS+MllvgjkaFWzEN1GxJst4NeIV96JY/C/skb/pt6A5zzMpHAv/+7wsDfwKElcBXdznPxbNnh5eBn4arwSI/6X5rroX1r+E85kUKJ16pcKToyyc/Vvv7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=tyfoi6A3/hWKyBxg+7dQ9gWUnySxJ6hV0JWYh2NA5SY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPJjSwW3TqY0wUgOw5YQHj+sk9NxmD8Dsp0ej/Z450H17w/C08EUvXbi1IPkgMATTaqXPsixRG+OXN38etJT3dsbSF4KdCHdQf3zy3J9kHt5MOx6xCFpszXlo24diS1MfkR0Yfvj1uaKtziKL13bkyJJUh+1fq15boM1TxZ4Eq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lqm1mW9z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEBE0C4CEF3;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=tyfoi6A3/hWKyBxg+7dQ9gWUnySxJ6hV0JWYh2NA5SY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lqm1mW9zhoSi87OuQ3NBNdrXrH2pndZjeBBcCC06n+rE36Thzj+tq3eUHZhGrwHeg
	 9anWYUzgBu6dtA8ELYzcOqIWBmD9WbnChKpdjLUNhEumJLg0Y6s0J836c04w8pipwu
	 m8Qjj5ZkYGetH36ACw95NMXHAQCVBCan+lYBWCd8RaCx/VvalaU6gHTqcDbkSU0dQj
	 tLoKTRKi6GbZR/keJ/5TAeKLKT7qCE4d2V+iGVQDp4XKtakuMX10tLuORKgjVcVZ9G
	 NXI1UUPalEvI4PwUjBjmHbYlV90VnPTyaU/e6cD2eJTYUaJsql8fm76MXgdggcREWS
	 741feaYc18BLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A55C71148;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:31 +0000
Subject: [PATCH 07/11] iommu/apple-dart: Drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=tyfoi6A3/hWKyBxg+7dQ9gWUnySxJ6hV0JWYh2NA5SY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a304y5gocs3585cclobV4/76v+mRxML5nmhvmtlPK9y
 lh36mtSRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiKzQZ/gpeKXvIFiTHKB+Z
 9mjDcaF373RfOzuHbYt+5bXy7cnroecYGRZMSZoflsp0q0rx7wvjO0/e/U4Xci+7H2h64e+TaTU
 peSwA
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
 drivers/iommu/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 0a33d995d15dd759eb47705c00b411f1157b408a..91d0c871acc418ac5fede4f177ce3af97aef5560 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -305,7 +305,6 @@ config APPLE_DART
 	depends on !GENERIC_ATOMIC64	# for IOMMU_IO_PGTABLE_DART
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_DART
-	default ARCH_APPLE
 	help
 	  Support for Apple DART (Device Address Resolution Table) IOMMUs
 	  found in Apple ARM SoCs like the M1.

-- 
2.34.1




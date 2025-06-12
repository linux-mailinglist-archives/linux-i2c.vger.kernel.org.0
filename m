Return-Path: <linux-i2c+bounces-11394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46238AD7D26
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C06ED3A8F71
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8C82E175B;
	Thu, 12 Jun 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILb+w7sr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB32DECC0;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=LwOSKIVOaG/W6n681cQQi4vxWgUo/D1efRWpTHkvTCn2/Qg1FTIy6cioC4Nw/TPSku6BDitSAri/vjeUgPiYi/L7p/y/o7PCsZ1i2Ivey0104GcrNWFR38rQ3cjshkU1LPpkIsGmKXFKkb+T2fb7OO14x4sP+1Zt2UJAdL+WZmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=YLmWDKsoMcAj1FZaEwVkOxK9EAmBzZd5KoPvpjLJcOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuX3q4Evh/VNdhD6CSAhuu10OXywKLMsRMvv2k9Rbx6FkDLwJGXEuzh2qHFTxsdQ8gJVCDL1wL06SrfBGc9SjOO24jTlEA1fWzfYUApo6e33fouYw6ChrRW0oSUQfCIKqOgSWd2n47sDpY9qKlKqQIBHUla+1I9vPUHS+MNecIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILb+w7sr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22CBBC4CEEA;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=YLmWDKsoMcAj1FZaEwVkOxK9EAmBzZd5KoPvpjLJcOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ILb+w7src221ykDUIlgdnxftZvH7pDzQLP/oP119e29bcKTtc3Dyd/Vj2ALFMPc4j
	 dCH6K4e/wNt9AV6XUJPr0ALhcpnOG/VRmFarkc28P2/z9mQRwvhHLx6QLcfrSn7NN7
	 saoQKx8o1dzj/SMkzddTg+5pxgdmn2dHmzSoKPdd1tfsvLooxysXBeq8TCPNagpoim
	 2jEawWZX6uNd5Iwl/nMY+gS4dHUSlWWPv56RifRy+CosSDi9wFTk6laOTUKf3if8E0
	 1z5LBYVFXX9NXXPwwbHBsXerkIRaNVI9G6iWjElrpBx8BQOe9EBbh3WpATYN0s383D
	 0njfal/862z+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BC0C61CE8;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:32 +0000
Subject: [PATCH 08/11] Input: apple_z2: Drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-8-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=YLmWDKsoMcAj1FZaEwVkOxK9EAmBzZd5KoPvpjLJcOY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a308x5ms0KdxX5tjYJ+Vj+5Z5Y0a+jEJPxyPLHDGfmt
 WoFV1d0lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACayJYDhn5p5R+rBA11SHwMi
 Nsu6Gr/++XbFTaMtTNlxm/kPzgiKFWT4719YvrYm885Mtqi0lv7rPbL+R2V+MDMtXcYevXvGWll
 LFgA=
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
 drivers/input/touchscreen/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 91a2b584dab1469a3c907c0f1accfa10c4c4a3ca..196905162945d59e775c3e0bff6540a82842229a 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -105,7 +105,6 @@ config TOUCHSCREEN_ADC
 
 config TOUCHSCREEN_APPLE_Z2
 	tristate "Apple Z2 touchscreens"
-	default ARCH_APPLE
 	depends on SPI && (ARCH_APPLE || COMPILE_TEST)
 	help
 	  Say Y here if you have an ARM Apple device with

-- 
2.34.1




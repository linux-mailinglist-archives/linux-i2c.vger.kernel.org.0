Return-Path: <linux-i2c+bounces-6636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC30977052
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACE701F257F8
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0401C1739;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqbMc3sS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562741BE25C;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165215; cv=none; b=cXT0T4OdeSwlVbC9/AfrKtpr6p/2Su6kajpZtH9uILH0M8+PU3mpC0kiPz3DbRH4W6ojSnpCGmPdyynht3ovlXByHuhC+5mijGpApiXqhj2Kc/wJhOdxQjv2EK1KpCWq1Y5OP86jtSfk6WacQtrDpjyejArCUakeHRjf+6Mat7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165215; c=relaxed/simple;
	bh=8dLWDvRZuiv72Q6TAOn6fVt/7YqsuabBUo+o+OGlMyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwP09Pkwg91UiBpEMs8XNakYvJHIA2Lk3C1mKOSRQnNlhUnjg/pNFifKq0cZnanDfFAm6CvZR48X+ukLBo+PJqgwbUfPV0CiGqOmDrCV5Gbp4Lw0SvFneVh4lotmaA35E7p7jxv5axmZZZi6e0+nF8JAhbN2szqVEsgk1+lpg0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqbMc3sS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCB0CC4CECC;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165214;
	bh=8dLWDvRZuiv72Q6TAOn6fVt/7YqsuabBUo+o+OGlMyU=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=VqbMc3sSe8XPTG4aKjwtiE7Ni38ETDWMg2YaoyQj7Ap+AW4yBW3ayi7HRhFroDntm
	 UUj2V4/FktWKGOjQwHeJCWz045YFBknAMWUsHrn/XnjE0+HsDdz7rzHJd9/OLCgXtr
	 q90ZrDsheE67UQeZrZ9jWZivro2/1ud8zeRFV993OPZShptIbUWs4qbHRhcFycZRup
	 q/YRQxYfdk0Gyv3lVZyuHI6KXM5NigLBVeitSvHP/5iY/2QVFvTeOkUOvfrs2RbwWq
	 zfO51uwg4F+NWYmvAVexw2j+KGwoxWb2nsoJUptPgbbd3LWfBoDI6XuV58xMFwHy1x
	 UFg7epqSnfPfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2E4EED63C;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:47 +0100
Subject: [PATCH 02/21] reset: Add driver for ADI ADSP-SC5xx reset
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-2-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=1107;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=6HpYjgEvmaMOI/Jb3fHri0mjaXqIkqikV6XKYOwo4UI=;
 b=IH2NvBCHpRs5VQkod2iVyDR1RXm8CLNExn4siWAW8bwa8goIT5CiqggFT6fdO8v5CDutT0SE6
 WCDnOQOeLYoANdKpXf80tUdcgMKb+KnMrk8RHqJ8/Q6xePGfmRj1xJJ
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Adding support for ADI ADSP reset controller. This driver allows
trigger a software reset.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 drivers/reset/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 27b0bbdfcc044ba58de9df09725ddef7b601c3ea..4d9e83b7ab38287336175d3804f9d2d4d2894595 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -4,6 +4,7 @@ obj-y += hisilicon/
 obj-y += starfive/
 obj-y += sti/
 obj-y += tegra/
+obj-$(CONFIG_RESET_SC5XX) += reset-sc5xx.o
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o

-- 
2.25.1




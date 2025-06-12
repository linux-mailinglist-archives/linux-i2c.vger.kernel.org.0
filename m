Return-Path: <linux-i2c+bounces-11389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC000AD7D07
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38C053A280F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F492DFA31;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvMMcEk8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074322D8DB1;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=gDmZQjsCyqWcSU4K0CQSl/CSaD7phrFFPNffqheo7wdMdLCFSMARmed7mIWy8phPKOS4pO120uYZxy37xk7lsOob43A0ZCufKh1eM1QVziNsfR2dvATj73+hstsCNEe5u97BSB78BLOl3NAgb3JhCIc2M+ZMNyjmOb7WbUHSOZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=1ktk8adW9Q8MazSYAza7zZHZaiASrCb+ItILUqRabHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrTHYsJA7DQnYP5VnLo9NSSifu7BSfAM1rd/nb7z600foBxf7EqEIFEcwcnXXSl3mJnyGtyg3RNZJj07iJAty9Vx+Ece29rvQ/UJzklRapFozra+qY4d1kWkTfy5g+PunTNP62qd4nKs9ZaKs79pqQi4wX0FXOrC92kFFdCNyNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvMMcEk8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E250C4AF0C;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=1ktk8adW9Q8MazSYAza7zZHZaiASrCb+ItILUqRabHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QvMMcEk8u/fQvarrIkABKL1Sr8sJ4PpHVmmyHsimR/7Y/mjdjIDUsFdl9qKLDph1I
	 L/wu7+yqGhzbO86W+ruA8SjcSeyWNY0qerjF7OSf2/jSAcX58HvuJAIp+ZWzmw/MJp
	 hd6vtbB31v0+EQWxUUhPUvkacQnOQR0ZINe+Wx8qxM5rDs8zzzTschUy/KCO3bjscT
	 wrWMjlyjx2vFGot+lnlXRS1deEAy5MYxlZA29E/RlBYVJTJheiu+YsX69EnT+J7Pu5
	 Z+vd6WM4UiVYuSF89N/TltmWvzHZrN6SHAFWZ+kSeh1C1if0Lm6u5aOA2ZRerwkKGJ
	 2+Han4tqIOBgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDFCC71148;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:26 +0000
Subject: [PATCH 02/11] soc: apple: Drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-2-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=1ktk8adW9Q8MazSYAza7zZHZaiASrCb+ItILUqRabHI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a308QpomuvNzTHFunsvpOzQYPt/dn00ioHC64jf48yT
 /NcO/94RykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiU7kZGb5dbpp4bXq8vCdf
 5OnLvw7tjj8dxvdAOo4rMZeXQVJ1kywjw+8LG7V/apnUcOdNUrp44/RNV10J+9Rr36eq3JKtqb4
 QxAQA
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
 drivers/soc/apple/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
index 6388cbe1e56b5a9d90acad3ee2377ed6ac0d207d..ad67368892311bed5a94d358288390a6fb8b3b4a 100644
--- a/drivers/soc/apple/Kconfig
+++ b/drivers/soc/apple/Kconfig
@@ -8,7 +8,6 @@ config APPLE_MAILBOX
 	tristate "Apple SoC mailboxes"
 	depends on PM
 	depends on ARCH_APPLE || (64BIT && COMPILE_TEST)
-	default ARCH_APPLE
 	help
 	  Apple SoCs have various co-processors required for certain
 	  peripherals to work (NVMe, display controller, etc.). This
@@ -21,7 +20,6 @@ config APPLE_RTKIT
 	tristate "Apple RTKit co-processor IPC protocol"
 	depends on APPLE_MAILBOX
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  Apple SoCs such as the M1 come with various co-processors running
 	  their proprietary RTKit operating system. This option enables support
@@ -33,7 +31,6 @@ config APPLE_RTKIT
 config APPLE_SART
 	tristate "Apple SART DMA address filter"
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  Apple SART is a simple DMA address filter used on Apple SoCs such
 	  as the M1. It is usually required for the NVMe coprocessor which does

-- 
2.34.1




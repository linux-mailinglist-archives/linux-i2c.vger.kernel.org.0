Return-Path: <linux-i2c+bounces-11388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7299BAD7D04
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB8F3B723F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906BF2DECDB;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVmNVb2G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA12D8DAE;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=bXivmsp89UzwUOUJpajduQ7/QHNCBrOJ8MIb6KGkPhN+BKgHGKrU/iob8BZNn8Ak4O38uL2005U8p9NTy27bB5NT4UZhvoaGdfLgOS57FnfCmDkX6MoncTCbbX8FjzWeQdejlg93KjDkSvbfmpymLPZR60kJdgU4VtFWIgxn/Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=OOlbVfIgzSBqrQXeX6P9ycG03p+lP2ZHx7YjgEpCU6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=exeibING0NtuWOdNKsYBfbc3SxUuTyyGod3xAtFK4x8LeF1xwAqQ9TOsBIeolFpc3FEKFfXwq2QRCkCuKnd4l7yj5cHcKgsyDIx2SFQzIFUTBwh/c//VIUq6GRDz8lmzv4cC9ZFG/uKFbp2br4If1vwI4jFGx90b6MtDeAkhZI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVmNVb2G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8277AC4CEF0;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=OOlbVfIgzSBqrQXeX6P9ycG03p+lP2ZHx7YjgEpCU6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UVmNVb2Gfw6soyav8Jw1t1IwyIz2kFnRbuRi3hmFF12qeTZUMUy5tTozoCDUiKMVi
	 oEBrxso0VJoAcEmJzA/yVAa/NTGp6St9onOGoTy2+frh21hxPqXhTvdQF4Q9s9Kvt3
	 fYJNnrH6GHUjk3tsjqvYosY+p17eN8lNq2vrZd+M66jP+Bv/qB3Q3YRw0EqVLqGnAp
	 F1m5yFZNrTFG2gym27EcynxVevQvMslRVAjpky2045VYi7H8iF+B7fvsFVcdkm0fkl
	 DyJ62B7/DdeEGtgwENgDH8eRicdujy/J0AHuRRmAg/bFp1p/xxfmolWK23eiMRmgFj
	 NHX0R/Tmp/Ikg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE42C71144;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:25 +0000
Subject: [PATCH 01/11] pmdomain: apple: Drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=OOlbVfIgzSBqrQXeX6P9ycG03p+lP2ZHx7YjgEpCU6M=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a304RI+5uRSxcm2H0JiO3dduZX2HrBD36b5tV1dlZfM
 EnjkDLrKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzk7F5GhhlGi+Uymmt3XJY6
 o5eV9aXOS3nGtZvsb97re8a/Led9msbwP7ByVZLoA4uPsRrqS1llrFVnWH9h/9D1rOtKQJZHCsM
 0LgA=
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
 drivers/pmdomain/apple/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
index 12237cbcfaa983083367bad70b1b54ded9ac9824..a8973f8057fba74cd3e8c7d15cd2972081c6697d 100644
--- a/drivers/pmdomain/apple/Kconfig
+++ b/drivers/pmdomain/apple/Kconfig
@@ -9,7 +9,6 @@ config APPLE_PMGR_PWRSTATE
 	select MFD_SYSCON
 	select PM_GENERIC_DOMAINS
 	select RESET_CONTROLLER
-	default ARCH_APPLE
 	help
 	  The PMGR block in Apple SoCs provides high-level power state
 	  controls for SoC devices. This driver manages them through the

-- 
2.34.1




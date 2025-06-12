Return-Path: <linux-i2c+bounces-11390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2F8AD7D27
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77C587B0B87
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604112E174D;
	Thu, 12 Jun 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACfor1YF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559F2DCC0C;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=JgsDn9eZbu5FdO6W4+ERMehQU5U6dAvbM4mgdGw2B0psnSj9dQ6UmtEwmauQqGf6jTLy/xngOCrPNgWc9e2nEM94BioncQMGAUCmjqSmQNxlVM3IHNBgnQUBQp+SM7vnUX/rOJGDYTx0SJpthhFZ07qOKEmsoyPhRg++wzS7SoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=fpXgaicKdFrQeAEZR+OxW2abaKNb7vcivYXBy1nvPSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bs8nq6E7gTdVDr9vMnGLB5Dax76Stjkn+5Y0iBMiuXt+H5DEwDA6nvpksbBItYJK6tp7S7oMGpK++mk/OM0teuwanMmMJh9jjPf081SbuZv1BAwzvS+s4q0vpXvqG17a+KhzXhTuU0pJQgeQ8JaQcYjJERPoaG8opMk0mlnDS2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACfor1YF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6BF6C4CEF9;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=fpXgaicKdFrQeAEZR+OxW2abaKNb7vcivYXBy1nvPSI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ACfor1YFhhOjLScqQiuTFP+IDgfpmfy7NrgT5UGaZGhgm7vHH8kZ7XVjq54Z3c7q2
	 OI9zkxbaqMy9JKx326OKRHMsnIUL4QGmrvge9T3FJ4G8hpMFiWHWz9ymd/aEIYXoFv
	 /YB34ck21DXGx/AMa20FmQBERMhVFbT/YC4c2UTcW0EqK6SetoI23NJsiiV9au8BP6
	 ENqcXMd1SmaNzgOlOdfz0hwB6ojcj5baWyoOPmzEIeYPd/xDkJ7oC0IYaM7n8XYoIz
	 9foP5brZ3s1Tjh3Zy7O8BI5xU1qUxNWAb2lcJ1/RSkkuJKe+IPwV5Yan9CuxQ+rA6r
	 7bip7TobVm0Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59DDC7114C;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:28 +0000
Subject: [PATCH 04/11] nvmem: apple: drop default ARCH_APPLE in Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-4-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=998; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=fpXgaicKdFrQeAEZR+OxW2abaKNb7vcivYXBy1nvPSI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a305RfC9buXhnFJeT7ZtXOyWKTBGNcT2RszDk+S+0de
 2zXh3OHO0pZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATCXjKyPD/N8fWXytyO9w3
 H9vLsvuOyryjh7QOM79euYrv9Y67GdKMDP9sbNttXszX8c1ZPtvgjVDNNqH+83FLjxxlkLlnnn+
 /yo4BAA==
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
 drivers/nvmem/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d370b2ad11e7eb3a3549a75edaada2d84c1e8dd7..edd811444ce5f4a1de1c59496f27bec417da2bbc 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -31,7 +31,6 @@ source "drivers/nvmem/layouts/Kconfig"
 config NVMEM_APPLE_EFUSES
 	tristate "Apple eFuse support"
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  Say y here to enable support for reading eFuses on Apple SoCs
 	  such as the M1. These are e.g. used to store factory programmed

-- 
2.34.1




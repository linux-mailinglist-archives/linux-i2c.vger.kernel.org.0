Return-Path: <linux-i2c+bounces-11396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC879AD7D34
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751013B3E1F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842372E2EF1;
	Thu, 12 Jun 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKKnAxxq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979C2DFA28;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=iu9l8w+GCRRYt/cFlSWSOwevwMS5SUKSzsSAuoSl5QifRhlb/jY36CJgzd/q2ZZ85ia+vTuGYuiyJI8tcv/Liwhw4KzDpqDvJK+avAjfZXv42kpnyCjTNRfpxOwkkzILLswfRqfxG9A5/BPZ225m2l43jLt2WtyHhgaXdlQu4tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=ruZ9l1GNZAWRjeIQuv4Eiiv8m1R9HWDfcuBW5YhBHWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oS28hBFBkz6nrc93gH68GxG/Zg1X+E3qLM99YWUmcIbf+zYe2vdPGwKF5qC7QosMvONI9ZBRgtL67xBN/GRrJi9ekLxBGF78+SJkj5NZp3Pq6i0PU4KWrGNO8PXmS3L6z1u6+Fd9Vr09GkZhvEVx3O74sXje7sBzsWJs/TdYWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKKnAxxq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F47BC4CEED;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=ruZ9l1GNZAWRjeIQuv4Eiiv8m1R9HWDfcuBW5YhBHWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kKKnAxxq5zYz0hV9jfumVcWaurrvlfcqVwdLcu7/ZykUyNxqWTDMI3s3G60WopsrQ
	 DbgMNySlQQjC8j8kFasyRrpj7n5CCI/bP4fHmO6nmXrWMkCLVpop0eek+UTgQf+g9f
	 dPplwDA6zs0EfU1XHMMB2bsTuabLoiwvjaKiJqsQzhlg9HUFfTGpitt908nxqYJ++9
	 tT5Dfp4nGi78pNhm0N7F9Lco8Vs8XtYSzAmMb5piwGENC7VBdBMBrartd2Pea5ePQ9
	 34G+5vrAPUbwjGb9w/3lIVE4QvMzHgBiQGKU2aRtgbKFRma9d8Llk4vhdHDYsi7atM
	 0yLTi1b7uZUHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D61C7114C;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:33 +0000
Subject: [PATCH 09/11] dmaengine: apple-admac: Drop default ARCH_APPLE in
 Kconfig
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-9-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=ruZ9l1GNZAWRjeIQuv4Eiiv8m1R9HWDfcuBW5YhBHWM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a30+yvLqee38l/3b2+TeeU+BRuhg/bhM9OmvNhrnPh8
 4Rmc6OmjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEhCcxMmzW9M1cf8np0cE1
 pR9NG5wf8W1dvvb9E2HhRYWqX8+wBn9h+F++lP2HRZOaqvN7Vq9jOYt0H+4X6X/J0LI4dtbFx0f
 e2HADAA==
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
 drivers/dma/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7606e40dc26ea41d26fcdd1fad979..7f387157e3c57d8c1517b55d86aa6d6e660dcce5 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -89,7 +89,6 @@ config APPLE_ADMAC
 	tristate "Apple ADMAC support"
 	depends on ARCH_APPLE || COMPILE_TEST
 	select DMA_ENGINE
-	default ARCH_APPLE
 	help
 	  Enable support for Audio DMA Controller found on Apple Silicon SoCs.
 

-- 
2.34.1




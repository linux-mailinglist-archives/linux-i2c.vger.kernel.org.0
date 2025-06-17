Return-Path: <linux-i2c+bounces-11507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC81ADDAB4
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 19:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44728188A1E3
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 17:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC592DFF20;
	Tue, 17 Jun 2025 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pge60F26"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6172DF3C7;
	Tue, 17 Jun 2025 17:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750181404; cv=none; b=HqEXPscOpwLnTRjceXjQTjoVULbVgzL7Aj3AqEjhXmfdZPOLdMzvzVtXlZT9BLvjgEttyQSC+fLPJ8rDuZB/g/+TO83DXKRYOOTgkQiklQxh78230c0uXD6VKHmxmKYZmghXcNDvTQ2NxRyCytiuHSkI8/76PgST3uXvuY3Yk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750181404; c=relaxed/simple;
	bh=U4h9R/89hdydTd3pc3WgABdUk8c1TST162ATESWxjuI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gYGeha6T9AzKZ9h0/xs+MeqF4DDaI3+CRw0j+Zt3Ms/mdXGTLD3VT8fYAF2t42rPZrZyvD/AWAwHfnWqAnncBldugHBpHrDRUK+tfQlwkMnxdE5uPdPdH8k9u8JHWdoplj0TBFMJJZTOrq7ijzPb5tTNoDroFFwUtG8a4kdepdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pge60F26; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C9FC4CEF1;
	Tue, 17 Jun 2025 17:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750181403;
	bh=U4h9R/89hdydTd3pc3WgABdUk8c1TST162ATESWxjuI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pge60F26PUoupxsVy8gGE2POWKr5Xz/YMH7bqFPTQtkSfAFsjHYYtQITlJz888suB
	 qZJ7MC4dRz07KdtR05IQx17vnCVNLfaf6l4TTcRiPsaYBsz4abI+lBV5K7cR5Sr3SG
	 N1xk1AlDfWz6k+jgZhoZUGAaqi+AZGwr+t9Y/vMRV/6erTXcc020Kcg/9rPME61n1i
	 +V/jVm4k+ntO3P+Ln1IHrTh7a/tT2WUoOENO4hXlwTIL0ieiLVSKKKEQf69WDtFXD3
	 2DGlRw3y5vpEjUGrlK5RQGDD8yoqMJ5wtgOdvutpiZfw8yDJMn18C3N2lmIYSYxGDW
	 pmJpNP6o+6cTA==
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Subject: Re: (subset) [PATCH 00/11] Drop default ARCH_APPLE from Kconfig
 and use defconfig instead
Message-Id: <175018139522.182101.4917904244547728654.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 22:59:55 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 12 Jun 2025 21:11:24 +0000, Sven Peter wrote:
> When support for Apple Silicon was originally upstreamed we somehow
> started using `default ARCH_APPLE` for most drivers. arm64 defconfig
> also contains ARCH_APPLE=y such that this will turn into `default y`
> there by default which is neither what we want nor how this is usually
> done.
> Let's fix all that by dropping the default everywhere and adding the
> drivers to defconfig as modules instead of built-ins.
> None of these patches depend on each other so we can just take them all
> independently through the respective subsystem trees.
> 
> [...]

Applied, thanks!

[09/11] dmaengine: apple-admac: Drop default ARCH_APPLE in Kconfig
        commit: de266931dd996fc2cb8ee8b5d12e39ea463e3f36

Best regards,
-- 
~Vinod




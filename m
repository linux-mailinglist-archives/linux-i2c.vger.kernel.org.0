Return-Path: <linux-i2c+bounces-11548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F92AE2EFB
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jun 2025 11:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42DDD3B3E1D
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jun 2025 09:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F45E1B4233;
	Sun, 22 Jun 2025 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUG2TJzd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC7318C03F;
	Sun, 22 Jun 2025 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750583656; cv=none; b=Fo71aa2nSDZ7IPchaKwTYOjRNjbTAZVM0hhM2ag5uIurMq/dVDtv9guHGRW5YhKqGOzK4RTTTM0vBSLG9WMpXgEJNG1r4c5ib5t6LbGzUS4oiOCbG8uEZO/1EuoMwXScbRwF5aAUCKCMRx/uRGLiAyAKLVD8c5B8rV9eFe3MFJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750583656; c=relaxed/simple;
	bh=FR0kk1ZyP4ATa4YOUOaLsb7MR+jvx6ZZw5j0miDtcgM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f0tJM1GcP2pBHJ1xrkbGkgBkQx0b1bP4ZXEeGz32HwidR34StckRV2Jw37f/4CGgpgTSNiHdXovZKrP0gKD/4bphUHhIaCsmY82lOQhxRxIdHPu8sd1rhJspa2Ruqv764dqZnWUyBHG0PVzqk20UrjM+gznK+YYkhd47ovSh7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUG2TJzd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90C6C4CEE3;
	Sun, 22 Jun 2025 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750583655;
	bh=FR0kk1ZyP4ATa4YOUOaLsb7MR+jvx6ZZw5j0miDtcgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sUG2TJzdERrgA1aUMcnNuFM/6Qlm/KqJZq20pmR2XvNqiOZxo41fyBzgYecB8NmGi
	 00nX4LvGveW7uZ7cIslW//6k5zfg/Iqwj89eytcAxkf8JkbGkpDZNOrsYSv/GRSnKz
	 kYmio20WPm2fmsA5ka972FkEPkgcxZIf2SjoqknRu76WPPc2Jkw1FJq95w/rT9OgAB
	 paAdmX2NoloQyHEAobczyCdWtntL5ZfZKhdxDiABT59xhJ+hk23EJngelVRLIr17aw
	 aKmaraDnxDg5UT+u03Ry0TsOBPcfitx40+1VhZ6e2pV4sIei1+qg8GYOGRNc958D6U
	 t/hH1Crz5y+dA==
From: Sven Peter <sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH 00/11] Drop default ARCH_APPLE from Kconfig and use defconfig instead
Date: Sun, 22 Jun 2025 11:13:55 +0200
Message-Id: <175058357351.73238.16083953894785363103.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/drivers-6.17), thanks!

[02/11] soc: apple: Drop default ARCH_APPLE in Kconfig
        https://github.com/AsahiLinux/linux/commit/65293c3276de

Best regards,
-- 
Sven Peter <sven@kernel.org>



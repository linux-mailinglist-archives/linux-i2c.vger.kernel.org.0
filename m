Return-Path: <linux-i2c+bounces-6725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3A97878A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 20:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C6B6B23FFC
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 18:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D3E136671;
	Fri, 13 Sep 2024 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXb2J3SE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F9012EBE7;
	Fri, 13 Sep 2024 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250889; cv=none; b=hHN//Xt9DKyggklxDXLI9nwyFp1KhweOwDfDXsYY1hE99vqiRoDMHVlYdCxtt1kEB/8cHlPISqMh+YjAksPsavvtsxrhmFOt4cFZzCnFQbT8TmdbrDGsIqkPJ+il/AMMU/tBljzch1JzCM1eEWvH0AA7A3qrxrUU2PnDeIcnM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250889; c=relaxed/simple;
	bh=pPgUGqSKrZW66jNavRtTicsXWsvkNovyg2p7zhV3gxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N6Q/OylH/aI8aNS53QIVRG2/P8fpOSTTQYye1QnOXKHbi3zvc6DTzR92vRmnz6W2zcdwe+dnalCq7s2GSUB4VRkVZ5yFeCfL7wVxJ6L4QjHbtKYDLSYuSLr6+Tc1MNzfGxs0iVSqYpUEXl8LyIArvHO4t0JNMYNJH425ZoWD7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXb2J3SE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDBCC4CEC0;
	Fri, 13 Sep 2024 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726250888;
	bh=pPgUGqSKrZW66jNavRtTicsXWsvkNovyg2p7zhV3gxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hXb2J3SEji2GtVifTGFvnzD6IPBGSigN4Pq0+Qz4KCrZpRyZJER0bFvZiFqkNGlFH
	 liFpZ+z3VUqFs96uPNIgWgQDxYpjQaz6wByUyym8mWE5DsR4S5/k7Pdi50ROqReK+m
	 iAkGKCPvYCGryPPCEE6JdPWMNoeehgfujSHPFUQkgSEon27SftSpnnTc2zK7xmS7hF
	 BRcncDSkZY8EaGKsuY7F1TXiupacTBggo3YoEbboRMJwYrdYwixpeIlmI2aRCgTxbY
	 FQS9XPonpVOJeUskn/fg8IYSAsIFPRqQB1By6iidMvEL19YlUcHnbZDsJ0qZsuGqg5
	 k5D6Z4kpwDd2Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v7 00/10] platform/chrome: Introduce DT
 hardware prober
Message-Id: <172625088498.70368.2332989625290315131.b4-ty@kernel.org>
Date: Fri, 13 Sep 2024 19:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 11 Sep 2024 15:27:38 +0800, Chen-Yu Tsai wrote:
> This is v7 of my "of: Introduce hardware prober driver" [1] series.
> v7 mainly refactors the code into a series of helpers. The scope of
> supported components is also reduced to those with at most one regulator
> supply and one GPIO pin. Also the helpers expect these to be named and
> so the "bulk get" API changes have been dropped.
> 
> Also, a pull request to document the "fail-needs-probe" status has been
> sent: https://github.com/devicetree-org/dt-schema/pull/141
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[03/10] regulator: Split up _regulator_get()
        commit: 2a1de5678944147c2a41b6006127d2d0b618e83b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark



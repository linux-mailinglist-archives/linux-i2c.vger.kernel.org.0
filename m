Return-Path: <linux-i2c+bounces-6202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F8F96C543
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 19:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3658D1F2910D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 17:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6BA1E132D;
	Wed,  4 Sep 2024 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCcOIJJ4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3401C4778C;
	Wed,  4 Sep 2024 17:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725470386; cv=none; b=CCLh3VZ8oadn6lvnpKxqCMnvmzf0GzCTbJW3v165gXl5PI+M2GdDrqrHx1ET/Gcw4fjM6QffaJLHzW8Q/r9E6kp3+HJbcikH4W5qzoGSNwInprpuk2zw1Rnf8S0WieHtCd0/UhPcGSPnxzxU7vXayrXJXIHa9Ee/lf6+Q6B/Bvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725470386; c=relaxed/simple;
	bh=7nt55skf5MkG+zn3hZ1jtUoFubnt7KYqSZXWSb3JOBA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SZktgk0z1Xn3FtIGrKsSbDjvyC7HZ+ihSqAjTd8fgcFZJoDLISWlOBPH9UCIo/jHXR+EMc3ey5BAhcI2K9K7RmqMey/2o4KW5UQzn4yqgBXhR/OKAa4oJ3OJDTcDBl9K/CF3MhYaYWiBMVtlJDfoAsNkTjRMjKalvc1zGPugqN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCcOIJJ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9C5C4CEC2;
	Wed,  4 Sep 2024 17:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725470385;
	bh=7nt55skf5MkG+zn3hZ1jtUoFubnt7KYqSZXWSb3JOBA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vCcOIJJ4KxgpPQAZGfnIzSSSWzE5M5l45tKNYeGP02oYvr5QSyk7ynT74CPgrJXN8
	 VHt5yWMgLdnNCjnFKfNeXitJqjdsBUxD4r3TLo0gDk4JC0asko3RJbtJLtJ7ATulMJ
	 cIJVYZFYdtWgswn6/GxmHkNYUxvDyAaSnUR8wq1knAw8shughKHPVjgnGuJD671PXM
	 n9WmSiYlUWdR/nhOLgGR4TyWzUM9BGBr18sUJGrvkrLMhhur/WvOf7uX51Dmctsqrg
	 reUMJ/cB4bWNGlaYhjwhFzD3o+wgwMdxGey/yEvDxOwCdNtzBPgW27bmMyS5KKvDlt
	 wRShNRiUxwlVQ==
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
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v6 00/12] platform/chrome: Introduce DT
 hardware prober
Message-Id: <172547038191.87336.8695106953397068225.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 18:19:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 04 Sep 2024 17:00:02 +0800, Chen-Yu Tsai wrote:
> This is v6 of my "of: Introduce hardware prober driver" [1] series.
> v6 mainly addresses comments from Andy.
> 
> v2 continued Doug's "of: device: Support 2nd sources of probeable but
> undiscoverable devices" [2] series, but follows the scheme suggested by
> Rob, marking all second source component device nodes as "fail-needs-probe",
> and having a hardware prober driver enable the one of them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[03/12] regulator: Move OF-specific regulator lookup code to of_regulator.c
        commit: b8c3255457147162cd713a319a8e2274335449b9

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



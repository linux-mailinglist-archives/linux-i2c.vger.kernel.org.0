Return-Path: <linux-i2c+bounces-5120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6D6946596
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 23:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8830283AE4
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 21:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D133113D60E;
	Fri,  2 Aug 2024 21:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LK8GNeGe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6621ABEBB;
	Fri,  2 Aug 2024 21:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635377; cv=none; b=catFGkR9eHbzUAxx+2mrHc4AZxqNcg0QVJN6iMo2sibnKiI/hapn4Ljh6UMTzTo+vcNs5AluuJp0pEsWQaiUXtbuwcDMZRhSpVpp82f0aKbMPYX/iJ9tt0O4u6TlnHyOYbOif0mWCL+EJpGR20YU2O0P+MTIB3FJ6OX36Ga8eyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635377; c=relaxed/simple;
	bh=8KXki3ZE507jcp3Uw+Zx1cRw7K8NBL2f5Z+CxVo9XaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rhsdCFVVHI13qFtydQEtG0a76Zw2cKp6LPWBzJqMet6sdbKbZBcle82/tMpHIj4b/f2LbG891cpu8rg2R5yB/C5tPZmhuGnUSvzQQtcrhDCFLFCdHPcyPMANysyCmXo3/CRRmoXBHAll70JqyLsaT2UpNFtWqW6AZ89+lHGt3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LK8GNeGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505F1C32782;
	Fri,  2 Aug 2024 21:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722635377;
	bh=8KXki3ZE507jcp3Uw+Zx1cRw7K8NBL2f5Z+CxVo9XaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LK8GNeGeUSoxeuqwUymkxA5pzFtD1V0UZqSZC9P3GT9qiVn+EJXLcwZHUvY2lKmD+
	 BnfAhKzK9GcrU9vbEm7y03dRcbZwbm448N4FTMKA3qTcbTPUON2T8Wx2Fr5jpXtsaA
	 gE9MopOBylLaJ6MF+S+cJiC7RZzs8N2ZIqW2eQFlwo2f85vINcRtSO8Vk0saaqyglF
	 BPTrx3xkvWlUIiacyb5cK2nbxEYBkxZyt/O1lSEOGI9DPlzw7WC+/jhZC5n4jS3DHG
	 QIv2KZXB8Z70vaVimCTVfGUqh78t/DUCJNyqNsh3uzSt10QKIe2ZsuHo9+prt2N+st
	 jfnjCjzmxCscA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, wsa+renesas@sang-engineering.com, 
 mika.westerberg@linux.intel.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20240802152215.20831-1-rf@opensource.cirrus.com>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2 0/3] ALSA: Add support for new HP G12
 laptops
Message-Id: <172263537504.136958.10336910404426833298.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 22:49:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 02 Aug 2024 16:22:12 +0100, Richard Fitzgerald wrote:
> Add support for HP G12 laptops that use CS35L54 or CS35L56 amplifiers
> with Realtek HDA codecs. Some of these use the same SSID for models with
> CS35L54 and models with CS35L56 so the ACPI entries are examined to
> determine which amp is present.
> 
> To avoid having to #ifdef around this code we've fixed the definitions
> of SPI and I2C functions that were not correctly supplying dummy functions
> when the real functions are not in the build.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: Add empty versions of ACPI functions
      commit: 90ec3a8a7fd0d43026fcca979713e077d4883b56

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



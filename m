Return-Path: <linux-i2c+bounces-3602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86638CA0C6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 18:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63628281E88
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 16:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAAC137C55;
	Mon, 20 May 2024 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7xoE0eb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E77137C4B;
	Mon, 20 May 2024 16:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716222841; cv=none; b=hGbKWsbQdkHCvjDVOzTit3N2FT7L+5de1QdG1Nda0zm0xS42LqkIpIcvB6nBz66ExMdRKowwjOBMpmdMs+EMoReyAhRHsabBbf5HRmi9TdexjZ0nMj+GTIqLvLi6RAqrJx8k/jjud4Fx+/Wjl3qtf/X8MsGsqZkFzLbZCMeR35w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716222841; c=relaxed/simple;
	bh=dhjXSwNavR9cyMzfQa7qIcQZ8225y2dbFBT8fnMXtxg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jqE89p5fz8eeU+cIbmSsWmnPVNcBDp9QKOUpS2YN1IinFfOaizj/RYYHN1ieTOmbii1FqLfPUYytaKQbKR9Mw72pvDreVxF0SzFU2WyRpzDyhclz/3k+LYENaaWXdSsirUIFkuTNQzpeNF1Vq+u/JaJRs4TDgvP0dHMVmK1QirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7xoE0eb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDD0AC4AF08;
	Mon, 20 May 2024 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716222840;
	bh=dhjXSwNavR9cyMzfQa7qIcQZ8225y2dbFBT8fnMXtxg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k7xoE0ebQm6KlKtRhm+/MtWngf461zBwRdUPNDAGm2ooeotk1jFsrhaFhYVL1vxBd
	 dgWD0SZQ5BDAzi6bSsigX7BHNsKT5LGInFYm//7qdw2ECoupNleOUr2ixgPyw3rqQW
	 oLfxGb8PjYCwcfv8Vnybf8C2DlTv3ot+ho1jo07aBte8lRY5mo8kAKr/hOgHYwohA1
	 HmlIPPg1LGruFKVWKSiSHTiKbExFc/LHsyLMaxks33Mt+GEyzMAHl3GXJM0L/mKEhR
	 9/cBAYukPpGBxizQIcOrNYSUrpWi2QV3fc5cbWFM6sJkhOJU0NUYelYoIyNrCzfVwA
	 m0iWxy0qGiQmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B31F2C54BB1;
	Mon, 20 May 2024 16:34:00 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZksWbctxiJmcNmg9@shikoro>
References: <ZksWbctxiJmcNmg9@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZksWbctxiJmcNmg9@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc1
X-PR-Tracked-Commit-Id: 068a95ef3945033b5355e50fecea18737680d43d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a07e09085e5cff1c8415ebd2ce9b087cf3acc73
Message-Id: <171622284072.31783.16840894349939315410.pr-tracker-bot@kernel.org>
Date: Mon, 20 May 2024 16:34:00 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 May 2024 11:22:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a07e09085e5cff1c8415ebd2ce9b087cf3acc73

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


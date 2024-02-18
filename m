Return-Path: <linux-i2c+bounces-1853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D55A3859882
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Feb 2024 19:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E06981C20DBC
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Feb 2024 18:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF8B71B33;
	Sun, 18 Feb 2024 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTwVBrHz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E48171B28;
	Sun, 18 Feb 2024 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708280529; cv=none; b=OFn98oZC4XmbNS9YoIdqmCC2CmF0UCNy74kei/63cEEHu1KJxRxL5465wTpOujkCdcuqzE8a4kOp5tZA+Z66PwHl5w9EGP8fkm6NJSp1xph6sdPto9PGKRE+Jevmu58Zk1pVSD4oBjeBvFxb2hZborlq3nZbqF3rvZGuwNtlVnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708280529; c=relaxed/simple;
	bh=stchlPjOi50JCsr7R53L+Z9xhmwS6tXkgbXS3bwzjDg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Cal0DDxArZcfE4XnVW7XPl8zPhyAx4zvh3aALp3NKXfRJ5oLV6u+3UJXdnN7Qz0KGJQGrbxaU9UjALHkeCyVR4KWKQvE47YsZLjdt/h3nUzPgDuyxmMNhpBnu0AEymorUXBhJry1GkK4JY19K/11AQckJb30T2CJIvZ4dU9DDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTwVBrHz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABE0FC433C7;
	Sun, 18 Feb 2024 18:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708280528;
	bh=stchlPjOi50JCsr7R53L+Z9xhmwS6tXkgbXS3bwzjDg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iTwVBrHzWRrM6wRjulmC/CNxtl0XOZLr3rzA0vQUlN86pLVa+vEgjcPcKsxL7ix16
	 GGsl/MgZLVMAz4BXYBJi1BN+z5/tkM9Fnh9jeKNTSpVhzKpsoz0e2oHLVkQA6I/mJy
	 c5QhSKT6WvnjcRO3US3o9wjhvVGE/uM1Ayj9SCyBPgtS3xzHEyVnUtYiAwtzN4gMb5
	 +zfce1OYo7qLaI9Zfbcy9oIalp/pmvwf1FuBO/S23A+b/Qpk7lIMKD/JzZ5+XQVAyj
	 hzIPZ0y7YLeNzSF5U0amRR8bTI5H07VShEN6jbw87n/4Lt9XDbQGYTJ5MUIaHwAVrP
	 vS6i0LarXrdSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9941DD8C968;
	Sun, 18 Feb 2024 18:22:08 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZdGpJm-eowSwd_ng@shikoro>
References: <ZdGpJm-eowSwd_ng@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZdGpJm-eowSwd_ng@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc5
X-PR-Tracked-Commit-Id: 67ec505fae32419354f4172c06c853def2541300
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 626721edeebd90df65691aed0df251b63c4ca4e2
Message-Id: <170828052862.10456.3865654851273739474.pr-tracker-bot@kernel.org>
Date: Sun, 18 Feb 2024 18:22:08 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Feb 2024 07:52:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/626721edeebd90df65691aed0df251b63c4ca4e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


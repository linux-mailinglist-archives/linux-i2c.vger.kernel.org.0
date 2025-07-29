Return-Path: <linux-i2c+bounces-12071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DC7B153CC
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 21:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADAF6562609
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 19:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218842512D7;
	Tue, 29 Jul 2025 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcs4nVjn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5F24728D;
	Tue, 29 Jul 2025 19:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753818317; cv=none; b=poi5LCk887LasRJXeh7MQjG+CgbkQ38FB959Ys5f/UuVyGAi6xRZRk9idFxIKO5JUoZh9atS0uTdQiiTLTt+YuCIztEcdMmttiKx7dtMJ7NiM76hobfsK98002dWmST88LjSG92AQ1HMFkw2CrdlSj7dLU0aPWn5iBjnFJKar4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753818317; c=relaxed/simple;
	bh=oUPH30Oqm/K/mgxC244jKpdF9qTeH2yxQ777G+iOYLE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cuMKZ+nj3UdKfvl9+GePU64sXtN4qpfQ5WU+2MetJ04Ox/jFxkFrqYX0k/ia62FBWxmgFKgbnAIQeMKzzpPyvJkGeFs4dbIL1EugP8CaOlrjtRsrkNjYN04jkzFdIYiw0+eK6BCyAaUOC2/zyzlG0jLCf8AmIT40HQS/beSgoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcs4nVjn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90C9C4CEF9;
	Tue, 29 Jul 2025 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753818317;
	bh=oUPH30Oqm/K/mgxC244jKpdF9qTeH2yxQ777G+iOYLE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dcs4nVjnyXvYFlEpGxk//SIDV8oiwMqHgOXBZjhpamBHObVc0EY9pA/tdvEDvJGlE
	 FlbrOUhk+5t258Bc/Q6QKccF/4LdATM/DGARs1P0MrPVEg6xBrggK2AWKqjeARutDm
	 Ymd/+LM8Buhw0FftLUroWs9ADcNxIwLSjpP+CBLGpHly8M9GO54htnXR8b/5S/gZzl
	 KgIeYHGrQ6QCtJePyhiF/cthOkRMksROKLjrdQrPLqa032mWtJEL4wx7iSDalfl+Aa
	 w8jZbNBwgODsg8teyBdjY4kYXr2bE4Cuzzti379A//L3fwggrGDHd4ZNIfOKLwkJH3
	 jOIX8ojrdvc0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CEF383BF5F;
	Tue, 29 Jul 2025 19:45:35 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aIiHbx_RBSMZ9av7@shikoro>
References: <aIiHbx_RBSMZ9av7@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aIiHbx_RBSMZ9av7@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc1
X-PR-Tracked-Commit-Id: 1c24e5fc0c7096e00c202a6a3e0c342c1afb47c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0ae982df67760cd08affa935c0fe86c8a9311797
Message-Id: <175381833362.1616007.16533532382051154601.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 19:45:33 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 29 Jul 2025 10:33:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0ae982df67760cd08affa935c0fe86c8a9311797

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


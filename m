Return-Path: <linux-i2c+bounces-12043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C27EB12CA0
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jul 2025 23:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B324E3047
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jul 2025 21:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA9D21C9E4;
	Sat, 26 Jul 2025 21:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKcq20vv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9AA20E005;
	Sat, 26 Jul 2025 21:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753565269; cv=none; b=hksZBayJ39IO9YhDHKjHlSDlmdvJXwDxNQncEbYmR/AHup9e6Ry/j8FTG5y4GNA9eDU9WuuewZyYAj5Ca53IDdpVFOi+NknFGTnwcj+/gD/7PSqGBmE9TVcOYN94Os3ER/WCq6S2R0mPP9ci/Em7dBpDceYOdlXY1g6+CWCdzIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753565269; c=relaxed/simple;
	bh=tfWg6QBgC80UWMJlkYVMB7gZHM1R2jW9m+kGw2QyqkY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mP+AhUruZRVIyBA2ae6l2eLSywjwS3E6M2q5XzysbGqd2EnaeyCI4LkZHJ0RTpS4/m8OA8M/lny6NCQb94Uff9tokgnuEsugAz4Mx5/nvmWga1mFQopgRyNvjSaGVFJGnxoxe4t9mACK9ajrhdms5+6MifRevLLUdxrJ9ust8t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKcq20vv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E586C4CEED;
	Sat, 26 Jul 2025 21:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753565269;
	bh=tfWg6QBgC80UWMJlkYVMB7gZHM1R2jW9m+kGw2QyqkY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mKcq20vvdupFnKiQ+UTtEeoIyjLiTJq3aJcEX1L2qiMKG5TstTAM0tN+OK8M/ultr
	 WPkmDoaC8VkyDG7ieTrO0WTxi2fSNJ3kJTnr30bdkWu5mLdo0aa1IxxTJMbM7Owrck
	 GdEtABwWaqRWjnnD2HEq04vHzawkrU3g1/FuKy7zazbJiB9bKmQIPhI8jskrub/pwr
	 f3E1Mt/imfpFMv/Lw+2c9Rjln0Pw9DLoh5xYO2GjBwCMqzxkOcfAir6eqVs7m1GyHD
	 uqY+p+6/qSci9pXYRZm75egwP0Eb4huodCC7ea39bw2y+1GlhMZj226EKCQElcPcCe
	 a45VBi6tfEMAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF00383BF4E;
	Sat, 26 Jul 2025 21:28:07 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <aIVDzXNdRsJ6xfK0@shikoro>
References: <aIVDzXNdRsJ6xfK0@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aIVDzXNdRsJ6xfK0@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc8
X-PR-Tracked-Commit-Id: 31f08841dd5d479458ee98bdc91d63910ee19861
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 513fc69f8fc7f85dfbdd35b6f59b6ef2da422e9c
Message-Id: <175356528655.3697799.5315598364720807171.pr-tracker-bot@kernel.org>
Date: Sat, 26 Jul 2025 21:28:06 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Jul 2025 23:08:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/513fc69f8fc7f85dfbdd35b6f59b6ef2da422e9c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


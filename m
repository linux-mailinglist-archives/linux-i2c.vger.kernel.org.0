Return-Path: <linux-i2c+bounces-9984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079BA6CD95
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Mar 2025 01:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3C403B691C
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Mar 2025 00:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49101FBEBE;
	Sun, 23 Mar 2025 00:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfWiWYFd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3A62AD20;
	Sun, 23 Mar 2025 00:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742691399; cv=none; b=CLjIh9906oKf94MvABitiFm95Y70JJK4J3FIlhTFQtitC7cG/wUjoJ+T7T9ZYMoabPCZSnzlnhgVBKzHGUNJ8p+wdL/49hsMNHAsm7+PlkU2h4PnAwsst4Hth3P1W8AELXNx7oJPyR+i+OCiw2yixdAf2+39uZQD4faG1cYVH8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742691399; c=relaxed/simple;
	bh=CmFBqHjwwPmp5Kl+CGb8ltrLz3Db7/thSNkWQKWXdfU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=d6jHXwdERqqVK4pW1MH5HGltumO5cCyhVlYHlxF3yQLmvI/P0QA3r2vnOQC6XWrRAKDqzx9oXf/KMlHUNxQkq9b88fmkDJAlO+CmiLHgJbssaVXKHLMj65zoPu+w5rJJ+/I30fLcf4rbC8g0pGZBDfo0Jj5R+T8jrSGEBpo7rq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfWiWYFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D0FC4CEDD;
	Sun, 23 Mar 2025 00:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742691399;
	bh=CmFBqHjwwPmp5Kl+CGb8ltrLz3Db7/thSNkWQKWXdfU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gfWiWYFdtl+oxMoSodDn5YFZFv5mtT5EdfDyjbtyhN0eZBGfbbSbMt25HJ8l6v2uW
	 s/6KjaHN61BBeflR0UyFNBVgts8xtRaMYGQ0a7vsqCSwuA5nfU9s9borJItEaRWF9M
	 VeZf1HwU0GUgHPBpD8YXtQbLvj+VQ3sPeEZb3pcTkbetrtR7uVT3EPj3FFAVcmUwAI
	 e/TQPgc54itLwwhJxOlEdkCf+pWhau+8J3ZKCT+ItdGoAfB55e2fGg7mHVtUP37vmy
	 rx2KP2ab9ZBWsMkLs6TXkNdqULREQFPCAms/6l+Sb9//K4nNCUavIU7n0UuR8FlzfC
	 3UI5vdX+/zWPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DA7380665A;
	Sun, 23 Mar 2025 00:57:16 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.14-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z988SQUTmI1q7TlO@shikoro>
References: <Z988SQUTmI1q7TlO@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z988SQUTmI1q7TlO@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc8
X-PR-Tracked-Commit-Id: 807d47a6dc054859eef90066516ae4f44fe22e6d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 586de92313fcab8ed84ac5f78f4d2aae2db92c59
Message-Id: <174269143483.2945010.12684281709217372797.pr-tracker-bot@kernel.org>
Date: Sun, 23 Mar 2025 00:57:14 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 22 Mar 2025 23:40:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/586de92313fcab8ed84ac5f78f4d2aae2db92c59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


Return-Path: <linux-i2c+bounces-12724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 164C8B48036
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1547A189A94C
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D971F3BA2;
	Sun,  7 Sep 2025 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRBIwdhv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2A1E25FA;
	Sun,  7 Sep 2025 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280192; cv=none; b=SRwdePSChwPGzWfgJPPg+xfwwyPavwENaDJ7Ef2Myufmyk7wAiZe4fNJwlAEwRLxCR4Lr2/iF5iYmjYa1dSLzym8WdMBG35eNS3WQnyU4mitP1uBlzSo1XA2lXSnZ/mVp7dpObpoehOPtVb7L8BTh2SW13pt7uvteNRDCnCb2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280192; c=relaxed/simple;
	bh=/SOCVnxGBJY8NuvaJTnJ40WAY/K8umlLB4OJK2Z9zNg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZeF7dpNRltdM0EjKUr7kZl4iM4I/cyd6N78ETA4dnf5oYTsz3jn/9BJb9nqvUdVJZsouvURzX+uQ4S1oGnyiueidpNUZCv81FctKHAGS48Of3Nt10gCsCJeqYMD8p1E7Lrk9bGL9Q+Uq2BfzGbYDXL+MKMlyjQImX9S2+ttokDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRBIwdhv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2733AC4CEF0;
	Sun,  7 Sep 2025 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757280192;
	bh=/SOCVnxGBJY8NuvaJTnJ40WAY/K8umlLB4OJK2Z9zNg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bRBIwdhvqA8vMna66AtYO4easlhKLIialMHfLrvTGQQbW1dqx/WCNXJZIpJsrKyL6
	 Bs4MrYp6WGBXGuvTpbZyMGoZhhfH1n+m9R/PVCaiS36LiTDeZlp99Kk0a45Yo0+clj
	 04q0Q4CLxH1qhabsRZetROm6KPDK89140Ax94u/jTdJPYglSCJ3z9nZ+59At4a5H+w
	 hyxJMT6S3fSFe9+mS/6uYIDSjN1zPvbUKAM9xImsDctkn7/tCH7phxdXLN0sgZcWGL
	 G00iUCr+nmAay0gPDS2VFtJgx0ePAImwX8PqnDkpvWXfO0084gXNyxdgErTBJ9TvJc
	 lTLR5VQsnCW7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34068383BF69;
	Sun,  7 Sep 2025 21:23:17 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <aL1lACUHl9td3dtH@shikoro>
References: <aL1lACUHl9td3dtH@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aL1lACUHl9td3dtH@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc5
X-PR-Tracked-Commit-Id: d035b4baebfc5112b128b66cafd45d2522a9c8f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd8f3bff4a5d4a2e7a414b033e5abb3c643c59db
Message-Id: <175728019584.3128559.12596237122414172914.pr-tracker-bot@kernel.org>
Date: Sun, 07 Sep 2025 21:23:15 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 7 Sep 2025 12:57:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd8f3bff4a5d4a2e7a414b033e5abb3c643c59db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


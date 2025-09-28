Return-Path: <linux-i2c+bounces-13270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538F0BA782E
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 23:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2B03B6F59
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 21:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27E129C321;
	Sun, 28 Sep 2025 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDdwcOvx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5FD29BD9C;
	Sun, 28 Sep 2025 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759093888; cv=none; b=i6apUGk7Xns1BsyLbdmwO8ydCI3Hofo6CsF4debs2ygtqUxWjYiJeObwp2dC//Wdyt1iaVkomPnSCOYyzgBHzns7okn/RG/UJVZmNksfJKPoU0eFxRB0y+zhrMsRYNJiQgj2GE5ihhzEsujAl5PXFBFTdzmb2D7m+/To/FvHd+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759093888; c=relaxed/simple;
	bh=HIRPpzBepCY56kCdJcjYpQgrM6/kI8Fkd02k2Od8+BY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CJBpNICqGWOs85tRL5k4H4c8CA3Fv9U248grcoxB01KLQyBJ6iNZmE64KJGBUFqvzLbl/UsgczdAsoQ1x3KPZz8WJ90cxnWqJwjQxyU84hmWv2z6fczGCQjLrZVXladuktBiMxKYKGQuN/xiE9wTSYCiXhAUsYB4tQ76K/fBSGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDdwcOvx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6354C4CEF0;
	Sun, 28 Sep 2025 21:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759093887;
	bh=HIRPpzBepCY56kCdJcjYpQgrM6/kI8Fkd02k2Od8+BY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SDdwcOvxdKMJjWZmMqeJTr8MPiQYt/NOgKvMRBVggaenOdQfF7X0+t6dpRBnM4Mtd
	 ySTJo+H1DoZ8fdIs3fxcBDAuf4jkjcn+7tdTF0fQvU4OgB3XvXYINV2LcEltr5vysY
	 Bv4tNO6K6oXJ1y+BzkK9NegR5sSVmR5SmUG4rl6GSTkGsCluBpI2RLbgTqnLvfVw8n
	 8z9b0x63VLNxc/iP93JzqmIZmro5DEk37Xpt0Vroz2cToxirEYzKaCoBRR8rdDtQwa
	 quXlHs11rV3s8SuQkPVNUGG6a/or7c5Lyup3rZ/hKxLqMKGKtN/2jcV9FFWAP+8c+v
	 u1DbK2+2Zo6Qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E6E39D0C1A;
	Sun, 28 Sep 2025 21:11:23 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.17-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <aNmCrm5PXQBhTnak@shikoro>
References: <aNmCrm5PXQBhTnak@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aNmCrm5PXQBhTnak@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc8
X-PR-Tracked-Commit-Id: 095530512152e6811278de9c30f170f0ac9705eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6855f06042ae8d134f96c63feb5dfb3943c6d789
Message-Id: <175909388178.612585.6745806310672027206.pr-tracker-bot@kernel.org>
Date: Sun, 28 Sep 2025 21:11:21 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 28 Sep 2025 20:47:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6855f06042ae8d134f96c63feb5dfb3943c6d789

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


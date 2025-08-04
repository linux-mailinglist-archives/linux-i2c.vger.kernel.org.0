Return-Path: <linux-i2c+bounces-12153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A3EB1AB99
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Aug 2025 01:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E70180F2F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 23:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8367B291C01;
	Mon,  4 Aug 2025 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bp8x+BD2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431232918C8;
	Mon,  4 Aug 2025 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754351617; cv=none; b=MV67bqfIV/1+vhPUbpCcd259/lQYsdrJTZKtUms3zfJgOPyNMQJWCLdhgGju7s5dNvh6jxSsvEzdjaFIbR53izSmA3E1xQlzJ/nHqBRCBvLTQlTPkeAoy8mEQ4rkWBhLL6kTcZuJCr3Ij8nDdk+9noWuaBtwHUMjqgZ9XO1epws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754351617; c=relaxed/simple;
	bh=mFthVKJdEAarrv73uF3B53vvxlU7zyB6T5aMXTPtS+o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=R6IU4VF6OgNp+YJH29WT/cw4xJeQHPuvLQ7vMRNZhsDkFv4JD88ZRcAkFBABwhlHHoADj550i6ToU9EEiVbuLcvMBkk2btD8q2OvIxg6xOpkHUiaxKWz0pl5a3ymEAvjp31e2+EzsebTUuzf64oIXOh7Ud7gae4mPtXk5pE2gw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bp8x+BD2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21089C4CEE7;
	Mon,  4 Aug 2025 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754351617;
	bh=mFthVKJdEAarrv73uF3B53vvxlU7zyB6T5aMXTPtS+o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bp8x+BD28mNO6eWxP+yeOQzWG4+FjMaCL0WBJ5Nziae7JnKPno/qtHcfF4Hk5UXaU
	 gIExZBxh1mAhd1h5fQCO0QrgzYI3DYdMlcGRsMPH1O4djeSL1Za9/QVya0lF+HvSqC
	 LcRyKEmXmb6xy1aD2pjkC/yiNPd3/wPZFCA8qaj450tiDHF134Mpj7xrX3QnqrgUwA
	 xopwR6bOa4EbVw4ivF7pPhI4EyPsyWpcVer/wjYnhTtWEMQ13RRFYuvYHYVgnbeaXL
	 Yu0XM4eFI9sGl6ByC/kap7rJs/7m9V+ZLCGTcmx4tFhdQMTXXTUH56hSKpvrwFFibC
	 r/TUjZB6Xh9Mw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE1B383BF62;
	Mon,  4 Aug 2025 23:53:52 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.17-rc1-part2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aJEryLi_zEByKKd0@shikoro>
References: <aJEryLi_zEByKKd0@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aJEryLi_zEByKKd0@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc1-part2
X-PR-Tracked-Commit-Id: 33ac5155891cab165c93b51b0e22e153eacc2ee7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
Message-Id: <175435163132.1391353.13297206593580398984.pr-tracker-bot@kernel.org>
Date: Mon, 04 Aug 2025 23:53:51 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 4 Aug 2025 23:53:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc1-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e161a991ea71e6ec526abc8f40c6852ebe3d946

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


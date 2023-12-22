Return-Path: <linux-i2c+bounces-969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78381CD43
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 17:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC8A1C21FFF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 16:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632BD28E0C;
	Fri, 22 Dec 2023 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLnP845Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272102510C;
	Fri, 22 Dec 2023 16:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E56AEC433CB;
	Fri, 22 Dec 2023 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703263918;
	bh=IDPUDBR2Ipzl/WJ10g03nBf5fHrP2CJNVIuikxf8Ex8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZLnP845Z0rf6S+T1V2+3+q1WDPAWnKR2StDWtYVh427lJR3xqlQKNlm/ZlZDpmScb
	 KCszF01kw4pnertr+6cjolIpYmsfwkv5Q4AasOFybhKWOGIwv08+9c5Ce9OFabcDPv
	 KqeMCOhE/Q4ChQCbAMQ/lqYhA8tj8+iP1HdIaHyxKLZKoGm5LLCgBKLo7Uks+jP+9v
	 dySd1J5NdkVXJoXV//PixNfMKFU0GdjaZDxg3L4uA3R+FRKSCwH9C/o0pSkl8wJhYa
	 9YYlHvQJb20DdVtHlufTprEgcrsd2a6Rn86XE6D0FjDZr8TMmxBBys+ufL188j1zVf
	 Ed69HtHgTDphw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D07C3C41620;
	Fri, 22 Dec 2023 16:51:57 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.7-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZYVsIwvSLqnn/BRW@shikoro>
References: <ZYVsIwvSLqnn/BRW@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZYVsIwvSLqnn/BRW@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc8
X-PR-Tracked-Commit-Id: b4cc1cbba5195a4dd497cf2f8f09e7807977d543
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2618280dedb2f3a35e51c158d31859276a8832b9
Message-Id: <170326391784.6925.567006587401808970.pr-tracker-bot@kernel.org>
Date: Fri, 22 Dec 2023 16:51:57 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 22 Dec 2023 11:59:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2618280dedb2f3a35e51c158d31859276a8832b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


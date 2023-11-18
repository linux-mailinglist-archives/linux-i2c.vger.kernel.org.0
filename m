Return-Path: <linux-i2c+bounces-239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF67F01C3
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58CBE1C20748
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7251F199B9;
	Sat, 18 Nov 2023 18:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvdLYxxj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF7A1944B
	for <linux-i2c@vger.kernel.org>; Sat, 18 Nov 2023 18:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89075C433C7;
	Sat, 18 Nov 2023 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700330529;
	bh=Cp3ymVXehnO5rOZTJj+Tl5Oo5KAkDDxENrgVcI2/IV4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HvdLYxxjSwV1uX/OdXfpZa+2R3ccxDQn4d2p20YnoXjcdrizbVCepdsNQP6pYBXZU
	 nqIaV5h9vHTI/UJ09Aw1wo3NmEasZc1N/+dGMyBdkH+Dl5PLSjv/VdPsDQj9uQSsit
	 FNXl+eAZKCG45t4i+m7aNYokMNQqSOFhkSt1qfgQuAs+h69TgcbIcnwSiFAr3SeB90
	 KsK7vuiihIyY7/gt6jUrwp5c8ZzSZ5XdtkJQJnJc/rx/VcppgLxEr9RttcGrjPBoIM
	 EnvMsE26/PyOnbeQXviq7JE1GczylXpzZKCnk59yiF0WSvMkSwmq/ufvlYtPfaIAQO
	 LI2RJ0OrVVNBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 77C70EA6303;
	Sat, 18 Nov 2023 18:02:09 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.7-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZVf/pqw5YcF7sldg@shikoro>
References: <ZVf/pqw5YcF7sldg@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZVf/pqw5YcF7sldg@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc2
X-PR-Tracked-Commit-Id: 382561d16854a747e6df71034da08d20d6013dfe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23dfa043f6d5ac9339607f077f2c30cd50798e12
Message-Id: <170033052948.28320.17704430633203725309.pr-tracker-bot@kernel.org>
Date: Sat, 18 Nov 2023 18:02:09 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 Nov 2023 19:04:54 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23dfa043f6d5ac9339607f077f2c30cd50798e12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


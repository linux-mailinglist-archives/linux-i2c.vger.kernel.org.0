Return-Path: <linux-i2c+bounces-1192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71B5826159
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 20:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ADB3B21A24
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 19:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB47F4E7;
	Sat,  6 Jan 2024 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hp89aJZn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131A4F4E3;
	Sat,  6 Jan 2024 19:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFAD7C433C7;
	Sat,  6 Jan 2024 19:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704570757;
	bh=knABKvhKNupnw+Wrnsnf1CjojhyoECqVOOC5GWJuBpI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hp89aJZn/16T+3l0dJ3u0ldOiMiDFFCqLNTbL4fMLACv/TIpW68QnbgOn1m296vpd
	 cB3mfvQJEiT72jWtc8o1yh7BivL2gkrGaG+x1h32RpM7mr876bMSOQy7+D1dUMZn3x
	 u5+Zo70WmdNuXKOSDjOT8jFds2AG4F99XqZCsjP3P52bDSmErMKiroBfmyf8XVeCj5
	 /Jf6kD2kxPNitJJmjViL9Y4Ge7bTuXbidShnQ5eg1popRAzgFDvegwwrj/Bn0STxTx
	 BTIsUQ9Su93h7ucYhWLh0xRiFN271IRZflKtqO0azKFLkdaYfigEDZvyZIFbmDrlrt
	 o7zNAvtqeHNQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BDEEEC4166F;
	Sat,  6 Jan 2024 19:52:37 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.7-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZZlUemoyS-PDZc0q@ninjato>
References: <ZZlUemoyS-PDZc0q@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZZlUemoyS-PDZc0q@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-final
X-PR-Tracked-Commit-Id: a3368e1186e3ce8e38f78cbca019622095b1f331
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 52b1853b080a082ec3749c3a9577f6c71b1d4a90
Message-Id: <170457075777.736.11033240330442140529.pr-tracker-bot@kernel.org>
Date: Sat, 06 Jan 2024 19:52:37 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 6 Jan 2024 14:24:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-final

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/52b1853b080a082ec3749c3a9577f6c71b1d4a90

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


Return-Path: <linux-i2c+bounces-11182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263BAC94BA
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 19:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31342A8071B
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 17:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA41823770A;
	Fri, 30 May 2025 17:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWsOX/yf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71492367BB;
	Fri, 30 May 2025 17:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626088; cv=none; b=tiZsqNEM6RAqWB062QY3rsV9uz31D6QzxgcCFX7R4uytjpFS7tuUBv9wRrY6Q3CGiBspKPfcLPy0Pn41YuFWQZWYJEV7gxK+nNvc+d7xK3I43N8Mi0zBbuDPvLtcJC792XO72gRUe8LLUzbY++vSGE+v9gQeyc1qoIAvnkRYVNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626088; c=relaxed/simple;
	bh=891xPZzJ0ARZuycB7Zn/UG369MrZJDw02j40JvIXjiE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VfgWuaGR4A6jZjTVbASApQTnoCRGOaunJnnIU6gOMUxKt97fs5ZTK7h5lCyiWb137ZZwnxuYo3vhszdpC7aS2tzHCs0xMj9uvffqygmb1PXIQOqFtlkhkpuB1XpR5iVVHAB/ayY93b3BBDGX9NDUR/nvO2jfQj+WztnEaWGgS6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWsOX/yf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F3CC4CEE9;
	Fri, 30 May 2025 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748626088;
	bh=891xPZzJ0ARZuycB7Zn/UG369MrZJDw02j40JvIXjiE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DWsOX/yf60+Iga2VaYy0K5lqUMU1MFmS+P9hngFYlPPKlzkvtbsQaqxPgQ61E1Lmr
	 Vtm3jj5cy19fRwzjnZQ6M/y1+u1yudSWogBX4Mk8uAwHCfPy1nZJwPxMDAmAZ8daUn
	 1PK3l60z6yUsf0w3CU3Bnm3dLBwJXdgXJIQUW3NjQaiAtYqoaIRozbBXPJ9+2B0X6r
	 Yxv+V92buRF4A3cFx8x9uDDueISj2sV/5RMQxU9aVo5nq5881XDO0hL/83Vrqrk0SJ
	 RuV3ZVfIHaRZF+i0CzKvxi6y5ymOGhBiAo0MlIOA0YQLOlC3RZ9e1ncjdKtxwU/S75
	 pdfkuQ3+NIBlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C0A39F1DF2;
	Fri, 30 May 2025 17:28:43 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDnYz2PB_euziA01@shikoro>
References: <aDnYz2PB_euziA01@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDnYz2PB_euziA01@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc1
X-PR-Tracked-Commit-Id: 17b7d785fc7fc94b94acc080e09de4b5023fbc1e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 883e3c9f40814377a239ca0becbcc77deab5ffe5
Message-Id: <174862612186.4033976.6799947837134303124.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 17:28:41 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 30 May 2025 18:11:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/883e3c9f40814377a239ca0becbcc77deab5ffe5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


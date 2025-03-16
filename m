Return-Path: <linux-i2c+bounces-9839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A950A63739
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Mar 2025 20:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1C116DCD9
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Mar 2025 19:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEB51A5BB1;
	Sun, 16 Mar 2025 19:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2xD30n9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC01249E5;
	Sun, 16 Mar 2025 19:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742153290; cv=none; b=hqSfSAmdGSg//Car4lJT5n+qlCIWr7o0wJOAhABgwTOhly6LNpNlsL3wDbNP1dbjbBY7TAfjqXyhhs7PtkD3qDrtgRzt/Yq2ozqZIpaes6DB+0TTZt+jJ3Bed4TRrNSUfa8h/CKT6/kC8vl6SOrPN4S/UAjF1Kd4vpAleFUlj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742153290; c=relaxed/simple;
	bh=ELchiGp4PLgqosdA77EY+wx1adhFO9OKYcv/K7itgGI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SGqCFOyz37tXYjoc0EUbqOEpqG8TmBaZrWRSsczY9TSDOG7+qToa3nz2iLIOSi9SRb930gwv2FFEeiZBxVYJUl0t4JnYQx07OtEsr6kkyjp3TH5Z3Wiv752G95407nLK3MTRAANu2eESp7ZrlRljsNxwb7Bz1qTzv8XzApnT0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2xD30n9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CEEC4CEDD;
	Sun, 16 Mar 2025 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742153289;
	bh=ELchiGp4PLgqosdA77EY+wx1adhFO9OKYcv/K7itgGI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=n2xD30n9iRfkbk6AaPkuJ55j3lXJNxpjGTMPLbSvmVt+EUizbeMqTm3cOIw+zrbMJ
	 PL8gKjiUEDkYtWm1cVr10KndtXoN+xUY89nQseheReEOY3nEcBzhUb/jH7ogtaDeu9
	 T7KR8jUKwpUQBAmq9mlsWme+acaQSR3aoXBbo43RwPAN2szJkWgMhVpZoImAa7HTs3
	 TI8pWzEIVWAXaWSzwgI8NG1SgeZjeESL97RAm7G22TVv6+oWWA5cwgx67Vc9+G5Wnt
	 I56DJre6ZYzoY4lbwrbrXWVehDy9bq12fytYJfEUbhR6j2BlgusL/5SsR+tgU0/drt
	 sDv4XxivWYM+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE6EE380CFF2;
	Sun, 16 Mar 2025 19:28:45 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.14-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z9bK4PAANPoIcMbm@shikoro>
References: <Z9bK4PAANPoIcMbm@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z9bK4PAANPoIcMbm@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc7
X-PR-Tracked-Commit-Id: 3ef18b236690af5f6427c5b6d8636881116aa73a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0990528befe86e538e51d89824c2c091999d191c
Message-Id: <174215332431.2863831.8329795964820370873.pr-tracker-bot@kernel.org>
Date: Sun, 16 Mar 2025 19:28:44 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 16 Mar 2025 13:58:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0990528befe86e538e51d89824c2c091999d191c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


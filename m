Return-Path: <linux-i2c+bounces-13615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F42BEA804
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 18:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 068CC7C5386
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 15:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9362F12C5;
	Fri, 17 Oct 2025 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1CYyMmb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FAC2F692B;
	Fri, 17 Oct 2025 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715034; cv=none; b=INWkMzHQtAMvqeE9lX+OY0E5mmle71JQKirxKSXILdHmPzjjuiQUYzs7CMqlxXRwCyjJ294m2vTd6ri9AsHB2iK4HnHfFbpeIGnzleDhCgYGc0DTsqIvupEpAO4oTlurjkUKIrKAAJ4j81G5pdcceJ0+/c/9H3EIw1oumkZ29rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715034; c=relaxed/simple;
	bh=JtFZucq3UWMjknQeOSD3WDXJGIy89n5xGOJFNTMMK9A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=D6Uwwvi+zmS1FwoqeB9EKttLG9p9IFN1Yb7BZPF205RpW2PBFVhYCryESDc31PagZnMAQHYnOQxEeDVLe0StoumR3MKaLAUNVSzqcEG70Cn+Ef3VJIIJZR8qC2N7bLhfbjbsTS/wOkf5Jl3hUTu+PyFda/+jg5G8XaeGoaGSznw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1CYyMmb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451D1C4CEE7;
	Fri, 17 Oct 2025 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760715034;
	bh=JtFZucq3UWMjknQeOSD3WDXJGIy89n5xGOJFNTMMK9A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=F1CYyMmbY+NW6eBmIZVirAZZuuJSeVrnctOA2Cz/Q821N+upYN4XiiNE2HTHZlITm
	 XKpdpGokqykQyPCvoxNgPzAQfReOjOmPW65epmtT1w3SlH+D4MvXzUCeeR6FUKVyHg
	 RmJVyjiisdAqIDo+82jAUi4Dw7ns3w6gTOkelTLd7Of0logxVOMt8GifpQPsb9UaUb
	 Yr2QtmKrEWtKeg+6+aFnl9SyR82BYD07DpQ8hPgz463vnkSwYP6LuEHC9IDAd+hObk
	 M5GwgQdAg1033aEJPBg9qRPguJDhbPJktHEs+yF/nIBDyB7OhFNabBD9MmqV8g+HUx
	 8WOLZNfYWWa7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3431D39EF978;
	Fri, 17 Oct 2025 15:30:19 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.18-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aPE9mCH-Mkz_RvV8@shikoro>
References: <aPE9mCH-Mkz_RvV8@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aPE9mCH-Mkz_RvV8@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc2
X-PR-Tracked-Commit-Id: 867537094124b0736ca2a40193de94fc5dc0b8d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 389dfd9db6384026fef50afdbf91bcc41446e032
Message-Id: <176071501771.2669258.18169315452033623198.pr-tracker-bot@kernel.org>
Date: Fri, 17 Oct 2025 15:30:17 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 16 Oct 2025 20:46:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/389dfd9db6384026fef50afdbf91bcc41446e032

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


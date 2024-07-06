Return-Path: <linux-i2c+bounces-4735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 509459294D4
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 19:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079C51F219BE
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 17:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F4C13AD3F;
	Sat,  6 Jul 2024 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPvp439O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF56A23BE;
	Sat,  6 Jul 2024 17:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720285564; cv=none; b=rAo6Jfax83Y7ZRpZy6UgApQ5TXkKjel9EVpc2LGRlZBOlAxyNNDZ7cMaXLl8y2rTvTO0xNgMLqAlar4KMxKpHQrivk9HgrtDuIIX5CrJttMqOLIxQwCRYDeNpI8BZ4G2lJ6FAYoGoxM4lYKR+wDzzbsXO9dkTU2OE9eZB3CxcCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720285564; c=relaxed/simple;
	bh=W6p+x8KlW82bU5GKRxa9zQCZbOuVX5ba+I8lOG2IMIw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HL+IaifgZcbWi52ZzkdI9dbAW3Z6OOw16eCyNDPRPUkg/V7JkscBjrWmBZvYs179hokB1BsDQ6i56MfmiOmxAHn61LvNd614En6tO2KzADBJvX9nHa7YdQbKHy6Zl3ZcWkEJNVT/1KsLk3D5bTKoPsQOM01X/V3HE+un2gIuovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPvp439O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41B48C2BD10;
	Sat,  6 Jul 2024 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720285564;
	bh=W6p+x8KlW82bU5GKRxa9zQCZbOuVX5ba+I8lOG2IMIw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qPvp439O9UNxNCmGkxRu7NU+IM/npyNguhYmF3zT0k2NvgSfafC2M/OOqaR2N/E+X
	 vOShLajCjgOLBb4oYxA92dKsAvJy++hv35v0Xal0yIkth2dgiNzbn9LbNCt+nFyrw1
	 8QSIWQwu1OjMGumSUVovmhQBMd09mfH5S/oKc4UM3LOdhV282aLIhAOunFqFfJ8ESX
	 +BUzFoGoYsEjFsi5N4fXDa3h+9KogQ1jBV6SrCyeJs13VAnWKh2/KPefDMN/9ylg/R
	 fMf3LlEJCav3HciV7maVoXTRSNN4gDYmuZbG6EoBEAF/0vdxXyVjGHRc2XzV0wk9KX
	 Z0O4LhRjNsS2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33A94C433A2;
	Sat,  6 Jul 2024 17:06:04 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZolEgp8R-JPRLYDB@shikoro>
References: <ZolEgp8R-JPRLYDB@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZolEgp8R-JPRLYDB@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc7
X-PR-Tracked-Commit-Id: b46803320c6ee2251de72d68f576a41aadbba17d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 22f902dfc51eb3602ff9b505ac3980f6ff77b1df
Message-Id: <172028556419.27276.1434904786329413244.pr-tracker-bot@kernel.org>
Date: Sat, 06 Jul 2024 17:06:04 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 6 Jul 2024 15:20:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/22f902dfc51eb3602ff9b505ac3980f6ff77b1df

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


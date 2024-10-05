Return-Path: <linux-i2c+bounces-7232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9299991941
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Oct 2024 20:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70EEF1F2210B
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Oct 2024 18:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1948015D5B8;
	Sat,  5 Oct 2024 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBhLWogN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB08B15A851;
	Sat,  5 Oct 2024 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728151669; cv=none; b=NqYepa762b/C3N8Uhoswp5NZOrSTnWgrZJqsITOjmuAOxfJ4vFCEA8PzHdzYKgXlR7WLYNLSnkiMfH53GmsxILC8zusTyS3TvjXLXkmDogh5PaZ6MWclekG7WqT5YZxF3AXUcB5qg4yJVAAryw3K8j9XLTtq/xujjFjjC93iD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728151669; c=relaxed/simple;
	bh=EGyWxga0NmAI0/HJP1kvBFmU1x8c5S9xnhdSVwLl2Dw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=s/jNFOi1R3C+ws3fGYcZbsb7VSgit8/S/ysoxxelfeeSZV98+3CdE0Qy+oiKQEYYEfihqECX/w+t30Nz+9tBGwQ7/Bg777BdAgu8iW9KM6wDRIE58Gbdh+u8y7tnxRzbOC1QLmZr0apfsNbil7pChOZh9Cb39S4Yh05gyLsOlE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBhLWogN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA4EC4CED1;
	Sat,  5 Oct 2024 18:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728151669;
	bh=EGyWxga0NmAI0/HJP1kvBFmU1x8c5S9xnhdSVwLl2Dw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kBhLWogNSi05gVZjpafi1WJ44RnYqgHzTL8OH0DwK6LSo5F5COtQsIV8rBXs82dQE
	 5y54BQ2+vISgd0rsck09e2Ez+wNCKzbn3uNLES9LTrtqrAaXaqWwkVSy3O8ri62lA0
	 AyT1wE3oglD93vMvdUr9WwnL4OlrT04dkFNUA2IkRqdP+AkaiPHlllSphu1W9xouJ3
	 yb9u5/U1TbqLo0rPi6xZWZb9zQU0foIZWxRrzq98kW3rnITK/KvE2SnaAW2Ap8hH5L
	 Uu0eNLDvjG1CSBys1DkSTHhxg6i380I58ijH1fF/ixFf0BMPGkK6aM45jDbOL+foiV
	 9E03eAIgXWa4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2913806656;
	Sat,  5 Oct 2024 18:07:54 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.12-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZwDrGmD29b0rTCZL@shikoro>
References: <ZwDrGmD29b0rTCZL@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZwDrGmD29b0rTCZL@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc2
X-PR-Tracked-Commit-Id: 3689245dedfd6157bb6060b62e523a68f1d674b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a28c9e12828adcc899a9738783f1380f077a260
Message-Id: <172815167329.3145223.16693439772059756230.pr-tracker-bot@kernel.org>
Date: Sat, 05 Oct 2024 18:07:53 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 5 Oct 2024 09:30:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a28c9e12828adcc899a9738783f1380f077a260

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


Return-Path: <linux-i2c+bounces-5054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E70793A4AB
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2024 19:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE50C1F23669
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2024 17:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35DF15885E;
	Tue, 23 Jul 2024 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKX675VD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCB01586FE;
	Tue, 23 Jul 2024 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721754290; cv=none; b=pm+zd353t18Rsvf4g0rs0vtZfrDNXPaTbtc4QRLRixeH+0VcQ1eFNDf5m9Nu8O1x9flbb8lPTD3OxY0t/AoBFFrX2oCpnPk4tulScXtAdYw22O4tQdokqm4dfYC0dmHYASWYovjFbzqhNeAmkiyYdjasJtlAO8WqoDB8ZAkkPYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721754290; c=relaxed/simple;
	bh=IxVfGpnY97wk+shuBTmRotfB9ps6nSQW8scVBM51m1g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=epIKgNTz/vU1/W7qPgN/1gMI5xvQqVCdByOSHY7loyfBS2PKzgkdR6tXOhbTxwsh99E/MiPD53gvzcSLOYZaBm+RB/ABsO1JEv6Sbyoj5X+SYLG/G+V3y2OZPWwMMIrJfZnmPO+pFOWu7H80A+RgBgZnT890S8jndcWLZa0sRxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKX675VD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DB55C4AF0F;
	Tue, 23 Jul 2024 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721754290;
	bh=IxVfGpnY97wk+shuBTmRotfB9ps6nSQW8scVBM51m1g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NKX675VD3esbCzkDZmGaCrI3ejTVTSrkNYRcWIleffXCUxOJkJDkvp6wS4ObVnx+/
	 3QEuSkjHmpvW0NUk4bI93RR3a4fgplsypFM2waUy+N7YQbaHrxpi1T6Cmz3HLtFVpT
	 iITKWII3L2hru3+u5hJy9EFynMODDQoIs9BPnhp1CeZ9uRNjHgNGMFNra8Pt20yApw
	 RU8gO/y2J5N9uurRgFASUQa8/YtGQGQ3VNyNtFK8NRnTwHOBcvDdj/ROPBhBUxEH7n
	 cW1rHP2pcLUidl/2fWtmidGOccRuhqF/3lLP5ZWfiLdmXaCpzP/dSV/TUDwWyzdPPo
	 2ULkBFLhGFgUA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54348C43443;
	Tue, 23 Jul 2024 17:04:50 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc1-second-batch
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zp-RyGae1M0Q9gqH@shikoro>
References: <Zp-RyGae1M0Q9gqH@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zp-RyGae1M0Q9gqH@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc1-second-batch
X-PR-Tracked-Commit-Id: 385ac870bdd531348de123d6790626ccd7827f69
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 28bbe4ea686a023929d907cc168430b61094811c
Message-Id: <172175429033.5236.4214288250634839624.pr-tracker-bot@kernel.org>
Date: Tue, 23 Jul 2024 17:04:50 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 23 Jul 2024 13:19:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc1-second-batch

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/28bbe4ea686a023929d907cc168430b61094811c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


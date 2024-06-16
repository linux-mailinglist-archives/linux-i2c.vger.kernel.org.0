Return-Path: <linux-i2c+bounces-4048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D06BD909F60
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 21:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6E0282FA0
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 19:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2F94962F;
	Sun, 16 Jun 2024 19:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgIUc03S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFEB224D7;
	Sun, 16 Jun 2024 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718564425; cv=none; b=NYx5lQMIx7rphym8c+nZ9QJaDRpWrfxGKO+eoeMoN/XMbtxCO1VWReSE3qamOprNtXuWUVkG710rt9B64xZJh0k1qOpNl3IIbZnEBlr/D0BJTgQ7OyDidpVEK7J309XHU/k8/ts/cRUZR6sqwn4dqLISUYvk52SeWY1m1vQoYas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718564425; c=relaxed/simple;
	bh=RysHMjjlLfFtsi3nNRkbbG/7wSBlm50JQ8pET6DAOIc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tmkeUJr7/zFw1QnIka0zcV3V1qFFM3pzzcHwW9obalGZ0mIEZspp5y1oMoPLOyML6wZTa6Hb8YqpPu7CcXP8gUJAXvcm9jUqxSnsuGKP4Wapbjmfb2ANkdAJ0kWHMuk2YRz6fiax2C+I37Q2pa3povvxRoI/ZetZSr3ly/z/ePo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgIUc03S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2AE7C4AF48;
	Sun, 16 Jun 2024 19:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718564424;
	bh=RysHMjjlLfFtsi3nNRkbbG/7wSBlm50JQ8pET6DAOIc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TgIUc03SHVYyMKht2NcM4IArQoaSx90Xz9T+0+p/adP7X0u6KP8rvgZG+fKIfcWO2
	 j8ghEZUG7zUB0h+EEV4kf/BbFVSmuWciU68RqHyNJahOj0ESUufSkg4vwvTlpM9o4A
	 e4Ynw738rtWgXrAP64ihm7U8cKoY0SBrddSef9i+3P0Q4H9L+yJyBPPU4GqMnLdX0F
	 PPCMPtATajv4wN/pG858h2q9ZtavymwxxLyh8kl/OeRa3fYmDPHv/xDn2IgKNYe06K
	 n8bmxFZJkrYCAhkAfhGVtDztjIhdcu8DI7My6C9w/oscbB0tNdNxnRRQ0EdZ7oRbdY
	 DUqm3C9EBVLrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8295C43612;
	Sun, 16 Jun 2024 19:00:24 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zm7D5wSXVQnhsPpw@shikoro>
References: <Zm7D5wSXVQnhsPpw@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zm7D5wSXVQnhsPpw@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc4
X-PR-Tracked-Commit-Id: 7e9bb0cb50fec5d287749a58de5bb32220881b46
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4301487e6b25276e0270a7547150e0304da2ba78
Message-Id: <171856442475.18923.17098889280993931387.pr-tracker-bot@kernel.org>
Date: Sun, 16 Jun 2024 19:00:24 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 16 Jun 2024 12:52:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4301487e6b25276e0270a7547150e0304da2ba78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


Return-Path: <linux-i2c+bounces-7911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3289C3503
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Nov 2024 23:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C837C2817B0
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Nov 2024 22:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B615158D79;
	Sun, 10 Nov 2024 22:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGYYnZff"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5681A158868;
	Sun, 10 Nov 2024 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731277136; cv=none; b=ZbNomFQ37rs+y3LYKmZTKlffs/UqKFrwO4muPB28QTTzmmBC7s3CRhbNsOCQqvUdkVCOnQ+zt04IObrFERqyCF7l4maaxM53P+DjfjEjbIwVHpjYEkndCVF4hX+b+xh3pvUmvEYfsBS+ENxQbGX9Lo2sv0vmbtwHD0BQhF3pIuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731277136; c=relaxed/simple;
	bh=PsL1lINylo33ZfOXuK/nWaDbyZF3nwSAMr7BMGPzn+8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=r1D3tWVtQV/4dI+SJu7CVzIXvPLLh1hcs3EtyG1G0slrlhlIqygPK2bzkLYSjt00lRuNSkW6mXG1jaRrZvSnVnaPmN844jBMEnim962ZWoQYYt8kP1zQXJQWZVvTo/8J8mu55fy3+fME4qXEPl6EUV00UQ9O8Pbq9iR1s/dmT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGYYnZff; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB37C4CECD;
	Sun, 10 Nov 2024 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731277135;
	bh=PsL1lINylo33ZfOXuK/nWaDbyZF3nwSAMr7BMGPzn+8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kGYYnZffmAfXeFs+DiUNc6nD1DXP6h/SxFUs48qiT9koFuPtsdNFjvOPrKcgAif1o
	 4g99GfZI0Vr3J4MXbbLvXhaToWQ29dUIKO0ErIlLEZU2aUxtY9Px31UM7OC3Hx68l1
	 zAOf4qJX+ZRiSeg6h+ohIdLCvl/uyOinn/Yk10Af3w3MlqWT5KSZoa/SYr2mAEJtrm
	 JfFFRQDFmcf7XATfZBK5ePB0FT0BOfGHEgXDn3sr2bDkXyC+ZA9RspZ530xpg/1kj2
	 BXgRs3F8cs859xaFy26OgZ6Z3gNSxPx9h200KuHbZW5vDpPV0rLkym+K0/U1lfMmhu
	 t9b+skg2Rht3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE83809A80;
	Sun, 10 Nov 2024 22:19:06 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.12-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZzD7sqWIYWBgRmKr@ninjato>
References: <ZzD7sqWIYWBgRmKr@ninjato>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZzD7sqWIYWBgRmKr@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc7
X-PR-Tracked-Commit-Id: 547aad93e00d5acdefb9ba6de2a7dfaeaf311475
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d7e67a9e8c304ba767c5069a9c1f0c8ca80276f9
Message-Id: <173127714557.3230522.7804392781207351802.pr-tracker-bot@kernel.org>
Date: Sun, 10 Nov 2024 22:19:05 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 10 Nov 2024 19:30:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d7e67a9e8c304ba767c5069a9c1f0c8ca80276f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


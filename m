Return-Path: <linux-i2c+bounces-15272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CDD3AAED
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 14:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 455C13008C8F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 13:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D823793C6;
	Mon, 19 Jan 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivUvEft8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0937A4AF;
	Mon, 19 Jan 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831070; cv=none; b=CGTnOGDgcRThYsP2gDby2jtqU4qEWXnmfOXt0NcG1YhceoKjJqgNqIDNHq6Bn1K0nApx5j57Rqwh4PLMRPHcSvkg2yTZUqxsF159HX81vnUEF1p95jJexjGTujyktaOmrd7dMwF7Vid+iRRZap0Uc+5S0yzKKqOCUwNXtLgsrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831070; c=relaxed/simple;
	bh=Y+k0nOYPFC1Nsh4irccc0JsNXxh9lWI0WHyxMlVnaQg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PtjfQCg9sGs3TdGX3s4NkhfdDxWdghC8p4IsZNIZVKMJjH+Fb2WGQRvKhBiOHh1GKh7CmDJiDdnm/OtyMvWe/lKItgbSd+7s3+Etwkqmctnyr/3Iq1X0IB9yNTbP/zDpsWx2+WHxsO7tyBg3+IyMCiPiowLtmGgrsOWgNqmdNfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivUvEft8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF824C19423;
	Mon, 19 Jan 2026 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831070;
	bh=Y+k0nOYPFC1Nsh4irccc0JsNXxh9lWI0WHyxMlVnaQg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ivUvEft8ys/nX1aF/XCI5vKcgNWkWhLZ8iUMjr2VGShTQeI+13g4RThvXBiRUHizv
	 daYUn2hIs2d+oAYiy0OPUQW/IHA4nT67M8iO6wSpRJTbnszJcuyFZuX4gHXd/qP2+I
	 nOBu0QN5A6zovy5bd9elGlv8z/JD8f7P+/NUu+4S2U982MWstwGp81rE9sn3972ALq
	 LP+XUv4ZsgTki/8hyYh8Sir6RJT1eqGR2toWe1tpyftM+3TjlfFGd7wLfYwEX4RdpR
	 /t95JCK1xMZdV/aVuZgTjIINC29Hc2x3C/Tz0tkfVK4IGZ+oOnsoYU+3zmAovUic/J
	 wB24d7PsKmMHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2B2F3A54A38;
	Mon, 19 Jan 2026 13:54:20 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.19-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aWyy5luqIRFzUma-@shikoro>
References: <aWyy5luqIRFzUma-@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aWyy5luqIRFzUma-@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.19-rc6
X-PR-Tracked-Commit-Id: f2a3f51365bf672dab4b58d1e8954926a9196b44
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d1765a96c66360bbbec5377ce7344d286715a8a
Message-Id: <176883085966.1423140.16674372646100075984.pr-tracker-bot@kernel.org>
Date: Mon, 19 Jan 2026 13:54:19 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Jan 2026 11:16:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.19-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d1765a96c66360bbbec5377ce7344d286715a8a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


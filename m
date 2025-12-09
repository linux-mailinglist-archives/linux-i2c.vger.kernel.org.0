Return-Path: <linux-i2c+bounces-14480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE9CB15C4
	for <lists+linux-i2c@lfdr.de>; Tue, 09 Dec 2025 23:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92F0C3009089
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Dec 2025 22:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838512DF13E;
	Tue,  9 Dec 2025 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZGe7TnE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8652D6E6A;
	Tue,  9 Dec 2025 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320793; cv=none; b=OG6/XOCSU6n+3MDcO5/dIal2gE+6U409CIVxGegfHU3OxQG9AlGFVsWtnVwWJl1fG6CSodDEP0ZGxX5O5fHDDGWeyvQVBpE7xQupFPiUt5BC/voJZlqqMwWyjLEq/BI0+XaTbZsf4OJwcb1lkIaejboASgGPiGJY6hB3CL2/3Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320793; c=relaxed/simple;
	bh=zi0K5Jz8VgXAhijHddiHQJemZZYTd6eXFEaY5do3Mj0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fRhmUldMKcV/jf3vguZiMVlpLGYqm9/Lu4hgYfU5pUBo7q6l27BoblVpIlMD+5dy213tVx9iGxmfgnFilFP5Nzqws56sw5zeHqV12SaPBNkd7VblNZtRIYZIEtY7zWoRsNrGf9h5O2xPXINhsfi+dy3thnZaPpNYNLauhQC/7bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZGe7TnE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187E9C4CEF5;
	Tue,  9 Dec 2025 22:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765320793;
	bh=zi0K5Jz8VgXAhijHddiHQJemZZYTd6eXFEaY5do3Mj0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jZGe7TnEHhJjrq6I3vRCLsPs9L8W+cVTxvIFug1pdwnzKm/uWPFspwk4FTODmcH/l
	 z0D+5Wq9e8xaRVaApCJ0Vaqnnw2AHHQImR1MXCohgN8seO43xqDQEOSzMxwSuyqOGO
	 DxD2Hkd8mmlatb2pcN5RstawjwVD7ZrTuNs7TDeDyyE+7gpPnZgE6qvSTZI7WoUwdr
	 2euDuCae8l/pDssl0k8rI18YBaVv12lJl4IQVK1UfmbhzXwxSGevFmDQVx5K6y/h/D
	 ZeFqjZfPl2jsHl11xeypLM70p/xFpBSk7vdtIiWN/3NQWODlKbOfoT8q8BIsSSTkJT
	 Jz3n5ZH+k2MtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BB553808202;
	Tue,  9 Dec 2025 22:50:09 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aTg1k4C4uGKMoiUG@shikoro>
References: <aTg1k4C4uGKMoiUG@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aTg1k4C4uGKMoiUG@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.19-rc1
X-PR-Tracked-Commit-Id: d202341d9b0c5b5965787061ba0d10daafb9d6c5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c9b47175e9131118e6f221cc8fb81397d62e7c91
Message-Id: <176532060772.4162034.2063297595290539741.pr-tracker-bot@kernel.org>
Date: Tue, 09 Dec 2025 22:50:07 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 9 Dec 2025 23:43:31 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c9b47175e9131118e6f221cc8fb81397d62e7c91

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


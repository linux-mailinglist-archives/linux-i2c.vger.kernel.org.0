Return-Path: <linux-i2c+bounces-14742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DECDA632
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB08E3003BE7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 19:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C300634B438;
	Tue, 23 Dec 2025 19:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2yly92W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADBE34B404;
	Tue, 23 Dec 2025 19:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519014; cv=none; b=H1+TdQhQ7fBU+TpxY07qhT+zHWD7foj4JOu3fNEahzOeRIYfz3g2D9euxzhT+yEkl8HaIvawN1vAIy7CHNVV9nTrnu3JBKojU+m0xgo8z5bgBkxwXVywlCdV3BCDvxHU3dVkEGqoESNVvANXJby7IsR+n+7SmKGJtkrdtLNdg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519014; c=relaxed/simple;
	bh=XRsf5A9Gxbnmfbbq5YrGy3ekbgmyr+fb5657YyWbBMo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZiAS3vvLlLBZaMQh5Jk8jB/idalcuq9TFe4dnRUEN7qpidyBJ8JAx0tiTA9ZIJgIuUljj+uEWssES2vDzztaPCxOx2+lDcta8nSQIYcpcNOtk9gDs1QHWSkTEKPvlJ2xlev94SUhpvcwcdA+Or+sgxUHEaxSQxab2kQFXhBRZYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2yly92W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB0FC113D0;
	Tue, 23 Dec 2025 19:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766519014;
	bh=XRsf5A9Gxbnmfbbq5YrGy3ekbgmyr+fb5657YyWbBMo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A2yly92WBG6PmHSe7Q8naJm0CAGLUVUNFCqQ8SOglRgRqOpkyzfJQ55gOrsp+kk3l
	 rxMIx+GbNeK57SSRejCvKVqHs0dGQkTCE1/XIolMM0r7XuPQeh4mgymWzgipZdtW7b
	 /+ilOjQ0jY/ArFvDxUk42gyM4k2ol5ssO37p/WAq0apIrIu7C9UnCwWtCHiXRb36vQ
	 59skqC0B+cRXLNrJ3Wt/QGB+VeEQPNMmMpNcYMlQcybAkYH4E31rmrUaIZF2+XL8xQ
	 nYsHF7lB+uIuJLtXO4TubaYS/rnav+AkMbmrCjSOIR+alxXv3pZt3xT6BJnm1/+0T8
	 f1d4SGcifyVPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 788173811A41;
	Tue, 23 Dec 2025 19:40:21 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.19-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aUhB7hs0HnvmZ1Bv@shikoro>
References: <aUhB7hs0HnvmZ1Bv@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aUhB7hs0HnvmZ1Bv@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.19-rc2
X-PR-Tracked-Commit-Id: 880977fdc7f67923d1904ee23ca75fa1e375ea46
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 765b233a9b945671ae9c5854e349ad50973a6837
Message-Id: <176651882021.1294228.8321611064169249154.pr-tracker-bot@kernel.org>
Date: Tue, 23 Dec 2025 19:40:20 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 21 Dec 2025 19:52:30 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.19-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/765b233a9b945671ae9c5854e349ad50973a6837

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


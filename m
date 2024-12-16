Return-Path: <linux-i2c+bounces-8511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 535679F277D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 01:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8502B1636B1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 00:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBBD10F4;
	Mon, 16 Dec 2024 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLo98IpB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35224360;
	Mon, 16 Dec 2024 00:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734307993; cv=none; b=b9l6oPg0ySgMDa32nl7AVbrwF1Y+TR8mKn0t31G3mdEX6DxtJ11Pw6PfwUJe2NPIQQbWsjnzeFcSnf8wXyD52JdxpqFq5BMqQiP4+o2WJ7gJj5yHp/X4ll5U0D9yscCnCB0ck6XjKweElRv1k2TNIRDMN2qWAQ/r/bQfSeMAz1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734307993; c=relaxed/simple;
	bh=4qsJdPCmLlS6mDMhSIQLJYEv1qg8utKSGbO/0stnhXw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NOoRb5GkQvUzXrXG5Rvvs+08I2jf6MbkBsEte04RuinxWYmLcYRcp90X3Ukk4gMSN+U68gVT854M02Y3yFE6yMhEe7EORpTikZdiHeLhzHpYa7XNIbjAl3j2whSTYx6ph8IeSqQKemBPV6hu477BmXvnTWB0LFCrGVTEev0mVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLo98IpB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCD7C4CECE;
	Mon, 16 Dec 2024 00:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734307992;
	bh=4qsJdPCmLlS6mDMhSIQLJYEv1qg8utKSGbO/0stnhXw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NLo98IpBLJE0JNfDlpTEEA/EA+eRC2yCJKrVEEUg0yI+jT1U0XWGib7zzDT5x3c6f
	 H+H+bZQP466N898LXOg7873SnYyyHpL4uinP8jtrXvEjAgx+VvLs/NAVxkpKGLn7wD
	 lXGBDaJE6TfZtfYLOpl6K74wutNXZHr+l8m3RL6fsTw7BiwjXmCu52W096CE+SbKUO
	 yqqVU7eMOpjVxCXiNYPprTE6ggiKyKpIs8eUBnJdDN9tLYbXLyzGxemRJrdxihtEt4
	 M0UOlH7rMjQiA3h3lWzqiSSDzYDG1uasBSALZ6hNU1KmujsEZKykpaLMspSHHobHXF
	 EJkY/jJY48TKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B19303806656;
	Mon, 16 Dec 2024 00:13:30 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z16Y0y5inb4t5jJm@shikoro>
References: <Z16Y0y5inb4t5jJm@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z16Y0y5inb4t5jJm@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc3
X-PR-Tracked-Commit-Id: 5b6b08af1fb09ec1ffab9564994cc152e4930431
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 151167d85ae5147dbe67842b702f0511052dc803
Message-Id: <173430800920.3608335.14459564623981829692.pr-tracker-bot@kernel.org>
Date: Mon, 16 Dec 2024 00:13:29 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 15 Dec 2024 09:52:35 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/151167d85ae5147dbe67842b702f0511052dc803

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


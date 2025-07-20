Return-Path: <linux-i2c+bounces-11980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D78B0B877
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 00:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DD2E189824E
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jul 2025 22:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036801EE7DD;
	Sun, 20 Jul 2025 22:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGPTS1D3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C2185E7F;
	Sun, 20 Jul 2025 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753049990; cv=none; b=FD1RsqfcijuVTFjXd4zyf8BmibNfrzD4GKHtnrvCYqdrnPlr4LT4LNw3qJoWfEUxyHnaJoqNWtQ1DEM0o4cJCbhbTfC0uiQk+hog+jjVpu2gMMJeFl21TshBtQcpH2EpLNj5h+gqN3PWicZ//+4TK1+evd2clNk1qXm/leyG+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753049990; c=relaxed/simple;
	bh=z1IDJALOKEAgpsMjzxY953r35KBK3MB9idalQhs2E1k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tpqK7NPxRdc4M+PAZuJixD2274FkT5w19rHjaARh9SnZmerMHQRwiN5UlCmYBPUDuZBXR2RuE13gosG3QBymAN6v2KPx/FwlbaZ+Y3ZifgwrNBPS9okcEEr8YfSwkDVYRwc0xpkjjJNpuVXsEYt7tM1FDGikQx5XZJ+SwxTWfhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGPTS1D3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E820C4CEE7;
	Sun, 20 Jul 2025 22:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753049990;
	bh=z1IDJALOKEAgpsMjzxY953r35KBK3MB9idalQhs2E1k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MGPTS1D3dhheqCso/CCo4Pup/+bxFKGhMfeR1bb+L6roh1z0nsNloGNOb2OBq9WRj
	 kgc6uk03kWPcU7cEViDgPQ79USrsmd9SHk9wht0vWrJ0cskuuoKq9Fob0KmTIwMxKq
	 64kaRHZ2KmmFtWOIEG3YmRsCb7kJxnI37O1xPFJUMZFq3SFYwJUd4H8BvCX1jlneN+
	 CA4Eb+oPnlEvIr85uwYuk3/16VYkxeu9PWOnru7lUtwNwYDpHcUnJgCwZMGQ6D3B7T
	 0T5F8IZi4cpg1v8H52k7CrQl+Fs0zC47FmlRH1p4BPR9Oj1Pc+74TahEKtlovOHf6o
	 prDSYKFQawypg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710B2383BF51;
	Sun, 20 Jul 2025 22:20:10 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <aH0xH_gZRIVQurDP@shikoro>
References: <aH0xH_gZRIVQurDP@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aH0xH_gZRIVQurDP@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc7
X-PR-Tracked-Commit-Id: a8780906ca2604c9d5128507e34285043b943410
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c10ee5cc1217c79dfa606c432aa95d5ee2e81083
Message-Id: <175305000894.3302306.3603458543512590430.pr-tracker-bot@kernel.org>
Date: Sun, 20 Jul 2025 22:20:08 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Jul 2025 20:10:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c10ee5cc1217c79dfa606c432aa95d5ee2e81083

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


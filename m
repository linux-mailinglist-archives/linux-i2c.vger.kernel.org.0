Return-Path: <linux-i2c+bounces-9463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D1A37034
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Feb 2025 19:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1093189344F
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Feb 2025 18:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2060F1EA7CD;
	Sat, 15 Feb 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKunhlai"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116F23BB;
	Sat, 15 Feb 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739645213; cv=none; b=KT/jMQ59cNKry5ej/qnvYYGVK78d2iYFafHPKmXI9wpGJPerHWwv3ulxrJ06MkW+nFvRXrIbH8WT0liSpu7YXgmNVFIKJgblDNsIH1GYgNVvf5yfnJPybKjLCwjB95h7F7b6HNFdu7bwyKUBi6dKRmVRRe/NyYmngrypzGzk60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739645213; c=relaxed/simple;
	bh=DCheD2LFTtVv+1y0v9qT6kfqA+K0HAufzWjrJzvnTmg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YfSqdKkLDSG/VJgJkMMhn2GoFYbqN0aN52db99r/65GDtvEIffweWKelEgxK5Z2OXQ2IgA9O2HxVVvwWv7524oO9i426Yj9+Xq3qsomIRzgsgA9G2/V3YYaQoWmUgCWALjDogAC2WJAvl7tFxwL9WRuJwN2L6AGj5Ww4XGkJ1y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKunhlai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BF2C4CEDF;
	Sat, 15 Feb 2025 18:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739645212;
	bh=DCheD2LFTtVv+1y0v9qT6kfqA+K0HAufzWjrJzvnTmg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NKunhlaitrEwPpcxioxPScuVpmFQ0v6N8sTFFzsifQw969SxTBCObqoeDqcyuW87a
	 T72IzNaA8kf6M8mvnDzStRuoBK73uLM5R3owh7QhdKupLbYox94vMS3aWY/ghyjvGW
	 gUTGHBIvLLIZLnuf35Wg5VUgXPy2uQpmoEdR+927UfD0VI2FDrNHktlTPpCKngvPfU
	 k0lzioY4Ox2I1GT2edbDidenpH3sPAwnyYYcRSGG6+sLbzEK99NcfooWppfn6madEN
	 m11IAlzLWWIw5uxqtTPZZl0SBjEytdQeMim83DP49YBLMBS0SBHuK6nSH6IJK1rD8+
	 IHNgduT8qdwew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B4B380AA7E;
	Sat, 15 Feb 2025 18:47:23 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.14-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z7DLCmDPaRhLWwos@shikoro>
References: <Z7DLCmDPaRhLWwos@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z7DLCmDPaRhLWwos@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc3
X-PR-Tracked-Commit-Id: f85478fb3fecad01927935c51fe7e9dd5731d0b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 496659003dac5d08ea292c44fce9dfb36fa34691
Message-Id: <173964524181.2320599.15446991110620659866.pr-tracker-bot@kernel.org>
Date: Sat, 15 Feb 2025 18:47:21 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 15 Feb 2025 18:12:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/496659003dac5d08ea292c44fce9dfb36fa34691

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


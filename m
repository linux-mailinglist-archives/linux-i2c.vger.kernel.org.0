Return-Path: <linux-i2c+bounces-5038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B0937E60
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 02:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3402D1C21F4D
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 00:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4BB4779E;
	Sat, 20 Jul 2024 00:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nINfQiCz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1798044377;
	Sat, 20 Jul 2024 00:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721433949; cv=none; b=VfGLm7H9vKB6RmALSvRFDxVFgEFoYoMgmb75gG6EzAKXM6/IFUVhJUAvLAJOfhnh3HZMZsnW+21iT/boWAQqOP+JVqlYHQth5pBpnR9MFeX/36IwI1ejO0FGFZgZ8K9FNdwR8IiS5kbb24Xc52UxYZKbzVveZmi8i7n6LyqXElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721433949; c=relaxed/simple;
	bh=d7te390M7OoITeSGVi48FlC10HfYna8nWPwN7Tr/IEU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iQ2NPSte4F3WzukXuaeelC7dOr7ni2hWRLOMNbFK3azbFITDLEAscodzFQS30GyWt3e7XWISymPKfr8aIkoALpPMLyfFLY/WR+iN1D0cqsqlj/GprCz5QPw0Jv3eRGxnw7uyNYJsXBiphpguNCmrDySnFtSKYFSVAbt7X+VXIaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nINfQiCz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4AE5C32782;
	Sat, 20 Jul 2024 00:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721433949;
	bh=d7te390M7OoITeSGVi48FlC10HfYna8nWPwN7Tr/IEU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nINfQiCzZzg+SPMmykgGmXMcrpNthv3B+sfSOHjSBzx1d4fTkWIa69SQkS28IO88d
	 ArGIJXwjBN/+MVtvn72+WN+tAizLLep55AibSHFtFIZr1nQyM5HlGxzfvtOw7DeL8s
	 NAavzECCEOThuCH2OrGt+nKbLk70jtPF+rKZpMKO1k33hpDjSbb1vWntueGmYgpBGm
	 MTAq2IdOWCtaXza8JWfoVC75I2tjZq1go8IH2+L+QVqP1UIkObBWCFrjvlNwSGVFCD
	 kq4AR6icyuMya2g+B34TDRHJFzLqkyR2Bq6sujCz5qKMjzNHYcpf+utqfLMcstQd73
	 p+r6F5DV5Vm/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB368C4332E;
	Sat, 20 Jul 2024 00:05:48 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZpY3X1tggZC3s_1X@shikoro>
References: <ZpY3X1tggZC3s_1X@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZpY3X1tggZC3s_1X@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc1
X-PR-Tracked-Commit-Id: 5d89b5bdbce3937c86f05ffe19455c3068fd94f7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef035628c326af9aa645af1b91fbb72fdfec874e
Message-Id: <172143394889.25682.1071928486868086714.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jul 2024 00:05:48 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 16 Jul 2024 11:03:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef035628c326af9aa645af1b91fbb72fdfec874e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


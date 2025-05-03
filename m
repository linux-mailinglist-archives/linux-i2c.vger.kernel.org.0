Return-Path: <linux-i2c+bounces-10756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2676AA835E
	for <lists+linux-i2c@lfdr.de>; Sun,  4 May 2025 01:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06B057AC75F
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 23:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DCF263C8A;
	Sat,  3 May 2025 23:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqlcqpqD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6698238D54;
	Sat,  3 May 2025 23:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746316584; cv=none; b=IH9aQ57xzk6gzwkfIJN/Rz/FoU9qpSpgextgBf29beDCRNtHCZxx4nDy18WRRRXavqKcTAaosJ448vqat6rzb5fahsO/GkPU6aLUn5C3luf4Fnz/qCN8PrAkk8tygVYHCtel+r/HxKZOs7QUlQB9NMt6Gby2IAnXjhCT0R1fGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746316584; c=relaxed/simple;
	bh=WR30OQEd7TUzZlyS8tpcaJGyIKqL4+BBLT74IdUGvFc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=EOMqJO1lmjdLurYd7ZOE9Uzx7QyRFs811ZqoILoRXjieZiKhj+izEmlDOvUL3vBFtCMhLVb1BFPbYf1yeffFg3RWuCK5LMvJ8r2qVR0tSUtxjdkZU9l/BIPzkzlo592mPt7uenccvwvd2dtrrpxFoilJ3eQJSQs4FPIhr5RCRDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqlcqpqD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B812EC4CEEE;
	Sat,  3 May 2025 23:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746316583;
	bh=WR30OQEd7TUzZlyS8tpcaJGyIKqL4+BBLT74IdUGvFc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BqlcqpqDwQrfkskexBEOXfIII7r7aao+Xz18UpidZY/UnKzo6QXQ2DyHFZbJGBc9B
	 HCEKYMtvkNtNXFAisu6s11IvxeAK4SWsZVD9SYzDurkNu5LeSTE5yGYThIYy4d6iGq
	 o0EFO4etjgbgYmw3tGmfGsQx8efVQsfpsCguX37PIYeo5c/NdM5mMTcvUV8EVRuo+E
	 Ht2VaQ24vgj6VAwuqByz3/HobSw+kRfj7vbQh3Ob+8AyMgFgAD9rZqvVy8D0eGbWmf
	 9i5mehifk8aJ5SerJbTxR9+95gTYnv3/0i3NS3L6/ltmY/Disxx1Jvfl4IdgCgHMil
	 5/g/6S718oONw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C37380DBE9;
	Sat,  3 May 2025 23:57:03 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <aBZwsuhgpgETHQOO@shikoro>
References: <aBZwsuhgpgETHQOO@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aBZwsuhgpgETHQOO@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc5
X-PR-Tracked-Commit-Id: 8e17493ea2d1c9f72e5e31160f75f8be56f79ffb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cbdd17b239fdee51eac87aa332a2793a22392e3c
Message-Id: <174631662185.3942549.14152596635222428651.pr-tracker-bot@kernel.org>
Date: Sat, 03 May 2025 23:57:01 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 May 2025 21:38:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cbdd17b239fdee51eac87aa332a2793a22392e3c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


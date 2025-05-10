Return-Path: <linux-i2c+bounces-10923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914FAB24AE
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 18:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42E777A231B
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 16:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7768124677E;
	Sat, 10 May 2025 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxCwUtCf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301932459C9;
	Sat, 10 May 2025 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746894501; cv=none; b=N6GIIApd/RHVbwWtUt0glAwyFavx+3bJvMgtQWuUjz5pDCTKUwF7f9DuqPPs8ZuSoO51cRd5UGfi1+mEupdUv8V/Lz6juScC7GIj4pqDykkRk2wXX4YgJCeWF2hVowPI8vywOpXT90MVHRM+UUMpO9wIk3vPwn91JvdsP4bfofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746894501; c=relaxed/simple;
	bh=V0XMqs2KhsycH6RiBgJUT06CmztEYPESrurZ+omnPwM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QXXRRuvsrhBB6rMP6oPwEldsXVZrUHkuSLpSJ6nXumbDWQoF/Kxvvk4a46+y2LPjIHkzFaFn5c/qaIcAguqWvIOvxoLeFnDMOxn2kRtvao5SFaA6IT4tVTB4atDkJSjA9itZiT9qMKdlXCc5OBupt8enKVUn+jsX4Qc5HIx+mKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxCwUtCf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022E0C4CEE2;
	Sat, 10 May 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746894501;
	bh=V0XMqs2KhsycH6RiBgJUT06CmztEYPESrurZ+omnPwM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OxCwUtCfLAT+XnhQaBIs2lDz1l7UaM5azruiAA1p77cm2fgriRIHPu9gUDtqTOmWw
	 1H+3ltddP1SvEn5wNZJTHVAFrRazArN3f2WVHG1HMGdS8/CAymMXtBnfGzDZBnlXXN
	 dY5VYsQJscXucSQHwV8KChf18IKe8/E4cSqg6JtxEPeuZivB5/yGs6mH9vn7pl0P83
	 RPbXiy0q6TyZ5vrL4aLFWpS2LcDH78WoLQsRy4M0a9G4JVS9LmDHvzZ4ShtJLIin8O
	 rzOY2H4n6OZDtn6peeA+TlcRyCzbJXdOLAzlW8keaF2wEE+wSGZeqSFazK1MvfGmVw
	 JWcpLwXqqrqEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B783822D42;
	Sat, 10 May 2025 16:29:00 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aB8memMatOtJhqDr@shikoro>
References: <aB8memMatOtJhqDr@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aB8memMatOtJhqDr@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc6
X-PR-Tracked-Commit-Id: b6c08bcddb2af9ea6d1846bcd36a35371e249003
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed36b437d9b16b073f53f3a61550df0e2e987b52
Message-Id: <174689453903.4001425.674633264399476677.pr-tracker-bot@kernel.org>
Date: Sat, 10 May 2025 16:28:59 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 May 2025 12:12:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed36b437d9b16b073f53f3a61550df0e2e987b52

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


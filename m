Return-Path: <linux-i2c+bounces-5472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F8955A65
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Aug 2024 01:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687FF1F21719
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2024 23:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAE9149E0E;
	Sat, 17 Aug 2024 23:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2HwXVeI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACE1C32;
	Sat, 17 Aug 2024 23:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723937779; cv=none; b=TCW+uGKnew8QuVdv6MBXiHxRuuqyNSTj76up6hfW5nnhVQYe4AwxoU3EtXeacm2E3huZDEhnSd5+cxIYib//1DnojObIh0ZAH83pMYEEa+dkEBZDTGSdiHg1EyTaJfFtG4tvTPxNqoLn0BncRDO/fJE2+Q9epnItAs/+m1Hy+xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723937779; c=relaxed/simple;
	bh=WsuVMCw+Rwc95TYFKUtAHB1I+WIdMSG2zxehlWRdDCA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FfDIXwuHYNa7QpkpAfAKfl9PLuG2wKc2ZnJN6LYA4Hyp68T/I/Z2qJYhiHkUDNVy27cEw+QU7P+eVPbduH1MhrJgJ0cVntOKJzwYIHCTVm1fsefNEIUiXeisNc20DQqEXvHnp5FUKjQ44fpiRZw4OLhrAxJHjRbYCnynQmB+Qmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2HwXVeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C27C116B1;
	Sat, 17 Aug 2024 23:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723937778;
	bh=WsuVMCw+Rwc95TYFKUtAHB1I+WIdMSG2zxehlWRdDCA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=W2HwXVeIqWXe0RGoyw978GmhNs+Uai6q0Ir8yWQ9PcMnxz1kCp1v8/MF/NG1Snfzu
	 C9cm31iKWjb1PqUjmESgDWGzwH4br2jQjg6wZ06Vw9B36RJV9Bc2/1LMzDlUrP7pZT
	 m7WVUvcaoXC6zYbAhRAsOg3D6GpLYwXoRuTQs6kV6OIx3VRJfvfwZW/I4QG8CbF70l
	 ItJTpn698OCIAJyPb47C8sCoiXFtBbU8fTo+E5Rpkrv6a/c5fuzfpY7afCNGLfuAOB
	 xkx7FWBGGWzpbGQgl+arhJUFOrDQFOjSdoUINQtaV8tvGBxdCcWU5L4DNv9OS+Jta6
	 waT2YunZN35ig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DFA38231F8;
	Sat, 17 Aug 2024 23:36:19 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZsEA2hE5048Dt5Vq@shikoro>
References: <ZsEA2hE5048Dt5Vq@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZsEA2hE5048Dt5Vq@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc4
X-PR-Tracked-Commit-Id: 87cea484951eba1d0342033241f80e49303d802c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 98a1b2d71f9fac01c7aba80f30235b1b2e8234da
Message-Id: <172393777806.3838684.18134398750162632957.pr-tracker-bot@kernel.org>
Date: Sat, 17 Aug 2024 23:36:18 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 Aug 2024 21:58:18 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/98a1b2d71f9fac01c7aba80f30235b1b2e8234da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


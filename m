Return-Path: <linux-i2c+bounces-6944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5449B9839D5
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 01:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F09BB20CCF
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 22:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414D4153BE4;
	Mon, 23 Sep 2024 22:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPl+K0If"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B3153836;
	Mon, 23 Sep 2024 22:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130886; cv=none; b=GR07AFzgfnnEu2SVUUbiCXVvzHvvk1GgsNMZDx22ZgQ0pjDocLTRofX6m17h7TAdrXqSGjkHW+lpImQw7XW3YpxDQLShupJKiVDg8dSGoika4PpAI4n1mStBDd77xnNxd2xVokFodXOY4mJyi/2Ov94stAQW+hnvWyOKhfy09JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130886; c=relaxed/simple;
	bh=ueXPS98jQJezY5629KokG4O2yWijovqNrU/2FCBFGUI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=npcJT/XXFp6J7mgCroiL9RJZs5ilOK9wJaffkLWkUPLpyont9CVrWgNA5b8AChUU8ip2duMBDqejHcf5kMbkWKunWH8WOuoj5ZqmQn24FLBgMDYwQ3YuIzM0vuwb5AsoIVgEPyRmgLnSBxYm2VEeprXWf+o/mJalbnKtlJ1C9p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPl+K0If; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57BEC4CEC4;
	Mon, 23 Sep 2024 22:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727130885;
	bh=ueXPS98jQJezY5629KokG4O2yWijovqNrU/2FCBFGUI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lPl+K0IfUfIRiL3S+oQyqw/XeSnczaz0P5XQ0wpH7eGpCX3/yY0Ydb/gm/AyGQtpv
	 QNmirgk9X9Ucgi2u610K4uLuv3IAHE8aaTrCneaocaBBj1cipS4Gu5ClisbRR4AxcE
	 RDm2vjS2xZZo5hzQ5KQPkUUlI/Fga1ZLSEYgWVVIElYz1pXn/vAvtx7TanfxhSVy+F
	 uHxE18bfLkfip2JPdASye+X40YPsxjD53RwZ3NzvxJsBlPKxBt+09IpZfh3CLEcTMC
	 DW1ZD2JRN3WSGjoiFVbA6CKec6WmqAqZTr6s5vnDU7a7AO8R2SjU6sv5LQpzy5ttcU
	 35wyfIAVIsztQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 715433809A8F;
	Mon, 23 Sep 2024 22:34:49 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZvEaHWH0IndyeMvs@shikoro>
References: <ZvEaHWH0IndyeMvs@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZvEaHWH0IndyeMvs@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc1
X-PR-Tracked-Commit-Id: c24999e61b2187578fe4256b7bc6190a046c4b93
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e2c9cd7dce6c7480f236c3ead196ff4e92ed597
Message-Id: <172713088797.3509221.5726471540730445336.pr-tracker-bot@kernel.org>
Date: Mon, 23 Sep 2024 22:34:47 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 23 Sep 2024 09:34:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e2c9cd7dce6c7480f236c3ead196ff4e92ed597

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


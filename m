Return-Path: <linux-i2c+bounces-5276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70894DDE1
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 20:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC626281F0B
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 18:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F9E168497;
	Sat, 10 Aug 2024 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU1+3jMR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17C04084E;
	Sat, 10 Aug 2024 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723313273; cv=none; b=np8x2RWU+6A+HSXjw+TKj1ghoHDOF9HPwuB/DjrnqW+VtVlpjS3BupdHljitzIzsQwXVktTlyBcLv8jR5muwh99sqn68WoEhTEiR9w+Ly3MN2uLfoYjsiO1v60A59Ob2rQyVzv4LDAnk4PPDprfaw4Eq04hRlrmulrFwHtJrreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723313273; c=relaxed/simple;
	bh=2cnwOYcRPYO0k1IUkV0NudoNUvDww9QEM4HTGRf3EgE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=buKpryC+3aMU0eMDnexIwbN8GpbM5g0PtEPAy2sgvk2f2SoHAK18msM9w/AjiwG+34mJQSqe6oA5Uv+kTwWix88wtwOEvYESgzYkG2sdjNn8OaBZPqnfeurDSRXXWBLMp1yqkVeyWj0ThYj/OTC+RgScwJjcJHYghUQ2gZ02JqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU1+3jMR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56361C32781;
	Sat, 10 Aug 2024 18:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723313273;
	bh=2cnwOYcRPYO0k1IUkV0NudoNUvDww9QEM4HTGRf3EgE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IU1+3jMRYy+Qo7eQUobNCKQC6gYH5Nq/i2Q/P4VNDLp3uWQKtl7Qulihb4C44TWTn
	 j7Whx4yMaaYXi4ssYKONulZUg4nFVQuJHuq9eAx9RX7Hsle4s+awnS7peZ/+6gyKXo
	 a3X2PoPOW5pNrZ8MkOrENHXtbZpWvjfVouXylS/sdrf9+8yiR8DwnKwSGGfTkl8Iqg
	 lRsTBiBoBGPACufPLI8u3wJ7sRao9vNQ6O/+/yB/r68kvCpFks9Kqklw/Lb+ht9YCV
	 6MPyHzGgdZSg+E27U1TkjShwnylOA7jE1A0180N+2sOqxBjMHHc3Fb6iJlt2LUnC3p
	 sxcUZH7tCifrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 738FB382333F;
	Sat, 10 Aug 2024 18:07:53 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZrdMaWTfpmCfKqeA@shikoro>
References: <ZrdMaWTfpmCfKqeA@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZrdMaWTfpmCfKqeA@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc3
X-PR-Tracked-Commit-Id: 01a620d491592ead12eca039fe1c9e74908c35cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7299cd48aeceba873a52968d6d6edb34c15bac11
Message-Id: <172331327186.44953.6688474418428737582.pr-tracker-bot@kernel.org>
Date: Sat, 10 Aug 2024 18:07:51 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 Aug 2024 13:18:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7299cd48aeceba873a52968d6d6edb34c15bac11

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


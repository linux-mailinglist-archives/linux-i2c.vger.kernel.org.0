Return-Path: <linux-i2c+bounces-7079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E957989669
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 19:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EAF91C20E52
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 17:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C638D185B6F;
	Sun, 29 Sep 2024 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSsGj8B4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841AC185B5D;
	Sun, 29 Sep 2024 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727629492; cv=none; b=Uzy52vsbbCI8qhbcH86KZ0iPBW2fpVH/gWXjbdFiMygbc6BfdepJqolsk7KIgTesqfmMGBtODnHQIBzrWR+186kqtpkld7mBevB/8S+BGiC5qp9mBVUUyaHluFwkRm8GgITE2hKLUXqXpgDY75BaVu760QiAmLc7J6eAC1ekeEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727629492; c=relaxed/simple;
	bh=QX3xQ1CDn0xdI5MXCLxd+KD30WhoeVW9kCVwjaH8H2Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RXYjduolWpugwwa+9MVcz4cHS+unoN25ZoNf8mDaruNmQXeb6dPM+haRT1T79jrJgb+MwT3Z0lUWDP7UvW05VMMrPtbOOtlCA5f/7U3WWYzPJLGuYxsp1s8a01MA7G9norvD945NjbVg0nVSeXOt10+H1b6Z4DlqfTh1OTvfiyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSsGj8B4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CE3C4CEC5;
	Sun, 29 Sep 2024 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727629492;
	bh=QX3xQ1CDn0xdI5MXCLxd+KD30WhoeVW9kCVwjaH8H2Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FSsGj8B4Hhig0MhIMKF2PuvIlSfiN4jknBBgoQTKuCiCR6GbYLk/1SoDE5V+8hmFl
	 p83c0kTglOE8e9XPllZbDmShWridk6HpjspODMCd6TBchawQHomAQG/5vOr14yFa4R
	 iv1iOe350oX1Mjm1aN94pwlP1KKsBqkyhdk+JZVcfCvmEhJ+iTwa9a2elLakZdxpK7
	 UyBOOby11DJCBypbHOQnkoWg78e3B7SeCmREf1NBjBGChfZUxAxnI6FB2dc9zRpnqH
	 1uvZ6I2muYVnb6r6tYMjZtlrfWYTqjy1xKTIkQp0d9WjC3Emx6qrkBjWWOHJizFnIw
	 G1O0xXmwYe7IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BDD3809A80;
	Sun, 29 Sep 2024 17:04:56 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.12-rc1-additional_fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZvkTb8esQeCOCJ3j@shikoro>
References: <ZvkTb8esQeCOCJ3j@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZvkTb8esQeCOCJ3j@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc1-additional_fixes
X-PR-Tracked-Commit-Id: 26de8614d83f1f1a0b0b0a300e3be40a95b9a340
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 907537f570c66703844eb6d3858fcb0e70abd0d4
Message-Id: <172762949490.2558104.5148119232837217981.pr-tracker-bot@kernel.org>
Date: Sun, 29 Sep 2024 17:04:54 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 29 Sep 2024 10:44:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc1-additional_fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/907537f570c66703844eb6d3858fcb0e70abd0d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


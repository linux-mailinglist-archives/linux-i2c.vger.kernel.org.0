Return-Path: <linux-i2c+bounces-4286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D1913C01
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 17:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F9F1C21F42
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 15:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D694183090;
	Sun, 23 Jun 2024 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="in/DmUTQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B018308B;
	Sun, 23 Jun 2024 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719155600; cv=none; b=Z49kVioLYSX4mKeIheAOw37ct2HC61wDFgLGvhj0KlO/btZjXk56onFnIBv6VGX+CE6vOtS0DTXq0XNoLJ4202dr4vD/VqgkhHiZKVHJglTuOuurN+knSsLNqu0j7UnPrRViELHji5+MzOhl4lNM0vay7bIqXEKHb+0F4d5mgLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719155600; c=relaxed/simple;
	bh=35IpiuTV02pNWtAWTH6etx9sPAlSL0vnHhsSk0kXStI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PWXoRlaDUmKlyavUFmUXQO5S82l06XFQF03RtvnkqAAvlkMXp6sjJ4JmdoGsfKFSkxoHeiFJPpdji7mV1t1ENKMxJz4n2vpCq2sI/q/kCG3ct3mhrUgBbWHhUJfLfE85g6Q54+/F4yEnozZkUpooXd+/IP3UxmoyBWrruRybuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=in/DmUTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5297C4AF07;
	Sun, 23 Jun 2024 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719155599;
	bh=35IpiuTV02pNWtAWTH6etx9sPAlSL0vnHhsSk0kXStI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=in/DmUTQqrYAy/p19qkMVjaj8rK40pWcRlrmGli2l4XxiqcK2XzTui95u3j1TCTN9
	 iUsXtbZx0ZhjiOVotVJ77bBiY1XWh2NBuggrIZ7QlqVO/fhl1rIGp96KsTl9OMotCb
	 LXL3JKkX0GBuD9zEoz0Rs7yyksxAWRGzlIVlypEQso2cufuXLgyT73e8P21lOpzbg1
	 l7cEN279Y9UhbiPJQTFWuk2fxq8x6SVDs/4RD3DuOvhG5wDV9mwTH6rf59+Ci+aLki
	 s3nzDY01pn0VPL0reC1JNUrdv0zNt01qHG6HFoSuA1FlvE4FwU0tqjKQKdDKn97tmO
	 vec7VRLqiz0UA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA1A6C43140;
	Sun, 23 Jun 2024 15:13:19 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZnfXfkZfI5iNZqBW@shikoro>
References: <ZnfXfkZfI5iNZqBW@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZnfXfkZfI5iNZqBW@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc5
X-PR-Tracked-Commit-Id: 2c50f892caadc94ff216d42accd8222e172b5144
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7c16f0a4ed1ce7b0dd1c01fc012e5bde89fe7748
Message-Id: <171915559975.3671.15154523518596435378.pr-tracker-bot@kernel.org>
Date: Sun, 23 Jun 2024 15:13:19 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 23 Jun 2024 10:06:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7c16f0a4ed1ce7b0dd1c01fc012e5bde89fe7748

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


Return-Path: <linux-i2c+bounces-2374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE187D504
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 21:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 095841C2288C
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 20:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D9217BB7;
	Fri, 15 Mar 2024 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbI5CwYs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7117984;
	Fri, 15 Mar 2024 20:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710535051; cv=none; b=Kh6wgXkdtJoCEDpOiDd5I2ntCHco+dNgdVLsjlq0kz8/HB7lLTpHjdBb61fVSh3XX1mUO1maDEtw7kbrtZ/ezX7l4MmkTCYSYHKQ5YtpQ0MksJAOuGK8KSl7Y65Mu5i5xsOw7UM52SHZo3URCYkkMsY6sJ38YF22AwseSvRBEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710535051; c=relaxed/simple;
	bh=Hi66L2ut2ZWymoxEDFUddSODvP1ZQZz2RAuA22pph4A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VhO5cjuMcmqpAAeqzHWZlJL3LKb5tUEAKzt4dHNubnOGngOMu9L+YUIJ/ewT2qx18R0+Jnn9noSrPEWeUI80vHsSZNWEly/FIGPypkXfkuSeiY9IvDuFmFvlKE9vZVfJKOGMvvIOwqinjfFPcNdwOOszw9rQiYqA22Ne7TBvNkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbI5CwYs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9F5CC43390;
	Fri, 15 Mar 2024 20:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710535050;
	bh=Hi66L2ut2ZWymoxEDFUddSODvP1ZQZz2RAuA22pph4A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VbI5CwYs/DQobjRahmlCAXP0JZahGlvoNwcRlQaVhSkm+iSFoy1GWkYWiTKszfyxP
	 y5aDgz7QSkW6eco6ZdZCrl/nUq273x+RvRtt3Dt6O7xLBQc76BnH28tnjLnYPy3yBq
	 e9UCbO2Yhkm3lbSNzWw/grlmuiPWbdfvj6UP+Tn5PG0aEqxpaaanjTILRW7kAyxnd6
	 pdpE7I9p6eAMyI0HFhhoXAGhBcD8R6zCyqJVGfGisoNO5feN1jHzmMeHKCwWAfKJgJ
	 EQQfCN6HnUo5S4bQszwOMkVbVoDnzedkL9EgjdFF/pElbqF46HCS3K0bihacAKTpgj
	 dxN9x48vuLjVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3ED5D95060;
	Fri, 15 Mar 2024 20:37:30 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.9-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZfQlREW9HGwKqvLE@shikoro>
References: <ZfQlREW9HGwKqvLE@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZfQlREW9HGwKqvLE@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.9-rc1
X-PR-Tracked-Commit-Id: 91962feb9502bb98f830d90fe197653e6f4e84a4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c77756d3da0782cb90c1fbf6635db7aa480ad638
Message-Id: <171053505079.29375.124220517556308041.pr-tracker-bot@kernel.org>
Date: Fri, 15 Mar 2024 20:37:30 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 15 Mar 2024 11:39:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.9-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c77756d3da0782cb90c1fbf6635db7aa480ad638

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


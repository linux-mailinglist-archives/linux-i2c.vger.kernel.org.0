Return-Path: <linux-i2c+bounces-9243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52062A238B8
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2025 03:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 972D21889B75
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2025 02:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A9713AD26;
	Fri, 31 Jan 2025 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpxG7eml"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A3B13A258;
	Fri, 31 Jan 2025 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738288796; cv=none; b=kdanaFmeypS0WXwbVW7aYx7v3g2PLlreVFb5WH0+MZkyHMZ+vHicp5XafnaY7qn5WS21fqA4wjH2u9sekXiA7zIbGMLIeltjYXI5Yx58n7N50Th6hfzP+h/SaIy2ZGCrOs6XCW0flm2dgmyg6cIgoHWMaAJpuCWc87SvmOp6Fhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738288796; c=relaxed/simple;
	bh=QjDCXJ+WctEsMtyTaevEdG/R/cjv8jLqbwMko5PJXII=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iajHJx473PWpCKx+zFQMgIQsctW7AXvmDU/lL0WvZttSF3VLiARj7dR16mnpfch3V+KppNss72GJNxnNVpl+i9L38i/MciWBREwXhrQjHrGAOpQmXyAiO7TwTxGIlTd8c0ELdyNx/lIDPWB8krbNMY6UIxtdKypQe31W9stdEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpxG7eml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B83C4CEE4;
	Fri, 31 Jan 2025 01:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738288795;
	bh=QjDCXJ+WctEsMtyTaevEdG/R/cjv8jLqbwMko5PJXII=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PpxG7emluxdThuz9GL4B/Jj/UuYRrul9gkPJJgp/AOn5edpVZ6sMUxhCtv9XXeu+8
	 aFI/jvBbhFyZcRg6SAU3mDnbNoDwaPNYs0EMHOxfs0lgaMt/IYkONpiVfGqTPkNQho
	 LU5EjdtIZr63/vo40f1VqHCA84DToyES1oYgIySH9kHUzeYOyKfPk62sRcGUe/tRrM
	 vIIOvzdNe4A3IvBCacX34GAAsOKsf3k4uXypB/cVR6POK5G81pnCznTr6cSTiFLQkp
	 5mo6e/C5ExA+0uajIJr4B2PqIeMBm4HHkeW3eNEVAKAx1m+rKRTmzQM8MXc9FETOq3
	 v+HabN19S9OSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71557380AA66;
	Fri, 31 Jan 2025 02:00:23 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.14-rc1-take2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5vxcfD8RPYzfsCe@shikoro>
References: <Z5vxcfD8RPYzfsCe@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5vxcfD8RPYzfsCe@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc1-take2
X-PR-Tracked-Commit-Id: 6250ebe666e425e173df5e11e8a612d57921f48d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a4b5e48ec4c975f40ec4f51cd5e054276c25eb34
Message-Id: <173828882195.1145982.5861476739645204804.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 02:00:21 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jan 2025 22:38:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc1-take2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a4b5e48ec4c975f40ec4f51cd5e054276c25eb34

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


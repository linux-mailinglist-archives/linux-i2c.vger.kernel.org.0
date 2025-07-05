Return-Path: <linux-i2c+bounces-11851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A06AFA1B0
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 22:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEC5D7A3820
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 20:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0FD23AE93;
	Sat,  5 Jul 2025 20:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqBK1bAf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C923A578;
	Sat,  5 Jul 2025 20:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751746127; cv=none; b=sqHiidvf1Fq+b7EiE3Dc8n53jlmzfhEI5vWCQXbRCYnnRGGPBQp/BTKB1hutJrpb1IcJ7D30keC6dLbY64OGE0L+CXYTiggc6X/xK/kABz2Jloa6l1ep0b2f2DWHoUXs2lLw6ns/kJKc+GjZfsOO01oeUl6pFLzynYbiwd5EzRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751746127; c=relaxed/simple;
	bh=UhgcxGXXvhl6dEtU7dO4PMzectR9iPceo4fNrfcxALs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QCFS+k9PtceWU0mVGT9ctOvyQJfjCQrHxIzp0B2t08LJUQ9tEXvDXwaJqXoOOhLYTbO7YVzkvmNZBSp+KPQwhmTGtk8aBVXQJPxhCLOHmPWQiQOvakFEaq59sPu01IqVY/sgC3c1g1x3OhpA6BQocts2nqUpS9EXp9+CixH7HNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqBK1bAf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012F6C4CEED;
	Sat,  5 Jul 2025 20:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751746127;
	bh=UhgcxGXXvhl6dEtU7dO4PMzectR9iPceo4fNrfcxALs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KqBK1bAfaa5olTyXTRIj0RZwQvh3SWpoclX34C2kJZrVjoCRSKYKcWIlpqXyhwHyc
	 drvF9Maqu+xPoPdxl/4tjoGkPup1nJPmLLlVLO1ILQxpv9oTcxll6AgBZkXhy5dlFt
	 tZj5YhhaJdPNBRQDxjkh+QXhwiX1Fv3gz/jGIGHQTHTfEMfLe5GAjV2lL06St5YqQe
	 o0DRa5lCla2AbKnRjSjwk503KmNloVoCHJEQUuKWbBpTDcFu2QVl7vYWJkjdaM7sR4
	 A5OQVs9C3OEPnPcVBewnjJro6lvryTki+XmklNGN1uQkFQvvQrOC61wO3eEhTlqRfo
	 w725xO7nlg1Nw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB003383BA08;
	Sat,  5 Jul 2025 20:09:11 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <aGki-9QTCbO-H4zU@shikoro>
References: <aGki-9QTCbO-H4zU@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aGki-9QTCbO-H4zU@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc5
X-PR-Tracked-Commit-Id: 534eb6de621954cde61c910dbeb8fb1700a0a0d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd860cd78146605eeeeee3ac264ca166cc9fa943
Message-Id: <175174615062.2526409.10992096909880049588.pr-tracker-bot@kernel.org>
Date: Sat, 05 Jul 2025 20:09:10 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 5 Jul 2025 15:04:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd860cd78146605eeeeee3ac264ca166cc9fa943

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


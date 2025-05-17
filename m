Return-Path: <linux-i2c+bounces-11009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA53EABAB10
	for <lists+linux-i2c@lfdr.de>; Sat, 17 May 2025 18:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14D69188D32C
	for <lists+linux-i2c@lfdr.de>; Sat, 17 May 2025 16:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3FA20AF67;
	Sat, 17 May 2025 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slZYTnSa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4EF249F9;
	Sat, 17 May 2025 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499215; cv=none; b=GgDMazANDlxA6d8OlJsIxT0VCIcfIlhJI5qQjDLYA6iXootAm2MOJztCgIONYLEWkFFJPfjx7k4wz9ZGw9ZM6eA7I9G2wmiELGok9ATxAQhImYGmDV04Ya1IG+2qcpgyMy2iYHHmr+DfD4kUNt+T3txSPsWUZuLO3iTckhZTJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499215; c=relaxed/simple;
	bh=J07fDEhsBJvkKB2Mu/LlqdViwyFVuYroTNtYjsZRl/8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LrHxl3iHoFX3QgRClM2v0R0SAEL6T/FtYaknRqETlfY/vVP7BFgEudnrC1aUjhcnKIT66hqtpfSFl77/QoqpDBjOiNwOkjljVftGgCXg0B+L9KwFfxOrJklEdFRhxPQYOduz7E1QkXnWXKtlXF5VD4T4v2MQWCINK9fKYD5GiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slZYTnSa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBDDC4CEE3;
	Sat, 17 May 2025 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747499215;
	bh=J07fDEhsBJvkKB2Mu/LlqdViwyFVuYroTNtYjsZRl/8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=slZYTnSaEQmXyvs+Z2u4JJrIAGyHDqf9dn/9XBrcUgXuXop1l2EvgxYz4jDrbf8/S
	 EQkcaf5eG4Yk3TqVwBNvK0lPbppYjIj+HLKeYs9saS+P7+yB+0GzkNt3mW8aILOM3S
	 UmeZYv6tuleMHOBfcl8Jt5OKbybkigBJsYGqWR5CBHMd8MtA/higl5zUZ4vEMJ7fc+
	 DtM1lmsPbo9J/ocYn0n/RCbK+QQu/Zh3hjxi1O6MG7y9wS/C4p2FLvbDEO4pMvgsze
	 YRkeVEZZaTU92z7GNVOxo8Km4qNxmTnDrvXQ9XO9EpTtgC8QpvoeizFASs4r0cwUVt
	 VziHlXtam7z1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB245380DBE1;
	Sat, 17 May 2025 16:27:32 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <aChQtvRgPB1q4gKg@shikoro>
References: <aChQtvRgPB1q4gKg@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aChQtvRgPB1q4gKg@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc7
X-PR-Tracked-Commit-Id: 6c72fc56ab2bb7e0c327a6d42d02164c0dee9696
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1317e1cb2109e1868ed0269c53244ea488dc9f2
Message-Id: <174749925157.101931.4602461814338095855.pr-tracker-bot@kernel.org>
Date: Sat, 17 May 2025 16:27:31 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 11:02:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1317e1cb2109e1868ed0269c53244ea488dc9f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


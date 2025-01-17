Return-Path: <linux-i2c+bounces-9129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CABA15A20
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Jan 2025 00:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0B7164311
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jan 2025 23:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509CA1DED55;
	Fri, 17 Jan 2025 23:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5vyyN8J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978981DEFC1;
	Fri, 17 Jan 2025 23:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157514; cv=none; b=Gz0+ddagUDwi88cHLFOqhK6JEDHeTmYuOuX8/tx0XTMdPCWtzpfv6rFBaSVC6w+V6AqnuXWbQt1+gyNoysKmOvuaS0LiL5poWZO6UGR9IN3vzVHsKAMH30+fAjkQ64uSG3E8vFkLBKyV4ypHpZS/J7RgEmLPDd6ezHv8dbZKqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157514; c=relaxed/simple;
	bh=365PKfMwEc28qfI1eaVpOZdQzvyY0J+xM14tDUcDzMo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UMXGPK6NI9+LYP64C98oj5bBmg49FxBlhs/dvhkXMK3tWekxi+FWYSkkqZhN+GActxTyLaoBKfcqEa+3oHZUFMLIKLJoIuDyX1UKxjYazpVtwFV0tk9u08DTeuf68HU1I7IueVj47HOriw/z7iEIvrSBVasqNCAw8yyLqzV2Avw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5vyyN8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A47AC4CEDD;
	Fri, 17 Jan 2025 23:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737157514;
	bh=365PKfMwEc28qfI1eaVpOZdQzvyY0J+xM14tDUcDzMo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=d5vyyN8JZ1IY8fJ3joxdnT/4iE6l3DsjxCbUCwhmW83hTLjGrETPiILuYhGc7T4NZ
	 FICRwVAJUmpWuB9RoHLXNHwkNjyEpFJMcwWJbaL+dJ03xCcSfQqnYt3zmZIQ1w0cLH
	 STr6APjjr08stFejjbl9BzbTHpsQ2ITkIHBHTG22eQZK0mOLvM8xv237OOIN60TgVZ
	 sqczizNDyGSbl2BRZ3OnMMro9em0N5fyPxYhJ4dJKFcOdJTt3QzEciNzy3NnluLg30
	 kaVx5tECEC9asv8MuJUaZg41F7AJfulJyuQQVSBa5jITKpDtTBYmwJG2FwBGrttVCs
	 CuyboKf6LoMRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE33380AA62;
	Fri, 17 Jan 2025 23:45:38 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.13-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z4oAJW2NkCsWQEzh@shikoro>
References: <Z4oAJW2NkCsWQEzh@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z4oAJW2NkCsWQEzh@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc8
X-PR-Tracked-Commit-Id: 6ad30f7890423341f4b79329af1f9b9bb3cdec03
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e74b9bf263f5ab7b65e5553c9844c8197b73004
Message-Id: <173715753731.2291664.1909773402835510621.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 23:45:37 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 Jan 2025 08:00:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e74b9bf263f5ab7b65e5553c9844c8197b73004

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


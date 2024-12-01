Return-Path: <linux-i2c+bounces-8278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCE39DF735
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Dec 2024 22:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F0C3B213AB
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Dec 2024 21:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBF31D88AD;
	Sun,  1 Dec 2024 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sro1/5mI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B518AEA;
	Sun,  1 Dec 2024 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733089522; cv=none; b=Pg6yhUe1Jdmdh0meHcX4e1SROHpabK5VMnbkG162ut4m8GZLkmZY4I7bTRu4Nbg6wypkB7lZNR2e4oiX6jilJSb8AeaEXZ89W1ils7u43ekjblGOo2hXU14sOn+Cih6FPPeP07xP2vr+Eug18A2pGzBAUMO5PVQK35OC52vtY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733089522; c=relaxed/simple;
	bh=ohxBzcNyLI4mjK1YE4vqnQ/O/v/c2tqAkp8OJmOeCZc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZA+tYrA9hdICj9rbDFaQTQC81ZfbLRBpbDTP6par14srEnPa0zOK8jyY+T29tgKl0TwX+XNLW+cBzVReVQgCHF5jPp1yf2BBXqu2kO+87chkb0jOapdBtI1tpj1NHIVwLqNBv08+0WEow4GF2fNl8v1lcjGKbm9N2XfFYElv/us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sro1/5mI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48231C4CED2;
	Sun,  1 Dec 2024 21:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733089522;
	bh=ohxBzcNyLI4mjK1YE4vqnQ/O/v/c2tqAkp8OJmOeCZc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sro1/5mImLOVG5CZ5CFBjZaXXMTgJiMlHdZVbojKwY0RKA+8VXDZWwvos44NoVbTW
	 trAKdjJJq+LEGGdbJVEw5BoXVRAAeZ+oqvjOSKL3WvZEvXq2DAnhrI9hU6qbf84JEg
	 lh6+znoXnDTV2rkfMIBSMqrfu1hpOTESz6sGLRd8ZQ/9iXw9FqBO2mg22yM6UGm3Ze
	 WC4lZ1AYJ9ZG9n2GnvrUHDOBTcrAcib89MSkebreZinv0FbEo+oIfFdK/nOPbnvXTt
	 ypGqb7EWzhkkyU2jcKzlN2DiF5gW3jI8MzN4TcG/B0aMAirlF6viP+Vlc8vuVBePDH
	 grhFfrl3sLsLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7135F3806656;
	Sun,  1 Dec 2024 21:45:37 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.13-rc1-part3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z0xg_JliD3EJmNtt@ninjato>
References: <Z0xg_JliD3EJmNtt@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z0xg_JliD3EJmNtt@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc1-part3
X-PR-Tracked-Commit-Id: caf4bdb558cbc9893524b0a15e6423ee6305cb0c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a14bf463e7dfa389850b9d47d38dda4fa71c8ade
Message-Id: <173308953595.2764202.1780196043450430531.pr-tracker-bot@kernel.org>
Date: Sun, 01 Dec 2024 21:45:35 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 1 Dec 2024 14:13:32 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc1-part3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a14bf463e7dfa389850b9d47d38dda4fa71c8ade

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


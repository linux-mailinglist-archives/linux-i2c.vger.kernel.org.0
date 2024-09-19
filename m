Return-Path: <linux-i2c+bounces-6872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 728CC97CB5A
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 17:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3C981C241A0
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 15:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BD31A0704;
	Thu, 19 Sep 2024 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rc9LM2tz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F11A08CC;
	Thu, 19 Sep 2024 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758608; cv=none; b=HJ6K47nbfXweo4BdQCbnOTTKbpyYsPe/wJ2FcMFJeEPEXa+i3BSA7gkohH+1VvkPw+dwItL/2png9EnopBhKL4dj6M81jqoYeImEi0Jj1uIEncB9bmfS8fATddy7P82yroeeXLt5AH5wap7Q+hW1UxmBuoCIVzJOJfW+Lvc7IeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758608; c=relaxed/simple;
	bh=06fxPW9NMFL10Cl+n83N4/KmDf6EUBNE87TMq+LPjS0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UAWyDYfp9540qrObwPt3Su9kd4exV0r+VazsbSzefIVoH22/dWtJq2LnNFezVMOMbPFtM2hBBwo/tYF1JdXGsixn3LAdQ/wrJVZhW29q38APfNXRHrhxf6iDl1JG47CFJnqbwDsk451P+CMepN/IshljodggyAsd4RQlDF+gTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rc9LM2tz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CC2C4CEC7;
	Thu, 19 Sep 2024 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726758608;
	bh=06fxPW9NMFL10Cl+n83N4/KmDf6EUBNE87TMq+LPjS0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rc9LM2tz+FJIf5/TTKk9zwM4VI9RWRR+yyoBskxwhC7kUXXpgPwAldaqVCjedpffr
	 +wIhO/waWMPcIzThmhVHbQlpkSEhMgU7j+vmD0Mf9wZTPlw4dmYERe9FgDlHLWM0uC
	 YBAuOmimDZSa8seGOhMPN27Bx6Db0k1gEsrq96k748YatgjkWk3rWD3uRO7f9xllcm
	 r8YMuwISv2FleNP0dZX0Rk6TJ7sdP09dlet4IGtrhiPaXGImGa7wGKAKWx4HnQiNK9
	 aiktwgykFxvgtOoz6rfgGgnhrcu7Uyiq7bO1X6u8ESDYNH6vjEGZyaQBI81LRRH4BX
	 7QH6ZDy9c5g4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B71073809A81;
	Thu, 19 Sep 2024 15:10:11 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.11-final-but-missed-it
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zuvvd4kJRv8XGQPT@shikoro>
References: <Zuvvd4kJRv8XGQPT@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zuvvd4kJRv8XGQPT@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-final-but-missed-it
X-PR-Tracked-Commit-Id: e03ad65cea610b24c6991aebf432d5c6824cd002
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7f52bb9de57dc1851a83e20e53491ad8df321e4e
Message-Id: <172675861062.1588903.10858244105719995179.pr-tracker-bot@kernel.org>
Date: Thu, 19 Sep 2024 15:10:10 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 19 Sep 2024 11:31:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-final-but-missed-it

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7f52bb9de57dc1851a83e20e53491ad8df321e4e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


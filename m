Return-Path: <linux-i2c+bounces-12406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A72B3306E
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 16:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 063C87A4297
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 14:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C04B1A0BFA;
	Sun, 24 Aug 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkUHWVWB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CCB4A08;
	Sun, 24 Aug 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756046050; cv=none; b=r1a1FPoDmBRTysc0M7AnXBsu7jwOz8EZgfzGjmbjfDBZ6VgTNLr29TsnHlp+HvQITBlh1Z0vFMKYuP5ek0Ozsb9ZcNbbbMhs719JCz1mbPbDaedhtzwo1DNRxWT4Z2nvIVQleEsru46hTFQV66sugxeRGUvS4U+e24GsOq4NUKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756046050; c=relaxed/simple;
	bh=zRCesnMgeogHefkABJO0ispZ0pnMzE3dcuowpIOcWVo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KBlCP0jZP1sGaQ3QUI6ra6z4WpJbbKte+JesUJ7a39tWCPP+qDs79IpXjnq2Wa3TQXLm0skgv3wEIyYNi87XJZ4YffvFBxu9xJ6yFYsGXCTM47/RiOjtzo9NQellsQloUoLXP0lUjZyqQqw986sYY/7UnJQ5oVYNpbMg4zm71Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkUHWVWB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98D2C4CEEB;
	Sun, 24 Aug 2025 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756046049;
	bh=zRCesnMgeogHefkABJO0ispZ0pnMzE3dcuowpIOcWVo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nkUHWVWBX9AJSEWFh7c01h4l2YD6uMmAmF4QrzJIi2zYGjngak5pdKE101YDfDu5D
	 Af7v+SUJ9cud0xDji5MJeXOlCHP/gcLLZ1p4t92Ci4FrklEHmCjD8knCQWvcjIuD09
	 V4x+A7LyCyD2FfZdDeDkr/Yyax667OBvKm4GhdVIV8SCEdDhrjs5uFQBcWd433slUb
	 K5IcAdX/MVxg26/u9P0gbAjUX0lwJKon0MHfK3Sa489V9qJUzb2BFc1By7eiXorUaS
	 f9ue/p46VJS3wQRBn6zPPO2ftvbxCMRHYz56w0PF5vTeEl/is2N1/IPKJrREiCy6hv
	 8VEkpOL6th8sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F47383BF69;
	Sun, 24 Aug 2025 14:34:19 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.17-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aKrrOlgY5fXBEG9U@shikoro>
References: <aKrrOlgY5fXBEG9U@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aKrrOlgY5fXBEG9U@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc3
X-PR-Tracked-Commit-Id: 3dd22078026c7cad4d4a3f32c5dc5452c7180de8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c330cb607721bae34c404604e2867be53e6c6949
Message-Id: <175604605805.2403087.3012778631188401536.pr-tracker-bot@kernel.org>
Date: Sun, 24 Aug 2025 14:34:18 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 24 Aug 2025 12:36:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c330cb607721bae34c404604e2867be53e6c6949

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


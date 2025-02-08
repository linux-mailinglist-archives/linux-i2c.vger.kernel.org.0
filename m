Return-Path: <linux-i2c+bounces-9353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE248A2D91A
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Feb 2025 22:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99B35166221
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Feb 2025 21:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9389024110F;
	Sat,  8 Feb 2025 21:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbdYnpVi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C633241100;
	Sat,  8 Feb 2025 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051987; cv=none; b=pHOVhJXRqSfPImToAhPuEQRbUH4umaULgDd/y/JxuArLIGigQ6THAlp6ZcWD1zxo3Zm13w7CbjmRpDkT2E2PHsfjrzCU3liALrxX+kXIq8/4S1O36AZaHU46753ttmvQJ/i+ybGYB8EieGMf6mWSL3tSEwG178B6CWjAQMkDVFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051987; c=relaxed/simple;
	bh=opvDsrP0v/P8S2rjtY57rhFycm7ls+7vP+qbBtwjixE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FtegmU/5ZwtXaY0sbIDDeFCp6C1WozA2RiwZbl0Kt5N4BuGl5/phA/wc3zZ5RK/K/B4D3fqEqrJSmYdVgzXgrPTeaWDW64lkqjBbuXve6vhIocpdBFzYkgBgeQcvRJryxY87GnVwDvvE8WVa/lo8oq3rfuYW1C+BcQFkkr4kPWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbdYnpVi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E70C4CED6;
	Sat,  8 Feb 2025 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739051985;
	bh=opvDsrP0v/P8S2rjtY57rhFycm7ls+7vP+qbBtwjixE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pbdYnpViYSdibMIOgowycpShOEeED793MU0djWSDvzG8l1rJgmytpqAVT1ZDnFrnZ
	 ths4ul6mSsuUQUCN9WJpusnuUrO4Ke6ZZIDHW3c4dSxgtJludnq/7XRRIGWxUiDGkm
	 rYMhGo7xHhvQwDDM6GwBbQaK1kL2x4yNtL5U8IDj0iF1n6dsDFn6504A5QRifIkp6o
	 8TLF6bJ9HQDVOd1BJfdsaSjewbjTIoexdKfqKWUeHt23BN9oOBrXIjoJmYFhHcy6uY
	 VRwhmLnwkYMf71BVFN2nLvRE2XJ7+ljiMRZvx2EqHeYPZF4vZE3COqk1yxgTDaggk8
	 504zdpUGWZN1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F0BB0380AAF5;
	Sat,  8 Feb 2025 22:00:14 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z6dG_QT0l_ehhZd8@shikoro>
References: <Z6dG_QT0l_ehhZd8@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z6dG_QT0l_ehhZd8@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc2
X-PR-Tracked-Commit-Id: 3bfa08fe9ec8dd79e183c88e1275be74191e7bc8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 74b5161d57c1dd221a20f89e3d490da56b223a29
Message-Id: <173905201361.2669229.5599082119832862022.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 22:00:13 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 12:58:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/74b5161d57c1dd221a20f89e3d490da56b223a29

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


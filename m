Return-Path: <linux-i2c+bounces-4979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B77793080F
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jul 2024 01:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 350BAB2240C
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 23:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F237E15B54F;
	Sat, 13 Jul 2024 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnUmbs7A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA061581E0;
	Sat, 13 Jul 2024 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720913797; cv=none; b=E6VFgVjXAyMpEKf7jfjB/7jxN5ZXM9ksUdqEE6qShgBxSuAGSnsu09d8ICEePJwd1at3JGQD1PzlX6TNGeTNH4FYM94EgFawOiKZzn8tNTgfVRgNSMSrQodMVmgql9iHCcAOmpiBzudA9E4izqIOKKq/wFulReNBdsCr80sYED8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720913797; c=relaxed/simple;
	bh=oEYTu9n2mhNMV4NU+WpyeZRnD9M0W3CfQdzBgBrbFWk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aQ8vHsFqzRqWlwo4HBHY3IuJO4Xq+wMvOlnZoQHLoylE5uEe2C7/bsb4ubURDZIajQ6hNU/z5kcxVjK2jU1wz0BADwc96XlIptMylWbSgLOHORQEn5FIJOZkpQamT5PyD+axug21p82gs9aVSyT2UuHP7SRZUtjJR3jglSNGlnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnUmbs7A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 850D6C32781;
	Sat, 13 Jul 2024 23:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720913797;
	bh=oEYTu9n2mhNMV4NU+WpyeZRnD9M0W3CfQdzBgBrbFWk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tnUmbs7AyhOWbJe74SKKQ7I+tAk4Xk0xWwo6n4MuCGPQ6oBkl9tFXuOaI0tbwsaHp
	 rc/+UboxhyS3pmLrrIf+9m51MUHgKbR/bdPdGwlcT2pL8O/BQlNs49NIaUwH+tx7ZW
	 DuQdGZuM4kXGX68pDWEEEjryUGYSmiZy2hJ/fb2SAeCiKKyWXfjbjDZ4Ldtq8PhN7m
	 dzz3YjN/ZNr3RVvoZqgh+gJ7ufEojJQ9pvd0pj+7cW42H1Q9hk0L6ZsNZR2FPN6MCv
	 olgCF72zy0x4Q8Oun1wkzey3U9Mg8J+qhWLjpfUIkK+PVhQYC45QPAxqcZxPBKbbc6
	 9GSBHTCpofQiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A6A1C43153;
	Sat, 13 Jul 2024 23:36:37 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZpMC_ugpHtY3GrmA@shikoro>
References: <ZpMC_ugpHtY3GrmA@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZpMC_ugpHtY3GrmA@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc8
X-PR-Tracked-Commit-Id: 3fdd2d21f1c7f0203575b46d2b3fba81292992b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d145e3f830ba2c2745b42bfba5c2f8fcb8d078a
Message-Id: <172091379749.21743.5650844880639271212.pr-tracker-bot@kernel.org>
Date: Sat, 13 Jul 2024 23:36:37 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 14 Jul 2024 00:43:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d145e3f830ba2c2745b42bfba5c2f8fcb8d078a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


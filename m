Return-Path: <linux-i2c+bounces-2309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 395FE877347
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Mar 2024 19:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22861F215BA
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Mar 2024 18:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09ADC45957;
	Sat,  9 Mar 2024 18:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOX5F7pn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6ED44366;
	Sat,  9 Mar 2024 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710009297; cv=none; b=gMD2Mhr6tTW6aHXfy7HPnw9OeyV78q9m7JNuAR9QZadpfxIURWtjmBzm7tMSC7ptk7+QPbczC+AjVWR5DvQUq4bDMwHXq+wnimN1Plppqd4e/n47ZMsFwc/mfbuM05Xe3poe6TcZ7F3ePN/N5+26qtzXRZaccjzVCxXSVdc/3Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710009297; c=relaxed/simple;
	bh=rHv94BP/fh2Km7I5XaOM5v3BPWtNUyEOQZuK6NaT/u0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cdlMvTW8lhpXlka0n/8PysMLXLNLsA3O4nnvSv2MqCGqYodxBSl5FTmMxATRWxrzl4Jlk2GhCqgqujQ4/Tu0nJ/fJEvAxq/gzCWQ2+OA/4wzhfuTSQ1CFyW/l/GFiUjZkhc61CuTi5IJ0VemXhK+t3MDiKO7oyepvug/tArt93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOX5F7pn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91B88C433F1;
	Sat,  9 Mar 2024 18:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710009297;
	bh=rHv94BP/fh2Km7I5XaOM5v3BPWtNUyEOQZuK6NaT/u0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qOX5F7pnfDbAablxeQevSzCi0hM2cVODINXrd2AtLuCRhwOz23Lr3LrrDeIfNaYcJ
	 +pR9C92JjNLh2+ToJzdigSyTq5T0RJSclKvrUC8NCAyDbSKJrtwpnGoVbPJatagyhZ
	 /MXt3HSn6U+1Jrw5lWhdEnn28Up07n5i89/Fy92/s1W9JIe/fvhJA6UKkjWmDZ19Q7
	 Kahn8eEbBAcy5PJDYZx59Pg60384jKJTE7E7MhGVy0dXH0+HUTbmRFKGr2D1gdhLLe
	 v+5ztAatefqePf8TJm6/uDBVI6ZR9bx/Ej/DcyVZnCXrQuTLoBMJItovm2dwY0t11m
	 RLXOz4JhJhNXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80CBEC04D3F;
	Sat,  9 Mar 2024 18:34:57 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZeyZe92K9AnHD1SI@shikoro>
References: <ZeyZe92K9AnHD1SI@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZeyZe92K9AnHD1SI@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc8
X-PR-Tracked-Commit-Id: ac168d6770aa12ee201c7474e1361810d5fc723a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 005f6f34bd47eaa61d939a2727fc648e687b84c1
Message-Id: <171000929751.24252.9177806962861992448.pr-tracker-bot@kernel.org>
Date: Sat, 09 Mar 2024 18:34:57 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 9 Mar 2024 18:16:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/005f6f34bd47eaa61d939a2727fc648e687b84c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


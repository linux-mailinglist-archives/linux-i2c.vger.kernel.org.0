Return-Path: <linux-i2c+bounces-13292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEBABB2091
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 01:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A034486BB8
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 23:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FFC296BDE;
	Wed,  1 Oct 2025 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6eFMJ4M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D30291C33;
	Wed,  1 Oct 2025 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759359626; cv=none; b=sluJ0hQV9n6yvY3qREyxznvWGkVmiLhbw8tVN/jfjFbAvGlHX8FDWYSCmvTpjqTDInkUdLkfCGFpD9TrvD5A485F4ZDWI4rxWymb8Iu5+Cm9sCJlzlgrtCHiyk/SU9q/+nvDTos7SUDjaZ+aF9D73WmyMW1YwATMOA7/u6yvP9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759359626; c=relaxed/simple;
	bh=ftIxs8705Bb02PGQ/NJDS/WMOL1AQfZIJjkgLDthqdU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hwO3+LPBidShQERdRQIO2gxeTNsOhElyNPjhKYBZXYKfyZ2b694Cy9dkQGpvwCY2kFL4uBtC2lPxRZxYKlipWVF7VJiNY238yQnbD3L85MEdTqDQaM7Fnu3fi7/vErc7YyBiCPR3weFP6t2d8RbTFaE4WPvvx0W6pO+wpq5mgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6eFMJ4M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CD5C4CEF4;
	Wed,  1 Oct 2025 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759359626;
	bh=ftIxs8705Bb02PGQ/NJDS/WMOL1AQfZIJjkgLDthqdU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A6eFMJ4MzpMYJd+QKn28g5b6tCFDB+8LOOlw/ztOD2lgJZwR+UN9v5FBX0k8PFE2G
	 61Vu+cImBwIVtqMT+/0sviR9UkjgEcNSSebyxnyR4em1KkKvtHcTMeLOug45BXlSK/
	 mXMbePQ+SPJAD7B0TtJwxQKVNTXKU30hCVT2ZiDl77Go1FvT9pUZUb/xicHSbmiiwq
	 0zIeGfpogB2CCXiTQFTUBk9A4ZNZlkvhsNLuhrumK9QhiVqlPph1v+bVd0s29vrxJU
	 UOBzl6z1XhnTwbYsc7ttmFT87hfHiSKrb3miO8SELM1MEsw/InSIJfKyO6SJOptgIY
	 sK9M9mQZbjA2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF86439EF948;
	Wed,  1 Oct 2025 23:00:19 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aNuPMdKKx6CpBifi@shikoro>
References: <aNuPMdKKx6CpBifi@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aNuPMdKKx6CpBifi@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc1
X-PR-Tracked-Commit-Id: cb3005d4c490fe2489accd5408592683d705b455
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf8da11679ec4e54e2dd3cb147fb310a2230be52
Message-Id: <175935961937.2650940.15344310452271499673.pr-tracker-bot@kernel.org>
Date: Wed, 01 Oct 2025 23:00:19 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 30 Sep 2025 10:05:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf8da11679ec4e54e2dd3cb147fb310a2230be52

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


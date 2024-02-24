Return-Path: <linux-i2c+bounces-1965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F8862698
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 19:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E9B81C20F98
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 18:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D15495E5;
	Sat, 24 Feb 2024 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbO+0KS4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EB848CCC;
	Sat, 24 Feb 2024 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708798259; cv=none; b=ec9lUEFCXNomrYyd+bTaxubs1LjGH2PuZzX4DBi6AjTfkkF8hJXAOF2xYcEN2ImqtxyV6EVK38rQtqKT2wGznXnQ499XM7sy8mG1ElJ+k+mKjZSNLBa/Uv1+ONMxmJMHSVgi/x38/P0etyzGVC+EK9iBJqyUNUVT66JscxGovg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708798259; c=relaxed/simple;
	bh=FzEL9PuF/LstleE8jb5hXjkYaQV7w+BROZoCdPzmu0k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RDBfot418oI/lT4ZhAlgxziRtdO1exP5+ip32nGIYZsstbA7ywtHfzp1DpHYTtebV4XsPZBEE2C44b3fXi6gIj3eSk+meAwBYyxV5spYQku0WrIJnm7B+iL+9/SuqbKRF5V6X6Q9DrTBIrDFOnzngrmRgp53TXR42iJq2wX7dYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbO+0KS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E953BC43609;
	Sat, 24 Feb 2024 18:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708798259;
	bh=FzEL9PuF/LstleE8jb5hXjkYaQV7w+BROZoCdPzmu0k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SbO+0KS4v3yxpMHlyVYQo/fJHz2MyqbMc6TGSB4DWXfm3rAKrHMzREFx5S/srtKRn
	 ylQlnT4nItZR1fPz7pThSmnt5ODptzV8U6WirMKXBMppP9AcwrZOOYh+9b0BWftMYa
	 b2Sfo3x/1Xm1l3ItDCDmef7shNBLA7WpE6xtJBQ1RRQ0MRcT8uARcmXBuDam2PYMnn
	 WiANTiKl95NnP6vOPOFXXuM5otlL4ms0eVnVQ2/vFqOD6c4zfRPSKqD6A6/DOqi9+7
	 D22QjqeAV9WEPfxUbNepySTfZFIFEysCdxzK9KBM6fUH3jKNCWkpCFZo04NeakHlpc
	 1cpNRxgrzqMnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D70B0C39563;
	Sat, 24 Feb 2024 18:10:58 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zdkh-4-6G9UfkOIu@shikoro>
References: <Zdkh-4-6G9UfkOIu@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zdkh-4-6G9UfkOIu@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc6
X-PR-Tracked-Commit-Id: 87aec499368d488c20292952d6d4be7cb9e49c5e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fef85269a19d277f23fc5ff08a3c356beeb54cb3
Message-Id: <170879825885.13776.9809858876282616022.pr-tracker-bot@kernel.org>
Date: Sat, 24 Feb 2024 18:10:58 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 Feb 2024 23:53:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fef85269a19d277f23fc5ff08a3c356beeb54cb3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


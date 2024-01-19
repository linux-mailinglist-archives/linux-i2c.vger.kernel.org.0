Return-Path: <linux-i2c+bounces-1374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759A83236B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 03:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E8DA1F22126
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 02:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B44EDF71;
	Fri, 19 Jan 2024 02:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDjd8BxX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB28539A;
	Fri, 19 Jan 2024 02:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705632025; cv=none; b=SFqm+Uq1bvhW5BDOVUTHqCo1YHYALQkn8Z/eHFuDcaaCiFtXmb0mbJsF2tdyFV/kF/GA1I1vN21o3zbKrg4SFgpILkfgriZcYCeWAY2ruipTbmUC07QZdB3i1vPDkrx+VZ1mFJWOgqwXhZpXQniPtPRMG0Vn6QCLZLXQIg5k93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705632025; c=relaxed/simple;
	bh=XevaTIM8eObqjIr1nzvVaMK/8iui7QlHREWZss9wIRM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PRIaxkf2Dl0oP7nxyVs4DE3uxc4OaaqtFSHz7dEzM0tN/63YiORNYt9ERVacasGFDQVFimqThxnyte94DfuOGbag00V3e1AY26G9SdymjBiAJjm/RE3o2ED2XZPEVwblgQqv5E5qGbENgadzfFBLvxGw6iJa5kBSioXum+j2hxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDjd8BxX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CE1DC433B2;
	Fri, 19 Jan 2024 02:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705632025;
	bh=XevaTIM8eObqjIr1nzvVaMK/8iui7QlHREWZss9wIRM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kDjd8BxXfBti2spQhEzZ3S9SpE4UqNfqzjBcxEJN/+h83GONz6M18KKxO30QSysRN
	 z23kTl/Xh6hiiioJcpzsy6fCG4zQyuG6HGHk7WomxSiwXTYRUZK3B5iUcjcVTBKpO8
	 syID8SRrmOZ1gx/fzIQWjoJX8kr8V8wKksfoR7QQ0dXVrr871NlpGtDXudnHHwXA2y
	 9wa7rj9z0pp5xYArE+4d9PgW3OuuhcKKZYr/Rk4jpzSHlkPfCpqA+Dpevr3SW/GF09
	 J4r2iz3/8NVRvwkLHm+pVcqiU0Wu7AA1XJnXXP1M0cOZhQS+CQ1hTjHvrvingHEfAo
	 XZB0jDz3b5iXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0CBCD8C970;
	Fri, 19 Jan 2024 02:40:24 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc1-rebased
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZamIagjK_j3gGQkG@ninjato>
References: <ZamIagjK_j3gGQkG@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZamIagjK_j3gGQkG@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc1-rebased
X-PR-Tracked-Commit-Id: 4503538d3066f6dd0a66ecc902b382912b97d8a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed8d84530ab0a3b7b370e8b28f12179314dcfcc3
Message-Id: <170563202498.16016.1279230888326987319.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jan 2024 02:40:24 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, Kim Phillips <kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 18 Jan 2024 21:22:02 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc1-rebased

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed8d84530ab0a3b7b370e8b28f12179314dcfcc3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


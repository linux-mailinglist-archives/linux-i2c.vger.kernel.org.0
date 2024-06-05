Return-Path: <linux-i2c+bounces-3835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D968FD5AC
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 20:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D06402895B1
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 18:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A38F17559;
	Wed,  5 Jun 2024 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaC8vTXz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D9624;
	Wed,  5 Jun 2024 18:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717611957; cv=none; b=GRzZLm/FxXiBa95s8xTlE/FxPTfs2xB9bPcE0yMkO+06lojepilapONZu2T/Whz4pay3PYW8bBubBtdcoN6KeODY+kA6QgKlwBtgoWovsYyR03YfP9/sQJcj+H8I6csEPacuGkvCEu0XtIYyxdKDcPwC7/S9cOBhtQRHodTLtfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717611957; c=relaxed/simple;
	bh=4y/5omC4EzN6RGvi7zJRrpb/JlLZ7cEbjI/uqSM0BDc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kmLaigrS/0Eh694CBSHjrCScAXAOwBxQphwdfX/27bwQtoyc0yW4+IhDgilgOSfyOJNOCcqBdUY9LbeKASKajS9jaNIuSm9VXWlH2CrtaRm0ljV8pcNLYjXFQplyMO+X+6Fvui3QCo2OC+jZjD+zmzZ+5xAl9tEFTUzHPgno9Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaC8vTXz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D21DC2BD11;
	Wed,  5 Jun 2024 18:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717611957;
	bh=4y/5omC4EzN6RGvi7zJRrpb/JlLZ7cEbjI/uqSM0BDc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NaC8vTXzldpN99NeCh4qXmN3smgEB4UGQInaebiB8m8+5kbkPvIKaGfu5jBWjvuwR
	 gbEOc3n3j8Iovn6/FVPII5N4c6YbSXfWC91RwMu0gmf2O31AI7MKFr5Kiae+wCEmxZ
	 QzOetn3gYJVl7wGwLJp3eW0NYk3Kst9b/ekcLIPOH1O6dyDE3QgMJarXHKkr87yQHl
	 Y9bKa1DBezrapE7xmqyyyixwR+2m9JztCCOunsFSZMIxemjOu8UxWNkNwJF34kXukg
	 yXImiNWfZNG1Hk9EKfFcF/tQkNA/OFGx+jiyCrY8aUIrQTg6y0o3e8cwwEXpmEABIS
	 TldfE6soAyLsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3EE07C4332C;
	Wed,  5 Jun 2024 18:25:57 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZmARnWliAuHLbwOy@shikoro>
References: <ZmARnWliAuHLbwOy@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZmARnWliAuHLbwOy@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc3
X-PR-Tracked-Commit-Id: c4aff1d1ec90d9596c71b6f06b0bfab40a36a34a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 558dc49aacc7f3a348c1f10af7d1169bed2fe426
Message-Id: <171761195723.15423.10373651732253520378.pr-tracker-bot@kernel.org>
Date: Wed, 05 Jun 2024 18:25:57 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 5 Jun 2024 09:19:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/558dc49aacc7f3a348c1f10af7d1169bed2fe426

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


Return-Path: <linux-i2c+bounces-11551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E3AE31D3
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jun 2025 21:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63B516EBA8
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jun 2025 19:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7F21FFC7E;
	Sun, 22 Jun 2025 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/sDK8sj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE81FFC53;
	Sun, 22 Jun 2025 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750622117; cv=none; b=mxH5opxgz9R+85I4MNZwJ8taLXga4nZX8X1POZ934fOMnKUVmmP8s3YJlqZtujqb5xw6sPqrbfLZFKaGzxjjQo/3fTj1Vq9vIYAEjbatDsQ644Sfsm7DwEwTjXnUSVBKGkQv5Gg1sIgLbGAf8Q87XAV6oy9L1lj48ooxZBJ2974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750622117; c=relaxed/simple;
	bh=8XlmMfjUrdtjzu/JsfZgrKoDOMzAmU/GBBu5oKnfxR4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=C+SeFBgfRq7vgP7osMyByh9ysXGPVjwN4x8I0zLg+LYl6pbsZ1vsE+BZlDWhdsbFd/hK84byrN5SxKhK6SSVEby1uD4WbzEdHD6lE/oJMdnCiTGQLUQSZN3aipbGA58GGCc78Pz4VDJpAj5CYHGZmjnHmV0RT2bVI/IM86GP4kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/sDK8sj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA7FC4CEF1;
	Sun, 22 Jun 2025 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750622117;
	bh=8XlmMfjUrdtjzu/JsfZgrKoDOMzAmU/GBBu5oKnfxR4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p/sDK8sjNBDpREADRKCyDcGvYekI/Db0Huam4KSsn8WMMWzh4EUnRf3bvoK/1zP3P
	 Fo3jrUOF0cjxgNe1zwUluiFrvpRUu5pfdyggk5CSpplREK/UOgysJVYZJWvKBYNvg7
	 QPlZodo12iYXtHFy0OG+0FLJkygoAw8ykRW59sbIrs8/u5gcIxDylh7F41vPlFG+2k
	 q5Ku0s5QTNdBOdAp61B6nxtpOIAZZ/TsMAscxTmRsSNS72TsPP+F4DccXfTYQjDRjH
	 o5H69liBHNfz1qvNUygEVk7Y7SQXFtSVRcTCbws8uGUibT62eDu1T60GC7qPi6g9sP
	 /3/q5EOaOyJfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACBA39FEB77;
	Sun, 22 Jun 2025 19:55:45 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aFgDHBHwY5ElWILx@shikoro>
References: <aFgDHBHwY5ElWILx@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aFgDHBHwY5ElWILx@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc3
X-PR-Tracked-Commit-Id: a6c23dac756b9541b33aa3bcd30f464df2879209
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b67ec639010f7d2ce2b467cef36f3e5e785d8d50
Message-Id: <175062214454.2132065.39842938111684941.pr-tracker-bot@kernel.org>
Date: Sun, 22 Jun 2025 19:55:44 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 22 Jun 2025 15:20:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b67ec639010f7d2ce2b467cef36f3e5e785d8d50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


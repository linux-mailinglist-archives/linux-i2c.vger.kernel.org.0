Return-Path: <linux-i2c+bounces-13455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86ABD0C2E
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Oct 2025 22:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D65B83BB91D
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Oct 2025 20:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08C221D3F5;
	Sun, 12 Oct 2025 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg1phbU+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D42AEE4;
	Sun, 12 Oct 2025 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760302016; cv=none; b=U8671Unh18heFSHB/2/4YbUzR7VXXz099oZ3LtbsUcdXvSJqkgYYxYG/D1IU/ismPgNVoQdV1t2KISAeQPwbsO0Ta4kFPn7SE9EvxTaqyKHz5xV02aM1ZVmlHNiUrbkiEXu/JbrQeDVIo7efKfoTyPR264vHP20xB3lV9z5DuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760302016; c=relaxed/simple;
	bh=4IemdnoK4uOyIgBSuuM7vbkxtVrjzsuhXERr62md+DU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OVYxFrPqrLWcwJyRvCSFf2+ilp1gs21dsaBCK5o/BaylgoLkPO0TkCFrEV48UYQaevfgBzh8Qi0gc8WOXrao9JBMyp9IK0xvJqXaikvWuDfvVioQwOIsG66Gvl7WX8BoabI25B+aTJxk3G7rM+CWSP/kZKpqytyqf0TiugMP4Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg1phbU+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDECC4CEE7;
	Sun, 12 Oct 2025 20:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760302015;
	bh=4IemdnoK4uOyIgBSuuM7vbkxtVrjzsuhXERr62md+DU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mg1phbU+y6rXWF2Jsq4PpL02haT33HvZOL4KKTF540h686c8LPF3lnky3XciQtDUe
	 RV3/6cOYyUZ9VcfQRkGlqKVOtoaIIUI4XU3aJEiZ2qe9iDrj/0t6CTmAp8HiVjgnms
	 eig/KSm4M68uTZF304IemtOwABoxYqIdG+WgiDIkKujSJKFSRAviXxcADuLQkaNcl3
	 aRzh21fdPnyuu07kvqwvzUtM5S+2bXJqVuJdbBz6VHAXt29UiYtIq0WfIujsEi+83A
	 PiJyaX4YCEpNeaSEc2InfgFhotiCpNUVj2E9M9aeZKfvAOh2fr6viHVPfhSJKSJBtc
	 xahiddJhKufmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 375F63809A1E;
	Sun, 12 Oct 2025 20:46:43 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.18-rc1-hotfix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aOv3S1lkcqj1BncF@ninjato>
References: <aOv3S1lkcqj1BncF@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aOv3S1lkcqj1BncF@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc1-hotfix
X-PR-Tracked-Commit-Id: a8482d2c9071d75c920eba0db36428898250ea57
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3dd7b8123544402be76bea82af43d2de4b9226d8
Message-Id: <176030200169.1748613.14934457031395400948.pr-tracker-bot@kernel.org>
Date: Sun, 12 Oct 2025 20:46:41 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 12 Oct 2025 20:45:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc1-hotfix

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3dd7b8123544402be76bea82af43d2de4b9226d8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


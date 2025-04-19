Return-Path: <linux-i2c+bounces-10497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 693AEA9457C
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 23:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23D171899E43
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 21:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616E01E1041;
	Sat, 19 Apr 2025 21:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNOmSqUo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA6714901B;
	Sat, 19 Apr 2025 21:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745098656; cv=none; b=Fq6jTxgNeJUnskV4XMnANmzoyvOKCzrIYCMPaPPUeJ8udo67jyIZDYgjvmQ5Qapm0SnKiSClHW3+NZuoAGQFoG5mhVUmKup/IrAWCHDxKo2cEfNuc6Yw29UtFy00Ewpgg0mT8MBhUZso3d/PKlJAGV4nRnB8RsgY/AUUBmeagYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745098656; c=relaxed/simple;
	bh=Yr+wCGLr9Oqr2mnTN9L2NKjKdoCcrFb5LTmYgT9GJKc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lRBOBjT2eWD4FGGr58B8s11jZbR/TlQPifCZluBxeCGTB3fBPab3cjdqZcwUmMd4dQ1s+eT9f8SYD4sGhEyCDIvrtCrbRjIYwarf5DBaYKLxm7lc6FirzUEijdHyW6iru/djss+K/zIgARxmKt41/TpISYTyD7vQCDWYDqqtuLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNOmSqUo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC881C4CEE7;
	Sat, 19 Apr 2025 21:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745098656;
	bh=Yr+wCGLr9Oqr2mnTN9L2NKjKdoCcrFb5LTmYgT9GJKc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JNOmSqUoyjf+yGAguRybFHmFG0fhDVdGsMnP8XclmITbFYPt9jPvZxz5gsPttIR1p
	 3dn+0osguLKfGi7HLU7v15JGd+RshB5Hs6LTkqzsCVSrAtSdDv15ekwCJcsUdmtoYC
	 rKWRpb3LRrEFglaic9DHsP+dJYZ4op/f+NTZqKWc+6sN572JjcuMYkMghF4UShpq7z
	 OwtuHkM7vmguIUmEsFxYTh1Asx/h0jhDyB9VxbpSUDkBWcyGgtTe/GH/Hpptt1B4lT
	 0jpubtHHru8FmyxjYtgoFDH0q2UCDUaK51W8plnnsDIryqbPb1c/McVa/ZxJMEctDu
	 nSinsX3XMpJJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F423806642;
	Sat, 19 Apr 2025 21:38:15 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAQL6l45c77VG4Vv@shikoro>
References: <aAQL6l45c77VG4Vv@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAQL6l45c77VG4Vv@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc3
X-PR-Tracked-Commit-Id: 24aaced72a686fb1dd8c3477987e1eaad76230a2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6fe8131757bd58693dba0775e919d46ce183dda2
Message-Id: <174509869392.540479.4368752802011045509.pr-tracker-bot@kernel.org>
Date: Sat, 19 Apr 2025 21:38:13 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 19 Apr 2025 22:47:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6fe8131757bd58693dba0775e919d46ce183dda2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


Return-Path: <linux-i2c+bounces-9539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7EA411A8
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2025 21:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0685E16EEEE
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2025 20:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F8123F26D;
	Sun, 23 Feb 2025 20:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iV/9hvZn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2EF23F295;
	Sun, 23 Feb 2025 20:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740342766; cv=none; b=BUFl2rRKzMoPIy3ZEZsVd9SmLHjS91ZsBRsPvJDtdbMTT1pwObGYw/P7SU4kbHZupSc+z49YRkVAOLsoOVUUdAMmEeFlp3NFLaSh4JmbbU4mz1G6lstLjIZeg2mTTVBXMyvOSc6IleD9UYqm+c+93xrU2FLssBmtoEWBmgoTcv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740342766; c=relaxed/simple;
	bh=XiYmk5hm8tSoUx/1BnPIPMgRxLxX6XfMs+HIIJaFOh8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=s8WzG7SyJjhhx5NDYqBx72sl6H9X6QkfgYv5wDvSJx7cTu9WGNCEGMdbAjRZ1gIcEgI9q7hfldIEaItaw9EksLdVc3Q40iXtfGJJYYxoRP1Bo2KNixC3OSxxUX03GZstRzN4OqE37LjyWkQftNCX7RlOvuLcvQ9xh4/j8hb4/1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iV/9hvZn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6550CC4CEE6;
	Sun, 23 Feb 2025 20:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740342764;
	bh=XiYmk5hm8tSoUx/1BnPIPMgRxLxX6XfMs+HIIJaFOh8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iV/9hvZnO8wjX8szLrJPw2SaLgo5IfVsCuZrWuDkpUIYgXP5GqNg0tro7m8qTUOyU
	 n/THM8pf0ulM0und0GoV0zBPZnZiDTWQG9OqsSj3VGa7OsNoAERjXwnPAA/fQdfg6V
	 x36He5CmORqAp0BuAsJIXSHfHeCFrM7KVEsCoZlxnvmqcoXWTBRrFU1nFTu747wuHH
	 zmRhpyx73ROE33pQuPw30i7CNr1Hy3AhP64FSfYdWqEBVHd1hcl4ZlBwM/yuCEwfxm
	 3GPJEoyzK2RVlW9QWB3yHH0JP+qNl0JFPOhzkCDzJ+K7VEdQbaKp2+d2wfvQpj7hwQ
	 OnbJVwprv/jfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD5F380AAF9;
	Sun, 23 Feb 2025 20:33:16 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.14-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z7sPfKmfDJzXOPrs@shikoro>
References: <Z7sPfKmfDJzXOPrs@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z7sPfKmfDJzXOPrs@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc4
X-PR-Tracked-Commit-Id: 781813db7909d945c33d3b035822225f3598774d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d68911233472dc2b336f2cf99521bd684ba6092
Message-Id: <174034279552.2614901.14134452049011905096.pr-tracker-bot@kernel.org>
Date: Sun, 23 Feb 2025 20:33:15 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 23 Feb 2025 13:07:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d68911233472dc2b336f2cf99521bd684ba6092

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


Return-Path: <linux-i2c+bounces-8807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5D9FE028
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 19:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70B818822DC
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 18:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B343199254;
	Sun, 29 Dec 2024 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsQlj4Xf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2CA259497;
	Sun, 29 Dec 2024 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735496540; cv=none; b=WWMnNPIsckr9oN6i+IHu3EUTAdQuLt4KeHyrK8kOjHXiHc8MI6scdNUjQs9Y5hAVbPa1Aiw6JYMSCUSG0McxuTZEPJpnka2j+XkAsv31vSLmFdCWe8DcTM7VfLm6+mIU8SGYlUXYuc+PqIt6LSDOACPht/Agf+zgve58zbZGNlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735496540; c=relaxed/simple;
	bh=HQP1rniX5Q1ihoiIFn3CfU3E9YCrpHZmqVilZokTChg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eEMHfHfKpUStFQ0ATVWovqkfCLsPPf233RI7Hic9LPDfoFSX7cVzIbpKhXxBlNcCGVEKX8coioLEZogeMxP8GhKwQ/NmBGw/lW1oW5fKQJtNY4SELGiGAMFFJbmhXSeK6MLScm0ePMLHggy6wMDQRnYjSi0RJ0RbiR9ZnVShzYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsQlj4Xf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0610C4CED1;
	Sun, 29 Dec 2024 18:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735496539;
	bh=HQP1rniX5Q1ihoiIFn3CfU3E9YCrpHZmqVilZokTChg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EsQlj4XfLKGe9CE3GmlzgRzwsKdf2AdGPtXr428hOgvnQVjcnAeb1jnV9x3+9x2DV
	 JI6AjrKayJlOORVf197juYHyI8TpaP+ZkJizbsIiptY0g0usRzyWH5ZFcrdDx4rUPE
	 E83BPQ20hgWhZ791e0AU4zSaHrlOPuKl6heGPgdMEKPxKncFieh0tPmLQo/xDzHZZ5
	 fAJgw2H22rLlpylLEyaTeGHZT6TAZIbrIh3RNc4ky16xmbnx0mPuMiDKeg/Ed/su8i
	 Xoa5O+wTd1SX1wM37YfOXgJ7tL6Xh7/q6FFbkquOSledIGRYeqlqGN56l4b6XjKWPC
	 aEcSlBLSVzAUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B983805DB2;
	Sun, 29 Dec 2024 18:22:40 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.13-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z3Byv8tvueVAsv08@shikoro>
References: <Z3Byv8tvueVAsv08@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z3Byv8tvueVAsv08@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc5
X-PR-Tracked-Commit-Id: f802f11b2336b0f5c522c6ba827a013bb0b83826
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e1d9326608395543d9c4d1bf2932f14fdb75c3c5
Message-Id: <173549655903.903038.16658919944804862426.pr-tracker-bot@kernel.org>
Date: Sun, 29 Dec 2024 18:22:39 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 28 Dec 2024 22:50:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e1d9326608395543d9c4d1bf2932f14fdb75c3c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


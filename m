Return-Path: <linux-i2c+bounces-14021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434BC445DB
	for <lists+linux-i2c@lfdr.de>; Sun, 09 Nov 2025 20:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4779346295
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Nov 2025 19:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0A7238166;
	Sun,  9 Nov 2025 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fI7ORKK6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8621D5AA;
	Sun,  9 Nov 2025 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762716036; cv=none; b=lmRkDS8uoLTSd2K9FW08/L+EI45NdoZEeq6qA4YsbQLA1DBZxDsf+SShSsjPTKnQAdAqlSCdZMdpB+vL5N1xspx1FjvZhdXl8/nxRPMu39lgo3kTduiVxFrZ8PR5fOzd2VzkE+uwcK2JGNfuBbWHGe5qpDqJLA4KV70gmByM6C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762716036; c=relaxed/simple;
	bh=pgFXozODZ+3i2d7mpI3QbBPaD7sHB3tdtINRQkoKMZI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iSfNr4nyJY34ZiPd9AliIrqB/7k5Daau80aoT40aS+h2SIixlUPB9nOAPs4gzYJXtYBu8aRDrp4E+dPf/oFLeR+0RMZZ5qLUHEPw0n606qcwDE4biJSRtQ/FYris3K02iuprzdYEVy1LasXH9brg4+wYkaqiCn44tP6s3EuFPzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fI7ORKK6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FC5C116B1;
	Sun,  9 Nov 2025 19:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762716036;
	bh=pgFXozODZ+3i2d7mpI3QbBPaD7sHB3tdtINRQkoKMZI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fI7ORKK6NOHxrMb3x/0DEamw6vgu/YEZ5KxXo5oDNa0EqiNl+YYJGAnLiO2/7IrdZ
	 IQDOjHhYHluzKBWwKV1xSjlPCteaLratVDWDHtVj4jSriYlgOCp9wiPG2pABe4WvUc
	 GfEm+U7AzBkCLHxlPfAnHq4+cuCCldLxxioBzCio6CUJYR1kBg8Mh9NfZQ0c8W4kLw
	 5j4/l36QnyYehcvJtQmCjFK0TL/c91A/FUeMsYe81CT6pmScft1hTxd9jGCaDsccTO
	 GPyjcKYj9nAop7GsNO3nUA6vagFE+d6hdlAdMBndvydB9BSZe/9WV/ZtJvxCkViLVA
	 u90/I9cMk2zeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF8EB3A40FEA;
	Sun,  9 Nov 2025 19:20:08 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.18-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <aRBI3ERoaz18MvCQ@shikoro>
References: <aRBI3ERoaz18MvCQ@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aRBI3ERoaz18MvCQ@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc5
X-PR-Tracked-Commit-Id: 6a0dddc53f6f04281b27254a7d940fb9bb2d5a3b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f850568efe3a7a9ec4df357cfad1f997f0058924
Message-Id: <176271600756.1617788.17904772019480708754.pr-tracker-bot@kernel.org>
Date: Sun, 09 Nov 2025 19:20:07 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 9 Nov 2025 08:55:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f850568efe3a7a9ec4df357cfad1f997f0058924

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


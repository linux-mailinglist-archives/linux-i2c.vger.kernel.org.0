Return-Path: <linux-i2c+bounces-2564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E978871CD
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 18:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33238B22472
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 17:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED3F5FB86;
	Fri, 22 Mar 2024 17:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iePa8gXW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AA5EE78;
	Fri, 22 Mar 2024 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711127761; cv=none; b=fzVCCewLp0/0CSxyZHgVwfgyLahjAUHtkEIypTfcDCIBrbXmoPZkAI472tMBfvyRLHqISC3npMQmJSWiLN5FSMBJ0akR3LBRvAHUZwzgRCqFcpYsLlEbh4Jy0LzEo7qNmBRk2WZFDDLkGT+aUHh4vzXJI9Xhh/YdG7N0qut085M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711127761; c=relaxed/simple;
	bh=RxuwOUWio1ZtM7nSTtjutlua8crmXfw8t/5qzBJodqE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VDwuWWWat9OqVUMzYPcQB7CDwJlXgHx7VKHM3sKefaK5guC2u2cgr3A9sZg75c1vGpVDe4+1lFT1vczkP/IlSO2bPrDuBOfhGlc2lFTfEVEobUsPyvBqJ/Cj9xOhj2KsSAzNqpdxj2NqzbdBKDJSkVvBRNjMkoxLx+0/NsFHQdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iePa8gXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A75B4C433C7;
	Fri, 22 Mar 2024 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711127761;
	bh=RxuwOUWio1ZtM7nSTtjutlua8crmXfw8t/5qzBJodqE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iePa8gXW0q41VhvrNwugZxNv5uqWHUZd6nArxiyqoCJQKKcXSPPtnCsaJL5RAxZwU
	 2nRt4OmjLjyA0w1BTye/PRcwCH4zM72/2e4jyGEAAyEUxhTO2xfi41aWZWcmk4tT52
	 iHa8G2zOfOIlztKeKXaNxH4DZSXHLZeVjchQJm14OErVtQbpNBtVq7h3BsUlx7H/Fo
	 og13xEffsW//Q4ExArxLqgmQWkpgTC8ia5wSiWPIuDYwq/tjXsRki+Fh7Y+iBPcoMi
	 hJm9254lvvd8a7lvxdIodXVR5rnCBw7kgeJs8A2V8AFFf5VygbMeVgyfGk/qDcSmmJ
	 M9r60vlDI/1kQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C496D95058;
	Fri, 22 Mar 2024 17:16:01 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.9-rc1-part2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zf0v-8vtOcMdy9Hp@shikoro>
References: <Zf0v-8vtOcMdy9Hp@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zf0v-8vtOcMdy9Hp@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.9-rc1-part2
X-PR-Tracked-Commit-Id: e593a4a2d3ad5e1a4be338b38ed6ba7c70642d88
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5ee2433f321b4983809ce1cd8a721c4a58fe6d51
Message-Id: <171112776163.8613.1796733144503056886.pr-tracker-bot@kernel.org>
Date: Fri, 22 Mar 2024 17:16:01 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 22 Mar 2024 08:15:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.9-rc1-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5ee2433f321b4983809ce1cd8a721c4a58fe6d51

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


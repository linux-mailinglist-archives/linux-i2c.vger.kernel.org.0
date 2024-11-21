Return-Path: <linux-i2c+bounces-8129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F199D5643
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 00:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FE5BB23B7E
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 23:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E651DE3C3;
	Thu, 21 Nov 2024 23:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2kU4IKq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB651DE3C4;
	Thu, 21 Nov 2024 23:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732232415; cv=none; b=Zu7/SAztQhbp8/vnxo3Cqg2GZgUnIudzdh9HXb+Vo1gXaaG5CSY/zoBiBr+dxrLGBTmfT6W9QDnfJBEOUMsTc2vIR2ghzjMcfqa+U41KUtm8hoXbit1a7tJd1OaGGNj43YtoqboHWWiBQ/Ismvtz4L9GyOoomQgrCo/vkOnE/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732232415; c=relaxed/simple;
	bh=Uv7JWiHvwOLYdqbOhjraPhVG14Fku2H3YJipY8FnFWw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bxiGwb5kjsADypPekOhHWXkpYcQSqceqZympl1E4QBVjMpScmb4o/cou6CI3mZ48HwI27bPLr3/tuG8fcK0OAVHeIiliV9m+KAqXWHcbi0AjFH0PcQyqo/EPu40sFtf/ZXI8gQuSAql4evCB2JL96Sag2RH6aa9+pZAE23yLBUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2kU4IKq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC351C4CECC;
	Thu, 21 Nov 2024 23:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732232415;
	bh=Uv7JWiHvwOLYdqbOhjraPhVG14Fku2H3YJipY8FnFWw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=J2kU4IKqe+sKbyyxg2Tb1GHFRccE57Wjs2OeRQJl0WF+Ki5ZHb/CV1CyC215l2rCj
	 EcpHPZYWhnhlHPjJnU2dCLKIBH0D6cTxhgXWm9wV7AkCu1lHbWQSSc/NkSSCAFNsAk
	 KodJ5X8zBL0T0xBQLtXIi04kJc7x2UbpkmZwwQbhwnA+iYOdPcXRGkTWV60SfM85K3
	 nMhMrmQmOk8rZPZ98aw51ngvRmP7kAy4NFJSASmi6BsjNYMLQhP9Xxq/OFTlZ+Lyax
	 P8pUcr+qI74TvAtVFRT1qX5YhWZf/N/koBaIuVo2B6S+BnRGDSxHVkwznWCXs38LMy
	 +0t3QODUqBgXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1633809A00;
	Thu, 21 Nov 2024 23:40:28 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zz7_OUd-y4ZjnlFZ@ninjato>
References: <Zz7_OUd-y4ZjnlFZ@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zz7_OUd-y4ZjnlFZ@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc1
X-PR-Tracked-Commit-Id: 1b3073291ddbe23fede7e0dd1b6f5635e370f8ba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55ae3eef10ae813616bd8a421e318d4b0e2f4a0b
Message-Id: <173223242767.2158732.9121852463880531015.pr-tracker-bot@kernel.org>
Date: Thu, 21 Nov 2024 23:40:27 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 21 Nov 2024 10:36:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55ae3eef10ae813616bd8a421e318d4b0e2f4a0b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


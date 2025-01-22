Return-Path: <linux-i2c+bounces-9152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2809AA198EE
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 20:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D58D53AD33F
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 19:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB252153ED;
	Wed, 22 Jan 2025 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLOJlDyh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF022214A9B;
	Wed, 22 Jan 2025 19:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737572757; cv=none; b=adtn/0Bwl0OgofuT5wBrI+LLT8ibnXwsg7Gs1zuzUy47zKf244V2m/s6n9v87Jv9GzYGoKeVXHVc3yzMOy/omqrXlg3q0OgtiIu/FGbU/VDM8xyw4S+wld9wxsqC2sI/NQA1Llry/tnA31lmiiRQLbKtcsGp3a8Ce19c1rATJTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737572757; c=relaxed/simple;
	bh=P5PLeKDi9stetpHaUL5zJIN0JWDGWQf7yS4GVGvo29U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TdXMCJX0wkO86BISsCIOsElmAca3KoaWJ8cWRY6Z5dtr+QO4R/bke7Kxw61yAYBnGkXog79rHaWk/heynToQvdaSRxQeK08pLIaBHLh2e8pAtW6/JMuh8/ruZl3TySTgVEkgiGmUVzcUAFP8eEw7mWMWwG7HX4cb60/4H8x+X0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLOJlDyh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C85C4CED2;
	Wed, 22 Jan 2025 19:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737572756;
	bh=P5PLeKDi9stetpHaUL5zJIN0JWDGWQf7yS4GVGvo29U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CLOJlDyhK5SQcqJA8TZIpJ908G6q7y6o+DXr/koVas++tsLtp/CLNFfgWzniT8gz/
	 Uz49yacH9NShUEMXXdDkX0eC0PCV/xJOHZ/fDXORt5BrUjjmzB22S1gQ510MtdgGKJ
	 UR4X6+I9CryJ9PdzNrYaIZbk7/BvkBhvg2tzkD9WcfMkbNfsMYoxsfz9pylcGZQMH2
	 SLE+HlDM1Es1JSgHsoI1+i8NWsd1W4g5bUAsJVLMrtrj/h8YGY1av8jYH2fJhX1qKN
	 p52FNYzQkkafZPkMHAVKPNCMmEJ8/jfZNkcN1CcDHOEDHK6dDvrgyoNVIewDFnb7Ya
	 Xv/pRIfE3fz+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 72022380AA62;
	Wed, 22 Jan 2025 19:06:22 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5AcUmwke1z4ZI4l@ninjato>
References: <Z5AcUmwke1z4ZI4l@ninjato>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5AcUmwke1z4ZI4l@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc1
X-PR-Tracked-Commit-Id: 27c3f0e61f19d2306527406cad233d5f5915ca1e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: abdebb2837ffbf3187791e92b68a7d80eec0e773
Message-Id: <173757278103.783272.13982114553630660654.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 19:06:21 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 21 Jan 2025 23:14:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/abdebb2837ffbf3187791e92b68a7d80eec0e773

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


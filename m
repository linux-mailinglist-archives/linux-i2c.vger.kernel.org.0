Return-Path: <linux-i2c+bounces-9273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D5A26397
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 20:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B42043A661F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 19:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0023B212B28;
	Mon,  3 Feb 2025 19:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orq8j9IL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA1F212B0B;
	Mon,  3 Feb 2025 19:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610134; cv=none; b=hws/hB+Wu9hm9wRhcDS2E0iFJO38gh4JEyb9d+EqiaqO40LAq0zcmWwfoXeb6ucITiGhl+Uyz1gRryduuWAWwy6bBD/tEcF6rwsW8vWtJVGdutsfTrmcBV7eoPlTFFrGu1MAcX+clPwe67vrkfLYmbJfZUeeG1VD0PFh5acUyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610134; c=relaxed/simple;
	bh=amXpXM2dMijrA0MtGiAiusiXv5glXfKEr2kGBt5Mf5I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pxx8SiJP2KQJ+OtAy8ona4r3x1+l63DGj0AY2cexrrIsXunGnQaPyT7XBf5cwy4WFUQVOT1TGYB9sVTbhb62GkdfWtaX48qhpJI22j6Cu8ZunO6Z72wxkfRxXhydwSFTwt3DuUNNic2LFuP7xjo1z715GHzuxjI51sUv6yfxdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orq8j9IL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24813C4CEE3;
	Mon,  3 Feb 2025 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610134;
	bh=amXpXM2dMijrA0MtGiAiusiXv5glXfKEr2kGBt5Mf5I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=orq8j9IL4sJCwffHeQkMqQ1LIzj3bLY8D/nrO4mnXrEndAU5xhvp1AnN+MPsSWfAS
	 IZvgG2Nw7sRKZfvdeBoU24R2M3mICG80BdgzQG5I/Uk/HAB63MWT6zBpw0p2oEMxlG
	 E8a7k3yyvNeN7d09N1SQvXMuDzOc5RDhdiwzRZt1Onqk/9We/Jy6PWS/UhHcfOEo+8
	 iErOqSj3NkZautMbNrY1aUZ+ZDSjaK42026+wZ4WVZ1YTR/W1+OjLgplV9vpJrYA1W
	 bbv7Zo/NVVNEU9Q1bbcgG36BP63LfRm1tbxQAfzJ1eXk+ut+Untsl+R6vGED961E9B
	 wK9dQCBP2xa1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710BB380AA67;
	Mon,  3 Feb 2025 19:16:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Microchip CoreI2C driver fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861016099.3409359.8425752210633125446.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:00 +0000
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 andi.shyti@kernel.org, wsa@kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Andi Shyti <andi.shyti@kernel.org>:

On Wed, 18 Dec 2024 12:07:39 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v2 with one of the minor items pointed out by Andi resolved and
> a new patch for an issue fixed in the months since v1, plus some minor
> checkpatch things that I seem to have missed on v1. On v1 there was
> unresolved discussion with Wolfram, but it has been two months without a
> response so I am sending this v2 in an attempt to make progress.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] i2c: microchip-core: actually use repeated sends
    https://git.kernel.org/riscv/c/9a8f9320d67b
  - [v2,2/2] i2c: microchip-core: fix "ghost" detections
    https://git.kernel.org/riscv/c/49e1f0fd0d4c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




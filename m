Return-Path: <linux-i2c+bounces-14657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC03CCEF71
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 09:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A4530B862B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 08:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747CA2E7653;
	Fri, 19 Dec 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQh0Y67R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932F2FE056;
	Fri, 19 Dec 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766132008; cv=none; b=QtlLpn410AEfOqmI7Hy/mzuo/V3hIcFN9x8C36goKG4Ol6qMtEc2wp5gnETxXKXGb177Qz4Ov1wYB8Phkni2HML+6AD3wvv5yMiqYgKZQC9TQSxp4eRJobanWkgIBye32N3Vvl13Ii52kX/DN7ME0EycCuNvti38t2PlMqTNx+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766132008; c=relaxed/simple;
	bh=VPA2RV+H3SHEDkHvAU2bPivwR8k4P2M2QGI+Sg01Br0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VftqzqFw/km8K3T1+Xvy1m6lCKgARMVP6EzE7KwKk9zvy+1qDO8cgdGKIMwx1yCaPsmJBkQ9rmEp6NxcxTk3EGou+HWyRM+iiq7sg3LF4iYHWYp+NGOsegNOcLvijCdCTLHvYJO28Gt/qj7jgDtUIqrvbXPbdo7U6JbvF6a4LWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQh0Y67R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FFEC19421;
	Fri, 19 Dec 2025 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132007;
	bh=VPA2RV+H3SHEDkHvAU2bPivwR8k4P2M2QGI+Sg01Br0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZQh0Y67Rx2TED3sHcn2P5Mbjft7nV7jDjkmaBEuWlr8knlHX+Y3j/HdCVnCqWp+at
	 xZbQPi8CV0R/dAGwdy5PmKqm55nu4iHoDGzHNoH/MpnBfQ+JHRVTLGL7k4cuqOpS+t
	 sNPbGW+JtFUEXqPyAJjxO8DF/7YSw7/O4h/nFYHJirJVmQDDGaLAnN6576J30d7DGN
	 pge69FDgc/+DShj4bTgTJhyZeAgD4L84auJ9zTmADkjih3FTHEINTRMjJnUqEYqptK
	 768PsZxMwsRlzifc1CnyRynkXgGpkn1Fy9wXQcVoRd3DRgz6AlB62WHPfnUVQbs1mk
	 EL0lvUwGgHAoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2B14380AA50;
	Fri, 19 Dec 2025 08:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:16 +0000
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, lee@kernel.org, dlan@gentoo.org,
 elder@riscstar.com, andi.shyti@kernel.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 18 Nov 2025 14:08:04 +0800 you wrote:
> Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> merged, the driver would fail [1] when COMMON_CLK was not selected.
> 
> This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> patch has reverted by maintainer [2]).
> 
> Now, P1 Kconfig patch has been merged[3], so I2C ILCR patch can be
> merged as well.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] i2c: spacemit: configure ILCR for accurate SCL frequency
    (no matching commit)
  - [v3,2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
    https://git.kernel.org/riscv/c/16bd954c9336
  - [v3,3/4] regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
    (no matching commit)
  - [v3,4/4] mfd: simple-mfd-i2c: add default value
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




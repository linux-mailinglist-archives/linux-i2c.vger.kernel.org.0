Return-Path: <linux-i2c+bounces-7137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875698BB42
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B126528298C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 11:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2811C1725;
	Tue,  1 Oct 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Idet+m9h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42C31C0DE1;
	Tue,  1 Oct 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782510; cv=none; b=HECXA/DgFvm1fFFvtk5gWJZiNOIxAapd9l4pesAPMSXfcdIqy2RjpL/7vVUb8WVZN7IMTNdePSCkAvBZ0bMUUzSx2JJ23WHTHhP0+nri8B3qR/C0qZo6rzeQ1PWya40krUJY1g2X+RYLaRFZnBTJa90aOg1iMhc9eEZKlvpPvlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782510; c=relaxed/simple;
	bh=ejwveurcpiVUAMtfc3MmS1K+nDymKKvZqi9zObr58qA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r0iMo5PDusQAj127sNRTM29ZbcsbL0bBv7FkQ8HAUv9y/VZV3e5nqfk8m32y4zumQxYQ6n/JBj8z4LLWFuTA4IU8ry+LEjFwo9/ffmyQ0fiDwROcnHJX71EDHyTqEkQPsT7XWa7hLn0VRz9zz7kdXxd5ARLaV4E3FJcUxe4zcW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Idet+m9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEABC4CECD;
	Tue,  1 Oct 2024 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782510;
	bh=ejwveurcpiVUAMtfc3MmS1K+nDymKKvZqi9zObr58qA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Idet+m9hEi7jJ4H+tzI8sgt1F12+rWXx1hzKRoo7R7Vf/Xgvmsut0lmGxVftjGc4w
	 KAkhiLDqoZFsGDzodrIzAnLMdPPxitEcu0n6U5HgYzxt4L2S6gIwY+fgfhF1k7wxoz
	 2+FBjBo+hRVPRIZWLB/GKaPvc+9QoClDEjrsbL1+t16nIotas4nqW3sqGCfYA4TNGR
	 9pY3xePlrMnjdALt+1E5qo/rLXuO3Owi1jAp6pbIHZlwfkw/tU3Xd1WZCCzW4D6drq
	 loW/aFF2yqMB9IiQJ+EExy6Z/EXu5CKGkmsKZBNhTHsfX66ugaDTc63cZsek8LSRu0
	 4d8+s1QstP60w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C33380DBF7;
	Tue,  1 Oct 2024 11:35:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers under a
 single option
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <172778251300.314421.9094418199342099537.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:13 +0000
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, andi.shyti@kernel.org,
 jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, vgupta@kernel.org, linux@armlinux.org.uk,
 dinguyen@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 alexandre.belloni@bootlin.com, tsbogend@alpha.franken.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 jiawenwu@trustnetic.com, mengyuanlou@net-swift.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andi Shyti <andi.shyti@kernel.org>:

On Tue,  3 Sep 2024 17:24:59 +0300 you wrote:
> Hi guys,
> 
> This is a proposal for Kconfig improvement regarding the Synopsys
> DesignWare I2C adapter driver.
> 
> Changes since v1:
> 
> [...]

Here is the summary with links:
  - [v2,5/7] RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
    https://git.kernel.org/riscv/c/0175b1d3c6df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




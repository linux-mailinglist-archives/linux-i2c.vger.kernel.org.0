Return-Path: <linux-i2c+bounces-7165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E45698CF26
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 10:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FAE71C22252
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 08:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8422195FD5;
	Wed,  2 Oct 2024 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi2J1ZVJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4A415445D;
	Wed,  2 Oct 2024 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858740; cv=none; b=ApcOh2rqGIn/W1kBYitNfzITM+hJcDGzkIAa00vnm8Hh71bVXPX/iju5JQdAIq8uS7WCOjvbmCJN7cHxAl6+trZhdeCe3G38I4XNf9NX6wnZxVPZLfd5lVkOIlRLPwPFn+Rp2jllexSfOxMtnxL/rWMmVoJiZ2NhJCxh0n3bZD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858740; c=relaxed/simple;
	bh=ZNdZFT18mQ1lN/bjqCggbwwAzWJR89AvH5K81CBVTvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFk+e/7JGXszLINwgnRfzbYTu77ozeaz0Ot/u+q9jkug5CH0pmx6uGsc3wTWVjyzlo1Hns1zgS25w/+nUVs/QVS/BxsAfnI2sPgvVA/d59UU92K9egbrvMII9AM5/nL4/Rfy2AtmNKQ/73Fcfg8cViqZhN2fih0C0YEvIFQaghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi2J1ZVJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDA1C4CEC5;
	Wed,  2 Oct 2024 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727858739;
	bh=ZNdZFT18mQ1lN/bjqCggbwwAzWJR89AvH5K81CBVTvQ=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=Bi2J1ZVJtG4RrRLL13E1yemINsID3cZrYStPPZxtvqYRBzbFORYjnSeY5x/OOCN9L
	 uA13xjBwIKy8Epl7WI3AWxcqUCIQimdJIeFnkrQPItiynBOj5BcynyafFjDexWS9O8
	 2zN4oFalEhI46K5cBugoawtU9P4AE1V26XZu/fsOwGyIf4Q5JOq71RwcieBs91EV7f
	 qihFccA1yuRbLaLKF3yKcpowS8IkZvpJMpwd9P/dalFHSU9sjb6uKRwJYPOWT5BjSA
	 X1mBXC9wRN+Kk//nN+nnxX+lq9b0dFiQIEFC7lMHL3KgBqiTQL9E7OKzGyytbbdKH2
	 Zqk4aVC0uaKMQ==
Date: Wed, 2 Oct 2024 10:45:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-riscv@lists.infradead.org, jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vgupta@kernel.org, linux@armlinux.org.uk, dinguyen@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, alexandre.belloni@bootlin.com, 
	tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jiawenwu@trustnetic.com, mengyuanlou@net-swift.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, UNGLinuxDriver@microchip.com, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <wrougv6kwuuv2ba33vyyeou5evxov7l7jvp5ezvzgpf3vra3tr@euug6qu55q2t>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <172778251300.314421.9094418199342099537.git-patchwork-notify@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172778251300.314421.9094418199342099537.git-patchwork-notify@kernel.org>

Hi,

On Tue, Oct 01, 2024 at 11:35:13AM GMT, patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
> 
> This patch was applied to riscv/linux.git (fixes)
> by Andi Shyti <andi.shyti@kernel.org>:
> 
> On Tue,  3 Sep 2024 17:24:59 +0300 you wrote:
> > Hi guys,
> > 
> > This is a proposal for Kconfig improvement regarding the Synopsys
> > DesignWare I2C adapter driver.
> > 
> > Changes since v1:
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v2,5/7] RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>     https://git.kernel.org/riscv/c/0175b1d3c6df

This patch has already been taken and merged to mainline through
i2c.

Andi

> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 


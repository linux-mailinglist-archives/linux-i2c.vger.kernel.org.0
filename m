Return-Path: <linux-i2c+bounces-5231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A494C77D
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 01:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5414D1C227BB
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 23:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF7515FCEA;
	Thu,  8 Aug 2024 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9NZoKX4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46230154C0D;
	Thu,  8 Aug 2024 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723161434; cv=none; b=G5yhChxKTS+Sv/cj1+IflOEJ8Gv/27JDmlV3MJYK8t4D9c/VcvQWYw8Sgh1Ditopw7MNXMHtcl6A8x0nIl3nvNSYtTgp1trOhloCPWp3IO4+E4GtodvfNnTpTKklHyLVHIUizyyGIpywf5sydpeP12Je7+dfxg+K8jTHwCcfrO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723161434; c=relaxed/simple;
	bh=W6ntaftJAMBL4RNkeW4CN5+31UJIAV1E7F9kpjRbcwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3yIs9g8lXCVtK0nd4ew96tvD+XWWAlRnbCT8QEaKR5YHEL3gGKXnoOUfTVfJVYZ+gB7xoBkYexFfsBTKZG/kzuKuBnEDn5q2fd8MhI1hkPDSePb+tQORlZdIj1W8aODkng+mB34trFe/JJ/kz7jEW3/SBiFDmHiip+MUqKPE3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9NZoKX4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C78C32782;
	Thu,  8 Aug 2024 23:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723161433;
	bh=W6ntaftJAMBL4RNkeW4CN5+31UJIAV1E7F9kpjRbcwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9NZoKX4NPy07QlNOq8WPt/4n//2dk1DMgXFWTZPKHLn3PUnFn2JyFGyfvHtm7doK
	 NhvnloCtWi4wWrDIzy6gwzv2Vh8KP0mGiltzvP5n5HnMfxDPUSetZvWsOGb+Xi32Wv
	 zyab3G5Fj80eqjD48mLripQ5tJIbNBIs2FmKNA9kbvafedQbLvU46P323F2fkUOALl
	 lw++VobnECC3YermZn9+gIt10z8z0R+nB3LCKsnE6Q1Zhq99dwTl5kgWViCZxI6qYK
	 /gfOHgB4NbOmha9EW8bodFlh7s8jc677JOYhB7K/3Oobz2Y9NWyGFIVDac8Z+rsxOY
	 nWfdogf0l2m2g==
Date: Fri, 9 Aug 2024 00:57:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com, Michael van der Westhuizen <rmikey@meta.com>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RESEND] Do not mark ACPI devices as irq safe
Message-ID: <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
References: <20240808121447.239278-1-leitao@debian.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808121447.239278-1-leitao@debian.org>

Hi,

On Thu, Aug 08, 2024 at 05:14:46AM GMT, Breno Leitao wrote:
> On ACPI machines, the tegra i2c module encounters an issue due to a
> mutex being called inside a spinlock. This leads to the following bug:
> 
> 	BUG: sleeping function called from invalid context at kernel/locking/mutex.c:585
> 	in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282, name: kssif0010
> 	preempt_count: 0, expected: 0
> 	RCU nest depth: 0, expected: 0
> 	irq event stamp: 0
> 
> 	Call trace:
> 	dump_backtrace+0xf0/0x140
> 	show_stack (./arch/x86/include/asm/current.h:49
> 		     arch/x86/kernel/dumpstack.c:312)
> 	dump_stack_lvl (lib/dump_stack.c:89 lib/dump_stack.c:115)
> 	dump_stack (lib/earlycpio.c:61)
> 	__might_resched (./arch/x86/include/asm/current.h:49
> 			 kernel/sched/core.c:10297)
> 	__might_sleep (./include/linux/lockdep.h:231
> 			 kernel/sched/core.c:10236)
> 	__mutex_lock_common+0x5c/0x2190
> 	mutex_lock_nested (kernel/locking/mutex.c:751)
> 	acpi_subsys_runtime_resume+0xb8/0x160
> 	__rpm_callback+0x1cc/0x4b0
> 	rpm_resume+0xa60/0x1078
> 	__pm_runtime_resume+0xbc/0x130
> 	tegra_i2c_xfer+0x74/0x398
> 	__i2c_transfer (./include/trace/events/i2c.h:122 drivers/i2c/i2c-core-base.c:2258)
> 
> The problem arises because during __pm_runtime_resume(), the spinlock
> &dev->power.lock is acquired before rpm_resume() is called. Later,
> rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> mutexes, triggering the error.
> 
> To address this issue, devices on ACPI are now marked as not IRQ-safe,
> considering the dependency of acpi_subsys_runtime_resume() on mutexes.
> 
> Co-developed-by: Michael van der Westhuizen <rmikey@meta.com>
> Signed-off-by: Michael van der Westhuizen <rmikey@meta.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 85b31edc558d..6d783ecc3431 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1804,7 +1804,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
>  	 * be used for atomic transfers.
>  	 */
> -	if (!IS_VI(i2c_dev))
> +	if (!IS_VI(i2c_dev) && !ACPI_HANDLE(i2c_dev->dev))

looks good to me, can I have an ack from Andy here?

Thanks,
Andi

>  		pm_runtime_irq_safe(i2c_dev->dev);
>  
>  	pm_runtime_enable(i2c_dev->dev);
> -- 
> 2.43.5
> 


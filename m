Return-Path: <linux-i2c+bounces-1082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D0822A2C
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 10:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91400284BB6
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 09:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FB4182BE;
	Wed,  3 Jan 2024 09:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPMAFg3x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67083182B3;
	Wed,  3 Jan 2024 09:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EFAC433C7;
	Wed,  3 Jan 2024 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704273608;
	bh=ef3Az3d0OVj/DabgKrQUWvdM9sWuJAMgvmozCZcAO3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cPMAFg3x4XtakmqyRtR8+Pr7p1j3g38+Ej9rNtcN2nac+mtRqeJU8PT7rboC7MXLQ
	 GdwOHgaHacuay3vrOxa3OH+ZoRb7dYv2c4IQmURWA2B4xvNWI3jyi+nIRKCJuCCYGf
	 NkkDqBIudz5iR0Yqt68hL3A/PCl1/3kMb9RINsHBykwd5LPUCUYKElW3nQXunjhjPf
	 VJMuguG+ruFcFFclQDzj/iwdsKfzu1ZlDKyF4yXLs3oAknbvU3whqnzkzoBn7UICwt
	 bSugwSCnvezkpMDUewKjzVkILh9FK+y/0gKGjYy9zhQ/kqlrfF8dfjPXWIF62ZaBQk
	 +aGdZHb+yYfSQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jan 2024 10:20:02 +0100
From: Michael Walle <mwalle@kernel.org>
To: Benjamin Bara <bbara93@gmail.com>
Cc: benjamin.bara@skidata.com, dmitry.osipenko@collabora.com,
 jonathanh@nvidia.com, lee@kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, nm@ti.com,
 peterz@infradead.org, rafael.j.wysocki@intel.com, richard.leitner@linux.dev,
 stable@vger.kernel.org, treding@nvidia.com,
 wsa+renesas@sang-engineering.com, wsa@kernel.org
Subject: Re: [PATCH v7 2/5] Re: i2c: core: run atomic i2c xfer when
 !preemptible
In-Reply-To: <CAJpcXm7W2vckakdFYiT4jssea-AzrZMsjHijfa+QpfzDVL+E3A@mail.gmail.com>
References: <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com>
 <20240102150350.3180741-1-mwalle@kernel.org>
 <CAJpcXm7W2vckakdFYiT4jssea-AzrZMsjHijfa+QpfzDVL+E3A@mail.gmail.com>
Message-ID: <5e13f5e2da9c4f8fc0d4da2ab4b40383@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Benjamin,

>> With preemption disabled, this boils down to
>>   return system_state > SYSTEM_RUNNING (&& !0)
>> 
>> and will then generate a backtrace splash on each reboot on our
>> board:
>> 
>> # reboot -f
>> [   12.687169] No atomic I2C transfer handler for 'i2c-0'
>> ...
>> [   12.806359] Call trace:
>> [   12.808793]  i2c_smbus_xfer+0x100/0x118
>> ...
>> 
>> I'm not sure if this is now the expected behavior or not. There will 
>> be
>> no backtraces, if I build a preemptible kernel, nor will there be
>> backtraces if I revert this patch.
> 
> 
> thanks for the report.
> 
> In your case, the warning comes from shutting down a regulator during
> device_shutdown(), so nothing really problematic here.

I tend to disagree. Yes it's not problematic. But from a users point of
view, you get a splash of *many* backtraces on every reboot. Btw, one
should really turn this into a WARN_ONCE(). But even in this case you
might scare users which will eventually lead to more bug reports.

> However, later in
> the "restart sequence", IRQs are disabled before the restart handlers
> are called. If the reboot handlers would rely on irq-based
> ("non-atomic") i2c transfer, they might not work properly.

I get this from a technical point of view and agree that the correct
fix is to add the atomic variant to the i2c driver, which begs the
question, if adding the atomic variant to the driver will be considered
as a Fixes patch.

Do I get it correct, that in my case the interrupts are still enabled?
Otherwise I'd have gotten this warning even before your patch, correct?
Excuse my ignorance, but when are the interrupts actually disabled
during shutdown?

>> OTOH, the driver I'm using (drivers/i2c/busses/i2c-mt65xx.c) has no
>> *_atomic(). So the warning is correct. There is also [1], which seems 
>> to
>> be the same issue I'm facing.
>> 
>> -michael
>> 
>> [1] 
>> https://lore.kernel.org/linux-i2c/13271b9b-4132-46ef-abf8-2c311967bb46@mailbox.org/
> 
> 
> I tried to implement an atomic handler for the mt65xx, but I don't have
> the respective hardware available to test it. I decided to use a 
> similar
> approach as done in drivers/i2c/busses/i2c-rk3x.c, which calls the IRQ
> handler in a while loop if an atomic xfer is requested. IMHO, this
> should work with IRQs enabled and disabled, but I am not sure if this 
> is
> the best approach...

Thanks for already looking into that. Do you want to submit it as an
actual patch? If so, you can add

Tested-by: Michael Walle <mwalle@kernel.org>

But again, it would be nice if we somehow can get rid of this huge 
splash
of backtraces on 6.7.x (I guess it's already too late 6.7).

-michael


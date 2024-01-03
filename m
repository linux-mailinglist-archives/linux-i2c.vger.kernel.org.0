Return-Path: <linux-i2c+bounces-1087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6D823033
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 16:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 598D4285155
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 15:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7571A71B;
	Wed,  3 Jan 2024 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY8TF53j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A261A704;
	Wed,  3 Jan 2024 15:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB11C433C8;
	Wed,  3 Jan 2024 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704294458;
	bh=FCWeGqBB2LoWam8qeYDl6io0kV3y6U6ulHjprFNadU4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LY8TF53jXlgvYfoUfXYHSI9V4LXC6wAVztuySm8Gxb7i58suU6vAm/h8ua4URP2cT
	 /by7N5Nh0NOpimjVHMZru0eArpOwYgSVyWyo2a8UYjoXkv9Ra3IToB2y6/YxtSYWSF
	 z2DeGg3H88S5XuwQImnNSdnXoGJ16Ohmb5bGvircawzncFDVHFpARL069/eigGH2bJ
	 QBtBHohxOsMHrQW2X1JB5WV9o8/Fa7s9udZPAtnJpzzt9jS7SYxyLug5m4wLijU4NE
	 I7mrM2wNmGlLCVu2FCBIaRN9DZrJE2hUDrqB8pGdSEAW6UIzqLswghBSCdIIA/wgU2
	 044qpmw1I+azQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jan 2024 16:07:32 +0100
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
In-Reply-To: <CAJpcXm5gFMYnJ9bSA9nOXhKoibfedxjhRfu92dCmi6sVG3e=7Q@mail.gmail.com>
References: <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com>
 <20240102150350.3180741-1-mwalle@kernel.org>
 <CAJpcXm7W2vckakdFYiT4jssea-AzrZMsjHijfa+QpfzDVL+E3A@mail.gmail.com>
 <5e13f5e2da9c4f8fc0d4da2ab4b40383@kernel.org>
 <CAJpcXm5gFMYnJ9bSA9nOXhKoibfedxjhRfu92dCmi6sVG3e=7Q@mail.gmail.com>
Message-ID: <6f321c457d1c66783480382929c94e0c@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Benjamin,

>> >> With preemption disabled, this boils down to
>> >>   return system_state > SYSTEM_RUNNING (&& !0)
>> >>
>> >> and will then generate a backtrace splash on each reboot on our
>> >> board:
>> >>
>> >> # reboot -f
>> >> [   12.687169] No atomic I2C transfer handler for 'i2c-0'
>> >> ...
>> >> [   12.806359] Call trace:
>> >> [   12.808793]  i2c_smbus_xfer+0x100/0x118
>> >> ...
>> >>
>> >> I'm not sure if this is now the expected behavior or not. There will
>> >> be
>> >> no backtraces, if I build a preemptible kernel, nor will there be
>> >> backtraces if I revert this patch.
>> >
>> >
>> > thanks for the report.
>> >
>> > In your case, the warning comes from shutting down a regulator during
>> > device_shutdown(), so nothing really problematic here.
>> 
>> I tend to disagree. Yes it's not problematic. But from a users point 
>> of
>> view, you get a splash of *many* backtraces on every reboot. Btw, one
>> should really turn this into a WARN_ONCE(). But even in this case you
>> might scare users which will eventually lead to more bug reports.
> 
> Sure, but the correct "fix" would be to implement an atomic handler if
> the i2c is used during this late stage. I just meant that the
> device_shutdown() is less problematic than the actual reboot handler.
> Your PMIC seems to not have a reboot handler (registered (yet)), and is
> therefore not "affected".
> 
>> > However, later in
>> > the "restart sequence", IRQs are disabled before the restart handlers
>> > are called. If the reboot handlers would rely on irq-based
>> > ("non-atomic") i2c transfer, they might not work properly.
>> 
>> I get this from a technical point of view and agree that the correct
>> fix is to add the atomic variant to the i2c driver, which begs the
>> question, if adding the atomic variant to the driver will be 
>> considered
>> as a Fixes patch.
> 
> I can add a Fixes when I post it. Although the initial patch just makes
> the actual problem "noisier".

As far as I understand, there was no problem (for me at least),
because the interrupts were still enabled at this time. But now,
there is the problem with getting these backtraces and with that
the user reports.

Don't get me wrong, I'm all for the correct fix here. But at the
same time I fear all the reports we'll be getting. And in the meantime
there was already a new one.

>> Do I get it correct, that in my case the interrupts are still enabled?
>> Otherwise I'd have gotten this warning even before your patch, 
>> correct?
> 
> Yes, device_shutdown() is called during
> kernel_{shutdown,restart}_prepare(), before
> machine_{power_off,restart}() is called. The interrupts should 
> therefore
> still be enabled in your case.
> 
>> Excuse my ignorance, but when are the interrupts actually disabled
>> during shutdown?
> 
> This is usually one of the first things done in machine_restart(),
> before the architecture-specific restart handlers are called (which
> might use i2c). Same for machine_power_off().

Thanks for explaining.

>> >> OTOH, the driver I'm using (drivers/i2c/busses/i2c-mt65xx.c) has no
>> >> *_atomic(). So the warning is correct. There is also [1], which seems
>> >> to
>> >> be the same issue I'm facing.
>> >>
>> >> -michael
>> >>
>> >> [1]
>> >> https://lore.kernel.org/linux-i2c/13271b9b-4132-46ef-abf8-2c311967bb46@mailbox.org/
>> >
>> >
>> > I tried to implement an atomic handler for the mt65xx, but I don't have
>> > the respective hardware available to test it. I decided to use a
>> > similar
>> > approach as done in drivers/i2c/busses/i2c-rk3x.c, which calls the IRQ
>> > handler in a while loop if an atomic xfer is requested. IMHO, this
>> > should work with IRQs enabled and disabled, but I am not sure if this
>> > is
>> > the best approach...
>> 
>> Thanks for already looking into that. Do you want to submit it as an
>> actual patch? If so, you can add
>> 
>> Tested-by: Michael Walle <mwalle@kernel.org>
> 
> Yes, I can do that - thanks for the quick feedback.
> 
>> But again, it would be nice if we somehow can get rid of this huge
>> splash
>> of backtraces on 6.7.x (I guess it's already too late 6.7).
> 
> IMHO, converting the error to WARN_ONCE() makes sense to reduce the
> noise, but helps having more reliable reboot handling via i2c. Do you
> think this is a sufficient "short-term solution" to reduce the noise
> before the missing atomic handlers are actually implemented?

Turning that WARN into a WARN_ONCE is one thing. But it is still odd
that don't I get a warning with preemption enabled. Is that because
preemptible() will still return 1 until interrupts are actually 
disabled?
Can we achieve something similar with kernels without preemption 
support?
IOW, just warn iff there is an actual error, that is if i2c_xfer()
is called with interrupt off?

-michael


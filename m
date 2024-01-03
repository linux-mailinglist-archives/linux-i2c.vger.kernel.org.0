Return-Path: <linux-i2c+bounces-1084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A846B822D7F
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 13:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AB241C23449
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 12:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B688219447;
	Wed,  3 Jan 2024 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4eUVlXl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB802199A0;
	Wed,  3 Jan 2024 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50ea9db9e12so58356e87.0;
        Wed, 03 Jan 2024 04:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704286179; x=1704890979; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wlvdoIdh11FpuRMZ6FedfzqCuHP7jE4LAthy5mimGQ4=;
        b=M4eUVlXlnNKPbawHLNel63bX+s5Co1T15fJ/5Z+gIQ94DNktS4t2uaypEeH25Vliwt
         254Ku5dJvFvW0T8XEpvHicUNXXFUADvqJdE8Wszu4MrlHz4nsiuQYiFO/Pgwn4+4uLmR
         NHYlCj7onUVHPLmvj2n6+eRoY1OVpfDqK5sHD1rfvl0fuNkGP+8n7W4szRSsiW73r1hR
         KFNAjpy4Ef92gdCNlKinXmZVJFGXc67PKXGajSGLgdKdLVt8mInhxCV/0FJwom4BMF7B
         j/NiA+VdjoG8AiTS6LKHKAx4qAbP1lhEVmbXhQRa5h/SeIjfO8n5gSgPyHbO8Aj2B0D9
         mmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704286179; x=1704890979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlvdoIdh11FpuRMZ6FedfzqCuHP7jE4LAthy5mimGQ4=;
        b=fO9Z0xGa6xx7MInb/O3Ahqe9l+/Kfkorxd+AkLj2sZJvBolyIcDj+6iWkyw7jrid69
         EgntWHc+VeU5v2zAcx1x47VTNBNzXO+RaFaKbdrgXTIHYd9owyetgV5cVmP60WVOlPyy
         P9r7Ua9ba1h29+l7AmnGkyWwsmbMq2iSP6fJ+BiLVx9B7YD7plr/fvHcl9usx/XjLERV
         cxiB/HvJYP8VHbQONZTSd6gphiYRbArtHQwupKdENNYvfkJm0s+ij6XNPiAGDj4Fxl9V
         0uuPXaTT1aYrqTWnpIrNs1O0RpVfoFNTEQNEQW8pBBS+HJ6/h+mpcO+t1dhCkIXzFhNZ
         AxsQ==
X-Gm-Message-State: AOJu0YwGCtm/2jan1+dGwrJO+37u7jyEF9iSUWSsP6wNY312Ghzl3+Jf
	b+fJPW6d5pw4nTNCvQrHhVxDrllRpuUKJSZzRoA=
X-Google-Smtp-Source: AGHT+IF5nUu5SjTdeixsvM0AnrVzAg36rJLUQKIKz0wXFwrkqJgkNYNb/njuK9ibM12aGzMMq1XCAbpPloAxjBeWqfA=
X-Received: by 2002:a05:6512:98a:b0:50e:3b0b:8cd1 with SMTP id
 w10-20020a056512098a00b0050e3b0b8cd1mr6626174lft.95.1704286178705; Wed, 03
 Jan 2024 04:49:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com>
 <20240102150350.3180741-1-mwalle@kernel.org> <CAJpcXm7W2vckakdFYiT4jssea-AzrZMsjHijfa+QpfzDVL+E3A@mail.gmail.com>
 <5e13f5e2da9c4f8fc0d4da2ab4b40383@kernel.org>
In-Reply-To: <5e13f5e2da9c4f8fc0d4da2ab4b40383@kernel.org>
From: Benjamin Bara <bbara93@gmail.com>
Date: Wed, 3 Jan 2024 13:49:27 +0100
Message-ID: <CAJpcXm5gFMYnJ9bSA9nOXhKoibfedxjhRfu92dCmi6sVG3e=7Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] Re: i2c: core: run atomic i2c xfer when !preemptible
To: Michael Walle <mwalle@kernel.org>
Cc: benjamin.bara@skidata.com, dmitry.osipenko@collabora.com, 
	jonathanh@nvidia.com, lee@kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, nm@ti.com, 
	peterz@infradead.org, rafael.j.wysocki@intel.com, richard.leitner@linux.dev, 
	stable@vger.kernel.org, treding@nvidia.com, wsa+renesas@sang-engineering.com, 
	wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Wed, 3 Jan 2024 at 10:20, Michael Walle <mwalle@kernel.org> wrote:
> >> With preemption disabled, this boils down to
> >>   return system_state > SYSTEM_RUNNING (&& !0)
> >>
> >> and will then generate a backtrace splash on each reboot on our
> >> board:
> >>
> >> # reboot -f
> >> [   12.687169] No atomic I2C transfer handler for 'i2c-0'
> >> ...
> >> [   12.806359] Call trace:
> >> [   12.808793]  i2c_smbus_xfer+0x100/0x118
> >> ...
> >>
> >> I'm not sure if this is now the expected behavior or not. There will
> >> be
> >> no backtraces, if I build a preemptible kernel, nor will there be
> >> backtraces if I revert this patch.
> >
> >
> > thanks for the report.
> >
> > In your case, the warning comes from shutting down a regulator during
> > device_shutdown(), so nothing really problematic here.
>
> I tend to disagree. Yes it's not problematic. But from a users point of
> view, you get a splash of *many* backtraces on every reboot. Btw, one
> should really turn this into a WARN_ONCE(). But even in this case you
> might scare users which will eventually lead to more bug reports.

Sure, but the correct "fix" would be to implement an atomic handler if
the i2c is used during this late stage. I just meant that the
device_shutdown() is less problematic than the actual reboot handler.
Your PMIC seems to not have a reboot handler (registered (yet)), and is
therefore not "affected".

> > However, later in
> > the "restart sequence", IRQs are disabled before the restart handlers
> > are called. If the reboot handlers would rely on irq-based
> > ("non-atomic") i2c transfer, they might not work properly.
>
> I get this from a technical point of view and agree that the correct
> fix is to add the atomic variant to the i2c driver, which begs the
> question, if adding the atomic variant to the driver will be considered
> as a Fixes patch.

I can add a Fixes when I post it. Although the initial patch just makes
the actual problem "noisier".

> Do I get it correct, that in my case the interrupts are still enabled?
> Otherwise I'd have gotten this warning even before your patch, correct?

Yes, device_shutdown() is called during
kernel_{shutdown,restart}_prepare(), before
machine_{power_off,restart}() is called. The interrupts should therefore
still be enabled in your case.

> Excuse my ignorance, but when are the interrupts actually disabled
> during shutdown?

This is usually one of the first things done in machine_restart(),
before the architecture-specific restart handlers are called (which
might use i2c). Same for machine_power_off().

> >> OTOH, the driver I'm using (drivers/i2c/busses/i2c-mt65xx.c) has no
> >> *_atomic(). So the warning is correct. There is also [1], which seems
> >> to
> >> be the same issue I'm facing.
> >>
> >> -michael
> >>
> >> [1]
> >> https://lore.kernel.org/linux-i2c/13271b9b-4132-46ef-abf8-2c311967bb46@mailbox.org/
> >
> >
> > I tried to implement an atomic handler for the mt65xx, but I don't have
> > the respective hardware available to test it. I decided to use a
> > similar
> > approach as done in drivers/i2c/busses/i2c-rk3x.c, which calls the IRQ
> > handler in a while loop if an atomic xfer is requested. IMHO, this
> > should work with IRQs enabled and disabled, but I am not sure if this
> > is
> > the best approach...
>
> Thanks for already looking into that. Do you want to submit it as an
> actual patch? If so, you can add
>
> Tested-by: Michael Walle <mwalle@kernel.org>

Yes, I can do that - thanks for the quick feedback.

> But again, it would be nice if we somehow can get rid of this huge
> splash
> of backtraces on 6.7.x (I guess it's already too late 6.7).

IMHO, converting the error to WARN_ONCE() makes sense to reduce the
noise, but helps having more reliable reboot handling via i2c. Do you
think this is a sufficient "short-term solution" to reduce the noise
before the missing atomic handlers are actually implemented?


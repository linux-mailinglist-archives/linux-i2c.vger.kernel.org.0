Return-Path: <linux-i2c+bounces-5247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E80A694CF2A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 13:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97085284637
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 11:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1B9192B6B;
	Fri,  9 Aug 2024 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOdGk8Qg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB51922E3;
	Fri,  9 Aug 2024 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723201448; cv=none; b=sDQT+b3WsWUenYGY5qTmvtr6CoxbBquAu8csQISsjU4lkPGewK9qYyK3kjnUISpH4ZsjeBdIyGYX0SbGwjYCESSj3+PyNJHFHb19p74qRMlo0vFDhTUCs1gwFh57rlsOdDNaeCYiHXhkdFlgZZGQm15GNIpRznuAEFiBiixHiYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723201448; c=relaxed/simple;
	bh=pISs1KK7Usig0HIPrdbIalsxMgMpG2TaK4CA5mFPI6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/XxwJlzsjFcn/kdiKEjPrAEGZCe0pV+tTG2m6VqTpOwPIO2O9nSpG0L9d6eCG2qqbxrvov3FJP+1qx4x6YW+GA8pSkV+6cmbLn7wxrJWvU6493TSsj3wKSdClByXj5duITG0YzJICiQ5GQm+KA2MVmynhxa7dqE42mqWAjqI6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOdGk8Qg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7b2dbd81e3so257511166b.1;
        Fri, 09 Aug 2024 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723201445; x=1723806245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqTyMd+8b9STNmvPFBPHifqqElupN85PuI6a8VjTCMc=;
        b=UOdGk8QgCHO0qe+qbMYsAmtKVkS/c29lx2B2CMDX4pzUqDyGfCwhSqtVc6fAmYOSAZ
         CPgMq2xMzPMBNL+IQ1rTfVvTVFRavOggDprMqF/J3TTcw8FIOpa2MiyhGVEQ81Kx3Y4w
         PA5ZFcvFbSDtUPf+6dQGv3T912RyAC7amDKLgGUOboM3AC2mP71X2S3qfwZfhbm4Ip+3
         fmBZx5uyw8Ka41pJ5cvLpP00OOChnX2aEBzpOkHc4aoOpVOHiVKKUwp1fXt3nkLnl938
         lBDKUObuSkb659Oto/g3VhfVpITXYVBwhVfOeikbHvzJfuhiILXlKnpANtoAMXjLduEU
         BFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723201445; x=1723806245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqTyMd+8b9STNmvPFBPHifqqElupN85PuI6a8VjTCMc=;
        b=txPXEvvD9EH++HoufZ22MX9JhS9E0Zbgd7MyXbolpNrGyY8wkEs7ffOQyYtuQPYYye
         KnnQGU9/XpQYW0yYAEG1lCQ/i4a6z4shNJ+pu0KH+cvMXEhk+oS027s8gNZaGYQFk7o7
         ArbLnBe+GT3mOZLAs/aaPGyluxCwhV3mjM2F3CIOMapps2wtiLzXRvcLsAZasuut1tYU
         Sw0LkmjqaT3BcxXptDYipUbAVxdomgoRF6eeGvbz0mLNwaPCS5d03UPt4WZRMTqs696G
         jcLwg8UWCCnjrISChFXEsrTVb3XUx58ixBV7jpkuNxRTCagyByeDzTd0fxl6Y7YgcXW2
         6ilA==
X-Forwarded-Encrypted: i=1; AJvYcCWzO2WNjZ4UOyerikQGceYPE574noi+9EfE6OPAQl6dBUxRAuKdsW6W1fzOILWLjFlLvbMPsV9Y9ErSGdnVgc0Dg+KFFpXlWSdqk2fLD+Yko6rGIORvADRSmc9j4ggnk+RpTNnTF0rHSu+5BJgGsY9IK3lm2SmQjiIUWOouC7i56gu/YpA=
X-Gm-Message-State: AOJu0Ywm9EQ5cPTpxSWn3oyJZ9fAzhJD3kApVx6sqC1f2Oq9vLGXuadD
	VQvzEhpUmAm0NNx0jJmuDM3UG6Ol9sGXf1LbyOrQLkKP9Db7rUX4JYTDmb7cBjYWz196KUUAOJo
	4g/ou5VZF/fEpPXgGZrrEOuAw+00=
X-Google-Smtp-Source: AGHT+IFpLE+pLBkcT14giu/ep9xYkXhKJk+O78hsAn+Dorxqi+4kGuAO6Mj833a4lmY/t12V14tM6w0XNki2j6VWA+g=
X-Received: by 2002:a17:907:7e92:b0:a7a:ab8a:391 with SMTP id
 a640c23a62f3a-a80aa65c854mr89082066b.45.1723201444426; Fri, 09 Aug 2024
 04:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808121447.239278-1-leitao@debian.org> <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
In-Reply-To: <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 9 Aug 2024 14:03:27 +0300
Message-ID: <CAHp75VdbRexEx90ybaFsiPhg8O0CzvpkWT1ER31GnP-y8a1e+w@mail.gmail.com>
Subject: Re: [PATCH RESEND] Do not mark ACPI devices as irq safe
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com, 
	Michael van der Westhuizen <rmikey@meta.com>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 2:57=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
> On Thu, Aug 08, 2024 at 05:14:46AM GMT, Breno Leitao wrote:
> > On ACPI machines, the tegra i2c module encounters an issue due to a
> > mutex being called inside a spinlock. This leads to the following bug:

First of all, ...

> >       BUG: sleeping function called from invalid context at kernel/lock=
ing/mutex.c:585
> >       in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282, name=
: kssif0010
> >       preempt_count: 0, expected: 0
> >       RCU nest depth: 0, expected: 0
> >       irq event stamp: 0
> >
> >       Call trace:
> >       dump_backtrace+0xf0/0x140
> >       show_stack (./arch/x86/include/asm/current.h:49
> >                    arch/x86/kernel/dumpstack.c:312)
> >       dump_stack_lvl (lib/dump_stack.c:89 lib/dump_stack.c:115)
> >       dump_stack (lib/earlycpio.c:61)
> >       __might_resched (./arch/x86/include/asm/current.h:49
> >                        kernel/sched/core.c:10297)
> >       __might_sleep (./include/linux/lockdep.h:231
> >                        kernel/sched/core.c:10236)
> >       __mutex_lock_common+0x5c/0x2190
> >       mutex_lock_nested (kernel/locking/mutex.c:751)
> >       acpi_subsys_runtime_resume+0xb8/0x160
> >       __rpm_callback+0x1cc/0x4b0
> >       rpm_resume+0xa60/0x1078
> >       __pm_runtime_resume+0xbc/0x130
> >       tegra_i2c_xfer+0x74/0x398
> >       __i2c_transfer (./include/trace/events/i2c.h:122 drivers/i2c/i2c-=
core-base.c:2258)

...read Submitting Patches and make the above to be ~5-6 significant
(useful) lines only.

> > The problem arises because during __pm_runtime_resume(), the spinlock
> > &dev->power.lock is acquired before rpm_resume() is called. Later,
> > rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> > mutexes, triggering the error.
> >
> > To address this issue, devices on ACPI are now marked as not IRQ-safe,
> > considering the dependency of acpi_subsys_runtime_resume() on mutexes.

This is a step in the right direction, but somewhere in the replies
here I would like to hear about roadmap to get rid of the
pm_runtime_irq_safe() in all Tegra related code.

...

> >        * VI I2C device shouldn't be marked as IRQ-safe because VI I2C w=
on't
> >        * be used for atomic transfers.
> >        */

Does the comment need an expansion?

> > -     if (!IS_VI(i2c_dev))
> > +     if (!IS_VI(i2c_dev) && !ACPI_HANDLE(i2c_dev->dev))
>
> looks good to me, can I have an ack from Andy here?

I prefer to see something like
is_acpi_node() / is_acpi_device_node() / is_acpi_data_node() /
has_acpi_companion()
instead depending on the actual ACPI representation of the device.

Otherwise no objections.
Please, Cc me (andy@kernel.org) for the next version.

--=20
With Best Regards,
Andy Shevchenko


Return-Path: <linux-i2c+bounces-5341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE995097A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 17:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85D211C20E42
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 15:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8E41A0730;
	Tue, 13 Aug 2024 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9e8wuHN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A401A08AF;
	Tue, 13 Aug 2024 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723564395; cv=none; b=poQyGpRww3p8qn5wXizYNO50QpJMyTYMJTgWqyMPuRCKwyY7CNxd+Ljiu092gyVQ9EtrWeKjd9KrCdC7ocUtZR8ToL4N2/c1z/ssoz4LsJAmxtn17nrICtH8ANcqX6jO0eW3/Ya/XHCyHqFoDKTfI6QMBTry5+XsbnOlo9Is/hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723564395; c=relaxed/simple;
	bh=9fA3d9mOtTgOMc7lpd9Ha2OUGkJvO2dH+JvQy2riqWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3PykWRO/UuMoi6XlszP9h2Z9+XK4QPk/rmV/m8SCLQZ0xM/N6XtKb21bHQX5cMiwgkSAw9wwJo+smX9H9jzsehbhc3Di+V4nASz9QmqEUXuD9CcRnsz3BkWyARXNJp0gr4msyjWeBTCiCX4lJIoCOWxnB6TNE7bsyt48rCFv7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9e8wuHN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a843bef98so103670466b.2;
        Tue, 13 Aug 2024 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723564391; x=1724169191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CDi0nxQmTMyJKYhv9r7kLUMtOrJfHPG/K7bxYyY1w0=;
        b=b9e8wuHNYFQkQEaTn3NI4YEWThMhYImPE8cwhw9cWTgCR0Sqv/xocAS3Y2LaMHNItv
         3Iss/WLr4/JMaVAjnP7SBtTUxwxFsF4GIm8Vr5p1O6uPATmI26Oco6bYpKrd2Cjfn1ag
         fxwXQHopNlrAaYagLNb57ptraui+40Au7H2S3CCyHMwmNW921Zr6qmGQ8IE+W7t9S+oG
         DKPVipfPqv8g49ZlT7GGM0t5cMXPrBFt0P+uQ7Ay1xQ7Et2OK2wZzgJjGFZ+ZhXFLFor
         6Y4UmREv7laOfIS+g9gdiqXeLI74jwUL+QyOOypNQLL7xZXKJFODyYRnPc0NNE0eB0Rl
         K8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723564391; x=1724169191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CDi0nxQmTMyJKYhv9r7kLUMtOrJfHPG/K7bxYyY1w0=;
        b=SqM2vJy2OpErzS78QwBmV+h7RKm0eAKiZnnSuo7objNWbbcQ6NwnWcbZBmstZGr3Pr
         tLe8bMAt/KS6VdbMfpwJ8n3BJeRzC/9CyxCNmp0DFH3dxEw/nGxuxUZzjHTtL/ietQF6
         HZbs/2l9mOPi2c4TWO02ROmFibdpSnKzyCKVkOalUq/HkuXHkWUVOIBrRyglVQE6tLL6
         iqQFBuonzUB6cGo7zTI0HQK834ZtZyLsBQBRIoBp8WTHcx8GkNCYs17TqDIgBBvBtvjD
         5y5n+J7H9yQY/Gc1M90I0+HkdP7XgJYaEJsg9H1yTE1m8eBoGgjGzv8JeVE2Gqp8yUof
         RdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvpa6BgQnqdB9XlW46eW1OrU5D3OmQmd7V6PclAnVOCaLrrHRCN/xcnO9u+VomREcSL4AhxIECV5h0TUvb+SiXgdMb5e8pfxgRHxWdkAWYOamTPScR9K9b0FMDsKhQkUgrSdritZzaqGDLWnPIaH2vOJoQHZDfof7FmHHOV5CHfPvs3mU=
X-Gm-Message-State: AOJu0YxFXga9O4QnxFNRNxkOV4rT3mbphymYyjWgvQpcG+Crpx1tauUh
	bJP+LL5P1gYqnKaXplanniwVTAWHMiLbE9oHYRVo2kQWSBhor/KVkpbO23RrXIBDD1/ALacUbpR
	VMVNSC3I5tj/pBi+tWqB+b3l76LM=
X-Google-Smtp-Source: AGHT+IHBDs7hd3lYmRZBPSM7XMnGRcrkT4qnvOiSdgv1s1zqTxc2eoPS+CWhK5VTx9y8Fw8swyYk8/eAA4ngm2DhLKk=
X-Received: by 2002:a17:907:f7a8:b0:a6f:d990:338c with SMTP id
 a640c23a62f3a-a80ed1efea2mr309054966b.20.1723564391099; Tue, 13 Aug 2024
 08:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808121447.239278-1-leitao@debian.org> <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
 <CAHp75VdbRexEx90ybaFsiPhg8O0CzvpkWT1ER31GnP-y8a1e+w@mail.gmail.com>
 <ZrtgfkzuCbNju3i9@gmail.com> <cf2d6ff5-dfea-4e25-8eee-e4e8c9cb1e7e@gmail.com>
In-Reply-To: <cf2d6ff5-dfea-4e25-8eee-e4e8c9cb1e7e@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Aug 2024 18:52:33 +0300
Message-ID: <CAHp75VdHT3g91AirBQGodw1sHbq7U=oKnJq3oSqDcNYS+OUOKQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] Do not mark ACPI devices as irq safe
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, dmitry.osipenko@collabora.com, 
	Andi Shyti <andi.shyti@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com, 
	Michael van der Westhuizen <rmikey@meta.com>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 6:28=E2=80=AFPM Dmitry Osipenko <digetx@gmail.com> =
wrote:
>
> 13.08.2024 16:32, Breno Leitao =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hello Andy,
> >
> > On Fri, Aug 09, 2024 at 02:03:27PM +0300, Andy Shevchenko wrote:
> >> On Fri, Aug 9, 2024 at 2:57=E2=80=AFAM Andi Shyti <andi.shyti@kernel.o=
rg> wrote:
> >>> On Thu, Aug 08, 2024 at 05:14:46AM GMT, Breno Leitao wrote:
> >
> >>>> The problem arises because during __pm_runtime_resume(), the spinloc=
k
> >>>> &dev->power.lock is acquired before rpm_resume() is called. Later,
> >>>> rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> >>>> mutexes, triggering the error.
> >>>>
> >>>> To address this issue, devices on ACPI are now marked as not IRQ-saf=
e,
> >>>> considering the dependency of acpi_subsys_runtime_resume() on mutexe=
s.
> >>
> >> This is a step in the right direction
> >
> > Thanks
> >
> >> but somewhere in the replies
> >> here I would like to hear about roadmap to get rid of the
> >> pm_runtime_irq_safe() in all Tegra related code.
> >
> > Agree, that seems the right way to go, but this is a question to
> > maintainers, Laxman and Dmitry.
> >
> > By the way, looking at lore, I found that the last email from Laxman is
> > from 2022. And Dmitry seems to be using a different email!? Let me copy
> > the Dmitry's other email (dmitry.osipenko@collabora.com) here.
> >
> >>>> +     if (!IS_VI(i2c_dev) && !ACPI_HANDLE(i2c_dev->dev))
> >>>
> >>> looks good to me, can I have an ack from Andy here?
> >>
> >> I prefer to see something like
> >> is_acpi_node() / is_acpi_device_node() / is_acpi_data_node() /
> >> has_acpi_companion()
> >> instead depending on the actual ACPI representation of the device.
> >>
> >> Otherwise no objections.
> >> Please, Cc me (andy@kernel.org) for the next version.
> >
> > Thanks for the feedback, I agree that leveraging the functions about
> > should be better. What about something as:
> >
> > Author: Breno Leitao <leitao@debian.org>
> > Date:   Thu Jun 6 06:27:07 2024 -0700
> >
> >     Do not mark ACPI devices as irq safe
> >
> >     On ACPI machines, the tegra i2c module encounters an issue due to a
> >     mutex being called inside a spinlock. This leads to the following b=
ug:
> >
> >             BUG: sleeping function called from invalid context at kerne=
l/locking/mutex.c:585
> >             in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282=
, name: kssif0010
> >             preempt_count: 0, expected: 0
> >             RCU nest depth: 0, expected: 0
> >             irq event stamp: 0
> >
> >             Call trace:
> >             __might_sleep
> >             __mutex_lock_common
> >             mutex_lock_nested
> >             acpi_subsys_runtime_resume
> >             rpm_resume
> >             tegra_i2c_xfer
> >
> >     The problem arises because during __pm_runtime_resume(), the spinlo=
ck
> >     &dev->power.lock is acquired before rpm_resume() is called. Later,
> >     rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> >     mutexes, triggering the error.
> >
> >     To address this issue, devices on ACPI are now marked as not IRQ-sa=
fe,
> >     considering the dependency of acpi_subsys_runtime_resume() on mutex=
es.
> >
> >     Co-developed-by: Michael van der Westhuizen <rmikey@meta.com>
> >     Signed-off-by: Michael van der Westhuizen <rmikey@meta.com>
> >     Signed-off-by: Breno Leitao <leitao@debian.org>
> >
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index 85b31edc558d..1df5b4204142 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -1802,9 +1802,9 @@ static int tegra_i2c_probe(struct platform_device=
 *pdev)
> >        * domain.
> >        *
> >        * VI I2C device shouldn't be marked as IRQ-safe because VI I2C w=
on't
> > -      * be used for atomic transfers.
> > +      * be used for atomic transfers. ACPI device is not IRQ safe also=
.
> >        */
> > -     if (!IS_VI(i2c_dev))
> > +     if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
> >               pm_runtime_irq_safe(i2c_dev->dev);
> >
> >       pm_runtime_enable(i2c_dev->dev);
> >
>
> Looks good, thanks
>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

LGTM as well, feel free to add
Reviewed-by: Andy Shevchenko <andy@kernel.org>
to the above when sending it formally.

> > but somewhere in the replies
> > here I would like to hear about roadmap to get rid of the
> > pm_runtime_irq_safe() in all Tegra related code.
>
> What is the problem with pm_runtime_irq_safe()?

It's a hack. It has no reasons to stay in the kernel. It also prevents
PM from working properly (in some cases, not Tegra).

> There were multiple
> problems with RPM for this driver in the past, it wasn't trivial to make
> it work for all Tegra HW generations. Don't expect anyone would want to
> invest time into doing it all over again.

You may always refer to the OMAP case, which used to have 12 (IIRC,
but definitely several) calls to this API and now 0. Taking the OMAP
case into consideration I believe it's quite possible to get rid of
this hack and retire the API completely. Yes, this may take months or
even years. But I would like to have this roadmap be documented.

--=20
With Best Regards,
Andy Shevchenko


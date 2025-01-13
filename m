Return-Path: <linux-i2c+bounces-9063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093CA0C225
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 20:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15EF83A5956
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 19:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87E81CF2B7;
	Mon, 13 Jan 2025 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdLtirxB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C341C760A;
	Mon, 13 Jan 2025 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736797974; cv=none; b=LcLFrpxtiehVcvN8AdWHa/lnkA2Tv0cvQwwn10BkpTL3c/caGfiLBJMcAajeL8g27qg4U0DYgSyFkJSwnv+AziuURyXcz4bryvhXddKr/wp5m9wBvFGIsI13buJ8QedBmVwWErTGSzq6REOTEuV4GMEjHSC8fvgd8CRtkrjDwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736797974; c=relaxed/simple;
	bh=XO823bjt5X9FnUPfO46pBp/AvJdPdplIJ+Z5fefXKXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcRawDz54N5FlmQK1MRObU7fMTGEQ59l0hp/5Q8pFaCLdtyDzB37EtuYod3ljrFL8l12eaSKzi6cLFw3UJeXr1tuZZlGo/FITetQdOW2pWhjDVJmO9VVZLrw5tNkhQ5vXN7WHaHsP+ZYttTcwrgs11CmHzh5JFOL/b0VGY8mkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdLtirxB; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaec61d0f65so922470366b.1;
        Mon, 13 Jan 2025 11:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736797971; x=1737402771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO823bjt5X9FnUPfO46pBp/AvJdPdplIJ+Z5fefXKXU=;
        b=GdLtirxBrSPMBmX6Do8mmqE3O/14UDgMImNS+mrn+S8qQ7GYdzJrsmoPLfViXD7WnZ
         JJ+ZmwtIwPMLtTJARQFprs8J8bVDCjp5ulvvgGPe4ssAIvO7NXiQzYkLtL8bKTEnjkWl
         1j8ifjNJY+0COSXTZeN0CxweFNqLWhYTCh2Tvo3MuJlIzZAxt6CRsyRPBOMw6Zqxs3tQ
         a2St2mIeMwYuLAb/BYMtlgGSmi8E3Dx7ZZA3g8v2VXL8ZnxTy03+b4jyw9XA3l5WxqSe
         XfubMI5M73x8FCG2aK0onTuo4bcWp8hnEmVqpTtNnTW1aDqeIXe9aDAtOGU3hVl5rMbg
         IQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736797971; x=1737402771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO823bjt5X9FnUPfO46pBp/AvJdPdplIJ+Z5fefXKXU=;
        b=qINGgaRYH05HXBJiFdRNtNvxKaFm36Mkrat4vomj79YENKFkMZuJzGRm0EYAJe+FsL
         YDwZip62RPahCZPNwG+pWi3N2PBsy0QjE0YObPkbJus7ihNfsh5q7FLGhR8xQeTFzRLv
         pDTt9UeBnK2cG+g4u6TxoIyLUN9BtgsNniLfO7ViWJtHJpfSEE1mk7Lg/qU1b8D1Rh94
         IfTslNVOy+aLzGfsGxk3Fa+svmaTCtDYyF4Wc3nOVoi45MK6flBJcC9rJTg4HHV+8bWc
         4lnRx1drAAQpsNb7g6IxoL3CvsVzeQUE6LC77dMMse00egS77pZOOpB99P8XKulMTrte
         POOg==
X-Forwarded-Encrypted: i=1; AJvYcCV7symyKAPfwAeYVtswA7+0rewWPaY+Fw+sjQaTj2EMjkk8vUnNI5WnyJEv1Umqd508SBPYIsqaEEoDShMDM19RQUbn4w==@vger.kernel.org, AJvYcCWwu/TZ3Hn2CpQXkN3WWeamYjiuGif3LtBfRlK8KN5HI+CCsJdCD3l3R9tppa0ONxA5B7P1YIa/pzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHADvi5n8yajn0unbNErGKsfBk4DeF7olfTlMYXzAcclEaAUWL
	tn0t8qY1J1ptc2NZVEBZISjXPd/Z9egIxPDKLqlKt4Itbw7mDvSciG/24SneE6bQ3yt0/8beC2l
	UUO2UJ90q5o7EQiIoIl/GBKtB/Nk=
X-Gm-Gg: ASbGncsdR6hsUBf5Pf8V6y+5in80JgOY5olvxRX0liI4E5RFg7mNonf3F5yRP8ZVOce
	kB20ayGbcetkjVjFafy0GL7MupQdKSBVEcOzHYA==
X-Google-Smtp-Source: AGHT+IHrjIdb/g/gHUs4XqS7Q8O/UiCV+22KzXbCmSdUugelZJT7UcJcjZ1n8kJ3gSmwcQX45jNN+lqfh1tJxXpDcJE=
X-Received: by 2002:a17:906:2792:b0:ab2:d84a:f86 with SMTP id
 a640c23a62f3a-ab2d84a11d7mr1221021066b.7.1736797970568; Mon, 13 Jan 2025
 11:52:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209183557.7560-1-hdegoede@redhat.com> <20241209183557.7560-5-hdegoede@redhat.com>
 <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com> <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com>
 <049555a0-ad65-7aad-2a7c-fc2047629010@linux.intel.com> <Z4Uy4FYgynLP3ZAp@smile.fi.intel.com>
 <2b2a3d16-039c-4cdf-94b9-41d074558d97@redhat.com> <20250113194702.j6ou2d7c3vn32unv@pali>
In-Reply-To: <20250113194702.j6ou2d7c3vn32unv@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Jan 2025 21:52:13 +0200
X-Gm-Features: AbW1kvad7cVQPuK1S9Yo2-u_-seXqbQgHs9fBJh4A23P_IEARGktvpxCgpGcNX4
Message-ID: <CAHp75VdnDqpeiWZDwZb0Cfx8n4L_8N1cQRb2MKSteWCZ+yOrfw@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
	Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 9:47=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
> On Monday 13 January 2025 17:49:19 Hans de Goede wrote:
> > On 13-Jan-25 4:36 PM, Andy Shevchenko wrote:
> > > On Mon, Jan 13, 2025 at 05:17:43PM +0200, Ilpo J=C3=A4rvinen wrote:
> > >> On Sat, 21 Dec 2024, Hans de Goede wrote:
> > >>> On 17-Dec-24 5:48 PM, Ilpo J=C3=A4rvinen wrote:
> > >>>> On Mon, 9 Dec 2024, Hans de Goede wrote:

...

> > >>>> So what was the result of the private inquiry to Dell?
> > >>>
> > >>> On July 5th I send the following email to Prasanth Ksr
> > >>> <prasanth.ksr@dell.com> which is the only dell.com address I could
> > >>> find in MAINTAINERS other then Dell.Client.Kernel@dell.com which
> > >>> does not seem to be monitored very actively:
> > >>>
> > >>> """
> > >>> Hello Prasanth,
> > >>>
> > >>> I'm contacting you about a question lis3lv02d freelfall sensors /
> > >>> accelerometers used on many (older) Dell laptop models. There
> > >>> has been a question about this last December and a patch-set
> > >>> trying to address part of this with Dell.Client.Kernel@dell.com
> > >>> in the Cc but no-one seems to be responding to that email address
> > >>> which is why I'm contacting you directly:
> > >>>
> > >>> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161=
bfc@molgen.mpg.de/
> > >>> https://lore.kernel.org/platform-driver-x86/20240704125643.22946-1-=
hdegoede@redhat.com/
> > >>>
> > >>> If you are not the right person to ask these questions to, then
> > >>> please forward this email to the right person.
> > >>>
> > >>> The lis3lv02d sensors are I2C devices and are described in the ACPI
> > >>> tables with an SMO88xx ACPI device node. The problem is that these
> > >>> ACPI device nodes do not have an ACPI I2cResouce in there resource
> > >>> (_CRS) list, so the I2C address of the sensor is unknown.
> > >>>
> > >>> When support was first added for these Dell provided a list of
> > >>> model-name to I2C address mappings for the then current generation
> > >>> of laptops, see:
> > >>>
> > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/i2c/busses/i2c-i801.c#n1227
> > >>>
> > >>> And later the community added a few more mappings.
> > >>>
> > >>> Paul Menzel, the author of the email starting the discussion on thi=
s:
> > >>>
> > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/i2c/busses/i2c-i801.c#n1227
> > >>>
> > >>> did a search for the kernel message which is printed when an SMO88x=
x
> > >>> ACPI device is found but the i2c-address is unknown and Paul found
> > >>> many models are missing from the mapping table (see Paul's email).
> > >>>
> > >>> Which leads us to the following questions:
> > >>>
> > >>> 1. Is there another, uniform (so not using a model name table)
> > >>> way to find out the I2C address of the SMO88xx freefall sensor
> > >>> from the ACPI or SMBIOS tables ?
> > >>>
> > >>> 2. If we need to keep using the model-name to I2C-address mapping
> > >>> table can you help us complete it by providing the sensor's I2C
> > >>> address for all models Paul has found where this is currently missi=
ng ?
> > >>>
> > >>> Regards,
> > >>>
> > >>> Hans
> > >>> """
> > >>>
> > >>> Pali and Paul Menzel where in the Cc of this email.
> > >>>
> > >>>> Did they respond?
> > >>>
> > >>> I got a reply from Prasanth that they would forward my request to t=
he
> > >>> correct team. Then I got on off-list reply to the v6 patch-set from
> > >>> David Wang from Dell with as relevant content "We are working on it=
."
> > >>>
> > >>>> Did they provide useful info?
> > >>>
> > >>> No further info was received after the "We are working on it." emai=
l.
> > >>
> > >> Hi Hans,
> > >>
> > >> So you didn't try to remind them after that at all?
> > >>
> > >> This kind of sounds a low priority item they just forgot to do and m=
ight have
> > >> had an intention to follow through.
> > >
> > > Talking from my experience with other companies that could have done =
something
> > > better I dare to say that this entire buzz for them is no-priority at=
 all, like
> > > "no money stuff", hence no attention given. That said, I believe ping=
 won't
> > > change anything here, however I agree that it _was_ worth to try to a=
cquire any
> > > response from them.
> >
> > Basically what Andy says above.
> >
> > Note that Dell's client team has been on the Cc for all the versions of
> > this patch-set many of which were posted after the "We are working on i=
t." email.
> >
> > For completeness sake I have just send a request for a status update on
> > this to Prasanth and David from Dell.
> >
> > In the mean time it would be good IMO to merge v11 of this patch, if we
> > get useful info from Dell after all we can modify the driver for this
> > later.
>
> No, this change should not be taken at all. This change has a chance to
> break booting or brick future dell devices. I'm not going to discuss it
> again, but saying that it is good just because you do not have anything
> better is not an argument to take such change. Also it is not an excuse
> to hide dangerous things behind module parameter. And if you have been
> doing to everything to ensure that companies would not want to tak with
> you then sorry it is only your problem, so please do not complain here.

With all respect, this is not how we should treat the Linux kernel
contributors and users (who want this feature to enable their
devices). We have a ton of dangerous and DANGEROUS parameters and
other algorithms here and there (in Linux kernel source tree),
moreover, users with all responsibility may kill themselves with a
laptop just by hitting their head or igniting Li-ion battery to set
off a blast or heavy fire. Is there any _practical_ protection for
that? No. Do you suggest we should ban Li-ion because of this? I don't
see it, but be consistent, do it!

--=20
With Best Regards,
Andy Shevchenko


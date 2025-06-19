Return-Path: <linux-i2c+bounces-11528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034FAE0B01
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 18:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4F91BC2A53
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 16:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92D128B504;
	Thu, 19 Jun 2025 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOyYdFE+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0CD1C7009;
	Thu, 19 Jun 2025 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348994; cv=none; b=p9s5NESvBzWmmL7QLFZ5YPst4HL3/8WVFzV+NgL4Snx9Mj/M/fgiv9Ewtdj1y3lkaYvYMZB2I4L/EiVdNTdNk1bMDZYEvcMr7ur5wKEZVcQZX1oaw5Gt7XK1QWyH6O4sXAGcXPHC8pt7eXxV2vf+4qzy9gQWxgu3SFxj5n0x814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348994; c=relaxed/simple;
	bh=r2M0LA0vpAcF4qHQatVHpNoCHvW8P/+5eAr6zd7qrM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uO1xfQpKqtidbr/XUgZz1Nk1G6pcDLd4aYeugYNxdhFGuO9dTDEnjPSHkumWS6ES09op1y//yxYXOueT8m8H9dsd70j82Gu21hlvWEBE1UQo+s/k/5y2pE/C0Fr76Ju1Z7e/ac38EU3vow7NzdIhXtDwEP7IqezSeD8xMgzLFDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOyYdFE+; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e819ebc3144so902575276.0;
        Thu, 19 Jun 2025 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750348992; x=1750953792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xQTwXxD7lGV9pBuwUJX6vU+Txv9GmZYzEqswfTqdeg=;
        b=eOyYdFE+kx2eNjvpj1UrPtNV+ZD1m3EW2Qz1G1wJvZCwMX6iJXRUmLixGaQBOTUWJQ
         a8SXqlgEIt+lQM7RHuPkLHX1A2tzWbQfxI+pbadefNyyvAZr6q32dVaz/V6k1nsB8g6g
         RFRC1G/vOM423+4DJ1DHmgpHEW5eaKsz61L1ZjnhHBwVaNBi13U7aXvDvJIfNTBMIMBL
         BbJDX+BPbWN1jB/0FT+SCb4lvNx49+bt4BXXmcJJDQhaflGosR01ZyDEP15zpSSIr4Oo
         oYAKcgPbf2d9+yJqTNrXvo6HkFg1aDnPU1/vtWQdWhdyLJ2jmUh4F0kiaFxDLBhaoQ6Y
         1Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750348992; x=1750953792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xQTwXxD7lGV9pBuwUJX6vU+Txv9GmZYzEqswfTqdeg=;
        b=eD6vrIWrdScAhmvwbGWbEKFbVJEQ34UKvBZSXENuJZjHznZZjZDw5UPeTuNnbckWgC
         u7RoxFXgo0niPv2rjFWBIHRvlfUAjCWfzQ0/5Qzk9CGuhDm7Zpxy8F8Rls3O/lgArTnq
         0Bs7EXakf++ltDot0Q8Y3diTbW1X8flHyUvx994xx/PLV2QMxqzft8lqjEnEYEEW+Mi1
         Z6UDGxKHz9zrOdKh6WYOaYVk8VKybDFBFg/lab8Atx0SzZUt8TnDoW0RPeSm1dm69ugh
         ZD5tLblds86ylkDDiGK/hZw5p77EZIGba+Gp4AKyvgVQa1dmIr6LC1A1agjx4CPHO02f
         5Rpw==
X-Forwarded-Encrypted: i=1; AJvYcCUb/CxhaozC1VBMHOQDabbtR6cqlpPBV0ApMWchHohNRfl5vKruW4ChtP60ViwW0jxUUv+hfthoypVQfQ==@vger.kernel.org, AJvYcCUlBdJfflX6ssbUaWRm1l9H4oPOW83Mf5ZdzgSztEWwxjdI5MrgOJtlILg7f1Ki02B2ZWB+k1Ck4hOB@vger.kernel.org, AJvYcCVWFJNVU7ZOImX6+hdS1sxRJ124zy09sNZpTHggbk/55qLej8cbaAg1QYONCQuoNipFpSUKJhLc78JUooI=@vger.kernel.org, AJvYcCVeMJhvQJvCzNcwdiY+ERFevSeSUA0p6OZ5uuWVgkjLXPN0EqAZ2e/66rQ9lmdnJ8GlSM6OP2JLJmQVsKRP@vger.kernel.org, AJvYcCVla32yOhG9lNhzCOZReQhbjpnRV2G9fTiVvLwuu0suZ/4jpzAsaDW7oD7gq4kbsL0KXKDHiH7koF7MHwE+p60=@vger.kernel.org, AJvYcCWT45kDoUJnAXdKtCIEu5zcHBNRsf3NXpvWboMMVM4j+CAFKq9YQambgk4d9Dry1RlfvQZHsGzP6lQJ@vger.kernel.org, AJvYcCWfZ4lehX2JoggL2YD9U0HoC/uXWOaSjOoJty3kaCDQBA7mBCg1nKswem4Uxs88tOwSSMrCcwPpIHU=@vger.kernel.org, AJvYcCX91Vv77WQC0JJANBCZBk9xY8pA7U3ie6mWV2JaGey6PyhdLf+BHfz6HGXfYGJ3FG0JKL6kV5MmX2c+@vger.kernel.org, AJvYcCXHxYFLWreprEjqHyDIBbVaKS0K6L+q7h4YgIR2DhH/LGZ4k2q8wCSVxqAiB6kCWSCLM2rQTSdy@vger.kernel.org
X-Gm-Message-State: AOJu0YyRp2u8n6sh89MJ1jIJ/TSt5dFAyr5aed1iruxvpNwS5EADdn0j
	538YZuxaZDTGLEF+TKE/u88rVp7ldKDW3MWDdHRyUhAV14Fyf0v10z0mRud8ondNRjzfWZQbRoX
	MAKDj7K1J2OtE9Fa30qTC/K5gQTT5qV0=
X-Gm-Gg: ASbGnctxUY9I9+3CsSTNR7/d2HA3qjfCj4Yj9N76csUkOeW3+imic/wARB+a1D88t89
	QUfvgjPbeHGE70EZEjsPx/hsTcydQ9lXf0Vg2coY0DEO7L8EUGIXjIdRxVGBPsKzBaoMgYFQ9DQ
	V334S6TZ3NI018ygypsLJEb0he6u3onnqSBNCHrhd6
X-Google-Smtp-Source: AGHT+IGa7tw70P7sGvwQKMUUHWj3QXVyK3ea1FN2fTq6oMO79eMLCTL0cNzeqaB1CCVADOTXLD7G0IohS8aLb91g6EY=
X-Received: by 2002:a05:690c:3802:b0:70e:73ce:80de with SMTP id
 00721157ae682-7117544de8dmr325019227b3.25.1750348991400; Thu, 19 Jun 2025
 09:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604041418.1188792-1-tmyu0@nuvoton.com> <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <20250612140041.GF381401@google.com> <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
 <20250612152313.GP381401@google.com> <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
 <20250613131133.GR381401@google.com> <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
 <20250619115345.GL587864@google.com> <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
 <20250619152814.GK795775@google.com>
In-Reply-To: <20250619152814.GK795775@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 20 Jun 2025 00:03:01 +0800
X-Gm-Features: Ac12FXx-P2aFA7c6BIgslF9XvC9taDGEdXQ_V2uefNP8obilfmqlElV_z9tezMQ
Message-ID: <CAOoeyxU7eQneBuxbBqepta29q_OHPzrkN4SKmj6RX72L3Euw5A@mail.gmail.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8819=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 19 Jun 2025, Ming Yu wrote:
>
> > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8819=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:53=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > >
> > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8813=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:11=E5=AF=AB=E9=81=93=EF=BC=9A
> > > > >
> > > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > > >
> > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8812=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > > > > >
> > > > > > > On Thu, 12 Jun 2025, Ming Yu wrote:
> > > > > > >
> > > > > > > > Dear Lee,
> > > > > > > >
> > > > > > > > Thank you for reviewing,
> > > > > > > >
> > > > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=
=8812=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > > > > > > >
> > > > > > > > ...
> > > > > > > > > > +static const struct mfd_cell nct6694_devs[] =3D {
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10)=
,
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11)=
,
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12)=
,
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13)=
,
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14)=
,
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15)=
,
> > > > > > > > > > +
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > > > > > > > >
> > > > > > > > > Why have we gone back to this silly numbering scheme?
> > > > > > > > >
> > > > > > > > > What happened to using IDA in the child driver?
> > > > > > > > >
> > > > > > > >
> > > > > > > > In a previous version, I tried to maintain a static IDA in =
each
> > > > > > > > sub-driver. However, I didn=E2=80=99t consider the case whe=
re multiple NCT6694
> > > > > > > > devices are bound to the same driver =E2=80=94 in that case=
, the IDs are not
> > > > > > > > fixed and become unusable for my purpose.
> > > > > > >
> > > > > > > Not sure I understand.
> > > > > > >
> > > > > >
> > > > > > As far as I know, if I maintain the IDA in the sub-drivers and =
use
> > > > > > multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the =
first
> > > > > > NCT6694 device bound to the GPIO driver will receive IDs 0~15.
> > > > > > However, when a second NCT6694 device is connected to the syste=
m, it
> > > > > > will receive IDs 16~31.
> > > > > > Because of this behavior, I switched back to using platform_dev=
ice->id.
> > > > >
> > > > > Each of the devices will probe once.
> > > > >
> > > > > The first one will be given 0, the second will be given 1, etc.
> > > > >
> > > > > Why would you give multiple IDs to a single device bound to a dri=
ver?
> > > > >
> > > >
> > > > The device exposes multiple peripherals =E2=80=94 16 GPIO controlle=
rs, 6 I2C
> > > > adapters, 2 CAN FD controllers, and 2 watchdog timers. Each periphe=
ral
> > > > is independently addressable, has its own register region, and can
> > > > operate in isolation. The IDs are used to distinguish between these
> > > > instances.
> > > > For example, the GPIO driver will be probed 16 times, allocating 16
> > > > separate gpio_chip instances to control 8 GPIO lines each.
> > > >
> > > > If another device binds to this driver, it is expected to expose
> > > > peripherals with the same structure and behavior.
> > >
> > > I still don't see why having a per-device IDA wouldn't render each
> > > probed device with its own ID.  Just as you have above.
> > >
> >
> > For example, when the MFD driver and the I2C sub-driver are loaded,
> > connecting the first NCT6694 USB device to the system results in 6
> > nct6694-i2c platform devices being created and bound to the
> > i2c-nct6694 driver. These devices receive IDs 0 through 5 via the IDA.
> >
> > However, when a second NCT6694 USB device is connected, its
> > corresponding nct6694-i2c platform devices receive IDs 6 through 11 =E2=
=80=94
> > instead of 0 through 5 as I originally expected.
> >
> > If I've misunderstood something, please feel free to correct me. Thank =
you!
>
> In the code above you register 6 I2C devices.  Each device will be
> assigned a platform ID 0 through 5. The .probe() function in the I2C
> driver will be executed 6 times.  In each of those calls to .probe(),
> instead of pre-allocating a contiguous assignment of IDs here, you
> should be able to use IDA in .probe() to allocate those same device IDs
> 0 through 5.
>
> What am I missing here?
>

You're absolutely right in the scenario where a single NCT6694 device
is present. However, I=E2=80=99m wondering how we should handle the case wh=
ere
a second or even third NCT6694 device is bound to the same MFD driver.
In that situation, the sub-drivers using a static IDA will continue
allocating increasing IDs, rather than restarting from 0 for each
device. How should this be handled?

Or am I doing something wrong?


Thanks,
Ming


Return-Path: <linux-i2c+bounces-11586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF2AE8664
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 16:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 094E17B96CE
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 14:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAD8266580;
	Wed, 25 Jun 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNoiObDL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E988263C9B;
	Wed, 25 Jun 2025 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861469; cv=none; b=QaLVQDaDKVTCi1/b943Tfh1q8ioM54wDr9fu3Il6VuDrCWk78pcun+BINQ+o+yJelPYmTIgzuNIkdlaRPti9JQoAoRCBy0ekuANBVU3ahH7nOenn1fNMH8IxMPEolWnqgI5N2tZ85WPoeFsf083qxXnTtpaqUH3UaQqxUTgsrwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861469; c=relaxed/simple;
	bh=4lQx4F9hjZWG+oecPIu73jVLUPGxu6Ppdl7qo3yREEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lo4bwIZp/G14tIsCqvzQSxL2D81wKClclJ0+mHmADQGFjyeiopcQ1/fIoyA6WgBHm9a6/q5B/Cb7UBpXgJreVfUVJvVZn72wDizfh2L5LE0x6vhSvrhkdR1fIFDWzIWJkRq6JLImqfhYn09Ku1e4qC9JhXm5r/qMZFgb0WV5/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNoiObDL; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e767ce72eso61452467b3.1;
        Wed, 25 Jun 2025 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750861466; x=1751466266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64+eXwRfzFJ5ZZF2JmaBAaZJE0xEE8CT5TwD35FJ8Gc=;
        b=TNoiObDLRLWEGNemagPOS21HVQJEKaFekwwv0vErMngIeRnrIWR3L7OXEVBTUSECP6
         DAvpzbguXOydzEEsk6Uh4tRfmIj3gUEheFFD6fhks2QDrQMBt00Vq3esxrRyPZqX3pG7
         37xGRxIf2QPDoC9dlZqEAE/6hsjRXhohEhbgvEpPqIwDZn3r3Cnc2RT4XD2asYGQ1sEx
         99IlXGOLkM9vB4dO8aEo9wTmsewY8/Lny8DleqfyboFiz/idatXKTQKWrpda6wiQfTFv
         wdATVrTja188VGrsN+x2wWEQnBY91B/RZf0OPtbek3ElMUVxb4elG+1YQj/t19UlBYLg
         WFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861466; x=1751466266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64+eXwRfzFJ5ZZF2JmaBAaZJE0xEE8CT5TwD35FJ8Gc=;
        b=xAaPPGFAGYRxlv5wIVPdF4Twrl8ytatnRhP0pYo4qzB8Xzea2x0BLpTCnclVzlkPnu
         Wi6vw0dPomvtuIt2mUivspeUvCuMUDdp9cFDOVy8Xw3gqZbveSbYCZqlTRbaFdzdIZ8T
         JpJ/56PuG6lMxaV+gVuxS9v54Vl1DHpcvgayKYjdb/LNpHT/OvFDnubXURLTg02xZ+Uz
         VbzEf7yGT7MOcKQgz4kqA+A19wQPylmgAP90uU/7I8wtdR/Z8+JjiMmb+guYbXuDMK/C
         f3F5nsbPilbCt8mb7oo47g/2GIPMiFOiUy7jVC+rulhIfz5GHXnLZyTOzBgsfSwiJqgk
         kKTw==
X-Forwarded-Encrypted: i=1; AJvYcCU5UWBqEEdvGlovRlBtMbki4a2cADcaggDfGIjtInd2cZI+52qcWs7qqf4wlFehDOcnagjI2AdXbXrG@vger.kernel.org, AJvYcCUBf3komUcL4I/m/Bqm93/w2l+tljMAmWB59fz+7ZwuV+TDakRet1u03V+BJ6V6a2U3sAn0kzu1Ud/HcA==@vger.kernel.org, AJvYcCUlQ6hJo8k64BCfhOsCJy6dvUXFYob12hVgLJVT3nqaA5MeXYnaUvMSGM+/tcE9jaV3+0QNpbNGaPwU@vger.kernel.org, AJvYcCUmtFwt9WDhzYiJWouWaciLQX0rIIK3fbMaOIpDH6kjyUx68noTIX4tx/0RzxkG59Kp2JteRFgw/yjxwHxOyNY=@vger.kernel.org, AJvYcCV4n010a94L+yV82ohWpiL+Z/RFzGCC+ZlCjnqv+9pO+TauJ9UQZiDVLw9LuBVVHkCYJcWqXiXAUR8=@vger.kernel.org, AJvYcCV9rm2a3JY5yDKG1CeEJfsS60ILRPVqEiauwPPdu+kTf6z14f+EN3S9QQkf11jpnltTqQmeZ0LP@vger.kernel.org, AJvYcCW16vPuCmJWcRDO+0HQ0iDomMsCZ/zl8UBb6he5IBcv4q4GO8TfrkbYdZj6jdvtvO18LJCXI/vyQOEgWqJc@vger.kernel.org, AJvYcCWkTkm2IJduAxTl9z3un2pKfrR0Kzv9UOW5YzrXSB8+5fUfDJYL/r90XsUY3axdvYinA954funLZOKA@vger.kernel.org, AJvYcCWnxfHDrZRssX/QcWu3qfPHbO9uQLw42SjH9M9C9bg6KbQY8ALToK2V/mPPG0WQe9NRu6v3gnu2MOo2LdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuKeD8d6x6QXbCpstNTjjp0aXiZRzE+BJvAOOBpTDy3lD594u
	dLvNLxTfBBzuCJSIyn+h68rm8oxdfrqMGL+K0N51wX6gPs78GyrEx5YMZdHuh5Xk/44Lfduzlz3
	AhCgSLM6cjtaCM9/rEG8bahbCSlo/55M=
X-Gm-Gg: ASbGncuQ7IIq6LeZnV0ZY13zsoe7NGPmZV6w2DkGbrhxExNZ4wuAoVB6bAZTEWmrKre
	skj3/bdxUd67D/XLnm5NL93wjOTqjku5L2D2Img+pzoS4KAGOUUD9DI7M7fpar8egHNHbydOszv
	Aw4BFiIBydMw5Y+HdYy70n7d2auXzzZ6i789lsbcD1Ng==
X-Google-Smtp-Source: AGHT+IFk+/GbdFQ7pe2ZUPEw01sHglJ1f9nAD4x+JqwT6kdRFvMBui1vb6g1X14KApUglJ5N+5SCNIY5OjUpmYd7Piw=
X-Received: by 2002:a05:690c:6c8c:b0:702:d85:5347 with SMTP id
 00721157ae682-71406e0865dmr42325307b3.36.1750861465689; Wed, 25 Jun 2025
 07:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612152313.GP381401@google.com> <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
 <20250613131133.GR381401@google.com> <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
 <20250619115345.GL587864@google.com> <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
 <20250619152814.GK795775@google.com> <CAOoeyxU7eQneBuxbBqepta29q_OHPzrkN4SKmj6RX72L3Euw5A@mail.gmail.com>
 <20250625090133.GP795775@google.com> <CAOoeyxWoxC-n3JjjFe8Ruq_VydXk=jev=mopKfL5B7gsaSg=Ag@mail.gmail.com>
 <20250625134634.GY795775@google.com>
In-Reply-To: <20250625134634.GY795775@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 25 Jun 2025 22:24:13 +0800
X-Gm-Features: Ac12FXwOAsReVst2WQpcfNnHik1k8UbE-KC25E0rS5ks97enPxKsXXybra4VcWs
Message-ID: <CAOoeyxVuu-kKoQa84mGOX=thAc0hnzQU8L=MnycoRRhzoZMnNw@mail.gmail.com>
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

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8825=E6=97=A5 =E9=
=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 25 Jun 2025, Ming Yu wrote:
>
> > Dear Greg and Lee,
> >
> > Thank you for your comments.
> > I've reviewed your suggestions, but would appreciate your feedback on
> > a few remaining points.
> >
> > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8825=E6=97=A5=
 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:01=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Fri, 20 Jun 2025, Ming Yu wrote:
> > >
> > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8819=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:28=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > >
> > > > > On Thu, 19 Jun 2025, Ming Yu wrote:
> > > > >
> > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8819=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:53=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > > > >
> > > > > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > > > > >
> > > > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=
=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:11=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > > > > > > >
> > > > > > > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > > > > > > >
> > > > > > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=
=9C=8812=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:23=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > > > > > > > > >
> > > > > > > > > > > On Thu, 12 Jun 2025, Ming Yu wrote:
> > > > > > > > > > >
> > > > > > > > > > > > Dear Lee,
> > > > > > > > > > > >
> > > > > > > > > > > > Thank you for reviewing,
> > > > > > > > > > > >
> > > > > > > > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=
=E6=9C=8812=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > > > > > > > > > > >
> > > > > > > > > > > > ...
> > > > > > > > > > > > > > +static const struct mfd_cell nct6694_devs[] =
=3D {
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 0),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 1),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 2),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 3),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 4),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 5),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 6),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 7),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 8),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 9),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 10),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 11),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 12),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 13),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 14),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL=
, 0, 15),
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL,=
 0, 0),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL,=
 0, 1),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL,=
 0, 2),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL,=
 0, 3),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL,=
 0, 4),
> > > > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL,=
 0, 5),
> > > > > > > > > > > > >
> > > > > > > > > > > > > Why have we gone back to this silly numbering sch=
eme?
> > > > > > > > > > > > >
> > > > > > > > > > > > > What happened to using IDA in the child driver?
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > In a previous version, I tried to maintain a static=
 IDA in each
> > > > > > > > > > > > sub-driver. However, I didn=E2=80=99t consider the =
case where multiple NCT6694
> > > > > > > > > > > > devices are bound to the same driver =E2=80=94 in t=
hat case, the IDs are not
> > > > > > > > > > > > fixed and become unusable for my purpose.
> > > > > > > > > > >
> > > > > > > > > > > Not sure I understand.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > As far as I know, if I maintain the IDA in the sub-driv=
ers and use
> > > > > > > > > > multiple MFD_CELL_NAME("nct6694-gpio") entries in the M=
FD, the first
> > > > > > > > > > NCT6694 device bound to the GPIO driver will receive ID=
s 0~15.
> > > > > > > > > > However, when a second NCT6694 device is connected to t=
he system, it
> > > > > > > > > > will receive IDs 16~31.
> > > > > > > > > > Because of this behavior, I switched back to using plat=
form_device->id.
> > > > > > > > >
> > > > > > > > > Each of the devices will probe once.
> > > > > > > > >
> > > > > > > > > The first one will be given 0, the second will be given 1=
, etc.
> > > > > > > > >
> > > > > > > > > Why would you give multiple IDs to a single device bound =
to a driver?
> > > > > > > > >
> > > > > > > >
> > > > > > > > The device exposes multiple peripherals =E2=80=94 16 GPIO c=
ontrollers, 6 I2C
> > > > > > > > adapters, 2 CAN FD controllers, and 2 watchdog timers. Each=
 peripheral
> > > > > > > > is independently addressable, has its own register region, =
and can
> > > > > > > > operate in isolation. The IDs are used to distinguish betwe=
en these
> > > > > > > > instances.
> > > > > > > > For example, the GPIO driver will be probed 16 times, alloc=
ating 16
> > > > > > > > separate gpio_chip instances to control 8 GPIO lines each.
> > > > > > > >
> > > > > > > > If another device binds to this driver, it is expected to e=
xpose
> > > > > > > > peripherals with the same structure and behavior.
> > > > > > >
> > > > > > > I still don't see why having a per-device IDA wouldn't render=
 each
> > > > > > > probed device with its own ID.  Just as you have above.
> > > > > > >
> > > > > >
> > > > > > For example, when the MFD driver and the I2C sub-driver are loa=
ded,
> > > > > > connecting the first NCT6694 USB device to the system results i=
n 6
> > > > > > nct6694-i2c platform devices being created and bound to the
> > > > > > i2c-nct6694 driver. These devices receive IDs 0 through 5 via t=
he IDA.
> > > > > >
> > > > > > However, when a second NCT6694 USB device is connected, its
> > > > > > corresponding nct6694-i2c platform devices receive IDs 6 throug=
h 11 =E2=80=94
> > > > > > instead of 0 through 5 as I originally expected.
> > > > > >
> > > > > > If I've misunderstood something, please feel free to correct me=
. Thank you!
> > > > >
> > > > > In the code above you register 6 I2C devices.  Each device will b=
e
> > > > > assigned a platform ID 0 through 5. The .probe() function in the =
I2C
> > > > > driver will be executed 6 times.  In each of those calls to .prob=
e(),
> > > > > instead of pre-allocating a contiguous assignment of IDs here, yo=
u
> > > > > should be able to use IDA in .probe() to allocate those same devi=
ce IDs
> > > > > 0 through 5.
> > > > >
> > > > > What am I missing here?
> > > > >
> > > >
> > > > You're absolutely right in the scenario where a single NCT6694 devi=
ce
> > > > is present. However, I=E2=80=99m wondering how we should handle the=
 case where
> > > > a second or even third NCT6694 device is bound to the same MFD driv=
er.
> > > > In that situation, the sub-drivers using a static IDA will continue
> > > > allocating increasing IDs, rather than restarting from 0 for each
> > > > device. How should this be handled?
> > >
> > > I'd like to see the implementation of this before advising.
> > >
> > > In such a case, I assume there would be a differentiating factor betw=
een
> > > the two (or three) devices.  You would then use that to decide which =
IDA
> > > would need to be incremented.
> > >
> > > However, Greg is correct.  Hard-coding look-ups for userspace to use
> > > sounds like a terrible idea.
> > >
> >
> > I understand.
> > Do you think it would be better to pass the index via platform_data
> > and use PLATFORM_DEVID_AUTO together with mfd_add_hotplug_devices()
> > instead?
> > For example:
> > struct nct6694_platform_data {
> >     int index;
> > };
> >
> > static struct nct6694_platform_data i2c_data[] =3D {
> >     { .index =3D 0 }, { .index =3D 1 }, { .index =3D 2 }, { .index =3D =
3 }, {
> > .index =3D 4 }, { .index =3D 5 },
> > };
> >
> > static const struct mfd_cell nct6694_devs[] =3D {
> >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[0], sizeof(struct
> > nct6694_platform_data), 0),
> >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[1], sizeof(struct
> > nct6694_platform_data), 0),
> >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[2], sizeof(struct
> > nct6694_platform_data), 0),
> >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[3], sizeof(struct
> > nct6694_platform_data), 0),
> >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[4], sizeof(struct
> > nct6694_platform_data), 0),
> >     MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[5], sizeof(struct
> > nct6694_platform_data), 0),
> > };
> > ...
> > mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
> > ...
>
> No, that's clearly way worse.  =3D:-)
>
> The clean-up that this provides is probably not worth all of this
> discussion.  I _still_ think this enumeration should be done in the
> driver.  But if you really can't make it work, I'll accept the .id
> patch.
>

Okay, I would like to ask for your advice regarding the implementation of I=
DA.

Using a global IDA in the sub-driver like this:
(in i2c-nct6694.c)
static DEFINE_IDA(nct6694_i2c_ida);

static int nct6694_i2c_probe(struct platform_device *pdev)
{
    ida_alloc(&nct6694_i2c_ida, GFP_KERNEL);
    ...
}

causes IDs to be globally incremented across all devices. For example,
the first NCT6694 device gets probed 6 times and receives IDs 0=E2=80=935, =
but
when a second NCT6694 device is added, it receives IDs starting from
6, rather than starting again from 0. This makes per-device ID mapping
unreliable.

To solve this, I believe the right approach is to have each NCT6694
instance maintain its own IDA, managed by the MFD driver's private
data. As mentioned earlier, for example:
(in nct6694.c)
struct nct6694 {
    struct device *dev;
    struct ida i2c_ida;
};

static int nct6694_probe(struct platform_device *pdev)
{
    ...
    ida_init(&nct6694->i2c_ida);
    ...
}

(in i2c-nct6694.c)
static int nct6694_i2c_probe(struct platform_device *pdev)
{
    id =3D ida_alloc(&nct6694->i2c_ida, GFP_KERNEL);
}

This way, each device allocates IDs independently, and each set of
I2C/GPIO instances gets predictable IDs starting from 0 per device. I
think this resolves the original issue without relying on hardcoded
platform IDs.
Please let me know if this implementation aligns with what you had in mind.


Thanks,
Ming


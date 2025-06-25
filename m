Return-Path: <linux-i2c+bounces-11583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F002AE8058
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 12:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45963B6B87
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 10:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EF92D1F40;
	Wed, 25 Jun 2025 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuvgTef4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2882D2389;
	Wed, 25 Jun 2025 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848878; cv=none; b=tQ9P5I9SnWGeNp2GAaejB+mTMf/X3VxA9ZuUUKFXXk1xyYIjfghvOsZs/5bL34B7FCdtIuGtoe7SHJbE0X1sMIm5lDKX4bRx2ysY8IvpVyv0SBkDFCxTFhBIp7icDdD4CzwIAScfzkUA7zMwN3O/BTslKlc6bkH/P+25uBRl0zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848878; c=relaxed/simple;
	bh=1pw+uqroMWF349QulkbaV2L+xoGUQiIDrgQhwjrbgLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6DVZ1tgLPatQ9bmvdRHVOAsyUykXc9I/29LzoUHWA7lPG4crMqXQNupyOHxTlB8SWzMaTQcOpYlaCEEmpueJMb2dcN42x6ssmnHZgh+dxrxhRG3uMF4BG1iWZx2NqX4tTCY9lPR4qBaWIC5DIalE+gXul/qy1xit94LRZLNyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuvgTef4; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso5606420276.2;
        Wed, 25 Jun 2025 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848875; x=1751453675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cilMFj2BlrrsofpUWF0eRD8610fy8kvLozLNgBSSemY=;
        b=KuvgTef4Sem4pyBuzeuGbV+ddyxuQOWsDiMlUbXu0HUcQdy7OG+B9YuRDLn0pcH8bf
         J+OQE+Jqsgkp4UQOD7xVN1eUFqMDQgu/ta1Cjr1vhdtZ5oli3CXf11+OLSM+bSYFTNoI
         4hUAMLRHVYWHKWjyjzuF67esK7aq75b3hOXYwnIftGlTC/ATj01nUoOhCXHRRClcXzuj
         oIKzAWLmoWA3E/R6Aju9NE6WpyzVtBi26Zw4l6QvCw+CTGFxCksyEJlbF+/YZ98ljJ7w
         VR+fXv0nYXJqkFptBOcpSygc+ObtkqDPt2cHZlnmAZPVPNJK4jIsHOulO5xRuJExsXRi
         qvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848875; x=1751453675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cilMFj2BlrrsofpUWF0eRD8610fy8kvLozLNgBSSemY=;
        b=mrKDqHIVdVkR1FkbLM3+r3YyEsLzm7t0WcIzq3YQUiro34Pcwtc8kjTcYhQm5Wv/Sl
         uQtrhadkf4Qtf/ZX34S2htkniE4tBBFUZQJTbFjMY8usovId7t3BKRETvG7gh5ztPKPN
         LcF+yMcLzrnljCT0+MBCgyOPGNUocLhc5IP5SvQRwbhECW3/33QjAYJ3Ozi070zKP3KX
         z+Z6YvOVY4pFdgZknvbrp+43qBrYRlTgIbt/B2npj7vGSEO/lrMfBHBEEWBLy1fjVIce
         wk0YdTg49Q0UCavfRDHGInp1G0jqXfMB0spnUbWD2CktMNCfMXsLuJpPM5MAZ/J0EK1K
         w7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBHJ85O+xBvW6pu0EaTOOu0LeuVZuJHtrOeNu43R2eXKhQnl8RG2db+rrS0csM71NAmoDyi6/Qg+Nv@vger.kernel.org, AJvYcCVBvi1OEgetd9M/VsgcBBYVrZNCJYomCOc2QnJJiyJEoy7lbhB00wt83R/MY8xCfhkn2lxJfeSZm9k=@vger.kernel.org, AJvYcCVKsHjuf3Z8ZzdqV/EW2npVJGbn2Cnmd9JaNhmksHM0cpz4jN2lScn2Y0kJA0JWmlP/quJtz6vGCrp4BfN6xEw=@vger.kernel.org, AJvYcCWdSu82R3PJ0L1TAPIaYqKeHI2DG/8D+Jh81jCgB07grxXzA6JdzZT80aoRZmDUq/XJaSWSQlgBHHmh@vger.kernel.org, AJvYcCX1cUepK3vR5s+CCUTk1H8hQHO2ffqh9eBOAiLGO2D94K1YJn9pKEOTPUUtUyWTAmXhL/Q3yQGXzFcH/YQ=@vger.kernel.org, AJvYcCXc6fPhNXDlCgYaHuq+5xWuOLH8GEHT0D5xHZZlkbMY0J8oMfIhKRXS/Sz2UbN4YGB7hsXWknGVtm1GMA==@vger.kernel.org, AJvYcCXfjJnLQCos9DuPaQY/YUAHQaACR2hDK8lG8X8TQopkmXaFBWcLKUTb/nGPw7XjQCvWI90Jek5exmnn@vger.kernel.org, AJvYcCXhlGAlMvYy6+r9lSEqT0gNNqw0wYGidkJv6qE5CtMxOS9uTSE8JTrv1NT9kTEAtFxNfq/PXVZv@vger.kernel.org, AJvYcCXihyNHvvrBHw59ROpM7XLn3/0YGIiBng8igjW4NHONyaiTbo02vN4Wo0C7iTMY3/WPMU/jI8PxImWk2wXD@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrtGAwjcIWGMqVnCysk3Twd6Ljgq0dudpCSmfE31rfyTKL8R/
	TIq2EMKnNP0PHieep4ERASw7d+nxQ5weHau86YWTTFXVxktV/jixkEo0fMciPy50j0zGjHiPvrU
	waFrG2IaUXznyPMj4A9SLD0AWM8FaSBs=
X-Gm-Gg: ASbGncvkLqNfuPrPaDIoquE4xF72u35Cjqtvwwx01zHy8p3wiprykwkOKUbLRpeU0GE
	x5eFoEFx5Qf0Q/YnHJUaQXC8c/+Ktsb9EnnBQJsyGnfOsOVUcrxbbypbAfIH1/Gdz4R09t7a7cc
	0Zo+Hoi9/uFz1jwTHI2Bk4utfbv2njMkgWWUQ+U2mu7uauHjehnZN39orJ0S5qruKJoXw4ZkmAA
	XDh8A==
X-Google-Smtp-Source: AGHT+IEu+R//w0LIcJJxZLM8KxbNtqpVsxRk+v2CqE6RW+SjfC+UBYI6SfhQaDEj74VCCVaHizUOSlRb/0YomJcnvOo=
X-Received: by 2002:a05:690c:6384:b0:709:197d:5d3c with SMTP id
 00721157ae682-71406cd24f9mr36191427b3.11.1750848875500; Wed, 25 Jun 2025
 03:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612140041.GF381401@google.com> <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
 <20250612152313.GP381401@google.com> <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
 <20250613131133.GR381401@google.com> <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
 <20250619115345.GL587864@google.com> <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
 <20250619152814.GK795775@google.com> <CAOoeyxU7eQneBuxbBqepta29q_OHPzrkN4SKmj6RX72L3Euw5A@mail.gmail.com>
 <20250625090133.GP795775@google.com>
In-Reply-To: <20250625090133.GP795775@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 25 Jun 2025 18:54:20 +0800
X-Gm-Features: Ac12FXyG2HoWaId__CawR23MZ8rb9Qa6uz_UMfhCNFjrCMpzymOvuItjHHgDfoE
Message-ID: <CAOoeyxWoxC-n3JjjFe8Ruq_VydXk=jev=mopKfL5B7gsaSg=Ag@mail.gmail.com>
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

Dear Greg and Lee,

Thank you for your comments.
I've reviewed your suggestions, but would appreciate your feedback on
a few remaining points.

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8825=E6=97=A5 =E9=
=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 20 Jun 2025, Ming Yu wrote:
>
> > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8819=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:28=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Thu, 19 Jun 2025, Ming Yu wrote:
> > >
> > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8819=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:53=E5=AF=AB=E9=81=93=EF=BC=9A
> > > > >
> > > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > > >
> > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8813=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:11=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > > > >
> > > > > > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > > > > > >
> > > > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=
=8812=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:23=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > > > > > > >
> > > > > > > > > On Thu, 12 Jun 2025, Ming Yu wrote:
> > > > > > > > >
> > > > > > > > > > Dear Lee,
> > > > > > > > > >
> > > > > > > > > > Thank you for reviewing,
> > > > > > > > > >
> > > > > > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=
=9C=8812=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > > > > > > > > >
> > > > > > > > > > ...
> > > > > > > > > > > > +static const struct mfd_cell nct6694_devs[] =3D {
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 0),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 1),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 2),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 3),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 4),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 5),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 6),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 7),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 8),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 9),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 10),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 11),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 12),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 13),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 14),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0,=
 15),
> > > > > > > > > > > > +
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, =
0),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, =
1),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, =
2),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, =
3),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, =
4),
> > > > > > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, =
5),
> > > > > > > > > > >
> > > > > > > > > > > Why have we gone back to this silly numbering scheme?
> > > > > > > > > > >
> > > > > > > > > > > What happened to using IDA in the child driver?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > In a previous version, I tried to maintain a static IDA=
 in each
> > > > > > > > > > sub-driver. However, I didn=E2=80=99t consider the case=
 where multiple NCT6694
> > > > > > > > > > devices are bound to the same driver =E2=80=94 in that =
case, the IDs are not
> > > > > > > > > > fixed and become unusable for my purpose.
> > > > > > > > >
> > > > > > > > > Not sure I understand.
> > > > > > > > >
> > > > > > > >
> > > > > > > > As far as I know, if I maintain the IDA in the sub-drivers =
and use
> > > > > > > > multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, =
the first
> > > > > > > > NCT6694 device bound to the GPIO driver will receive IDs 0~=
15.
> > > > > > > > However, when a second NCT6694 device is connected to the s=
ystem, it
> > > > > > > > will receive IDs 16~31.
> > > > > > > > Because of this behavior, I switched back to using platform=
_device->id.
> > > > > > >
> > > > > > > Each of the devices will probe once.
> > > > > > >
> > > > > > > The first one will be given 0, the second will be given 1, et=
c.
> > > > > > >
> > > > > > > Why would you give multiple IDs to a single device bound to a=
 driver?
> > > > > > >
> > > > > >
> > > > > > The device exposes multiple peripherals =E2=80=94 16 GPIO contr=
ollers, 6 I2C
> > > > > > adapters, 2 CAN FD controllers, and 2 watchdog timers. Each per=
ipheral
> > > > > > is independently addressable, has its own register region, and =
can
> > > > > > operate in isolation. The IDs are used to distinguish between t=
hese
> > > > > > instances.
> > > > > > For example, the GPIO driver will be probed 16 times, allocatin=
g 16
> > > > > > separate gpio_chip instances to control 8 GPIO lines each.
> > > > > >
> > > > > > If another device binds to this driver, it is expected to expos=
e
> > > > > > peripherals with the same structure and behavior.
> > > > >
> > > > > I still don't see why having a per-device IDA wouldn't render eac=
h
> > > > > probed device with its own ID.  Just as you have above.
> > > > >
> > > >
> > > > For example, when the MFD driver and the I2C sub-driver are loaded,
> > > > connecting the first NCT6694 USB device to the system results in 6
> > > > nct6694-i2c platform devices being created and bound to the
> > > > i2c-nct6694 driver. These devices receive IDs 0 through 5 via the I=
DA.
> > > >
> > > > However, when a second NCT6694 USB device is connected, its
> > > > corresponding nct6694-i2c platform devices receive IDs 6 through 11=
 =E2=80=94
> > > > instead of 0 through 5 as I originally expected.
> > > >
> > > > If I've misunderstood something, please feel free to correct me. Th=
ank you!
> > >
> > > In the code above you register 6 I2C devices.  Each device will be
> > > assigned a platform ID 0 through 5. The .probe() function in the I2C
> > > driver will be executed 6 times.  In each of those calls to .probe(),
> > > instead of pre-allocating a contiguous assignment of IDs here, you
> > > should be able to use IDA in .probe() to allocate those same device I=
Ds
> > > 0 through 5.
> > >
> > > What am I missing here?
> > >
> >
> > You're absolutely right in the scenario where a single NCT6694 device
> > is present. However, I=E2=80=99m wondering how we should handle the cas=
e where
> > a second or even third NCT6694 device is bound to the same MFD driver.
> > In that situation, the sub-drivers using a static IDA will continue
> > allocating increasing IDs, rather than restarting from 0 for each
> > device. How should this be handled?
>
> I'd like to see the implementation of this before advising.
>
> In such a case, I assume there would be a differentiating factor between
> the two (or three) devices.  You would then use that to decide which IDA
> would need to be incremented.
>
> However, Greg is correct.  Hard-coding look-ups for userspace to use
> sounds like a terrible idea.
>

I understand.
Do you think it would be better to pass the index via platform_data
and use PLATFORM_DEVID_AUTO together with mfd_add_hotplug_devices()
instead?
For example:
struct nct6694_platform_data {
    int index;
};

static struct nct6694_platform_data i2c_data[] =3D {
    { .index =3D 0 }, { .index =3D 1 }, { .index =3D 2 }, { .index =3D 3 },=
 {
.index =3D 4 }, { .index =3D 5 },
};

static const struct mfd_cell nct6694_devs[] =3D {
    MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[0], sizeof(struct
nct6694_platform_data), 0),
    MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[1], sizeof(struct
nct6694_platform_data), 0),
    MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[2], sizeof(struct
nct6694_platform_data), 0),
    MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[3], sizeof(struct
nct6694_platform_data), 0),
    MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[4], sizeof(struct
nct6694_platform_data), 0),
    MFD_CELL_BASIC("nct6694-i2c", NULL, &i2c_data[5], sizeof(struct
nct6694_platform_data), 0),
};
...
mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
...

Thank you again for your support.


Best regards,
Ming


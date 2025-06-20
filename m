Return-Path: <linux-i2c+bounces-11534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1D1AE1165
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 04:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1F64166DF5
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 02:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722741DD9D3;
	Fri, 20 Jun 2025 02:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2hUiqD1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6B1D54F7;
	Fri, 20 Jun 2025 02:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388099; cv=none; b=ogLSgRGAX7EHRxm0Vrs1ZQ//u9vGHQZ3B3/pc+kD0jSNYcwvfbsfrSdmDw613F1IBgYz7dVr7SYSzY0FxqAW3McFGi3zSRAnbYQXXSe+ZUDT/C9pvW7s5+00Y1aQtMcIMyiXSfhHn81LvDPLr9i5bY/FgA2szkbZZVCNsGDRlT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388099; c=relaxed/simple;
	bh=yTftLcaxaoxroo4obRqJKYKCN5x3YoLvapUy9LHGCYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThWYfcWX7Y/4luf/pkORKwJgNQweh3nHd7PT2RdjIn48WOAqDyPN2qaWpUbo1t3wF4JcNIBbrrhmZSJYkPzz+t1eyEF8YfvmDv1Ml1B4JJREdDIO1F5iPPUGQ/+OXyP/tiZGJRYuRVrazLQlCq71un9D3wZSQDYDT569iTdsfJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2hUiqD1; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e3980757bso11729497b3.1;
        Thu, 19 Jun 2025 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750388096; x=1750992896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PL5ZfUXg5yLET4pHMFIAv22Wx0+Nt+MISjgpqe1im+U=;
        b=Y2hUiqD1GJEQWbK8aPA+CsfKmOiFaaZVqrLsSjjGjVzcDXgfAqF5o/kMjoCP4/lrLM
         lFyagcxOnjnpDUOHCX7/yCgPrIj/tDOfLTeoZM10PH6reQOOgb0RO/Y0Fk5VBVX8Psf7
         tFe0JWEKGO/G/jQvuXnCB0yOZCJ/u3e8PTW7KNQLzvRXnmmUgUXxgENATwkjr6axfKLJ
         fmDDsu43xCI0bScuwz5/cWXKWm2svjKgAphtPLh3OlAh/a2vUstUa9uYadULAIx7k05u
         hYVESEIWA12OxMBRR1/p4F4Gxdokrkwn5NQ26HwhZu1xH9NL9W+bqoqHVoXOKTnChrFa
         vHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750388096; x=1750992896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PL5ZfUXg5yLET4pHMFIAv22Wx0+Nt+MISjgpqe1im+U=;
        b=G2UVfhUCqQ+7Xy/N95iVxPLRKyl/padKKAzeueuAI7uhlYclPo2V8JjymiSFdz/u8U
         3JMdykzdCg0jCkpRuWjYNa/MmjT5FiaBusdetfUbrU78RLxOovpU/P1KRFR40f2Fit2W
         nPBbx6wuNHyLKIaN1+RGUA8TZG6m/3QWy8Dp6qvzoGUWMW+F5oO2z2PsXvekR1aD+ShV
         fLgsR/zbe9plRTeQf7ln4raDckYNLoCYCuefmHpd771qT6dgVEhVyPsmgvMtvRLuziet
         VVnctdqTYz9kHILiXzd4npg4CEa3tvEOBxw+MMJuRJQCe+xjw2YhzMM59ZuocHqua+MP
         TVZg==
X-Forwarded-Encrypted: i=1; AJvYcCULTXfVMmUY6HjofCZzXRX9hHJ6uRzmDRaPgEZf+6zOzHoui2WAuEKvenw5yV9goPztYlLCX12ZdUNLsWs=@vger.kernel.org, AJvYcCUOr/GATiFsKRGaVRpLPBnisMhJLDSbozACtkFy3QRchgJ1vBJyZxFRRv+Sd4/t+kiyQtEtxqSZN0gW@vger.kernel.org, AJvYcCUlYeliml7Y5yD0miFij5BF5E/kn3HTEQreS55IecKTG7fuwJ+ZtsVuEORROMs+SBUcCJAMj7DUSbeW@vger.kernel.org, AJvYcCV9reZ07yucwKnHt/yQUA6j+0jTDOK1p1C0CEd6lEK7syv8XGzCWdK5Kqgx7+WKUAVqM25GPdEA/V0=@vger.kernel.org, AJvYcCVFO8SpG345yR9PL3YifnkC7ild9cIJCZZIcPW6kgM4tvkIfhv8U5Y3+XLPKp0IjUbj7C3Y9w4Ta/pJYMV5AiM=@vger.kernel.org, AJvYcCVlPFeMbMQDjGhtMPGBawS7s9Wnnj1ouDyFBkTuBOmhhOeGAZRHtA6qruUGFcqqVtp0pzzo+ddNDqGGmAlv@vger.kernel.org, AJvYcCWmKYjzNrLywr/gsOrIHtlrKGc8YiT/tEd7joHcN1xEf/7w+9diglMVrTJ3MOYc49iaS1LkVix/@vger.kernel.org, AJvYcCXfA1WFyK0PRgNodbZ6WO4QDOwaVVJ80CIf2a/DvxnFZLyNZFsvOsKqjl+5sEZQqxJCZa5Txqb7yj661Q==@vger.kernel.org, AJvYcCXogaanxKMtpVANdRt2ud9ofgRZLL95Z9oNHglL7QEaoCFPPouKn/l4tXy/CLX1QPyrbURhQ1quuMaR@vger.kernel.org
X-Gm-Message-State: AOJu0YxT0X1aRCUCZuhzGol1daTAOPh/5cxv93cNnrvnvQz8OMbMNrbS
	VPGdoMBhSf2Q1ilo03qWDm9Y8kiFM9kAJD58fcoC8v0o0WxmmdarfjyJxN5Sn8TCzllNWgG3t2Y
	vCOKh+ieBzj7URRU5uKszlClKb5qi7Ko=
X-Gm-Gg: ASbGncsC3ci2rLVfPmMdHOowoZutdE0F84K5e1420fQjVFn7u3GZvgScfriyYQlf76T
	542Xy6N77cAO8YkUzuWPR95sU64zOwTF0/pgOkSv2TMyUrjbG8tqFNhEhN4f8inwhGKLTuHPjPu
	f3Myq9mkmM/0YYBm7IjjYf/REgU30XeAGHKDgLrJVr/sDxe+saySbkxuVOulZbVS6Q9qAG/2A9M
	pr0og==
X-Google-Smtp-Source: AGHT+IGOaj/XfTCr9Sxl3v8frQyHM5q4GUw9KJI7wNyCuiixCs4wA+KSCVYIEYO5/2GOKyYczURT3DEa106mX3Ct9pQ=
X-Received: by 2002:a05:690c:9683:b0:6f9:4c00:53ae with SMTP id
 00721157ae682-712ca356122mr8571437b3.8.1750388096062; Thu, 19 Jun 2025
 19:54:56 -0700 (PDT)
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
 <2025061910-skies-outgoing-89cc@gregkh> <644dfd66-ad30-47cb-9ec4-50d9a003433b@roeck-us.net>
 <2025061914-sternum-factoid-4269@gregkh>
In-Reply-To: <2025061914-sternum-factoid-4269@gregkh>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 20 Jun 2025 10:54:44 +0800
X-Gm-Features: AX0GCFvM1po7kadcnzGUSgDruiL08eSqKUPiA5kZyOYEApP7QJqtO3AY5gi443I
Message-ID: <CAOoeyxUcB1xc_kMBADWoV8RnnFJ+uCYa_kJ7_BdyR8W_WZfsAg@mail.gmail.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de, 
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter and Greg,

Thank you for reviewing,

Greg KH <gregkh@linuxfoundation.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8820=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Jun 19, 2025 at 09:58:04AM -0700, Guenter Roeck wrote:
> > On 6/19/25 09:20, Greg KH wrote:
> > > On Fri, Jun 20, 2025 at 12:03:01AM +0800, Ming Yu wrote:
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
> > > What is wrong with increasing ids?  The id value means nothing, they
> > > just have to be unique.
> > >
> >
> > Unless they are used in the client driver as index into an array, as in
> > "this is the Nth instance of this device for this chip". There has to b=
e
> > _some_ means to pass N to the client driver.
>
> Ick, that should just be walking the list of child devices instead, as
> obviously no one is hard coding array sizes for devices these days,
> right?  :)
>
> Anyway, sure, if you _have_ to have a specific id, then use a specific
> id, but really, it should not matter.
>

I need fixed IDs in order to communicate with the sub-devices
correctly. For instance, the I2C driver registers 6 devices, and the
userspace interface needs to know which specific I2C controller (e.g.,
index 0 ~ 5) to target with custom commands. Using fixed IDs allow the
driver to maintain a consistent mapping between device instances and
register sets.

I'm open to better alternatives, but so far, using fixed
platform_device->id has been the most straightforward way to achieve
this.


Best regards,
Ming


Return-Path: <linux-i2c+bounces-11524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75CAE05C7
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 14:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07F613A8ADE
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 12:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A611C23E352;
	Thu, 19 Jun 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA1+jezO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FF422B585;
	Thu, 19 Jun 2025 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335893; cv=none; b=cvuOFfzitfzJlqhADI4LChAT5lJk4JbhMClOffxmaY6e5z0vCY/uY5mDtw3BfJgyLdj097z/7RIjeaf/ys7UeAkkgi+VjXS77sYv/1Asvmm1G2mNrGq92q8M2GQs4Wj/E2l1zsCwSa7M+A9Cann1ncHqBHmv7CA4kzP2Wq9oSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335893; c=relaxed/simple;
	bh=qZsxiaGezis86cieA17Y/fKt4dIFkxKjdwoo/GJS/B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hICQSXLa+RyaJsTsWiET8tM2aM+Sk5P1XN7PL2fb8GLxiUfQ+/+7X1R6VCxt4RSLSW7vkVkzPRq23nv5IQdOZDpfpqhEtQew0Oq9zYxFs5S3dltkUNBp4xUiN3an6BCjfa/RMvdmsppoBiCEAcTNvSxP9Ez3kIpMPqpG7lKW+OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA1+jezO; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e817b40d6e7so671360276.1;
        Thu, 19 Jun 2025 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335891; x=1750940691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfIjkzeS5uAQaFqRZSD5Nbjj7UnUDtMrcP/bB5XepjY=;
        b=BA1+jezOMbUCwexHE0JgyWfrNghz8e9Dl6SYwIWCy4eRPOfur1FwpRo1pUkvOtKOZq
         rWpccD5RyoraVyE1PM/ujN2pqLEmtnKH+THW/QIsJGwRvHKBWm9a8IC51HGri49sm+/7
         XaDH+J/6T7jcETtaeGZK8LOdLICQ+6B818eO4NCQCRk6mz2ih39DIcabKIMLl4IoIiFe
         sTCW6ozS0Fw6zF6iebqYqfqYtEwEe5K2XHaZc+nchVDJDwMwOZ84YDxCvFZBwYcp7hGL
         UqIhDAui9wr98uJwrJyfLsA5uOA7LwjgbFTU9i/a6HDOI7JDONixhxLvIpslgmNNNy5V
         xZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335891; x=1750940691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfIjkzeS5uAQaFqRZSD5Nbjj7UnUDtMrcP/bB5XepjY=;
        b=vi7SdmBl6LeZ2Ht1V1kf4aektYKbeBLStAAD6WsY2yvmvHiJmov+BqHaVS7FlwaNCv
         Mhb/afos27sj4kufs+1HyW07q9dHDetb/XgTIoXN7stFGNbMkAisLokE72G7ud5FRkYq
         iO8T+Md2iPV/FF0/yfuQHn5Rj+F13qnG4NvUKGAjW66Pd0CmGSJIKB1/wryXTbD+lpxn
         9yxHi3Hh5eCJQMcaBBignbT7elgukELTd0+VVRtMyfraz1M7pC/o7ZZyDe/kCiEsPBNS
         XY4CExLqAFj7yjDPjsE6vpIrcPkslYL/A0IcsZbEwIrc58S3jFHA0eEr1C2ihL+mHttg
         48+w==
X-Forwarded-Encrypted: i=1; AJvYcCV3ZxWuBd+nZNYwz2koo3QdYV0FxUfmBoADtKVFwFcWO1chQrPtmyeu8dJZOBllQR+/t1fT4zVblRA=@vger.kernel.org, AJvYcCV9arBdMzFo1Q1p/GvzI4ql6RrBvW7EhI014pQf6+IL8Is2H0FbqywNp1W2pn3ivXN5L0HTVM2N@vger.kernel.org, AJvYcCVHKogPEHeoErMSzWJ953nwpEm4miHmxWKVqjFSAeaWr4kY9iu6uBBvmh/n+gBu6Sy/JhZJTV4HrWoz@vger.kernel.org, AJvYcCVybqz1qgkQKDFkh34/o0Ct2Qe1bRIAXv4GoQxMDS6AyJtlTIZr9S7licXjXjvRwnom+iwK78DVMZYIxi8=@vger.kernel.org, AJvYcCW0aHyVKzPSGD36uTIutIbudDBH6/yVqfrfk9wWmK5pI6QkTsrsgJr5gQFZH+xoj40mF/8y+dY9eWPKzw==@vger.kernel.org, AJvYcCWhco2ZERgtsyBYRq/FzXWr9627MLfBQGbrbbu3yNjmDScelwW7oQAOr9ZhfPbYSI5txFX5TASyreH4SFGzBbM=@vger.kernel.org, AJvYcCWwO7uoBWqXQ6gmbuQdwe4L6fPSZSHImfh7T4WTJ0LC+9cdli85gNai9iUKWYEzoRUJ9Sd7lX121BPT@vger.kernel.org, AJvYcCX+eKK+w3Qqtut8WBD/Hyss1KFLRC2enJnhoKesiOuzY7licXRI8YahG6qNN05agBTXkh9qB3tJPf7oIQWW@vger.kernel.org, AJvYcCXym//a81wt968eFKW8rMACP3GDpPd8jr643xtHDzWBvoSmv4EB9afwlb7XGAJKFTFBb1BNU2CfpbK5@vger.kernel.org
X-Gm-Message-State: AOJu0YwYCX/uZDvMEsMl+9HcRDUXon7d/QPWt/AmXpJKHpoz0c1CJ8cb
	zL5UxIKNX5sNF553hYiZ9doGd4RoAQRHqdz1Hw2qsppL0BcS1r2+Xhry7xwWEYB12qSnYyp5ZmR
	+jkS2Cs8dym15xa1RR1SIN4LzLr3f0I0=
X-Gm-Gg: ASbGncu01etH0Drrqm5lvVkVKKolZirYta0cahGYI2jp98e+Nqh7hJe4f1Wck71wbqx
	EOYf8qGBOVz6tkN34Jxz+sFAPepOWJxoH9b4dl47VHA1sh1Q0qePBFA3VJv5SPHZHTQu084xIc2
	h3xmYZMV1O7R+oXDV4FXTDEuX23WST5dvckxtd7tWd
X-Google-Smtp-Source: AGHT+IFrwD9otqECbrNBOsQXRFU2NGmSUq9gFgMkQWp96Hgd5fWPH44knQmZI54PSfEyYDh53L6rH6/+TelBwsCnliM=
X-Received: by 2002:a05:6902:72a:b0:e84:2160:8d7f with SMTP id
 3f1490d57ef6-e84216090e8mr2096612276.28.1750335890581; Thu, 19 Jun 2025
 05:24:50 -0700 (PDT)
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
 <20250619115345.GL587864@google.com>
In-Reply-To: <20250619115345.GL587864@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 19 Jun 2025 20:24:39 +0800
X-Gm-Features: Ac12FXxSSOxpq61eXW6rD5IBeExIb-GjhAsUxrn9ZuYbm7R1ka7j6QhMD7DeEW4
Message-ID: <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
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
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 13 Jun 2025, Ming Yu wrote:
>
> > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8813=E6=97=A5=
 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:11=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Fri, 13 Jun 2025, Ming Yu wrote:
> > >
> > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:23=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > >
> > > > > On Thu, 12 Jun 2025, Ming Yu wrote:
> > > > >
> > > > > > Dear Lee,
> > > > > >
> > > > > > Thank you for reviewing,
> > > > > >
> > > > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8812=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > > > > >
> > > > > > ...
> > > > > > > > +static const struct mfd_cell nct6694_devs[] =3D {
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > > > > > > +
> > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > > > > > >
> > > > > > > Why have we gone back to this silly numbering scheme?
> > > > > > >
> > > > > > > What happened to using IDA in the child driver?
> > > > > > >
> > > > > >
> > > > > > In a previous version, I tried to maintain a static IDA in each
> > > > > > sub-driver. However, I didn=E2=80=99t consider the case where m=
ultiple NCT6694
> > > > > > devices are bound to the same driver =E2=80=94 in that case, th=
e IDs are not
> > > > > > fixed and become unusable for my purpose.
> > > > >
> > > > > Not sure I understand.
> > > > >
> > > >
> > > > As far as I know, if I maintain the IDA in the sub-drivers and use
> > > > multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the firs=
t
> > > > NCT6694 device bound to the GPIO driver will receive IDs 0~15.
> > > > However, when a second NCT6694 device is connected to the system, i=
t
> > > > will receive IDs 16~31.
> > > > Because of this behavior, I switched back to using platform_device-=
>id.
> > >
> > > Each of the devices will probe once.
> > >
> > > The first one will be given 0, the second will be given 1, etc.
> > >
> > > Why would you give multiple IDs to a single device bound to a driver?
> > >
> >
> > The device exposes multiple peripherals =E2=80=94 16 GPIO controllers, =
6 I2C
> > adapters, 2 CAN FD controllers, and 2 watchdog timers. Each peripheral
> > is independently addressable, has its own register region, and can
> > operate in isolation. The IDs are used to distinguish between these
> > instances.
> > For example, the GPIO driver will be probed 16 times, allocating 16
> > separate gpio_chip instances to control 8 GPIO lines each.
> >
> > If another device binds to this driver, it is expected to expose
> > peripherals with the same structure and behavior.
>
> I still don't see why having a per-device IDA wouldn't render each
> probed device with its own ID.  Just as you have above.
>

For example, when the MFD driver and the I2C sub-driver are loaded,
connecting the first NCT6694 USB device to the system results in 6
nct6694-i2c platform devices being created and bound to the
i2c-nct6694 driver. These devices receive IDs 0 through 5 via the IDA.

However, when a second NCT6694 USB device is connected, its
corresponding nct6694-i2c platform devices receive IDs 6 through 11 =E2=80=
=94
instead of 0 through 5 as I originally expected.

If I've misunderstood something, please feel free to correct me. Thank you!


Sincerely,
Ming


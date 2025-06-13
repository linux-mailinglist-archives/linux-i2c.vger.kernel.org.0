Return-Path: <linux-i2c+bounces-11460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFFDAD90D8
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 17:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92E7A1E3A1B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2499C1E25F9;
	Fri, 13 Jun 2025 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACT9Ctvy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5EC1A5BBD;
	Fri, 13 Jun 2025 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827380; cv=none; b=jlqr1y34+kAX4poxkZHPDI7eUYY7sQqXxtmswshQBlrppz4962D2ckys8wIqhKHuYT7C5IBMRf7cNFmhzIpzk9rYAuC9JHRpiH33NavR5mY++ErdWFv/vEJKD5lGI4mKYxggGwt3JdqDxrNWLqBt4FitEoiDKZG8Ksbv9li7hB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827380; c=relaxed/simple;
	bh=z/B4crK4//VWrh72iGUgU3FOvjCigqNKpzaJajGP9V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMYiq0Znnj1aTgvu2o3JOU+xMD+I6OKGAF/DWO61PoGOQ7Ovmhtn0pgZfGZuc9PBq9gmmKFGwVxqGsRoCEWTogvmOnUI7vnX7OqtOLJuFlOIwfKsreECOWWLfFjoYC7xBFSIie1Xr8wzL+f5uxNMqCef97QFnYEYH+yLdYNBqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACT9Ctvy; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e40e3f316so16288647b3.0;
        Fri, 13 Jun 2025 08:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749827378; x=1750432178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWqMgx2TvmM3ycijogqU+1oUaN+kSDJ1tpwyXgBX/1Q=;
        b=ACT9CtvyPK9T8l9/nDC5wx19mATVqkBZitaPQ7wNcq2THXMTzIiDwGztTvnHomh2R4
         C3Xsg4DgQmnv7RrLOoXUYjvmHXZx/Hj90CltaogJwPSrwpC5s/JRNwTSTqflRuBCX+EW
         7MCcFb3uIaV5iCPTAVIFoPaV2oD7qpavVKYp/Aht5XDHrRhCLzs88Sb3+sCT+mD+wTqB
         FKGNqDvWZfUFVBni35ikQvo8PTftCglZ6DM1xYWHuMNg0JwlDwlINytv5T5J4cZQLMwc
         0NHXY2Z7H+z4Z9cjAXzu23urFbazHLssp2RbgFMbmExFcBEx8OBROAkX7sn54+rAjAd3
         vA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827378; x=1750432178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWqMgx2TvmM3ycijogqU+1oUaN+kSDJ1tpwyXgBX/1Q=;
        b=rWm76/jfrIRtPPXBkEZBD7kirhG+xMRk6X7EcgZ3CFqgbRliFy6e4zNaPrG4pgmlqe
         hPz4ql4wJSHueGsrSUTPt9/QEnrJddVuPqt536qSIQIk9enU8C1XQhnSt+cSqFQkhtUg
         BsSFCT19fCw3i2DNpFVcQN5gDa1youf7kLsE/zVb3KimUWYqmngGdz4UrrwmL/NOUQtS
         zJ2E2xWuGqzopL2zgDHX9YL3NmbCaz0R+8eq4tChU6sGjVw5aYQnhkGnFu14/wmmBnMx
         9T7aQtqvzA71QPeOGRj/NuWiJcm9hsDgMC0o0lXlOs4uw21To+Q62SYPe+2uhAUbJPhp
         3dyw==
X-Forwarded-Encrypted: i=1; AJvYcCU0vnZonVlXO0LHRC6jSz6gYNPqGQytcqrQag2YLBVjclKJuLtPalr+7tDnqgRx1CmQ9cAAfpRpPgyMIA==@vger.kernel.org, AJvYcCUXkFGRSAxO53rVNUZzBO7sIY2qdoy15mt2RQ+bimQMhty4ByqVm2PPPG0N+aZftLWEyxEkknWosl3H/got@vger.kernel.org, AJvYcCUc5Fom9C5tBBdpqR61OYMLqQOqHe+fO2uyPDdHYs8oH3d+liyJp0uLbH5LH/MSTTN1TYTX2jeJwdDtQ7IWGng=@vger.kernel.org, AJvYcCUy6CZH/EzPRXqrLnmwZcURtknqByoNv5gSQ8PvM6ZOM9qH6TuSJUsZzAN80EsTW820db+EDUYy@vger.kernel.org, AJvYcCV2Iv0hjLoVizO4MRuHJ4Lq+DmOL3TLUNaR50K7qRsaqrw44p6hgK5fzcguS2+twUIhoOvb2K8+Gjgf@vger.kernel.org, AJvYcCVdKWgyJY0a8vj68k+NZ+UxCIU0KhZ5MjtFcLStV3Z5hRmONl3QMJ/+M8kk0f6zEzS2w2pt8Waw78M=@vger.kernel.org, AJvYcCXZ8/u9MRKgeh8+RgHjqMFJ1Z242R6eevyM0K8Sg9cpdD+c9rJdZGU04PYonCERdESKqEnw1vOKwYlAvuo=@vger.kernel.org, AJvYcCXc0ZAJxm08X16nAJUFlr0XiZJj4iDskQhX2ax48z4NLNZ0dnw3bd8SS2zxWId+LyCEe7JdiYoxATgA@vger.kernel.org, AJvYcCXoUuvAPGfwwRCfMdLHfmF1QC1xNpmC2RznnRwfW3aQ6IXfg+Is4+WX/OI2GXHdzo+no0mhbJb/ei6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOsNHNGxfAUJhpnBkDUcsUiuW3V7YXy9emSKLzhM1Eoh4zmGk
	aPzFbrFOc8kh+eu7RHv0Wyzz0ssBFP4mVgu5efh5y18SAZzZpNvaL8udlWbnNO+x5UqY43UGRJh
	dHomxiI4LXHx5T0k3Uqby5Qc/C07HkqE=
X-Gm-Gg: ASbGncvvjw2N2zsZL9ipEnakjN9kg6JMtFTcfavfkKre1EIDDYR/6z/6thr8rtsEMxx
	hDfB7LKuD/q4b9AFrw0oocaTATvYjY0Za+BgkGpZjwKo/kIB9X09Dn/dZfPeW3k8RNFHlxv1Mc9
	JOGT0jT/eV3uCi899Z51j76WtiTLOIPM3E3HPsggyguwk=
X-Google-Smtp-Source: AGHT+IFEZW5Zweega7Vs4Va9mvrBEoLdKArCyxKoyJ0+pHn1zEerFQ5BhPKVvvzu3kXh6ZeNdgy1Z3Yu68TbnLlhnSk=
X-Received: by 2002:a05:690c:fcb:b0:70d:f338:8333 with SMTP id
 00721157ae682-7116371fb14mr50260087b3.22.1749827373395; Fri, 13 Jun 2025
 08:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604041418.1188792-1-tmyu0@nuvoton.com> <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <20250612140041.GF381401@google.com> <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
 <20250612152313.GP381401@google.com> <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
 <20250613131133.GR381401@google.com>
In-Reply-To: <20250613131133.GR381401@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 13 Jun 2025 23:09:22 +0800
X-Gm-Features: AX0GCFvsLelkG587zTzgv7nzzjr9mHXHWsTBgmTxfQezIbWJWpZn_6A6aO9a14A
Message-ID: <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
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

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8813=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:11=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 13 Jun 2025, Ming Yu wrote:
>
> > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8812=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:23=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Thu, 12 Jun 2025, Ming Yu wrote:
> > >
> > > > Dear Lee,
> > > >
> > > > Thank you for reviewing,
> > > >
> > > > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > >
> > > > ...
> > > > > > +static const struct mfd_cell nct6694_devs[] =3D {
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > > > > +
> > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > > > >
> > > > > Why have we gone back to this silly numbering scheme?
> > > > >
> > > > > What happened to using IDA in the child driver?
> > > > >
> > > >
> > > > In a previous version, I tried to maintain a static IDA in each
> > > > sub-driver. However, I didn=E2=80=99t consider the case where multi=
ple NCT6694
> > > > devices are bound to the same driver =E2=80=94 in that case, the ID=
s are not
> > > > fixed and become unusable for my purpose.
> > >
> > > Not sure I understand.
> > >
> >
> > As far as I know, if I maintain the IDA in the sub-drivers and use
> > multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the first
> > NCT6694 device bound to the GPIO driver will receive IDs 0~15.
> > However, when a second NCT6694 device is connected to the system, it
> > will receive IDs 16~31.
> > Because of this behavior, I switched back to using platform_device->id.
>
> Each of the devices will probe once.
>
> The first one will be given 0, the second will be given 1, etc.
>
> Why would you give multiple IDs to a single device bound to a driver?
>

The device exposes multiple peripherals =E2=80=94 16 GPIO controllers, 6 I2=
C
adapters, 2 CAN FD controllers, and 2 watchdog timers. Each peripheral
is independently addressable, has its own register region, and can
operate in isolation. The IDs are used to distinguish between these
instances.
For example, the GPIO driver will be probed 16 times, allocating 16
separate gpio_chip instances to control 8 GPIO lines each.

If another device binds to this driver, it is expected to expose
peripherals with the same structure and behavior.


Thanks,
Ming


Return-Path: <linux-i2c+bounces-11399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23966AD809C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 03:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D265F1E2F79
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 01:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E1B1E0DD8;
	Fri, 13 Jun 2025 01:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkuHUGsn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B8C13C9D4;
	Fri, 13 Jun 2025 01:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779711; cv=none; b=A0guletBgi5stjs8Goz+l/NeEMcFHH2fQf1WcUbSfPYs2iqeUL0fJDbv+Yj0//60B3smOfL+vLwJ8JLVkrcUlfV6/+qZCVh1YCq5yUD0CSFRNe/LcB5T5hksG6Gee2iU1G1bGlkuNLXKlvuQNILHCTV9mE6vzjq+UopInIrWJMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779711; c=relaxed/simple;
	bh=rCdKrK6gJ/e8YxnkxVovavsWLwaBZejD5B7IvnTP7CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzSpJQrQEIksb2KuqkcFpdcGaQ8fYC3JcjARSX9Kx9uZgAtSQGInPYe61Bpfx0ZH+/0gI9YO2kaFF7KyP19LeDFscoAs2C7uD9veGSIh/XFEUXRVW2sDv8vpEmHdcCivGFSQRAavsZIZAP37Ejj2hAobnMl4aK1wjE6qPsiKt5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkuHUGsn; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e75668006b9so1667178276.3;
        Thu, 12 Jun 2025 18:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749779709; x=1750384509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06ajxX2TNlIzX7ObIwY55/RYqge10Y8dd0yMk2LIygM=;
        b=LkuHUGsnuNNbElpKo5hjZtJ0ywzkBHQl/V+Xu5rHft9zp5lYDtTTRR2tR416zgfUJq
         AengLFH0aqLj6XMqnHtKtFub1W6eoVztl6XaK9xxieUMC5Jel5d8BsFSGldgzUHlDy0x
         tgM3EF2mf6nMWEUQYhfWxRV0ZAgu0UH0+8XqhUBoWopdegmwRoigc4kX+Gaity7UGk0Q
         NI/AuTs4Aq+nTbvE08ExLIWFVDmkTRlRkvI+kWWOK1nBJiT5rtWrH8vOuVUgDvlMGiJ3
         G9cZtqoQ7DN9zWjIwno5Gzb/0qE48/xPw2lDS7AcEofGG1ZpG5X4EnKcGFxpZ+zoHjdT
         1IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749779709; x=1750384509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06ajxX2TNlIzX7ObIwY55/RYqge10Y8dd0yMk2LIygM=;
        b=g5TJboYpoBFdTNjdvOlg6D9BEosDZa+kMGk+0weh3m8KBFfjgbRDexrseTSrq/YJuP
         bVqGzw/Ccm6TnHdrW6jIIlOBL3FEt7fHDTpsT//ZDJxXlnKUx85J5TnsmklFQex9O5Nl
         ygskgExRlSCPCud6fi1NHX/y27LIba7TShJ0AIWlWz7Zuzx4RfeOmiTaq7bGPXlOY2W5
         YjIcPSypEAliJF6IDhfe2XDKGQnrHWeLA6kSaNaqzVTYDrPDwsqbNBRbvxO27H9Wkjyq
         gc+aeLxhYofvyOdK0qrJLCoNFNwsKjbe4CVEkuaj0cPhBEOM5MfE7lW0NKTXLuZXS7T8
         JOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQLOmqQKHJ+9EI1kF97L2e5WCYd7inSlAYclvTnk+sYcaIFg75raKhBDaS3weVttoBc4M/6qyFjU7ieSFjsbA=@vger.kernel.org, AJvYcCUmGn23m1MuHcZcufJzQ+GozG5rDttA9VqTNdlGQwx9792ZlqDJ/XbDH+MVmr5eUkOgsJ2pwNgDUZZMEw==@vger.kernel.org, AJvYcCUq2c4nnt7c9h118ZPGgupSlt53cMNlGfnrEbQ8vJD5waTWp7BkwQ76AYFbkTHk2kM8tTMPHE6rPAPAXBE=@vger.kernel.org, AJvYcCVxotwpZxkFfJ52KVR47F6nMPxhgBW2I97fGDlrgyT+b9EhkVVcM+avoLX313ymiqlHkJ57PlQNrT8Z@vger.kernel.org, AJvYcCWULLaczJWmQ0VGuvSrmTURl1L6FpuTNVVfSAex+yHElLO66MuGuo0dr9KvMdmHM2yYuLhHl8uAKcdU@vger.kernel.org, AJvYcCWXICN2lZsX8GemsEGbRPIyXNHHKCH97hoCcB/bXJrrmQOs1V4RzrQ/ZuPpIl346V5ozUTjWMPmshbA@vger.kernel.org, AJvYcCWlRqmos7XvSnA/mXHQP1Bh9THEX4udSl6hcQhlg4GUVEysVYW9vYJQ3AEIdQ7RHJJZyzuS5rCSPYM=@vger.kernel.org, AJvYcCXRsnx3cgt0XLdUFIiTinzCj02kQxIuYwGUfSX5anMwCiYKlh0+77GB0rtTSvOGFxZnyXhaERMRKHH1/MEC@vger.kernel.org, AJvYcCXnmKu9YS2FSD+AJHKS/eBBT/bV4Vl9ia+Jff0x6No2IuFWg6kg/BtuW/38z+P4HwXjtD6brRAE@vger.kernel.org
X-Gm-Message-State: AOJu0YyBx/nR8qIp4wX7vRxcElysYkZJgIfGL20Ym6mXj1RRSOOF2+wq
	DjdNfAjE0NMbo7TnQxrlTnSQo634ifChBWbUFUHEq0oGJZVx7gH4/acNotxCw9wDlTD55d1j+nZ
	vHAENsqcw1+T7slFOGCSyl8alHiZd5+c=
X-Gm-Gg: ASbGncvDtYIbonx1lW0WFv4PEKsOHMcm1Y15yTx58OooEwhBbCLFLuE3H3qbHX6qtF4
	WQ6fJCq/pqH4t8UDu32yQc3EQnsnjjCB1oiTqbCJDa2odvKQ4gyvx/Wl82UpQobt5ZgPPD9QuBx
	cMIhJJZsOP00B3hR3EpBBTikML+9waoDSanTSa+IY8YNoiaoOjJXwqXRrdJgFA4NZ/3UxTt8uRJ
	a9p
X-Google-Smtp-Source: AGHT+IEwtTMIgnW9cREhPY1t6TwmH5URxj0k01buMuGSLF64DQ1cKYYmL5ADjjBfdKxhOg26PxHaWRdo1T9o8K3ogLo=
X-Received: by 2002:a05:6902:2846:b0:e80:cff4:5d1f with SMTP id
 3f1490d57ef6-e821c3260admr1744635276.33.1749779708953; Thu, 12 Jun 2025
 18:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604041418.1188792-1-tmyu0@nuvoton.com> <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <20250612140041.GF381401@google.com> <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
 <20250612152313.GP381401@google.com>
In-Reply-To: <20250612152313.GP381401@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 13 Jun 2025 09:54:56 +0800
X-Gm-Features: AX0GCFuXplAsq4dFkQn8MRsErKaATzN_Jh0hZNplX5q_WEulmLSOivK-kFfFh9w
Message-ID: <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
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

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8812=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:23=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 12 Jun 2025, Ming Yu wrote:
>
> > Dear Lee,
> >
> > Thank you for reviewing,
> >
> > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8812=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > ...
> > > > +static const struct mfd_cell nct6694_devs[] =3D {
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > > +
> > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > >
> > > Why have we gone back to this silly numbering scheme?
> > >
> > > What happened to using IDA in the child driver?
> > >
> >
> > In a previous version, I tried to maintain a static IDA in each
> > sub-driver. However, I didn=E2=80=99t consider the case where multiple =
NCT6694
> > devices are bound to the same driver =E2=80=94 in that case, the IDs ar=
e not
> > fixed and become unusable for my purpose.
>
> Not sure I understand.
>

As far as I know, if I maintain the IDA in the sub-drivers and use
multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the first
NCT6694 device bound to the GPIO driver will receive IDs 0~15.
However, when a second NCT6694 device is connected to the system, it
will receive IDs 16~31.
Because of this behavior, I switched back to using platform_device->id.

> > I=E2=80=99ve since realized that using pdev->id avoids the need for cel=
l->id,
> > so I reverted to the earlier approach.
> >
> > That said, do you think it would be a better solution to manage all
> > the IDAs centrally within the driver? For example:
> > in nct6694.c
> > struct nct6694 {
> >     struct device *dev;
> >
> >     struct ida gpio_ida;
> >     struct ida i2c_ida;
> >     struct ida can_ida;
> >     struct ida wdt_ida;
> > };
> >
> > static int nct6694_probe(struct platform_device *pdev)
> > {
> >     ida_init(&nct6694->gpio_ida);
> >     ...
> > }
> >
> > in gpio-nct6694.c
> > static int nct6694_gpio_probe(struct platform_device *pdev)
> > {
> >     id =3D ida_alloc(&nct6694->gpio_ida, GFP_KERNEL);
> > }
>
> No that would be way worse.
>


Thanks,
Ming


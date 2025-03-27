Return-Path: <linux-i2c+bounces-10047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D13B9A729E0
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 06:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30643B281E
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 05:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A53F1C1F0D;
	Thu, 27 Mar 2025 05:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aM5DG74t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620AF1FAA;
	Thu, 27 Mar 2025 05:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743053473; cv=none; b=rKOgFJmd0WOLqkl9LncPPjch/YGTe3ZZkzFDzgkq8AwJ2NqEHs6H9GYKQ0MkfI9UNmz5/O1Z7mMNSnozqFt1FF43HX2WIpnzAeZHAh71I+5af+MRpXkTrKsZukY7z6UvQP2EF3i2VNi4jqZTPBTqhgAh1+UHG0CvoUq0mWvwy3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743053473; c=relaxed/simple;
	bh=zlEk+nM0KMjO6BK5HgI9naEyY/gzus1ziRhcIU4nxZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBpb2Jnq5Z0GmcJZvKmUGHzeqZCb+r6Ln3Q3Ccw2emsZro52XzGgFP5UfLVeVg0VIzmYS0xj6DOKHcbyt2AZ/aNkmyClNxtWd0qXkeon1kX3IkYwMKdBh9TIf8LRdeDpb+0E5nCIr/djw9a9jiaxkrmW6TR2SHiZYwPSKyl8uyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aM5DG74t; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so575959276.3;
        Wed, 26 Mar 2025 22:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743053470; x=1743658270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anfb6aMXjqKoh0pdnMJlZSbWmygDUF0+cL+VQ4pLtcU=;
        b=aM5DG74tguKzfzyrCO/mAYlqKl1DHMbLm9KIauxGfOyYan2M5OLMGc1kcAKmNnObnJ
         AGybSr4/CwF8Px7zSXjZA/wrq1YZiqEcNJMgYSoRKCehVl6Hb+vD6G5ydyEi9zhGXun1
         wZCo1BrOfNKzERACFA3TWDY55Hvby2AwnFfOXI6zBkRT3UOLg8VCJdMEIMmNjy49Pr+8
         kpo6tGqLHkyBNF9p50SpjzTukGERoU/OhoHOl55d2VZqynfi6yxkT0OS1rFBU2SN7EfA
         lo+KGHps9ZEA8avhfxcfZQsKrsbAn579UtcGPF6AajjTFmd6ok4CHVWMZnom3h2FewlP
         YUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743053470; x=1743658270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anfb6aMXjqKoh0pdnMJlZSbWmygDUF0+cL+VQ4pLtcU=;
        b=C/zMnfgMSJ02W5eg1tG9DF0+jfUF1gqts5fmxBEUYJW03UKp7avMEjOeSDIS53m9Qs
         9PA8ZAWYm5pJUuGzh75Mah74IkbblgLuzEbjuM5Pq/WgDewuk/JNlhHmn3QQmco01MGH
         ltf8ibVS1sP0Nb5P3HGdnZr88WJSJcPhtMgKbZ8OX1SWE1C/bPzpggGx7iIalZvjuAKR
         Au8tfsczOFUuCTnQexhVpkA76Bu3Ny2kJCqqnxr0GcKK1aYGFu2zVoq6URl17s8qMtXu
         mxBgKudabl+gw5+kwW0zVgn8LC42dHBd+KrJCBbFR+DmPmWKtNZrMVr6xiI9+QaWTzO7
         0DKw==
X-Forwarded-Encrypted: i=1; AJvYcCUOsdeYE2jDwlzaSLDPcmzRWpaxVehk5uqqqO1wa354U8plg3IqREI3Pw3CFr4NKyYdmVfGlgUJ@vger.kernel.org, AJvYcCUQotam4WAW87Z8UjCuN6M6RMXQaACqL+FbplQZ0DwgXPI7rHQYyZmdGjsAeL7fBdV70u2NFV6Clz3bkg==@vger.kernel.org, AJvYcCUh8ysWaPMYC2luAGekXx1bQh2cSQmJ9EstCFCEDCHSlYV1RadQgxefzvs6voSMkTzzDdFeS/5LMa5Uvi8zGng=@vger.kernel.org, AJvYcCV2z1SiL6/vvrUd/M6ySS0UcVJSzyaJ9m9alQJYdlx+Aw103KTXCzIzpgcd7RoIqhCJSOQv062c0E1C@vger.kernel.org, AJvYcCVdutZ8a/pkOUqghMmE4J4BLUP4cBUeoJuldrG4DJKBpZhAsqA0BkRh69ZMfZhQP7ov2kPzQfqNmScbaDw=@vger.kernel.org, AJvYcCVgNGVnlaocNeaUl7W8JRK0qrFTUCtJfhI6rqeGpUOBVkdgOAhv4gMCkhTe98P9qCxkPvb02PDhrV25ojTl@vger.kernel.org, AJvYcCVmUBH0IUu3MVZ6Ho9ama/4sxtkAEIOiEsoFj8XxnPuHOjHgY9+z423c8qDOzeLdKgeERwIptKni+Na@vger.kernel.org, AJvYcCWB9mhtKNun+IYls/751oYfkpfpd3S37cf+tA3LeTcAm/fnfgWH88JpR03aQkNyqVAv1xtWSGou2OU+@vger.kernel.org, AJvYcCWy/yWXkXuf+jeVIIn0GOb1Mw2BYbKC4lAwHEBtek+bcb8/urhSo9ANmgR2HefAU//BxdQSs1C10nM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjN8MLGqoQnGTaTvB/oysDICluavSvCQKyHESMgEeFPAKPYmO
	jBFM+H0cPPKVbK5Xq23evHBfgMEp5utAan0IdX3b0KYqgLwzqxPYQeffdWldjf48+apfABtw/5K
	3oeiOifqqJSG2MWA6N5Yt2CoVs+I=
X-Gm-Gg: ASbGnctZzRiL9RK44M85beDtezxhDj/3oj2tybRswKHY5IMKlRBMR1xrHRKPLSzrAeX
	OuGxIxuDe1APs5EZVOoyaQGJ29JioKShPiMNmaFkbEaRUb6jHl0j8oBHUpq4l3UpOy6uYT8eRyw
	LlTzgexkKOcWIPxSDJ6VcvFN+V747OVpuKiQO2VedRg6yGLaBp45r+wH572w1K
X-Google-Smtp-Source: AGHT+IHsm/5tNxOhtqTseSel8U8cDVO7gbZGGe5VA4fyssBkjWJmJDSWCPGOq5ql1afQV4+vF574tKYXoEFyQTgNfCA=
X-Received: by 2002:a05:6902:260e:b0:e5a:e39d:c2ad with SMTP id
 3f1490d57ef6-e69430b9e5emr3350436276.0.1743053470043; Wed, 26 Mar 2025
 22:31:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com> <20250317-outrageous-helpful-agama-39476f-mkl@pengutronix.de>
 <CAOoeyxVF9baa8UKJKWcbTLzvMo3Ma=GRCbdnBSoGOw0Lk5j4sA@mail.gmail.com> <20250326-utopian-mega-scallop-5f6899-mkl@pengutronix.de>
In-Reply-To: <20250326-utopian-mega-scallop-5f6899-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 27 Mar 2025 13:30:58 +0800
X-Gm-Features: AQ5f1JpwYaYKq-V3JQ6MJSoAPPPQl8Dr7KjIQEXlTvSTgSXvEJFYfp0Qb4l0Dhw
Message-ID: <CAOoeyxUvoYsKpLMY6OU+Eo_4=Ka+au7e_awA4yVKswwtaDp6NQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=8827=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:35=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > > > +static int nct6694_can_start(struct net_device *ndev)
> > > > +{
> > > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittimin=
g;
> > > > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > > > +     struct nct6694_can_setting *setting __free(kfree) =3D NULL;
> > > > +     const struct nct6694_cmd_header cmd_hd =3D {
> > > > +             .mod =3D NCT6694_CAN_MOD,
> > > > +             .cmd =3D NCT6694_CAN_SETTING,
> > > > +             .sel =3D ndev->dev_port,
> > > > +             .len =3D cpu_to_le16(sizeof(*setting))
> > > > +     };
> > > > +     int ret;
> > > > +
> > > > +     setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> > > > +     if (!setting)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> > > > +     setting->dbr =3D cpu_to_le32(d_bt->bitrate);
> > >
> > > I just noticed one thing that needs clarification/documentation.
> > >
> > > You have nct6694_can_bittiming_nominal_const and
> > > nct6694_can_bittiming_data_const, but only pass the bit rates to your
> > > device.
> > >
> > > Do the bit timing const really reflect the HW limitations of your
> > > device?
> > >
> > > Are you sure your device uses the same algorithm as the kernel and
> > > calculates the same bit timing parameters as the kernel, so that the
> > > values given to the user space reflects the bit timing parameter chos=
en
> > > by your device?
> > >
> >
> > Originally, I only intended to provide NBR and DBR for user
> > configuration. In the next patch, I will add code to configure
> > NBTP(Nominal Bit Timing Prescaler) and DBTP(Data Bit Timing Prescaler)
> > based on the setting of nct6694_can_bittiming_nominal_const and
> > nct6694_can_bittiming_data_const.
>
> Sounds good, but this doesn't answer my questions:
>
> You have nct6694_can_bittiming_nominal_const and
> nct6694_can_bittiming_data_const, but only pass the bit rates and the
> prescaler to your device.
>

I understand.
The prescaler field is used to calculate sjw, brp, prop_seg,
phase_seg1 and phase_seg2. I will update the code in the next patch.


Thanks,
Ming


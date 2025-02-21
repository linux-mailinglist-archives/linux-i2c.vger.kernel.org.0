Return-Path: <linux-i2c+bounces-9518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4FA3EDD0
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 09:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 801ED42060A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 08:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9371FFC5B;
	Fri, 21 Feb 2025 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV5vmAIt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220B1F9F51;
	Fri, 21 Feb 2025 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740124881; cv=none; b=PFgWTSvrtQnPDCKF3Je13Txxucgb/D40U6ounlbiDmOsHxkavM509gpIMeJpW3ddxs3aBbnOkzxtyfx44ZrvEUuaXacCH9yUe5bzscrKHKpav8610+GdfEn65hcfqrWz01uQsqRx3YehEdZ6fQr4jB+yBiCltMVUT2cxe2v/eXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740124881; c=relaxed/simple;
	bh=Cv63BOL0oXO2PSjObiOHehq4Wn7S94yEUznizEi8GVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwAyfRInw7H2CKO9tUlWgwQHZj0et8b+MgDzjTFdx099SU39qn5WDn6jGVJBWd6l/2/GHY9Wcu+ndYYGmCt7uinJ0l6gGnIuY55hJy/LLSe/zb+K8M8e0Ta6RMwlsjXIhHU9VVSWNQHTmyUIxUsLD1TJ38PiRD7TXaMvhmvHNVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV5vmAIt; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6fbaa0582a6so20234287b3.1;
        Fri, 21 Feb 2025 00:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740124878; x=1740729678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lnr4Q3hoke2m4tnAyS/TN9K+Km6DFm15j9BEpxBS0+k=;
        b=LV5vmAItmxOYlCn8SVPG7QTr32biEfRDkmitXwY+Wx+bWqRTi+t4/IF4cOS4q93c6R
         HZqRuLtjHkHVUuVnWP8AvgQXtC/MHiRBc0MAXhZEYlTvHts1rZA9j/XWzL9E/IOtJADj
         LROTiuCmwbVnvlFUsmWabwXy8Hl1HJFFD60t3q3JnRg7Rst+8jeuv1n4Dm8INbPldiEs
         wC5TTkOBOVJ3ST7pgSXpf4kYByfE9cabGAu6EvO5mzyQEAabEkoIpmypH9ep66W2S6QH
         yeAH5yPSd3IS4z4goBJpXUSRDignJDOr0jaXyXnw3VG6yBa2kJj0SfvtaumgQ16XV/ZW
         Edbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740124878; x=1740729678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lnr4Q3hoke2m4tnAyS/TN9K+Km6DFm15j9BEpxBS0+k=;
        b=bmmyLU2TMEJsSyaXM+mgPqa104z8GiWbXshWE1tQg7uRohUa6+scwNWBhNhKRY+XwL
         8JvrKylOaliry+rjA832LSY3w+qv3fndgMtx3Uv0YOkIkxircU4nnBV1Zae+Yz1evhh0
         6vsp80lwIyDlh4kgzbIkN4sZFFCsTVyjwxe/ry0Qec3n8MvpkVxuONJitDlb7kXqWIqS
         X/V2WE8FPie7SZJ65Qi1CBzpd/R00d+W+pO+H9Z7ke33AYl/TiMcRZ3ClV/+x75iZpdG
         RXOZTAevqKUG5nWNGd0YmHrg8tnBh1RGMk3H37IICbiwT1cs7QA8pmYkDctF2AO5s3ZG
         PLlA==
X-Forwarded-Encrypted: i=1; AJvYcCU/xG9L1RouU7eXDxJAbOSduimktN8t0gQiuyzQRYJtWt5y9M8sXMj3E81CyzbLkw95AffL88eL3qQ=@vger.kernel.org, AJvYcCUW0L2/3EsQxmKGmeXERmiXqKxqugxM3mJcPtfGgGzgiEi5aixi5RbVHdndtcUtWJXFMcVKdXPP+kI0dmne@vger.kernel.org, AJvYcCUsCDOH+zDVzB/NkZ7Y69bMz0dee3sbYHmLZtTviW37ntMh3oaxzLt6T2Hv1BwFkcA7J6owWVo3tSzC@vger.kernel.org, AJvYcCVBypgIMU4Mxp/QHC3HMI28XoIEeP32AftPL7mj8wUJB3N/6QwNTFENuB1yaKn1tJmBU9nZZMNI7prXjM78DOE=@vger.kernel.org, AJvYcCVHk6mn1uWmaM7W/PxxXccpyk2hsSyAtoFcKQjNMyXjQs+lLwTgAsZ43vRcN8w9NJSPxEG4J76z1l4a@vger.kernel.org, AJvYcCVsVFJ0ZMBuTFZT9mnRUBaTaeqk3Qh1yx6BtxTLnyNu93husohRLr4sXazkjCAU5prJbYQGoR4/LFq8yQ0=@vger.kernel.org, AJvYcCWlddh3zpKRqP2anELRQFFqbWS6LzuJlydZQOs/VRcxj9NKOt8uE/mVXI4g2TJhbO8DsT5NnETis+bn@vger.kernel.org, AJvYcCXCTKzcvZIniRv10JA0bXn/wWzsFumSGnW7pzMG9wiOj+uK5j0q2nuNDyeZotvxqFE3GLad6g41@vger.kernel.org, AJvYcCXFgXDEhox5VjJHINXw1zajj4FZSeUF06EjLumeCDzfj7NNI9U5SXMePd6saW/D9qabSWLiR78jIMSRew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Pkw04teTnejET5fVKAF0vR6ywBLo/BSAZwU3NjUH4VFgvB3I
	trmw45tQFSfDN2+ZIMIuujGZeYoFiOxl1ktU4JgS/lydAL51QCaDnWCpPXbJ1PC9EjtWlvxkdwy
	o05KNvT+OLu3F0NVxHgK4nw73eAg=
X-Gm-Gg: ASbGncvSCLbCx/pXbli4eLGQXw2sr+VOj+MQiiirqsOSAVyFiLJESlx24Ul8I/bIiqc
	FpLOfeoTNzTBcgcJiuSIwDIXfmXQqv8dWUmlGdAWYT4QIE2GNX4xz4F/Ei9LwNebsxNO4doPwul
	Tm1ezXTpVqiS9lJqRbbvxRnQQFpK3yOtTa0l6QaqrPeA==
X-Google-Smtp-Source: AGHT+IGjrdbl08X5Oz0gLPvhnZB5+e3gwUES5DRUa5Evh0AA8SRQbyVbsNbVNB80eiomx273zv7MffadhbF1WlGd9C0=
X-Received: by 2002:a05:690c:290a:b0:6f9:e4e1:a86 with SMTP id
 00721157ae682-6fbb79d3ddcmr48861797b3.16.1740124878197; Fri, 21 Feb 2025
 00:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com> <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
In-Reply-To: <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 21 Feb 2025 16:01:07 +0800
X-Gm-Features: AWEUYZnurECAKh5ePECj3FH2D5NBztBMPIKD6SuOIyQk1k2iVir6-g3FRFc4M3o
Message-ID: <CAOoeyxX4guHzUap1ieQ_L3PrvpBAYbMiQKrb6ko=MGsF5RcXLg@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
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

Hi Marc,

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B42=E6=9C=887=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:15=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > +static irqreturn_t nct6694_can_irq(int irq, void *data)
> > +{
> > +     struct net_device *ndev =3D data;
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_event *evt =3D priv->event;
> > +     struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_EVENT,
> > +             .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, NCT6694_CAN=
_EVENT_MASK),
> > +             .len =3D cpu_to_le16(sizeof(priv->event))
> > +     };
> > +     irqreturn_t handled =3D IRQ_NONE;
> > +     int can_idx =3D priv->can_idx;
> > +     int ret;
>
> it would make sense to have a event pointer here instead of the can_idx?
>
>         const struct nct6694_can_event *event =3D &priv->event[priv->can_=
idx];
>
The CAN Event command always returns 16bytes: the first 8 bytes
correspond to the CAN0 event, and the last 8 bytes correspond to the
CAN1 event. Therefore, the event pointer here refers to both event
buffers.

Thanks,
Ming


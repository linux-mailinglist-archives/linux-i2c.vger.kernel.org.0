Return-Path: <linux-i2c+bounces-7626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93389B29C0
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CD9E283FD0
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E071DDC06;
	Mon, 28 Oct 2024 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0xJh34m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14C6191F68;
	Mon, 28 Oct 2024 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102294; cv=none; b=a7rT8/CGdCxtGQbjIqQsTjAhj49VQVBPcGcVbw3uiYGpOqkoZMCBZT+RbUGOhkAbpriXKeVH4trOGv1eEG9/MLX9AmYKjIqM5rP0VlzPtF+pF70XRKmvJVeplsCipzmrWnOGPoLilSWSzDsq9pL9CrIF+MwIveOwmEoN03LsRt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102294; c=relaxed/simple;
	bh=uziGmxV5MyzvUGsOOYFYYKEqqnkYMob1eAun868YcjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbElWw9SQJL6yn/2YEybgGdn0cRigwCSDU07Sb27bmdD6G0teAwLE4Mn2siCTIIxVMwn5N3TA3AJk4gc8otXj0W3rtQSmiNf/ZS7PvViJ13yhtaEsNHyiRyAQej5hYZ6N//f+Eczi0O03Cb/AkSnrBV8bxL7KFC2w8qJ6VSn2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0xJh34m; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e309d50f194so690032276.3;
        Mon, 28 Oct 2024 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730102291; x=1730707091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y07gSTup1Q3PvRPgeyq3O+ZUa37sVejuXcRkYCy/Ek=;
        b=P0xJh34mfK6ptjRNFhfJ7SsxCg3VBUu0d8/NXTaLgxZY/Jpxq4VxSWsB72JBvp29Vs
         C9tDFCgASsCCBVC/V5gQSi5EVzOXCEd5M0Gei6A8bLcyMKLZS90946Tol2qGExE9/P2c
         MXFjkdUrlFX05S7J65utmdgfI9jMSAcYaEzfDyxzU/fw7+hBBbHtwj+z4cS18FQ85oRU
         anVsLIFPWS/MwF1NPgS8muT7awL9lvqh5W6tx0VWl+RiO1ptNCPJ6I6sVuOeO4N3Ac7m
         v858v4HFtOSdEdrIPqwUVGIi13gzsVj55xtx15AAZTnWxXYOeGVhhxbQ+m1jTQav2XWR
         96pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730102291; x=1730707091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y07gSTup1Q3PvRPgeyq3O+ZUa37sVejuXcRkYCy/Ek=;
        b=TWcZFbsT9J1LqKav6JCj9giD+ZhWxiyRi4wCkkczTSsbF1YRDvy49sxY+Q8ctpfm9v
         DAjSZYPJl6Gqw+xXhZvMHrZcIWu13isnM1L5qg7zaW2MW+C8L31euc1Pe+xJ0bYToVaR
         8bVenEnpwz53/TSwZL/qp4CR7q1X07EcvgJ5PAMtiJTECs6+rW7dtpQtTN0ZbE4K6h/q
         hXMCcQ1vBGyzBpExhkaVMCDj6fgfW3pbEesSj979KBp5ILcS4ob3sOfDXiNxJkxPIUA0
         c+OEVOxiTXtVkBppGHnEVBrDhMdvklKdRiJ+wR5des0/RqfxiRGmSNP1jCH56HYDMNeV
         VOSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDyMoiV3eqlWZIs2y3kCgsTIsYO0gOPhKp/9r8P1uMCmTJbxO3XJz2QSuf9e5uYeHicnh7TG8jSnE=@vger.kernel.org, AJvYcCUUZ0s2trpZKJgfwD7SQt6VwQevAqbS3762FKum3KnbRUu5cj79Q0Y09pJXsJ63+/ympJvp+dZlxE4B@vger.kernel.org, AJvYcCUl+MDfY70lzfIYE1nfDy16UH5vjKxWJcUzTqMq+j1R0+9q4bBn99N7KjwZn5bE7ZGsxcP7ibli9udY@vger.kernel.org, AJvYcCV1pz1B8jf2LBUf62xHP4xGn46YuYyncn4BDRvaGfk2yXks/1DzyzPZ/C6xMpcBwWGHtqzJbALSH1CA@vger.kernel.org, AJvYcCVCCqmsNjiBEtbWWgPJnMjK0L0R1I+J3DpZO81AY3/SERcGK3ch5FRTuuol5vnOvWMnfRyJrEMrmMB/CQ==@vger.kernel.org, AJvYcCVKdC/BYGkpRUB28QWaMBdTCdF7c+XoxwPl7fKnQs4h5/4h/OB3bp98zVds1qPVHRFLMyIE7naYK6IYWJ8=@vger.kernel.org, AJvYcCVQnimNup4YnsCbf94mMgGkQei366uGXMnBfDnfQUz/m08ImJFSV5qzYaRSCVqD+7Y6LHpMlsOat+ceOlEG@vger.kernel.org, AJvYcCX4bhuun/qoeGiJ/yadRtqy1EUHC2DrH7VjHnwHbpbSQbNwgjYE4GWDccA+9yCEy/Dt1TqRB4y3YMpO5P3qWds=@vger.kernel.org, AJvYcCXNCk2+XuqxRXjgC+qrseF85rryEEdq4EjJNo5dOjH88uYohHk/0+VO+hIeDc+NCTXOn7yGE46A@vger.kernel.org, AJvYcCXU1wOWO7LGV3v8SVJKF2159w3IMwb6
 CWqkWUftX5bA1AtFRWxayPFQXsBMA63X5DPTbcDOMYrWf3GI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ErPoF+Dq4cetILAfKtFQFgAuDg2mvnyvMKvtH0SrRzcjFxio
	IHmuFlYVp7VxKmM9dPRBid2TxnYPqC//I96Rd0CIlB3LesRm4Tvuh14VcqjAsiRjnIgNnKyx/dg
	wd/ZIBcWS9rzc8xyA1lJm8qiq19g=
X-Google-Smtp-Source: AGHT+IEeVtQ4Mfm3Sjq2wHpciFrbjjxIYOrYvh/FCiLn6Ydf+vcLIXndUA6BX71uJDQWSPs0eewq2L8QblxudajKPt8=
X-Received: by 2002:a05:6902:2389:b0:e2e:467d:d54e with SMTP id
 3f1490d57ef6-e3087a4a0f2mr5604930276.8.1730102291466; Mon, 28 Oct 2024
 00:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-7-tmyu0@nuvoton.com>
 <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
 <62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net> <CAOoeyxX=A5o5PhxpniPwPgMCBv1VwMstt=wXCxHiGPF59gm5wQ@mail.gmail.com>
 <817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net> <02f05807-77ae-4a3b-8170-93dd7520c719@roeck-us.net>
In-Reply-To: <02f05807-77ae-4a3b-8170-93dd7520c719@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 28 Oct 2024 15:58:00 +0800
Message-ID: <CAOoeyxX2Jk+76Cedu5_ZGgeRCPmT8Yhczmx7h+K-za7r2WS=Sw@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter,

The original plan was to use the IIO driver to access the temperature
and voltage sensors, and the HWMON driver to access the tachometers.
However, since the device is a hot-plug USB device, as far as I know,
IIO-HWMON is not applicable. I will merge the IIO driver part into the
HWMON driver in the next patch.
In  other words, the driver will be used to access TIN, VIN and FIN.

Best regards
Ming

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B410=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:50=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 10/25/24 08:44, Guenter Roeck wrote:
> > On 10/25/24 08:22, Ming Yu wrote:
> > [ ... ]
> >
> >>>>> +static int nct6694_fan_write(struct device *dev, u32 attr, int cha=
nnel,
> >>>>> +                            long val)
> >>>>> +{
> >>>>> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> >>>>> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] =3D {0};
> >>>> [Kalesh] Please try to maintain RCT order for variable declaration
> >>>
> >>> Ok, but that is already the case here ?
> >>
> >> [Ming] Is there anything that needs to be changed?
> >>
> >
> > I don't think so, If two lines have the same length, the order is up
> > to the developer to decide.
> >
> > Question though is if the buffer needs to be initialized. You should dr=
op
> > the initialization if it is not necessary. In that case the second line
> > would be shorter anyway, and the order question would not arise.
> >
>
> Actually, I just noticed that you also submitted an IIO driver which
> reports the same data again. If a chip has an IIO driver, there should
> be no HWMON driver since the IIO -> HWMON bridge can then be used if
> necessary. So please drop this driver.
>
> Thanks,
> Guenter
>
>


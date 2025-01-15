Return-Path: <linux-i2c+bounces-9090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE1A11715
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 03:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D0A23A4A0E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 02:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E44B22DFB3;
	Wed, 15 Jan 2025 02:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCBmfkYT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9803C3597D;
	Wed, 15 Jan 2025 02:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736907106; cv=none; b=dMcA2fohmgwPC3eAA61DTdlEONH17hyAc7Wv6mPSZdEet8h/TSFF3XlEFMTfVIj/ucalD0bIgaWkVTcsSJKjbqOP8pfyXh/S3MvNuXNOJUF6/s19+wk3cgpvEsPTYOUxX5YCmlU9UNMwtj0jHtNOhq3Y3S12QJf1KWBOG7Sf+HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736907106; c=relaxed/simple;
	bh=z6Rc+pSrBIHC9Iws72s1fI5gE0Df27Hul3Jn0LH1KVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Awa2iH8Yd4NdmRQvYFBg9Z8mgrFR/qcWPCddT1caWtVqBSzcehJy7Oj/xwOP/KQg1d1YUlAlYlhqauyg4jj3FA87gXof0Y/+Ow3cMvsLgS/xYjlYq8ZHCJeAAjFKiOFZW/W+MpWLq6ItL72k8rT5e2gjSa52h3KMTY2+jUikCIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCBmfkYT; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso9707809276.1;
        Tue, 14 Jan 2025 18:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736907103; x=1737511903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzBbvyc9XeOPumeywlczQ3YKQ+UKjKz6ZgpLbbtCGjw=;
        b=jCBmfkYT9Dhr85MsIrBElqHUjaLj917PZmxuTTt9dd0wWCyLdyN/NBxijbCdVzTPYT
         Cjksn3WkYqXqWxB8KS4AFTXFC2E5wqj+PbhQa60UE6PYA1e3QyPuBmYEvmZY3iwquwBM
         fNK+rTkuagI9NDSPrVXQa03sW2vUtjVUARRmBlJZzddJG8DFiCt6FBumCvCCaCAxOa/2
         UpwnbZozkIpqwRwnWoUG04FymVEkxwhrl4oB0ThH3GoMNOl/SI3FA4o6Q0BGoxS2I6IZ
         d6LAT7wbmQQU8kYuEwEwtvx+hvPqenaLqJRK0B6jBHzzdEt+pFOzK13e/roAkQKgUHnW
         iZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736907103; x=1737511903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzBbvyc9XeOPumeywlczQ3YKQ+UKjKz6ZgpLbbtCGjw=;
        b=UD4KnAwlUDaG0UzTAOkYMQTExEF4HlDJexuk+fnEs4WAYeypMzL6/cgEeInOfLhhFB
         dW21kpGu7za1nVRRTqaMm0e7Opl4QKLYLUmSjVnLqRLUrpHMxCWuygKc/XUGMqdjCP9q
         D4qy3zvaeyItcbwYKCstyHh4TzUEh1fbAn83M3ole/idEUO+Wwm83fQkGfvwLuBD5B0R
         83YbfXesWkJmec4YA1pz+y6XQ87HORf4a70KS+cF0F9Wh75gBAHqPRHYaFRbrsaaQXf8
         MI8nYIpKZx77HtlG2yd88sxR9JjxNDeq20a2k8fjlxoSm97tHpYSrazYKM/HF3rtb2GK
         eDWw==
X-Forwarded-Encrypted: i=1; AJvYcCU23/8YlnoqihDpIrSRvt7+nwVNRoj02y4pKbEBaDih603qwDGKtybquWDdaf+hrM0kuLGkld9b@vger.kernel.org, AJvYcCUfWALug5ujERmRJVNm1O1jnMmyp5+SkDBeWo0rWxqwVidfOu91vj63YNF+K8/hFPbkTJpTvlSOIYExQaU=@vger.kernel.org, AJvYcCVWJSjccXYBy0jUUqaiM12QLlsgI4P/m1ZofMTL47JEoOGN0g6RbELH1PUPsHm4oCd4CrJXgBtc+k1VCJaP@vger.kernel.org, AJvYcCWECwS/HJlip/qLUfrWKXlr6EnNHvJA8z2AsDTa5ujSoHoGV+lTfvHolUUA/u1m4E8jNvWzUOL2xAB7WA==@vger.kernel.org, AJvYcCWtqQkqpzi59sw5JR7twvl31FHquPSSBk19f3l3vgIxACbE5Zwg1bF9RWDHLklvKcqGN8FF5rk367iw@vger.kernel.org, AJvYcCX7MxjaZ71VvvHY+syJO+mevH6U/2qgiTrHH8xTsd2RgpDFaJNISDtJ8A3HRYeltfaevYrBqSxtUnU=@vger.kernel.org, AJvYcCXTxzhn4Kn/lTBkbLxH5lD0n2IQPRMmEUFl7VWSYzQC1EFV8B7X/8lNZUDGUQJtyQpRyw3FgKyxJrx9@vger.kernel.org, AJvYcCXV3dWLNqyc432SNo2vNL3BvXOJ8C+AH8CpnznXtj5Seg+SWTvbBWuVlopKMZQVhVHWwbWT0VMFpRzXeTJnIu4=@vger.kernel.org, AJvYcCXxpNRuoEytq7f2ZKoiPT8CuyfGGheGn6a/dZQ0Yp1YiIUskmDSikDGizY+1Ksfz0+jJjtKnzjAxDdc@vger.kernel.org
X-Gm-Message-State: AOJu0YwXajf6GNUOAcQ4GowJPdnE01ntCpDnuYelW0esCGgk2VEM7DFp
	5yIIu7hrqKv+1NLxAI5sq5Eu/ngs1HLlMV5/ZioSU4A3tx/5+v3AzF+uPLk8XsB9Ws26NrxP1DJ
	XIjFkTAdtuIS7WZYsyo+V8IWMK2g=
X-Gm-Gg: ASbGncs6qLLujIlp38RU8mLd2SEhc0MaNKc5O0AYY0r5MltIrAI/rDZnIwqAsXy9gBM
	4ydzGV89F5H5T4vzocOisGt7udb1bsBZl7exkOqFavIl0ic/RXGNdT7/tjqWNwmr9q6YPK3o=
X-Google-Smtp-Source: AGHT+IFIVxjvuwQxlm+It/LMur9kFyF8O1Z9FGStqAjIGuLMVyk8BbeY9MnMf1DEg2p5Hq1WcKpXYmr8gaoL7EQy+HY=
X-Received: by 2002:a05:6902:a01:b0:e57:311d:3143 with SMTP id
 3f1490d57ef6-e57311d4dcamr12922097276.42.1736907103392; Tue, 14 Jan 2025
 18:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-5-a0282524688@gmail.com> <CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01VzZ0S_9H8g@mail.gmail.com>
 <CAOoeyxW=k35-bkeqNmhyZwUxjy=g3irTBS5mbXLxqp1Stx-Zfg@mail.gmail.com> <6e349f0f-6509-4a3b-bb75-e2381e9205c6@wanadoo.fr>
In-Reply-To: <6e349f0f-6509-4a3b-bb75-e2381e9205c6@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 15 Jan 2025 10:11:32 +0800
X-Gm-Features: AbW1kvaQIEFE9WM-IPay3Y7pZt581CJwaqBO4xhiRtEJtYM812FJmCH8UFsvh0Y
Message-ID: <CAOoeyxVST6rEqp65rU6ZgmM-rSkAdeUVM=0nTLZYrqiO4DbQOA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] can: Add Nuvoton NCT6694 CAN support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B41=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:12=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
...
> >>> +static int nct6694_can_get_berr_counter(const struct net_device *nde=
v,
> >>> +                                       struct can_berr_counter *bec)
> >>> +{
> >>> +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> >>> +       struct nct6694_can_event *evt =3D priv->rx->event;
> >>> +       struct nct6694_cmd_header cmd_hd;
> >>> +       u8 mask =3D NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
> >>> +       int ret;
> >>> +
> >>> +       guard(mutex)(&priv->lock);
> >>> +
> >>> +       cmd_hd =3D (struct nct6694_cmd_header) {
> >>> +               .mod =3D NCT6694_CAN_MOD,
> >>> +               .cmd =3D NCT6694_CAN_EVENT,
> >>> +               .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, mask),
> >>> +               .len =3D cpu_to_le16(sizeof(priv->rx->event))
> >>> +       };
> >>> +
> >>> +       ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
> >>> +       if (ret < 0)
> >>> +               return ret;
> >>
> >> You are holding the priv->lock mutex before calling
> >> nct6694_read_msg(). But nct6694_read_msg() then holds the
> >> nct6694->access_lock mutex. Why do you need a double mutex here? What
> >> kind of race scenario are you trying to prevent here?
> >>
> >
> > I think priv->lock need to be placed here to prevent priv->rx from
> > being assigned by other functions, and nct6694->access_lock ensures
> > that the nct6694_read_msg() transaction is completed.
> > But in this case, cmd_hd does not need to be in priv->lock's scope.
>
> So, the only reason for holding priv->lock is because priv->rx is shared
> between functions.
>
> struct nct6694_can_event is only 8 bytes. And you only need it for the
> life time of the function so it can simply be declared on the stack:
>
>         struct nct6694_can_event evt;
>
> and with this, no more need to hold the lock. And the same thing also
> applies to the other functions.
>
> Here, by trying to optimize the memory for only a few bytes, you are
> getting a huge penalty on the performance by putting locks on all the
> functions. This is not a good tradeoff.
>

Since nct6694_read_msg()/nct6694_write_msg() process URBs via
usb_bulk_msg(), the transferred data must not be located on the stack.
For more details about allocating buffers for transmitting data,
please refer to the link:
https://lore.kernel.org/linux-can/20241028-observant-gentle-doberman-0a2baa=
-mkl@pengutronix.de/

Thanks,
Ming


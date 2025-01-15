Return-Path: <linux-i2c+bounces-9094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93CA11A49
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 08:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C15901889BD5
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 07:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB47230277;
	Wed, 15 Jan 2025 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCiE7+9K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2895C22F82F;
	Wed, 15 Jan 2025 07:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924600; cv=none; b=N6UU5jh+kjPoFzJLgiXAsqVgYmJXj1Ogqjb5vmVgNK35Y/uJHBMrSXHAwyoQO7cZOaYLwCN5C1+CXok7TMsQnr4OhPBza+03X/rMzLD/pK8KZeAa40/Jc8d22Me/fC3rQciWQNZHbopqJmHaCrshoSxYbdHMeBtl8dvu6S6L8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924600; c=relaxed/simple;
	bh=KQ4eLNQSFJ74+FyRlczFuBHR4ATAla+SYEnpQlXar8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXIWTz9R2TPQLrCeQ+P6N1TiVGJgFeBUVTbWdmRXEg4Q/OXxty/WKyqs30t0rt7eM81N/EBIVnjTC+Yh3RON/KA/DHbmBDljmCJEWI/WUxjUyzMzD2wAVURWYhyvVlA2XajLC1xXY8lDwvxAXyK3VgyE+DwBzRZXDGb6R0Vsofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCiE7+9K; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so9976366276.1;
        Tue, 14 Jan 2025 23:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924598; x=1737529398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyvMLYSm4H1mnKeIKs7N/htskaOU/SdKUfXXPSbYEfI=;
        b=KCiE7+9KhLYBbFNqNbxwikbGgNUYwifwav8ahgCvBvbfY4XzY4DSHS1s0ou0ffSz12
         hkarKIPABLz1OV1JJMTWxAC3rs95x77AT1929RNY7+YHaM6NwynGfrxT4URxhQRg4gMU
         mHB3BgPZCZTFnZ5Yh5Ky4EfABl8rLQTnELpfBHwYQ096V1Xnq7rSGrLIVHw34dgxm/UH
         bVYHbeTXaUqHk46u2G297/fb4D8dSPGaE2JtdtkfddrSy6At6tBmRmYxyy48mcmGiows
         pHaoM6YYTu3dxAOJmDvCgMYi0kwQQxjWNZ20ysLNBt8yAcArUItUWHM5I/zoH8k70nYk
         V8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924598; x=1737529398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyvMLYSm4H1mnKeIKs7N/htskaOU/SdKUfXXPSbYEfI=;
        b=Y4ngpiPz8KWpt/jDoN08vIU5Qvz7FJyD/ef1hUyn/VUZkJxH1ST++W583IRQhPFFh/
         5va5SIe5igsVjHXybzd3bBSKVZs1/ZIiWaxPS9/7XnhwpxXYINFANXQsLU4h7J47WaX9
         KDrFlnxCSMgIK7K0bpQCn+zjWW9m3CrW+TpmRI0g4MNpwzgs94jj/xan0hGkBFQpCGCf
         3zdJhM/ORo7sv5NIhFBy4lDU08EnxzhRN1kJNDZtIBC7n0qj85qIxH6eCH1xu8/CQKpG
         9D5aJvLe9aNoB4FOT3ZVXevRlxJAY4/RKNRo4wFe5AZopLk7mxVwO2fmlS2je3loSbrV
         Hnow==
X-Forwarded-Encrypted: i=1; AJvYcCU1593PgfrimgKNrf1DBGGRVkSaj3BQmrgEyXR+8Ek4o5yICBawaf0Q4ZXrrS1g5SHuVnQQjYO57f2u5A==@vger.kernel.org, AJvYcCUQUmU9PdqMxZXNrUbzDQVaegkhc+aJcz3Mp4ttJ3po8V4Pdbpt8RGC5SYlmr8uJIlYXg8JXbD1tj+w5dwZ@vger.kernel.org, AJvYcCUUG2Q+7ZDR+WGQMlZtRkprOB6zmG/jmWJasi3Cwzwiuv9jmCT5TKZWHrCHvK0TPVvo+nQ87r3GZkX+TpvoqlM=@vger.kernel.org, AJvYcCUcP7z3DHYzy66vEMSc6T7F2Hmfd8JuLHW4LoJ8nFOgy9UZQgvPlaeRIMxlKMWVvE+LQpPurFrjED56CQI=@vger.kernel.org, AJvYcCVCyiBWZ4hdCQtdzBANgdKskWgXCq9fW/q4UdmVDdMLpam99h3NxJlaFgKjWHh6wKf49L11UT8QaB1T@vger.kernel.org, AJvYcCWMHYi+hlxPU443P417aAZsFruYhjm5Ef55LSzb2W0OZBiZfNT9XMkp0yCBbfuUmhWKuXdijVZgKsk=@vger.kernel.org, AJvYcCWWJi7hgmwnX8wKcm0J9BN4sijD7OskF6o9zgHmH62tmR11lJ3lIO33JZ/NdZXSyUEa+wKMV3c78Q8E@vger.kernel.org, AJvYcCWfAzCzKQLEcUVuRVc3LbzDjnN86amH5N7RyZmMBaL6LpIvrrIhWgpxswQiW81hUpYHhs4uf0QWtNgu@vger.kernel.org, AJvYcCWwrWz3dgwFBfHOgXvagSVfBUgfVj6IMnlffmoX+JJttnd+ixRjuW0Xr7/2y1R5z7xIMM0mZVjd@vger.kernel.org
X-Gm-Message-State: AOJu0YxkL5sGw9RX2ayOibt7n5OG1KPiJZ8idAFSAe8xjznxCKdwQNGB
	b3nl8QmdnrsOyMm17KoQZvpuxXIKz9iiUrNQfdoaNex5Z/ahcctmzKFfjfbRpWyadxp/UOeEEtu
	Mfh7JJ3Ff3wtJkN6gnsuQL51649E=
X-Gm-Gg: ASbGncvlpqd1oCDhwp45VNcgOm5PISi8z0k7NDqQfeRAAcclZzMyzMokjvCe5mqQSmK
	n+SoUnl4fsBh2YnAgUykz1mrYjoF2F/87HGFAuIGMwSayiOtu0/CV6WZmmoXCjkT/Ghlg36I=
X-Google-Smtp-Source: AGHT+IFxdn5bxXACv5FAqhmS9pJeI+SvfbfFhDStUn4kSjTKpuJWHZqSVzl1dXRvfNq9xltmVB1T18ZhFNYWLh6MgUk=
X-Received: by 2002:a05:6902:2301:b0:e57:4254:a76e with SMTP id
 3f1490d57ef6-e574254a914mr10292536276.30.1736924597771; Tue, 14 Jan 2025
 23:03:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-5-a0282524688@gmail.com> <CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01VzZ0S_9H8g@mail.gmail.com>
 <CAOoeyxW=k35-bkeqNmhyZwUxjy=g3irTBS5mbXLxqp1Stx-Zfg@mail.gmail.com>
 <6e349f0f-6509-4a3b-bb75-e2381e9205c6@wanadoo.fr> <CAOoeyxVST6rEqp65rU6ZgmM-rSkAdeUVM=0nTLZYrqiO4DbQOA@mail.gmail.com>
 <0ccedc84-d429-4d6f-bd21-7487e6a0fbf9@wanadoo.fr> <CAOoeyxUrJdtVRykS15UxjEgrsstpOba-s+4=i7Xh9oXAsGcMWg@mail.gmail.com>
 <CAMZ6Rq+nWzBii6G0ufW9Kb4q+c1jrWOjq3ZmkOusdXJeA0qLzA@mail.gmail.com>
In-Reply-To: <CAMZ6Rq+nWzBii6G0ufW9Kb4q+c1jrWOjq3ZmkOusdXJeA0qLzA@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 15 Jan 2025 15:03:06 +0800
X-Gm-Features: AbW1kvbjncdLlDX5sGR5rJY85iYCP5I7nx9DQr2XoPnIMd1pNgpVDDz-VlYu7Qw
Message-ID: <CAOoeyxWBGrhNSuVVO+Dbi2qwar7=LNXTPkFWgoZTJWcBQaLMag@mail.gmail.com>
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
=8815=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:44=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Wed. 15 Jan 2025 at 14:35, Ming Yu <a0282524688@gmail.com> wrote:
> > Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B41=
=E6=9C=8815=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:36=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > >>>>> +static int nct6694_can_get_berr_counter(const struct net_devic=
e *ndev,
> > > >>>>> +                                       struct can_berr_counter=
 *bec)
> > > >>>>> +{
> > > >>>>> +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > >>>>> +       struct nct6694_can_event *evt =3D priv->rx->event;
> > > >>>>> +       struct nct6694_cmd_header cmd_hd;
> > > >>>>> +       u8 mask =3D NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_T=
EC;
> > > >>>>> +       int ret;
> > > >>>>> +
> > > >>>>> +       guard(mutex)(&priv->lock);
> > > >>>>> +
> > > >>>>> +       cmd_hd =3D (struct nct6694_cmd_header) {
> > > >>>>> +               .mod =3D NCT6694_CAN_MOD,
> > > >>>>> +               .cmd =3D NCT6694_CAN_EVENT,
> > > >>>>> +               .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, m=
ask),
> > > >>>>> +               .len =3D cpu_to_le16(sizeof(priv->rx->event))
> > > >>>>> +       };
> > > >>>>> +
> > > >>>>> +       ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
> > > >>>>> +       if (ret < 0)
> > > >>>>> +               return ret;
> > > >>>>
> > > >>>> You are holding the priv->lock mutex before calling
> > > >>>> nct6694_read_msg(). But nct6694_read_msg() then holds the
> > > >>>> nct6694->access_lock mutex. Why do you need a double mutex here?=
 What
> > > >>>> kind of race scenario are you trying to prevent here?
> > > >>>>
> > > >>>
> > > >>> I think priv->lock need to be placed here to prevent priv->rx fro=
m
> > > >>> being assigned by other functions, and nct6694->access_lock ensur=
es
> > > >>> that the nct6694_read_msg() transaction is completed.
> > > >>> But in this case, cmd_hd does not need to be in priv->lock's scop=
e.
> > > >>
> > > >> So, the only reason for holding priv->lock is because priv->rx is =
shared
> > > >> between functions.
> > > >>
> > > >> struct nct6694_can_event is only 8 bytes. And you only need it for=
 the
> > > >> life time of the function so it can simply be declared on the stac=
k:
> > > >>
> > > >>         struct nct6694_can_event evt;
> > > >>
> > > >> and with this, no more need to hold the lock. And the same thing a=
lso
> > > >> applies to the other functions.
> > > >>
> > > >> Here, by trying to optimize the memory for only a few bytes, you a=
re
> > > >> getting a huge penalty on the performance by putting locks on all =
the
> > > >> functions. This is not a good tradeoff.
> > > >>
> > > >
> > > > Since nct6694_read_msg()/nct6694_write_msg() process URBs via
> > > > usb_bulk_msg(), the transferred data must not be located on the sta=
ck.
> > > > For more details about allocating buffers for transmitting data,
> > > > please refer to the link:
> > > > https://lore.kernel.org/linux-can/20241028-observant-gentle-doberma=
n-0a2baa-mkl@pengutronix.de/
> > >
> > > Ack, I forgot that you can not use stack memory in usb_bulk_msg().
> > >
> > > Then, instead, you can either:
> > >
> > >   - do a dynamic memory allocation directly in the function (good for
> > >     when you are outside of the hot path, for example struct
> > >     nct6694_can_setting)
> > >
> > >   - and for the other structures which are part of the hot path
> > >     (typically struct nct6694_can_frame) continue to use a dynamicall=
y
> > >     allocated buffer stored in your priv but change the type of
> > >     nct6694_can_tx and nct6694_can_rx from union to structures.
> > >
> > > And no more overlaps, thus no more need for the mutex.
> > >
> >
> > Understood, I will remove the unions and add members to private
> > structure in the next patch.
> > e.g.
> > struct nct6694_can_priv {
> >     struct can_priv can;
> >     ...
> >     struct nct6694_can_frame tx;
> >     struct nct6694_can_frame rx;
> > };
> > And do dynamic memory allocation for struct nct6694_can_setting and
> > struct nct6694_can_information.
> >
> > In addition, I would like to know your thoughts on how struct
> > nct6694_can_event[2] should be handled?
> > It is utilized in both nct6694_can_get_berr_counter() and
> > nct6694_can_irq(), with the latter being called more frequently during
> > runtime.
>
> For the nct6694_can_event in nct6694_can_irq(), I would say it is part
> of the hot path and thus you can have it in your struct
> nct6694_can_priv.
>
> For the nct6694_can_get_berr_counter(), the easiest is actually to
> just add the error counter structure to your nct6694_can_priv:
>
>           struct can_berr_counter berr_cnt;
>
> Each time you receive an event, you update this local error counter
> copy, and this way, in your nct6694_can_get_berr_counter(), no more
> need to query your device, you just return the berr_cnt which is saved
> locally.
>

Understood! I will make these modifications in the next patch.

Best regards,
Ming


Return-Path: <linux-i2c+bounces-9092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED4AA1190F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 06:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A538188A7F7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 05:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EF322F39B;
	Wed, 15 Jan 2025 05:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nARYuG+1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC1A156F3B;
	Wed, 15 Jan 2025 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736919326; cv=none; b=i/Ja5o7xLnPVCqaAoT5EDmH7X3NyaI11n/raEfzw+DXvcOxMz/6bbN0JphiOXbdDrMwIJr1rzvwPBqgMGT+3umOwcQGUiFwXi/D/iSQTZEyy/3L/V/2PA18elvulQSPdf2OrgonxR6gs33PxHNrYLQzhezKdF8t59tTljqxMYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736919326; c=relaxed/simple;
	bh=ccZtzwf7Bt4htpF0UDvneUd8+3+5zGc0vg0OixiVwrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOZoTAobV0dXuNIXirAZJz2xnGpw/pmb6nVcV9v5Hu3tNb8PgKGQKjvU5EETc9hs+Vs3Z1gEd6QObsMABVv2PvA1DxmESy85EKznGNXevynHY5HbrLWDzheNX6G6760Zp1Rn2aIxI6i9iKM6/LrydJRjcMOggM2l/dJbpCHlV8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nARYuG+1; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e54d268bc3dso11252160276.1;
        Tue, 14 Jan 2025 21:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736919324; x=1737524124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuitbmn9mwEi9tghL+gGB4/50R1hxo101PES+YZbaVU=;
        b=nARYuG+1dD4Qy3J3ljDFMinYOPfwtUeOP7aQ82jUgSRxD8UVraFtZBvy+tIooGaT9D
         5hhTQey+RucJ7W4Fwy+8JsC+ymRlxAzLVMxQY2LmhMSzxVCq+zuBJvF8NUCI5x1JUa6i
         4h20DpPJ/puZ5kBIx+zOCTkT9oXy5zy+SuQYQcj7IPaOU4+NCT4Sh/UuBf32MCYYMjdL
         lXn8yE3G4t/QUQ9ThCCgAeFDhHDVnY/qjU3fJiegjVvDS1em+KXngKDT0cWRB1kBdXRe
         LRSCJIkUTvqfpPzQadjUdawTMYyYTVpUg53YmaT/HYMBuvURNT2cIxUJBR4+5ramstXr
         11KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736919324; x=1737524124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuitbmn9mwEi9tghL+gGB4/50R1hxo101PES+YZbaVU=;
        b=hQI2kPCXOg9JPwg8GOX2L/AjMM0gni9pGqiRiQWFT8txCliK3+2CjOHr7Edd+9ae2m
         xJ/yl0NUJcZkszKgXj4NQdV3tkc3zcWruOeaOLZl19FqB0KyHBTa9giqqwJp39yWXuU9
         NY3y7uRA3XVlmz4YKodgt0koFHeV8XJ5sOW2yIbSrNLVbr1SBIjUhVTVDiiFNAhwYMta
         mQGhlQa6FrqhjZDa6S4F/7elAtnbw3LIRGgTtn2wc8AF2NlpS9T5uVitmRo1MTwQDrPz
         V6COnUZmgcEl9wgcMzqBkaeDQxbKP/wO8NBsJCXvH+ms0p9TOKgGiwmwDrE3IE/dEs5e
         xgkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/IlbnW7QMW69PGQX+ubsOcqaoAyizfMbSkRu3lD3N8u1Ysu2N0NW5cLiArnZRrvI4mmB/HgYj@vger.kernel.org, AJvYcCU3wQY2q5M6Ej3js864PywyJmFvNFI6CygLIATEjR7jpeMbYT76+/w/60Wh+E1jfnFSqTWNvIqa4QbA7cD3f8g=@vger.kernel.org, AJvYcCUADMEuFaODFQT7SkfGJ+dNV7/cqiOZR0Zpcf4h4Ad31AVDScnFPJMm5iW3tITml18cLyXPPBkXZrx3@vger.kernel.org, AJvYcCUzBYp6w1w97tb/Bip3lFGVQesqileRygYaWM6LKlMEkAH1uXGirD+H6ibTkerQ94rBD6JlxCIK9d8b1g==@vger.kernel.org, AJvYcCV67DQxz+DU+0fVG/FkJF+Prml00q3hNn956+X3Ly2C/MUKS13m7dd1ynrBLefK8kkj56aq3OxyS+xKKlE=@vger.kernel.org, AJvYcCVViNhi/IMJcPxvvduaxtaZfjN1KlLwTgYNNZLaPDrOnwjuPYzDrnrsWMBweA3Ru7W4XaAdBuQlSb0T@vger.kernel.org, AJvYcCVtvEgNbhvazqk78QfNpKaOtJeBRmEyfrWe+dTsmycowZqPbl5Wvljx6iDaqfLLPQ2ywvqWgnf5M4gl@vger.kernel.org, AJvYcCW21BWeO7PlyAmgpn5OmMx58u4Ln90I/iKwCO00WOWEPtfEAeHb9lrKjBEdcKSwjXEyH4OcRsf63C6ol0Av@vger.kernel.org, AJvYcCX5l+p0b8wWZRA1uTz5Zw6YqO363LLqH4s+dzwl6YExASsMLuwlbhgG7X4tcBKxJQkWKrevE4TcLB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDSQurrcFg29zWbXMS2BBaAf+N96kdbh5PWFu2PSwA/gSTwZr3
	A8S1yjg4t5A3YchRyEoR+V8nWOdf5+yQ+THvWolUEaGwPqa3AitSPA5vksXZheYPfWj1q9nSbhy
	3jktlxmFvmBKaWuajib0kHKhkwBk=
X-Gm-Gg: ASbGnctR2nr5KbfkL1d+WvnWHQBLY8MgIbfkmyAeCgz8wKgoy72z4Fg8TOdHcOwmUC+
	LWQHj+EVntFqw/KLeHFIUuhsM71+SFmRlrWUetHcnBYb15H/avRSHu3RW6XVMGOroLDGarg==
X-Google-Smtp-Source: AGHT+IHa0peyoW79otucX6pcKMHFQRgLPI8Jc1kUfEh09kuPHR5lvaAVDd56ygEj8SVYIvfG5yLjw+kt4S5vxq6LvDs=
X-Received: by 2002:a25:5886:0:b0:e47:f4e3:8801 with SMTP id
 3f1490d57ef6-e54edf25d61mr14722987276.12.1736919323806; Tue, 14 Jan 2025
 21:35:23 -0800 (PST)
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
 <0ccedc84-d429-4d6f-bd21-7487e6a0fbf9@wanadoo.fr>
In-Reply-To: <0ccedc84-d429-4d6f-bd21-7487e6a0fbf9@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 15 Jan 2025 13:35:12 +0800
X-Gm-Features: AbW1kvZNPxXDWAaMAp3vY2xZ992Wka8WXVeWv9rwrP0hSU7PpAVZxt0ONIZ8pwE
Message-ID: <CAOoeyxUrJdtVRykS15UxjEgrsstpOba-s+4=i7Xh9oXAsGcMWg@mail.gmail.com>
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
=8815=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:36=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >>>>> +static int nct6694_can_get_berr_counter(const struct net_device *n=
dev,
> >>>>> +                                       struct can_berr_counter *be=
c)
> >>>>> +{
> >>>>> +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> >>>>> +       struct nct6694_can_event *evt =3D priv->rx->event;
> >>>>> +       struct nct6694_cmd_header cmd_hd;
> >>>>> +       u8 mask =3D NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
> >>>>> +       int ret;
> >>>>> +
> >>>>> +       guard(mutex)(&priv->lock);
> >>>>> +
> >>>>> +       cmd_hd =3D (struct nct6694_cmd_header) {
> >>>>> +               .mod =3D NCT6694_CAN_MOD,
> >>>>> +               .cmd =3D NCT6694_CAN_EVENT,
> >>>>> +               .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, mask)=
,
> >>>>> +               .len =3D cpu_to_le16(sizeof(priv->rx->event))
> >>>>> +       };
> >>>>> +
> >>>>> +       ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
> >>>>> +       if (ret < 0)
> >>>>> +               return ret;
> >>>>
> >>>> You are holding the priv->lock mutex before calling
> >>>> nct6694_read_msg(). But nct6694_read_msg() then holds the
> >>>> nct6694->access_lock mutex. Why do you need a double mutex here? Wha=
t
> >>>> kind of race scenario are you trying to prevent here?
> >>>>
> >>>
> >>> I think priv->lock need to be placed here to prevent priv->rx from
> >>> being assigned by other functions, and nct6694->access_lock ensures
> >>> that the nct6694_read_msg() transaction is completed.
> >>> But in this case, cmd_hd does not need to be in priv->lock's scope.
> >>
> >> So, the only reason for holding priv->lock is because priv->rx is shar=
ed
> >> between functions.
> >>
> >> struct nct6694_can_event is only 8 bytes. And you only need it for the
> >> life time of the function so it can simply be declared on the stack:
> >>
> >>         struct nct6694_can_event evt;
> >>
> >> and with this, no more need to hold the lock. And the same thing also
> >> applies to the other functions.
> >>
> >> Here, by trying to optimize the memory for only a few bytes, you are
> >> getting a huge penalty on the performance by putting locks on all the
> >> functions. This is not a good tradeoff.
> >>
> >
> > Since nct6694_read_msg()/nct6694_write_msg() process URBs via
> > usb_bulk_msg(), the transferred data must not be located on the stack.
> > For more details about allocating buffers for transmitting data,
> > please refer to the link:
> > https://lore.kernel.org/linux-can/20241028-observant-gentle-doberman-0a=
2baa-mkl@pengutronix.de/
>
> Ack, I forgot that you can not use stack memory in usb_bulk_msg().
>
> Then, instead, you can either:
>
>   - do a dynamic memory allocation directly in the function (good for
>     when you are outside of the hot path, for example struct
>     nct6694_can_setting)
>
>   - and for the other structures which are part of the hot path
>     (typically struct nct6694_can_frame) continue to use a dynamically
>     allocated buffer stored in your priv but change the type of
>     nct6694_can_tx and nct6694_can_rx from union to structures.
>
> And no more overlaps, thus no more need for the mutex.
>

Understood, I will remove the unions and add members to private
structure in the next patch.
e.g.
struct nct6694_can_priv {
    struct can_priv can;
    ...
    struct nct6694_can_frame tx;
    struct nct6694_can_frame rx;
};
And do dynamic memory allocation for struct nct6694_can_setting and
struct nct6694_can_information.

In addition, I would like to know your thoughts on how struct
nct6694_can_event[2] should be handled?
It is utilized in both nct6694_can_get_berr_counter() and
nct6694_can_irq(), with the latter being called more frequently during
runtime.

Thanks,
Ming


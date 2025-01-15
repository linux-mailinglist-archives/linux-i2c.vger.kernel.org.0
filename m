Return-Path: <linux-i2c+bounces-9093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4AA119F1
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 07:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BB913A3F67
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 06:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ED222FACD;
	Wed, 15 Jan 2025 06:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="T25W/abU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A822F3B9;
	Wed, 15 Jan 2025 06:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923457; cv=none; b=g75vAa7kxTpErnhdJGtQI+yBcW0MIz1H6xSRy5N57u3zbpPOcFZHMfkwesj36gxyIV56KAInWU+As069jREAV2GmqMJVLjKhNr4uHCna03EQRMg7q7xRdbBUYiotIE0pgqGIhXRIfw281XUtWE7eOe14dcOBWrG/xC0Mz792WKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923457; c=relaxed/simple;
	bh=SLWPx8HuIG5/vHbcqAlKlY47gQqSrVIF0B9xvsu75dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OS3KtNs8xSrTjGF7WJGPfy5/HUG2yG4giNuTofM8R/3nOWuvz+6txyUrR8wTHFG/iSxwouAM8DCEhWLZ/cmoK1VEpwrY8fiU2Wj/YEmOdt5HplxhhgMErkpguUDDjvYDPwROKmE/I8SOSnEdx5o1rFqkTR1VYEUnGAU5x6gA+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=T25W/abU; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by smtp.orange.fr with ESMTPSA
	id Xx8EtaRe4efOOXx8HtkSXA; Wed, 15 Jan 2025 07:44:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736923445;
	bh=2Oou1c8ogdfkZIOen03QkJWU2HqLN/tLI4Vba1PjvGA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=T25W/abUjyzP0u16kL1tmDPU4sE2AUtzkt1fl6RY34DCvtjt1waa3Y3QLrnZNIZOW
	 s3sNCaNbj4Ln+KCFsSkxdhjnjaZ9uOsRo9m6k9d5pD9HtHoBEhKFWrvgeC9rh9zSv1
	 /fLiwTHlCbXm107Xhk72WjNzBWKdEq4m0r/XSW1aGRQzfRXF5Zxr05YumuVMARH2JL
	 Usndtor+ZPwI8lQDBlktjHL736lbClvrECaMQbhwAFqc9N5n3uRBbMV+2LWEGwuhT8
	 bw62Yn/QY9zFdJSGmfDtnRfnPvNtFZtBzj1lus8E7EXmLAM9wzy+ks1of9qQZOJ6Ls
	 +zaVZm8LqLeBQ==
X-ME-Helo: mail-ed1-f52.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 Jan 2025 07:44:05 +0100
X-ME-IP: 209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso11453609a12.2;
        Tue, 14 Jan 2025 22:44:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrIl+l2m5IdEdCWpVQGAV4yL8+ADhoyMltyX9/fRi6G2x941j5GEBZjBwox3QvPOy0hzBv353cqj0=@vger.kernel.org, AJvYcCV7k1u9hC5me+b55NSsUPpcJwEezid0Ea+m9hiEs5jZbuh7ctMZ+VZfBOpI+9FtXrIN39p3XSb1@vger.kernel.org, AJvYcCVRX8/G0UUD5q56r6YsdJvN+8FiGjsdGIvNONFDB28YtGccy6bC6QKFaS7sYkNckl19fDBrdKZVHPao@vger.kernel.org, AJvYcCVz530MZ1T4EdOBATV1u/PXQ8sA6fYv7yddOEnUZcQHjT65iY4veBP86k2yJP4/v9Oco3M9gMjaIX4m@vger.kernel.org, AJvYcCWDQLU44W8MnNrr87vUIZiNjstNacD13U9a/qshom96qLQNQUOKhhTegDbIAE9FIhkxnti2Xm92cwYMTIDFYvQ=@vger.kernel.org, AJvYcCWcr3mah/ou93c7HpKeLYBbJRuZu0gFyoO42JQr4D6nnjPt2AkwpgW1fpHMgjbBhSMGFDPXshfXmWxN/kAw@vger.kernel.org, AJvYcCWnw2zOrRtrn8ZjlbbvByifblr2w1oe0jiWc32BgsgI+wq0k46tsW0ERsN72GfY1HG0q0EfdBlKOaamuU0=@vger.kernel.org, AJvYcCXQyFI7jd7WbdoON9uJ+qtwI/JDKSNCp76J452K86CQ5NDIWdVbPw6rhi1295Za+ieIpSSAAuEoVmUO@vger.kernel.org, AJvYcCXsrhs3Nndoc2lfdv0lAsS7mxp3lixdlyvh9cjI+UAYoW/tphwuxI7uw0IPnDv6Hd9F2f0ouczuGFMn7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75jyaQJye14geSz9TEe9mLTiEH4rG6e530LLzX6yx3XnNPUfB
	+gXY1R2il6SeHDm73xutuKyYlgxURJOxS8rjEBsvcaeg+7YC8JMJ7lmbNEdvN74S5+/8QK63nJU
	j5LqVudWP6gFMnV8wVNLfZTZ6Hc0=
X-Google-Smtp-Source: AGHT+IEfgjfywD2PrtG5Sqg1zeIb+P0MGj6tzn6DZGoiGYWglXLDK3an+xTn9h/Q5s5AYIYEgWKakCCa2Vl1qHtUI+o=
X-Received: by 2002:a17:907:72d0:b0:aa6:b473:ea4c with SMTP id
 a640c23a62f3a-ab2ab6a75aamr2766543866b.10.1736923442357; Tue, 14 Jan 2025
 22:44:02 -0800 (PST)
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
In-Reply-To: <CAOoeyxUrJdtVRykS15UxjEgrsstpOba-s+4=i7Xh9oXAsGcMWg@mail.gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Wed, 15 Jan 2025 15:43:51 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+nWzBii6G0ufW9Kb4q+c1jrWOjq3ZmkOusdXJeA0qLzA@mail.gmail.com>
X-Gm-Features: AbW1kvaP3KAIfU3U0sbMeRPsHT4aqZeOW7ivkGTfY0Z72vVsrt-ipA5MmrZSZCo
Message-ID: <CAMZ6Rq+nWzBii6G0ufW9Kb4q+c1jrWOjq3ZmkOusdXJeA0qLzA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
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

On Wed. 15 Jan 2025 at 14:35, Ming Yu <a0282524688@gmail.com> wrote:
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B41=E6=
=9C=8815=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:36=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > >>>>> +static int nct6694_can_get_berr_counter(const struct net_device =
*ndev,
> > >>>>> +                                       struct can_berr_counter *=
bec)
> > >>>>> +{
> > >>>>> +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > >>>>> +       struct nct6694_can_event *evt =3D priv->rx->event;
> > >>>>> +       struct nct6694_cmd_header cmd_hd;
> > >>>>> +       u8 mask =3D NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC=
;
> > >>>>> +       int ret;
> > >>>>> +
> > >>>>> +       guard(mutex)(&priv->lock);
> > >>>>> +
> > >>>>> +       cmd_hd =3D (struct nct6694_cmd_header) {
> > >>>>> +               .mod =3D NCT6694_CAN_MOD,
> > >>>>> +               .cmd =3D NCT6694_CAN_EVENT,
> > >>>>> +               .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, mas=
k),
> > >>>>> +               .len =3D cpu_to_le16(sizeof(priv->rx->event))
> > >>>>> +       };
> > >>>>> +
> > >>>>> +       ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
> > >>>>> +       if (ret < 0)
> > >>>>> +               return ret;
> > >>>>
> > >>>> You are holding the priv->lock mutex before calling
> > >>>> nct6694_read_msg(). But nct6694_read_msg() then holds the
> > >>>> nct6694->access_lock mutex. Why do you need a double mutex here? W=
hat
> > >>>> kind of race scenario are you trying to prevent here?
> > >>>>
> > >>>
> > >>> I think priv->lock need to be placed here to prevent priv->rx from
> > >>> being assigned by other functions, and nct6694->access_lock ensures
> > >>> that the nct6694_read_msg() transaction is completed.
> > >>> But in this case, cmd_hd does not need to be in priv->lock's scope.
> > >>
> > >> So, the only reason for holding priv->lock is because priv->rx is sh=
ared
> > >> between functions.
> > >>
> > >> struct nct6694_can_event is only 8 bytes. And you only need it for t=
he
> > >> life time of the function so it can simply be declared on the stack:
> > >>
> > >>         struct nct6694_can_event evt;
> > >>
> > >> and with this, no more need to hold the lock. And the same thing als=
o
> > >> applies to the other functions.
> > >>
> > >> Here, by trying to optimize the memory for only a few bytes, you are
> > >> getting a huge penalty on the performance by putting locks on all th=
e
> > >> functions. This is not a good tradeoff.
> > >>
> > >
> > > Since nct6694_read_msg()/nct6694_write_msg() process URBs via
> > > usb_bulk_msg(), the transferred data must not be located on the stack=
.
> > > For more details about allocating buffers for transmitting data,
> > > please refer to the link:
> > > https://lore.kernel.org/linux-can/20241028-observant-gentle-doberman-=
0a2baa-mkl@pengutronix.de/
> >
> > Ack, I forgot that you can not use stack memory in usb_bulk_msg().
> >
> > Then, instead, you can either:
> >
> >   - do a dynamic memory allocation directly in the function (good for
> >     when you are outside of the hot path, for example struct
> >     nct6694_can_setting)
> >
> >   - and for the other structures which are part of the hot path
> >     (typically struct nct6694_can_frame) continue to use a dynamically
> >     allocated buffer stored in your priv but change the type of
> >     nct6694_can_tx and nct6694_can_rx from union to structures.
> >
> > And no more overlaps, thus no more need for the mutex.
> >
>
> Understood, I will remove the unions and add members to private
> structure in the next patch.
> e.g.
> struct nct6694_can_priv {
>     struct can_priv can;
>     ...
>     struct nct6694_can_frame tx;
>     struct nct6694_can_frame rx;
> };
> And do dynamic memory allocation for struct nct6694_can_setting and
> struct nct6694_can_information.
>
> In addition, I would like to know your thoughts on how struct
> nct6694_can_event[2] should be handled?
> It is utilized in both nct6694_can_get_berr_counter() and
> nct6694_can_irq(), with the latter being called more frequently during
> runtime.

For the nct6694_can_event in nct6694_can_irq(), I would say it is part
of the hot path and thus you can have it in your struct
nct6694_can_priv.

For the nct6694_can_get_berr_counter(), the easiest is actually to
just add the error counter structure to your nct6694_can_priv:

          struct can_berr_counter berr_cnt;

Each time you receive an event, you update this local error counter
copy, and this way, in your nct6694_can_get_berr_counter(), no more
need to query your device, you just return the berr_cnt which is saved
locally.


Yours sincerely,
Vincent Mailhol


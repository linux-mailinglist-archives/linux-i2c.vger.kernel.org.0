Return-Path: <linux-i2c+bounces-8142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB849D5C73
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 10:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCC251F22696
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485D11DE8A7;
	Fri, 22 Nov 2024 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JalwzHlU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E981DE88A;
	Fri, 22 Nov 2024 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269077; cv=none; b=JxUobY929ujSuTN1EQ3/sXep7sOKjSemZhppD6MMNTaoibMxtE0GOyvb//5aC3VgiCrzp7SxGD24rLdp36pYKEFx8eHYtJxnuEG79AHXERoojLqQmLgkzDyJQ/rgw/Z7y4o74RWkrugSkXCarrjnvqNoOAkTnBmuWU6UnV4WN50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269077; c=relaxed/simple;
	bh=CD3QMkeKwPJwplOb9+RxUlyJP3HAfLpfRmOmE5WErmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNw3FPooODQJ4WD1kp1C+E+5EfqHdDqmU2MywFiuTZzIS3fZGZocyBluPw1djDgbigJ+YZfQnVcAHm8Z85BQ8MFDfBowsDw/sZPQxE6wK5XLvyUiivT8kRWXZE0y1fKtsWmPJTEGYOODjTxfGKvUyQXbMwgcB2+RUdbqO/GSGcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JalwzHlU; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2e41bd08bso24743437b3.2;
        Fri, 22 Nov 2024 01:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269074; x=1732873874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Rt7HhukuMOT/wZor/U1/vRsl6sRp7OR5MfA/Y7RLEM=;
        b=JalwzHlUfpqIqd2ryWww20z5D3sPmuh4CobMYrOqTWAvWp2MFimdOR0OJQxRN/1ds+
         wBS4Uasb0bIk7aov5oXJwhXwzASUx78fqMlkSwwyvjC0OB+vScfVArgrXtdY2fHxR0hr
         Fc5EUyetFJRrpwVTRuaoaMWPPxABygyUpVfg45iGfD2+3G3H8bGqUPI4njDkS6l5pUoO
         lWniiApHvojM02k7OETE5x3RDEhQVih0tm2oUH59gbIWYYNgKsP/uwUsp9DVxGDFc+HH
         iu7TUE9vcR02wiVlt8f3qJYDpfK+JN8cxXJg/y/26wVUbIKEcx1HdAPJ6yqit8eTbo8C
         lITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269074; x=1732873874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Rt7HhukuMOT/wZor/U1/vRsl6sRp7OR5MfA/Y7RLEM=;
        b=bGD44A3mZAw5iHGnha7Pqe9uqayXck6gN0CnrW/nO89zCml7KBWgN24pMr9acTSLxc
         L9Mj5wtEcIuA+B2YXWPoekdYZBScU5syvYD1En7n/GoiWqYZsJyhfFemOkLLQUZG3Tf5
         zq+FYAhHwL9b9tyYPl1Td+vOldUhLY2BSmjb3JW+bx4q1fFjngzSl5xuPasmFkwdTrdH
         kcndi5kdas2jvUz5wRRnR3qnYrZDJDExiYqqPmPrOABkXe6d1jxCHewVc+OiLVLW/q6P
         zDHdWgc4G7/qYz8uXN8xn7jFoeJ8LAUD9y4Kt9Bo6NPnkR3rxEtTVWDsPosaEEd+UNCL
         lxHA==
X-Forwarded-Encrypted: i=1; AJvYcCUEhQq1bnLHfSHNmxUcA8V5w0z4FshaWOSIKuMlVR223tI6pzOCjR+UV+vKNxsdGX4UOc0o3UoQ@vger.kernel.org, AJvYcCUc+i0kOdNpsBQ2DHJVM6qOvglEefJGtKdlvVJOQ3hwDfvuAl9EXIzj1sXBjHN9FvA2qvZfOlj+N9W1gQ==@vger.kernel.org, AJvYcCUxuKn9zYibzJp+aEoowRV8ZphIQdV71/kCuWpL+bZ6jfylONQ27HhcO4mGkY/RqzZE6nM5wKLdpHrpHYl5@vger.kernel.org, AJvYcCV23Pj6ipwNwTtLMYVQH9UtLudUrQFLf+iYFr9DvxXCNmoMnnCMIyi8GKzo9MIKZ8XA4h0nuWELSMqslG4=@vger.kernel.org, AJvYcCVM6NfegYh+uoLuKn81YEJZfEjkRtCFC/5f1uwkB9aCuEtsL4FZT95k2/ATRw3IqYG9fyAW7bfWgiFT@vger.kernel.org, AJvYcCXB0D74lMRpddlVaD6TE34rdhSpBQUSL3bfchjiBi8lP5AiJbjBIyiCC4CbtC5F9A8E5Ed7ttnjHWg+@vger.kernel.org, AJvYcCXGuJfigQjVf4aiPlB9PDn1IzK8VVbXiR5hpLzxXqCw668anSIZ5TRAFK3YP5c+q+VK2Fbuxq3xs/2QO9eeDg0=@vger.kernel.org, AJvYcCXoWw+sHqPgX7SmyBDh4k5SJVvOR+XhFYqI646Z7Ex1mqv2B+h9KkcP8aFkXx/9BPJPLBF2P0tTqIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsS+u0Wex6HpQzrcGr6rqMeIlGjv2XC92GIArmekYvwgetLV1c
	43iBe3bfUD36usHT0iVSVqUyAPhypODq1UZnUQDS0bfoFCy2cH1Q9gZEwLlN7sS3Flh2Q8K709i
	Com2v1uU6OJrqkEk3n+BdnbyJwiY=
X-Gm-Gg: ASbGncsVTBm+cXx6niwKCbf5OnbVOpWJx8qJVOPtXE8HF8qCY03zCRFnEhFC3TyilwK
	d1k1S3ysS2N635AcTsh0oBBavbds3bDQ=
X-Google-Smtp-Source: AGHT+IHNFF/GKbFCFULGPf7sWZKHfQpR06VsGIF9URj5G0bpXBz7ffdWhNp3VuNmFHIa5U4s+MVbE4ADk3JCewL8aHw=
X-Received: by 2002:a05:6902:10c1:b0:e33:4341:28dd with SMTP id
 3f1490d57ef6-e38f8bdb861mr1785555276.38.1732269073985; Fri, 22 Nov 2024
 01:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121064046.3724726-1-tmyu0@nuvoton.com> <20241121064046.3724726-5-tmyu0@nuvoton.com>
 <08a91d47-ad78-4f7d-896f-b75d7418be1e@wanadoo.fr> <CAOoeyxVjBsmOr=-14iq7pQamJ90j_PBMhQK0Lo=xmvPyqqseGQ@mail.gmail.com>
 <CAMZ6Rq+WePVM2aSk2HzXoa-t+ZE97yeqS6bndpGXUh+NuiM8sg@mail.gmail.com>
In-Reply-To: <CAMZ6Rq+WePVM2aSk2HzXoa-t+ZE97yeqS6bndpGXUh+NuiM8sg@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 22 Nov 2024 17:51:02 +0800
Message-ID: <CAOoeyxUaJwd5_tSLFxUJBB47G0y1p3dr4zeMx3Qkx3KVrQNa9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] can: Add Nuvoton NCT6694 CAN support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B411=E6=
=9C=8822=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:25=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > > +static int nct6694_canfd_start(struct net_device *ndev)
> > > > +{
> > > > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > > > +     struct nct6694_can_cmd0 *buf =3D (struct nct6694_can_cmd0 *)p=
riv->tx_buf;
> > >
> > > Give a more memorable name to buf, for example: bittiming_cmd.
> > >
> >
> > Got it. So, every buf that uses a command must be renamed similarly, ri=
ght?
>
> Yes. Note that you can use different names if you have a better idea.
> It is just that generic names like "buf" or "cmd1" do not tell me what
> this variable actually is. On the contrary, bittiming_cmd tells me
> that this variable holds the payload for the command to set the device
> bittiming. This way, suddenly, the code becomes easier to read and
> understand. As long as your naming conveys this kind of information,
> then I am fine with whatever you choose, just avoid the "buf" or
> "cmd1" names.
>

Understood. I will make the modifications in v3.

> > > > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > > > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittimin=
g;
...
> > > > +static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
> > > > +                                         struct net_device *ndev)
> > > > +{
> > > > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > > > +
> > > > +     if (priv->tx_skb || priv->tx_busy) {
> > > > +             netdev_err(ndev, "hard_xmit called while tx busy\n");
> > > > +             return NETDEV_TX_BUSY;
> > > > +     }
> > > > +
> > > > +     if (can_dev_dropped_skb(ndev, skb))
> > > > +             return NETDEV_TX_OK;
> > > > +
> > > > +     netif_stop_queue(ndev);
> > >
> > > Here, you are inconditionally stopping the queue. Does it mean that y=
our
> > > device is only able to manage one CAN frame at the time?
> > >
> >
> > Yes, we designed it to manage a single CAN frame, so we stop the queue
> > here until a TX event is received to wake queue.
>
> Do you mean that the device is designed to manage only one single CAN
> frame or is the driver designed to only manage one single CAN frame?
> If the device is capable of handling several CAN frames, your driver
> should take advantage of this. Else the driver will slow down the
> communication a lot whenever packets start to accumulate in the TX
> queue.
>

I understand, but our device currently supports handling only one CAN frame=
.

Best regards,
Ming


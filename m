Return-Path: <linux-i2c+bounces-9522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC9A3EF33
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 09:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3771986028C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 08:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66170201264;
	Fri, 21 Feb 2025 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcZy8D0z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D633EA;
	Fri, 21 Feb 2025 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127992; cv=none; b=GUKpvNrUHfnUhsvvPS1hSNjjn3UFyue+6mAphZSAmvYTHTDMav+rKP6zD2of3fk9UsJbOvUOUlCqwk+3+8LWW+8gPeEamS+gNbZIWERVNJ2oTALd3AyjecXJBsvyc4hNtBxJHAbqU9//U/RU837bHS0n/hukf7bSIW+zE/ffP+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127992; c=relaxed/simple;
	bh=AvdfNC/0fw6razFiLTY/gc9KZ7drgzB6pWKOjhOrLtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5WtD3qdRA22DNJoXD+ru+V9A+bepUJJG//is+yzlLlmi1VnUWS5kignSryzXr3tnPynqCi6lPrC5hbpm39lkPRnF9IiJ1y2mGnBBey1QuLb7QSrRvr5zdIqVAaobkKRc9YL1qf5H0TBOVA4eFv9HFC52tvSUvfqf6yAZQ+CTqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcZy8D0z; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6f7031ea11cso16164097b3.2;
        Fri, 21 Feb 2025 00:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740127989; x=1740732789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jR358HQpp23LJWIOUBf9DeNyqJuGtgcMhAeCjLmW/U=;
        b=BcZy8D0zto9bjrGUALgdbZvc/nZroEIhS+3OzzreZRG1XCfkn0YF4qhIHHK+Q5e8ss
         xpUUiFx5evDgFkzF7l/J9VCLs0ldWZW4VZgb+v85U51vsbBmSTDraa8A8bceAdyG+0op
         9l6JhmrVQPTtN9eQmMD+V6nCj/Agt9uFezCu/lBqhT388n834In7S2Cjf0qmmdK1WxW+
         KVnRTTGDIJfEZ4inqnv8Ndm3MsSGsArgo8q6opvKAWSllktM1+CHF9+wVZ99EcLZMIX1
         qngGiMpvKREXrxJq+ravfW3qkU8y+yITohanqx14OhPZH9VQNFFKmkeUqjEX/ZqkpRjt
         aoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740127989; x=1740732789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jR358HQpp23LJWIOUBf9DeNyqJuGtgcMhAeCjLmW/U=;
        b=pw1KJiewqGZO3Ul9nb8hHiNzAVD11V9i1+Jl/4RMcL6dHn8ZY2kK4fTIcun4buoTyR
         1Wv+DDLwxf8PXSCyyY/aP4koG0i0Wcty4GbHFLxLjTxFesvrxugmdAWL1maUzSUofgaP
         83GBfxdaNYffycF8jugevhy/DTeRLAYbOuQPo9ha2ieCBmAhTgI0wPw9w0lrRUcFpUf1
         vmvKMZ5HF72yykvhgSKS83gYbbd6gaoE4X3GVpHFQoBKA4Vdhohvr/jpiNLFV22G//MB
         zuQi3ELw0Or33aHOBb3Y/mjJhrTyGsM2zWYl+3HP9llZBvGjnWT4UnRARsfUanRxFhIw
         BQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCU5mJSkHEHcZB9YiY89VxGl/C0YHD3jckCLQhsecmaZAHyWhzV5s4/JCRvTDehV//N9qobuO38c0E8d@vger.kernel.org, AJvYcCUQZywXUxSOFy8zYuyqYGUDww2mrqurpkBs3FFB+yVCwiVsSGyLqz4Q2Onk5PBxdazI9vZrc8XwO6YXIkE=@vger.kernel.org, AJvYcCV39mu1d6k0eholjyEd+3JQR9ynfMX15am0fqvQlReoZ2hWMBrZ5KHEkgK77naQ7GCHb8W3UCMBVUx3@vger.kernel.org, AJvYcCVyp2XVrou/0GVWi45WLX96f4CWtdRiSaeHnLWGMQbxQAFbYO4leZnu1/RcR42kklW8r7DZNaw+yVozjTQJ@vger.kernel.org, AJvYcCW0JhW8LWooe3xt+9zXjSuOt4532MYJGFruWC9LyDsa6LfVeG9BXQs9FwuJf3qS/bwfBBDCfrn4F0c=@vger.kernel.org, AJvYcCW9LyWJKwZ3EL8Vbca7I5pfs69dfv233WjskQqwBs+M/EbeR6R0iC8t0YS0nX3O38CwIF6HvlUpWJZDCh734OQ=@vger.kernel.org, AJvYcCWRVG0Mts+744JG/7ZKH2aCfXi0Fe3re02d5m82mnDp6ie66LFlbWlUwyOnTqpM+G+rEEoU8xBnn3mpQQ==@vger.kernel.org, AJvYcCWsLr7OIjJiAEAYKzCGeMsWLxYiC2LskkBF2tf0L+bQh69YcU6/6sknu0vz8Agd6aaN0012JGDyt7Lq@vger.kernel.org, AJvYcCXkA87qHcCLpd67LPxH5FwH9v5v7pP2y+6jU7YCV6e5q605S7mE97+YTrAxH8xGbaPxSqt2F0j8@vger.kernel.org
X-Gm-Message-State: AOJu0YxfD4zQQMt5vn+FYW7Dj3JFe+lmrTe6Fo6WCx2B/WMMmMNETNyC
	VAByooZInZeknR7VEJUJiOoxLdlr4nn+8LOW778KnNny8xfbRLwUWPuYUhOA2fgkOdKltsWVZtH
	44CfuiUJklvc05xyuMmw5Uno4OJ8=
X-Gm-Gg: ASbGncuTtMSpJjKNNJKVNMmu3n09ys+BHDXvKGdFVYQ3Xwy7BH+3mxVOjrcD2fmMSKs
	0amYW/mMMO13TE/Dxq2REksD088qPhGSfbAerx/7R4lyFvkJN5NX1w3wsvDTHkwfv5pUgeDwzbG
	K+DEFOQcNdNOW0mbK7tDUz4+og6CXuqUnn55RTV36ntw==
X-Google-Smtp-Source: AGHT+IFFTv7mQS14e9HKcqRG3/KsgEtYDi7b0s/xnrbTYOGNNlU/jBMS8OnkWwa2w46rPzinCnYjeg60XgLeZT96Nxo=
X-Received: by 2002:a05:690c:6404:b0:6f9:a33a:4c09 with SMTP id
 00721157ae682-6fbcc25ef84mr21019997b3.18.1740127989379; Fri, 21 Feb 2025
 00:53:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com> <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
 <CAOoeyxX4guHzUap1ieQ_L3PrvpBAYbMiQKrb6ko=MGsF5RcXLg@mail.gmail.com> <20250221-light-neat-doberman-1166a5-mkl@pengutronix.de>
In-Reply-To: <20250221-light-neat-doberman-1166a5-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 21 Feb 2025 16:52:58 +0800
X-Gm-Features: AWEUYZk6by-3vXQ6oDlfBy8kG3O6ZrNx-AUodUyxeYU9X_L9LPdI1eCwguWgvdM
Message-ID: <CAOoeyxXaCdFS+BLh_2ESyHF3Sf50iVM2A7ys5R+sRFx4gK_U0Q@mail.gmail.com>
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

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B42=E6=9C=8821=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 21.02.2025 16:01:07, Ming Yu wrote:
> > Hi Marc,
> >
> > Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B42=E6=9C=
=887=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:15=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >
> > > > +static irqreturn_t nct6694_can_irq(int irq, void *data)
> > > > +{
> > > > +     struct net_device *ndev =3D data;
> > > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > > +     struct nct6694_can_event *evt =3D priv->event;
> > > > +     struct nct6694_cmd_header cmd_hd =3D {
> > > > +             .mod =3D NCT6694_CAN_MOD,
> > > > +             .cmd =3D NCT6694_CAN_EVENT,
> > > > +             .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, NCT6694=
_CAN_EVENT_MASK),
> > > > +             .len =3D cpu_to_le16(sizeof(priv->event))
> > > > +     };
> > > > +     irqreturn_t handled =3D IRQ_NONE;
> > > > +     int can_idx =3D priv->can_idx;
> > > > +     int ret;
> > >
> > > it would make sense to have a event pointer here instead of the can_i=
dx?
> > >
> > >         const struct nct6694_can_event *event =3D &priv->event[priv->=
can_idx];
> > >
> > The CAN Event command always returns 16bytes: the first 8 bytes
> > correspond to the CAN0 event, and the last 8 bytes correspond to the
> > CAN1 event. Therefore, the event pointer here refers to both event
> > buffers.
>
> Yes, but in the following code uses "priv->event[can_idx]" several
> times, this is why I proposed to have a dedicated "struct
> nct6694_can_event *event" variable.
>
Okay, I'll update the code.


Thanks,
Ming


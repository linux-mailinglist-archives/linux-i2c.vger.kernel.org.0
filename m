Return-Path: <linux-i2c+bounces-9840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C146FA63B0E
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 03:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D2BD16AC49
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 02:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3916014F125;
	Mon, 17 Mar 2025 02:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIdItIuj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A009199BC;
	Mon, 17 Mar 2025 02:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742177303; cv=none; b=gq9rjgxyEZLdXAWSJmj6RRjvt2viDnmy0xTV28MkAWENHyDlVbt/9DoCyFPVK1w0XFebT4jNt4mUv62iSwan3dWny/9iAENnB3y8ThCJp4/75RFpH6wpNXua4Akust2czo5xkVfOJha4JDGmF7wS2reIBeXTDgxUyp3jJlTchDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742177303; c=relaxed/simple;
	bh=QaRY5HDn4qZdHT4CHd0qF1U0hRXV9ApWSJPYDKsV0Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaijLmXadenkSVbCIhDawequg02SQ/b0xFLk25oCaI6Goaum1jAcbEnvoybRJL7+yeICuy9xO46UdB5/lyGMf5RA+7bPVV2N56BEUeiJnNBzcYETHzf35KxpEA9u/Cf5y4YG/IzDlbZw8IPO1GO77cDt26GTL/PlLc7a3V2Hsqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIdItIuj; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ef9b8b4f13so35809397b3.2;
        Sun, 16 Mar 2025 19:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742177300; x=1742782100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WerE0F29wDAv86fT8ZPWFA4+BX54BGcqnjcPvPcGEis=;
        b=hIdItIuj3p0iDZQp2sHSvedzeKMfe+6Nz46ZAGFI2u0HawGChEx1ED4NTRcug1aa1K
         eCZ+kewEI+QF0ZEwAiIr7mHbx4Q8S6XADSn637Lxrg0qoJMiRGY6WFwQFTkgxc6ifoU/
         cdKARD+SCsHHdmYH2V4EOG0Ocjbz/WgmruHbrv8qdDzwqB4GkZiL5uKlY8FqKJ7N2/iG
         kChxQ4qqTcLxiGEy3qo4VCn5vE3Ett73neYAyhHbmT70dIIsHyjHMNfeTSWiyMPFV6dM
         EwkiVsztqUsNrh+25QDTHDqQDuGvWOxoWB+u17cXAFWikpOKECTzFed5MlZOQB5N7pxd
         sFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742177300; x=1742782100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WerE0F29wDAv86fT8ZPWFA4+BX54BGcqnjcPvPcGEis=;
        b=iV1GYvQBWLaR0doCitBpQxhBZ1bPk2Vtg3pTLcj5SV3J7ahzCyFJ4OWxbrh/zUQhZx
         OJ0OtwsTfx2JleS75Nq9UXrozMljnjsRvToKQIwtaIgul8rr+l0ewrffnUtPKy/RIXep
         OXZ9XkfZ2HQhLKiFaTiQYL9PVMJPSC4aNCK37QeGCRcK24E3zPIG0JLovF1t/YgWnM4E
         wsE/gim2KHp6X9f0sw1fDVzT3zC2e5nf5edYjo62V4QVwPXRLAUOeUQhoYSQA6/sl/rT
         KQc0epL0Z+IMkA16CGJPFP24nqFDLMsLyR5K5Eh+pAxNB7EkVcW+qR5TO8IZ/S9H1447
         Bohg==
X-Forwarded-Encrypted: i=1; AJvYcCUNivoByxdOFzpNifi4xuR+WG4DKsWZUE4RQwLvdDj86s2GZCTuksImOaOHpRhbNAwSMdQfqcwUCJA=@vger.kernel.org, AJvYcCUhXSU8FDXUANHZ0BZktI0+NI7lW6I0ydxLOuvVRL9wiKa3i2k19n2rx8XogeG/GCDzYsubfdTGFZUP@vger.kernel.org, AJvYcCVAaQlrX4mR3Amg2GHntxcesW/RodqgcGr9cewylgMc0BxI91cQak+UY/FaJglXWr2X2t6dLVjfbmtLmAZ2ZJY=@vger.kernel.org, AJvYcCVYig/djRBobAdy/Zuf8YOVGJa+j5Dq91C6YHUBOldje0cHDO8UqKy7UoeiGb6x19jRGAYEYGYprY/5@vger.kernel.org, AJvYcCW4QlLr9u7UGEJBmlwO/niqiaTzrbdDG/K1tBdbsh6y69IsmLmaRnSGDQq08AKfgLNjeT0KUDrX2kc+8Q==@vger.kernel.org, AJvYcCWDxGmeI4hVfgmypjCnXrd1mKEzQwEjOf9ogFDbp8TRuRd+CIp10gjX6YAALk3xwcs9SDLRsJY2pehvFl4O@vger.kernel.org, AJvYcCWVPO/pAppxYvvJw8CoCJW/iQWMqHny8pIgO28FQK5OeiVnQgFxYht/fM9UJAbU5f0R3SmjttybV9TLoOU=@vger.kernel.org, AJvYcCWvBB9pbbtPhsDK55WpeafBF7OqNUmXq5ulpL1XUATP7mk1Dd0y5XNul1c3GyBC6FhMZkn5jmfh@vger.kernel.org, AJvYcCXsrHwc7ccHBu7wwokYlO1rRILmePu8kXnkt5AqxleyCZlaF+IrOkgXfEwYN9d+2s/n7giSoCursR23@vger.kernel.org
X-Gm-Message-State: AOJu0YyKfopNvlvWFqDpT+KPqYmGtZC9/d0zPRSKeM/H1rMG5E20OGSm
	m5Iw/ENz8s8ZomqarZGvxE8Gaah3MYIkJHCm/Pm/yR8y07r0ULSegYA0K3KLLHnXfoX9r0nSyTx
	2TGh/P/kotScKQKMdwoTkd7iBK7A=
X-Gm-Gg: ASbGnct5OkdmV3j3rlwx2Y1p2SRIaIHfwCB5ZP0EmhXQwDvqU70xZzzMx9jv3owQc9t
	JpG1ol95EAC74hVhFYYfRqx3On1go7G10Z8cQ0wsD8LLdjwgu2CJfU6oVwr5MgK5vmtVeDOX7R4
	qencJcIRsHFW6fjhsowhEqECDl03HZKmHOg+cwTVhHpeVsm9f4uz0EbAC6+iCW
X-Google-Smtp-Source: AGHT+IEbNRK83jrLYbJn98E/VJiprTqBAgHhzfTQIkBb0acooaKjAt7JcBiej9fE7M2xDLsYZ0g1wrc/E0KHPTcBM7Y=
X-Received: by 2002:a05:690c:7301:b0:6fe:b88e:4d86 with SMTP id
 00721157ae682-6ff45f43fe1mr136588587b3.9.1742177300126; Sun, 16 Mar 2025
 19:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com> <a32b4ca1-0bcf-48e4-87ab-61fbd077a3c3@wanadoo.fr>
 <20250227-gregarious-garrulous-echidna-ca7975-mkl@pengutronix.de>
In-Reply-To: <20250227-gregarious-garrulous-echidna-ca7975-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 17 Mar 2025 10:08:09 +0800
X-Gm-Features: AQ5f1Jrjkl7Ix93j9Sl_5v0Y4G-UoTbJZQ10uY1K0suSPPo5FMkQ-SCMR1tpC-o
Message-ID: <CAOoeyxUgRK=Rw0XuYD0raGmv9RGxqMHXofmyytXd+bRxEaBpxQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, tmyu0@nuvoton.com, 
	lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Marc,

Thank you for reviewing,

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B42=E6=9C=8827=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:17=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On 27.02.2025 11:08:50, Vincent Mailhol wrote:
> > > +static int nct6694_can_stop(struct net_device *ndev)
> > > +{
> > > +   struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > +
> > > +   priv->can.ctrlmode =3D CAN_CTRLMODE_LISTENONLY;
> >
> > Hmmm, when Marc asked you to put the device in listen only mode, I thin=
k
> > he meant that you set it on the device side (i.e. flag
> > NCT6694_CAN_SETTING_CTRL1_MON) and not on the driver side. If you set
> > CAN_CTRLMODE_LISTENONLY flag, that will be reported in the netlink
> > interface. So you should not change that flag.
>
> ACK
>
> > But before that, did you check the datasheet? Don't you have a device
> > flag to actually turn the device off (e.g. sleep mode)?
>
> Please test that the ifup -> ifdown -> ifup sequence works properly,
> even on a busy bus and on a bus without with a 2nd CAN station that is
> sending and you are the only receiver.
>

Understood.


Best regards,
Ming


Return-Path: <linux-i2c+bounces-10054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D138A7425C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 03:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33A2C17A86A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 02:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435FB20E018;
	Fri, 28 Mar 2025 02:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9Rm8R9q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD96224F6;
	Fri, 28 Mar 2025 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743129469; cv=none; b=udGSJWA7vN91QF9CLQ03MFePe55Z5TRTAmo+ELZJSAKg/V5T9kuvTrNPzBc5iCFRIGBNHGBIs6jihRCa3hpbixRGjPN+bWlc6d7O93QnZUK2bdn0LMr3IXOOZvqOI6D+4ZkbRIVf9rm0MG7kafVLlTitky3dyOMuP9maqpXjok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743129469; c=relaxed/simple;
	bh=8VdUetZ7XSbNdldMYhCuY+zyfCHSXJq5QXgqttchYZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0fd4jvD5vwLU4w8nJkhE4i46flM/hisnH5axT2u6Ru4JuEa0FzpAmQJ3AOIrUgtN14L6rTlQVQjBcT58SAiG95GfCrELvll2UGYLXS88oFDIsXbGw5rDOnuK8oeJQcubywb2DuoMKErADDiNWTmR4N7CFwYAv+K/i6TJE5CYeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9Rm8R9q; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6febf391132so17248147b3.1;
        Thu, 27 Mar 2025 19:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743129465; x=1743734265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GU28AGd9UzkKZ2wP0uOwi7wHu7jsmeCOCAXcHHxD6M=;
        b=X9Rm8R9qbUoRneqPufK1I55UOIovCTfuVn7jaY8mxgi/KVGnYejA40Xfu2BIOeeHSX
         JWPcfixz/sK5qKnJvdvnuOU3IJB8XqbvrOOblIqFyUBMFLdKmXqoOIML93e4Wnte54yr
         mow/TgBq4dgfc/LXOayywD+UxDPyhbUPS6FXhRRq1Js3KGNqNdlRk3wwZR2xHZN9NnFT
         e2WXNATj0cef4+zVFWsdqYgQonN7leqXqB5soObZJszKbfzgxyXO3/wiTGq6GexYu2EQ
         fXvxO/isys/dZIOmc9umYJUyhbOgeXtOszY22grW0wF5zzkIwAV9az5bTpK6pGolw2Rl
         gcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743129465; x=1743734265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GU28AGd9UzkKZ2wP0uOwi7wHu7jsmeCOCAXcHHxD6M=;
        b=ZO/kVJDy32Iwg7/TpJ1v9apXWpIfgQDop2NGU6LBFvsZGocIDVI3MvkQylRTDBktcj
         f6Le28s2HJVQrMPY3YJbTKPHmBtYPRzqzXWZEX8jJOZllpJXS6//wZ5ajbD30ZbhbTgw
         d8E0Op0Bzd1yHWlU1pTd8xa1J7BxgPpXbY248FD85JF1h+iIv8l48oGftzhjNRXPyLeH
         Vu+pzDShH/SIja47wa3LKawZXQjkQ8t8Nv8MOETquLmcEu1r+C9nPYqXrNO4KomNH2aw
         bws3DKZiF6Ib5uQX4bA5BUSTQv9Xy64sxpzh2/FMWiCqWZV1xOwiAkAtdlzLWU8iJWeI
         PYcA==
X-Forwarded-Encrypted: i=1; AJvYcCU4CGM383Fz6eUy46nSU6JUWc7dXqz5v27w4BW8yPNQD1nF4oZVQNsuRlkk+1/NiNzHjH6+hKJ2wDyDlQ==@vger.kernel.org, AJvYcCUUZmzZ3j8vEffVH2YFyhmaFYfISZczVfSf9i3nuZWqhfk+f13CR4tGCjttAkKS/rn2stjJBCtbu1nu@vger.kernel.org, AJvYcCVBoq/AGcMsdow1YuHZHTRiAB+w9SwzC72NFwspyujWnmpou28iP8q1B902280G0I2lk8vVJa6GEvY=@vger.kernel.org, AJvYcCVC5ZFaOqGRL3OAshwaNDWg0LXotuvtmBm3mgQ2GQ9PNMr//acgGjWo+0xgKdRs6RJc1MjnLIsWv7Wz@vger.kernel.org, AJvYcCVVnM9qcs909jU2ggSVN8ro6iPURMHk7816zUPaCuiAtMv8JTmw0dFAuhOt9BIXJXjC9KmGy1W/Ecq1@vger.kernel.org, AJvYcCVp+95I9UkYVLmzHn1Px6yw7PO/w/HHTuPzPBVWQhAaw7VRwaMu2Vk775nQuv2rnE0qS2FOb1uLmbmf9aJ8aSE=@vger.kernel.org, AJvYcCVw/sy+DFF5WmiVJbu7shtcbP2y7yelTFNUicVP5ccy4r/3Pkd+Q6NMjJd1A1/PxuLIM1wtBJD3RVG++zRE@vger.kernel.org, AJvYcCVzErkJ/qS6fDM2N+1NumEvxpRrDLRLajyDFenrYdOjpCA7TRgQh6GvLCILKYl1XHedd0q/cfoq@vger.kernel.org, AJvYcCX2RRyIBQoE4dYUEOo9bOIPs3cZCpXbbVpLXoHyPf5oBFue2nK5FupWd/7VnMbBtgZ7Jq4jWAMrXrfQUNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0d+WIk7LVdIpG0vzktq2iUC72Hb7vrB2CTpVeUjPxXb6lDtH
	ZsV7EL1ACmRnnNb02npFhct3STsCJbJqm1NIhTar8SjZh/Uze8fGxlnGPNDxoUPqXsThhlS0PhJ
	PuznUDy2zYCB7IQHgHP8qi88qaPevxQ==
X-Gm-Gg: ASbGncvNmMATsR6iHAzryUGav3emf+/94n5i4GJd4I3w7uih+YusxnIZu0upFTwOjcn
	UCMrxuiM1dKAlrR4otbx2B/8QivqhHGWwfPdmPtLmhg+8q/Bg/HPsgdF/cGIrdlcYDgT4KO7PVi
	dUBMatW0Zj5+w3NBemA1XFD5HI1Oyr7CkFf1fLnIxxEHKDZoPGJ+a+yOVP
X-Google-Smtp-Source: AGHT+IHOG7iBfbwOCAkCrj+zd2ekYGaqnGivRImk2Y9FvwnBEMCf7PKrjNYgFJdxvqYgl9G07WIFNT9mvTFJJt5g/60=
X-Received: by 2002:a05:690c:48c1:b0:6fd:2fcf:12f5 with SMTP id
 00721157ae682-702250aedfemr85769427b3.27.1743129465091; Thu, 27 Mar 2025
 19:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com> <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
 <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com>
 <20250317-cuttlefish-of-simple-champagne-ee666c-mkl@pengutronix.de>
 <CAOoeyxXSC3rjeB0g5BtHKvKy-Y9Dszd5X9WuHeBeH1bk39d_Eg@mail.gmail.com>
 <20250326-inventive-lavender-carp-1efca5-mkl@pengutronix.de>
 <CAOoeyxXw1x2HVXQYzxc1OuGimn7XPfCjj-aB=jAAfw733b_9OQ@mail.gmail.com> <20250327-awesome-mutant-cuscus-0f0314-mkl@pengutronix.de>
In-Reply-To: <20250327-awesome-mutant-cuscus-0f0314-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 28 Mar 2025 10:37:33 +0800
X-Gm-Features: AQ5f1JqhxPwd2S-wZQFXmJxMw8Ubb20oYpWkuak_vFPYWhy8Ch8Vy9Zr_nIuAfk
Message-ID: <CAOoeyxWa5sB+YS6W=oG7xUeizXxigkdw3b=7w9aGftCWzWsw2A@mail.gmail.com>
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
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:25=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 27.03.2025 13:38:22, Ming Yu wrote:
> > Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=
=8827=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:41=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >
> > > > > > > > +     priv->can.clock.freq =3D can_clk;
> > > > > > > > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_=
nominal_const;
> > > > > > > > +     priv->can.data_bittiming_const =3D &nct6694_can_bitti=
ming_data_const;
> > > > > > > > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > > > > > > > +     priv->can.do_get_berr_counter =3D nct6694_can_get_ber=
r_counter;
> > > > > > > > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBAC=
K |
> > > > > > > > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_R=
EPORTING |
> > > > > > > > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> > > > > > >
> > > > > > > Does your device run in CAN-FD mode all the time? If so, plea=
se use
> > > > > > > can_set_static_ctrlmode() to set it after priv->can.ctrlmode_=
supported
> > > > > > > and remove CAN_CTRLMODE_FD from ctrlmode_supported.
> > > > > > >
> > > > > >
> > > > > > Our device is designed to allow users to dynamically switch bet=
ween
> > > > > > Classical CAN and CAN-FD mode via ip link set ... fd on/off.
> > > > > > Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_supporte=
d, and
> > > > > > can_set_static_ctrlmode() is not suitable in this case.
> > > > > > Please let me know if you have any concerns about this approach=
.
> > > > >
> > > > > Where do you evaluate if the user has configured CAN_CTRLMODE_FD =
or not?
> > > > >
> > > >
> > > > Sorry, I was previously confused about our device's control mode. I
> > > > will use can_set_static_ctrlmode() to set CAN_FD mode in the next
> > > > patch.
> > >
> > > Does your device support CAN-CC only mode? Does your device support t=
o
> > > switch between CAN-CC only and CAN-FD mode?
> > >
> >
> > Our device supports both CAN-CC and CAN-FD mode.
>
> This doesn't answer my question:
>
> Does your device support CAN-CC only mode?
>

It can dynamically switch between CAN-CC and CAN-FD mode when
trasmitting or receiving, depending on whether the nct6694_can_frame
passs the flag with NCT6694_CAN_FRAME_FLAG_FD.


Thanks,
Ming


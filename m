Return-Path: <linux-i2c+bounces-10048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAEFA729F1
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 06:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B75C216D3D0
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 05:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD7C1C3BFC;
	Thu, 27 Mar 2025 05:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOJzgHG1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D332A83CC7;
	Thu, 27 Mar 2025 05:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743053919; cv=none; b=LPI47Rm3aNxe2EVkXvcVfbv/HYLfU54XG7x/HFVaNm3XYH0rSukj0qeKvCZ8dmhaFiRc8Igetz25IIM6xzQ/XKmIRzC/QfZIJj3sUWuiYj42E4QZk+DGsZchVMJ61N1g4HYCrIA0CBWyAtm5n5ocEbsnUkXXdHg4oKmFOopOa2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743053919; c=relaxed/simple;
	bh=24i7HBzmg1Y/Pb50F99CjuJq8G9fArWMz0O4zZDVb4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACdNnTHLuYHPqSJinj5+2bxUbOIFZeeCG1rPiBQxBEDAm/7eTd2A+GJtjcic/t0m6VaAi7PRIVw3rQCUWJmpS4Cq9yY4BVKOD/1LusBnETcggmtHVHtEyPvrEzcNCC0dwQotjcoU6rqaLiGajgn5HiZrf4+ElIrLaZse/53IuUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOJzgHG1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so853283a12.0;
        Wed, 26 Mar 2025 22:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743053916; x=1743658716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEihfJ4ccIwm2OdmKc9Yshv/glNPrxHPhUYPq46sWO4=;
        b=YOJzgHG1n0jDxN4VcLn6GvJVsUpWFxV/Wozv0ofbNAS8UGISffcGy3lyw1Th5soH+Z
         MebTQCzEpEjftfiFow72lHGmNkmYl6zGf4Mt43WCzVlFs4mKT+3dybt/hFAkzTAS5oHr
         iEkR7Er/xGvxyCX1QlS4WOrfxXpzhwWQXDs/etwDTn3p1akNBLG4PgnhCX3puVDuoVN7
         BrJsM64xiNNWzK5+T3kLjZEbYXhXqlPlDi5ZDlRRHcLbJA573Rrnhn9Q3K6EzxALUolD
         vupfB52VmL1nzhRBjQgRcxmBbkziAHAv2eUTgz56ZvVAbZCwpGYKn0AxDYEB02G4LIsC
         xumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743053916; x=1743658716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEihfJ4ccIwm2OdmKc9Yshv/glNPrxHPhUYPq46sWO4=;
        b=eBeb82v3T8RjUX4lbVmM7ntbG75no+HsCCNfGBODTpacaGbPuHSE6FTqHc52CP7CH7
         6TSIZ//K2Ve/1ukoiNSh1EJiTlB4rJeV/g7XG8AybR9BBqJ+t1zaSF7FCyeFbGKlaRhA
         U0eqOkkiQzm79TJdN7uO3DrGS8e119szF/SLzlLWQ7ceXOfVoObX5mjxqlgO1krZ0+Bw
         NzqozBzHL0H8RvGeQoLvj3LPLTt5WJaiic6TwWbkOwz9Jgpqe3FScV0uFMx8KkwZDhyY
         2MrIQ6nwPzaTaCkE6D4pbr2KVpFrh59eN6O+fmjKnj0f1qzyn/3302cwBQ9O6yEfquHI
         cRpg==
X-Forwarded-Encrypted: i=1; AJvYcCUPsh66o/Jj4vRTtAj5xlBCAag1pkUROXTUvIc6TApbGg10en/qUxYCnRCUJvIec/3biIyvpxl6FcqM@vger.kernel.org, AJvYcCUeZHxK56UO07iHEDlU6D69uT7rdB+FVzQF7iIxySiylkOOhvSEGfsmh8+Jrlkb78uyol5vaZupIKodVNXj@vger.kernel.org, AJvYcCUkYNddfvx6qe9hisnLu1FBHiNYcvqJ1mH6v6zFjNykjtTy2jkDXbuGMFsAW7wn8tkBwhU0ApLV@vger.kernel.org, AJvYcCUmqfYb6A6alGm1PulffuCN5GmitB9eT/WK6mQuGQKz1IwZjxrjn8ME7uctcjrE8Eo++ovRxfsbDNj59Q==@vger.kernel.org, AJvYcCUv3Y6WTk+9J6CGYB9PIIYeYcU2VCx1I8qs+yEOHKSH+Y4asVgpQeYPpFWqKyvk8s0bks6jS401HeQZ@vger.kernel.org, AJvYcCV6AONvTlcKML0OBNlBAFxOFz52BNAfTgbZag1vgHlVzOed1XX/nmm+6Kw5C/aulRPoLSfiV6ks5dnXG38tyqM=@vger.kernel.org, AJvYcCVqpl9sK3NrdAFApdINZXUjsGzVUKhX29AuWlynIFxmyXvmt3jnlRYYUCuibRj8M8xGkJQGKjUtSBA=@vger.kernel.org, AJvYcCWfKLcGJIucV8lFfFg/h8Q/4KpyabT00O0Jo/7jBr1X2YvSW0HLT37Q+lwO6R1O8ahClofq2dJLyXRcQHU=@vger.kernel.org, AJvYcCX0IyDa8bbjb0902Q9kBuh8FTYwSmDpRlhFrMH1vfPzYVRMkOiw8TiYrJpUmQzNOS1hWLi9bIkyxqNy@vger.kernel.org
X-Gm-Message-State: AOJu0YyZlZMTNCFZhUHuQp00gdW5d3rCJVtZqwtAYX/SHbTxOChg1ou1
	b8fJ/SdC1UOVCyvERNZVbmhYCkzhDb+VAQj9OlFJ2EeX7FvL+EIAqylEuAei1vngNY0QrCBwdyX
	Fgi+4d3dCy+Wc+FxR61aiJOo8iyk=
X-Gm-Gg: ASbGncs+lT95UpkwxojUwCPx1CLOQ9zD/DUD9efbjrILri8ep1FgVaDzJ1GAlLYUea4
	20NgVz/aUCo+mTshK8xsb/jlw+1p2AxAOZ6B5fNx+MMBWiLcj+GdXhPmp9t0ZchkRiZ6fzdPPTz
	bETo9viXtvq6lFV55YgAyLZqXg94kO3aExy7z1Mhuzg6xXa8gm6cKcjP6a9WsGlYvk8pOhkkQ=
X-Google-Smtp-Source: AGHT+IHELdNB91VYLFLjAbKGVENJUvBqrv8fyp7t3sj12vFCeisc8IASCRc7/obfLlMnXTCczI1ipHuaCXia3+WL37I=
X-Received: by 2002:a17:907:1b27:b0:ac3:48e4:f8bb with SMTP id
 a640c23a62f3a-ac6fb0ff0cemr205599766b.41.1743053915742; Wed, 26 Mar 2025
 22:38:35 -0700 (PDT)
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
 <CAOoeyxXSC3rjeB0g5BtHKvKy-Y9Dszd5X9WuHeBeH1bk39d_Eg@mail.gmail.com> <20250326-inventive-lavender-carp-1efca5-mkl@pengutronix.de>
In-Reply-To: <20250326-inventive-lavender-carp-1efca5-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 27 Mar 2025 13:38:22 +0800
X-Gm-Features: AQ5f1JowskiduytSBp9N8KWLXt0RE_gU_jLrcjPD0WJE4dtxm3E_6kLUCKZJyco
Message-ID: <CAOoeyxXw1x2HVXQYzxc1OuGimn7XPfCjj-aB=jAAfw733b_9OQ@mail.gmail.com>
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
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:41=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > > > > > +     priv->can.clock.freq =3D can_clk;
> > > > > > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_nomi=
nal_const;
> > > > > > +     priv->can.data_bittiming_const =3D &nct6694_can_bittiming=
_data_const;
> > > > > > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > > > > > +     priv->can.do_get_berr_counter =3D nct6694_can_get_berr_co=
unter;
> > > > > > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> > > > > > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPOR=
TING |
> > > > > > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> > > > >
> > > > > Does your device run in CAN-FD mode all the time? If so, please u=
se
> > > > > can_set_static_ctrlmode() to set it after priv->can.ctrlmode_supp=
orted
> > > > > and remove CAN_CTRLMODE_FD from ctrlmode_supported.
> > > > >
> > > >
> > > > Our device is designed to allow users to dynamically switch between
> > > > Classical CAN and CAN-FD mode via ip link set ... fd on/off.
> > > > Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_supported, a=
nd
> > > > can_set_static_ctrlmode() is not suitable in this case.
> > > > Please let me know if you have any concerns about this approach.
> > >
> > > Where do you evaluate if the user has configured CAN_CTRLMODE_FD or n=
ot?
> > >
> >
> > Sorry, I was previously confused about our device's control mode. I
> > will use can_set_static_ctrlmode() to set CAN_FD mode in the next
> > patch.
>
> Does your device support CAN-CC only mode? Does your device support to
> switch between CAN-CC only and CAN-FD mode?
>

Our device supports both CAN-CC and CAN-FD mode.


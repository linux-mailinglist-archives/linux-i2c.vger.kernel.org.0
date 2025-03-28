Return-Path: <linux-i2c+bounces-10056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC7A745CD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 09:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C282A17C16B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 08:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29732135CB;
	Fri, 28 Mar 2025 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8Qpccc+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE721147C;
	Fri, 28 Mar 2025 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152280; cv=none; b=LOXJyiarJz+Jx0AL2+5m454NwHDTMrQp+pE1jvUjyUeWL6Bw1nzOgRv95uOQM6GlGMtv2QGW6F47fnrpu3hDCSywvX90OFo8ZLTZJLj2gmMM9JpLCW0FjKorHGCJ8B3rbtfv/9tZD+lN48jqZUsyXqDyxWh51lW+gsYutS2/x+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152280; c=relaxed/simple;
	bh=xYLXywumfYcBE2gdZINxZy+YFrU0fq7kxGGQ+cSsn0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHvJeB6S44PwmYQzyUL57vUSfmVX6BBYGuKBygwl8NUSZCrRogqyPFt4ZshENAvzc8LGEji1zMVsVqCuKF1MeClf1xlMMAEsr8+YrzREj9rU9Y0OJVsoz7AJFP6yrS7llwSzJfOnkGeO0Ug7Rdl4tPwSZj7U9Nf+rpSfAhV3Ddg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8Qpccc+; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e461015fbd4so1577430276.2;
        Fri, 28 Mar 2025 01:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743152277; x=1743757077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWPb1mI/9upCcqkogSbWtUh32Sdpc2DRyu7FzyouqhI=;
        b=c8Qpccc+IDLMbbKQiG+H7j0cwHx6h97nUuOE7O3ItKoqzSvIai/Vu2Q56+3+WXz5yM
         73VhaIaDXeIIHZGllYkK0l2ZtyMCfgj5UMoXmoVJdflnNajUERagkMX9jiChSR84PLRy
         YJOs0qANhcZ2t0ROPNdGCloscM4jfrOg5Ai7SjghZkDaoGO7vTtCtj3FILN/zdph1Xum
         Q9dnStoRp6ectxCBhRqeiI+nMTTXEeuKBLyKcuOqp3zayxE8LI5JQ2ZOBwJWH6T8V6fC
         Ny+wxbHflHxaHh8DOvBM3VAOFFlw8GHOU4JQoF5fjPexWHY09mQ23T0e+TKw3eWiPLKC
         /nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743152277; x=1743757077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWPb1mI/9upCcqkogSbWtUh32Sdpc2DRyu7FzyouqhI=;
        b=Vj9gCBGo4DTTTYPLVEA5fCcP2jNdBOYRO7ucBCCSSMbcWatKTiE+EaahppMgORY2fF
         kgdCDEqb9U0FJkh5CGoffTWdJYWHry3xC0devzUBuaziQi/rainIUSWxBCXoULtTRBgp
         PFv0sRtkevCwB9NDSIjC9ak/5RF3FSL5IIZIud2bSWLYRf+qqIADwvBrisKz4dTRn89v
         GhHB5MaGewBnZBgdWI85VscqBMadfNzkGckEP40rOfDhGelVxYD/MvB7sPXCm2T5HWDH
         8EFFO1BsedVYrzeBj9lATsfq9BV1AQbYXwQgoV7O51w46FipkBYWvRfWn9UsS3CpPMRP
         ZCnw==
X-Forwarded-Encrypted: i=1; AJvYcCUAOzt0TW8eVFcrxBVbuXusSEBimiolrjHVY6HbJcM2Hyx2/c0nQSwEhMXHT71KJcnzTCwx259ucE2Xnxuex/0=@vger.kernel.org, AJvYcCUZeAejiXHTXarfHUd1pSMkmJqFuCLfYj+qRZOT9h/UCsTjB3I8Ya9aR/MT9dHhyvvvrhQQuEsb@vger.kernel.org, AJvYcCUyPDbZ5gawXisjKDq3Q1vc4JIrlbWNetx7I8BSjIbEJ1mrjabhe1K0pEP3kKsHi25OPnrMSSDzCJQ9PMU=@vger.kernel.org, AJvYcCVds2TmvnvNRKsPTzT0RtqlAtcxsJHAh/kQvo9tlwayJ6SB3J4Ifvj3XErxzuG3usmAka6wUQ0qmz0=@vger.kernel.org, AJvYcCViS8wmhHrxfo8WSiaO+urahGvGdruMWhwsARHoZJcB/Jxj/4D98JftYnaal/k1y6Kx5lGd55i7b6nB@vger.kernel.org, AJvYcCWfSM+LC00bloVC/dK9JpSUSQNMx6ZuD4T8J0uYYp14Y9RxKv2Q4AWacykD7O3Y5DyBgl7u6KQD8aQA@vger.kernel.org, AJvYcCWkyfLP7RnvkyRR1/h8gXEBXFfO/1nowZCk2ckq3d4yzoBIV5CyKBz0iVcfrQJs/lYHpwCrgsM7U6A0@vger.kernel.org, AJvYcCWxmWgwF5imLVmCINyH5tPZi+peEcj+0qnb/h/cDVk5+5T8AeTJy5JO41OmPWgRhCc6A6B4KQSkAc0kEA==@vger.kernel.org, AJvYcCXKZqclMosWzW7Wx/kdNFpq88Z/ON48TNA/rfEJThGTASQIwPJqiE4NxChRnhOvTJHJxYr22YDO9E9iKaLH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx91q8QHscCj7o997BN12xXshS2Ba3hbFIos32EZ72ydQ6hb7CX
	1kOZ2bliLgVDYSRx6VCkJaCYjtnZmcAnn7uIFg2DC2XtDfi9lp3S+TmDDIKUV7LmvP5MAES3IoQ
	e8iSma/ICi7ChSXRqW1jqr2mHIks=
X-Gm-Gg: ASbGncvsznS1oiGZG3nDH3qzkjP0VF4thqM7ge9K9oUz1ajTEGCatCmPC9J1LAu+jpI
	DuFwL91FUaZErTTP1mz0s1XybXrgHYjI4o9yaxD3lT5Rhn0lTvpRy6Y1wYOPWG2uol2AZsFRXPN
	5BE6D7dy1jDPn1HKuhFKFyF4lGMxgOu80PSqDj9JOhaQbuvlfd1SmtppFz
X-Google-Smtp-Source: AGHT+IFLLC9PtZXtkSzNtOYuXckibCE5a+SweHKkkBiwOPRXFXjjbhxDt6SFVeqrDzFpbxVVVSlFSPuYln+B4xj4Dd8=
X-Received: by 2002:a05:6902:2806:b0:e5d:ddd2:8acf with SMTP id
 3f1490d57ef6-e69437fd4afmr7959068276.38.1743152277453; Fri, 28 Mar 2025
 01:57:57 -0700 (PDT)
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
 <CAOoeyxXw1x2HVXQYzxc1OuGimn7XPfCjj-aB=jAAfw733b_9OQ@mail.gmail.com>
 <20250327-awesome-mutant-cuscus-0f0314-mkl@pengutronix.de>
 <CAOoeyxWa5sB+YS6W=oG7xUeizXxigkdw3b=7w9aGftCWzWsw2A@mail.gmail.com> <20250328-smart-thundering-asp-2536b0-mkl@pengutronix.de>
In-Reply-To: <20250328-smart-thundering-asp-2536b0-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 28 Mar 2025 16:57:46 +0800
X-Gm-Features: AQ5f1JqFFh94KtgZpMrBv-osA_XLKd_POUmZCUtvpqZF_h4Uo1CEEcQaSnNuCO4
Message-ID: <CAOoeyxWy7n32iD03sr+8jPwf5OpHaCe_itkRnzOQK8GC32A9+A@mail.gmail.com>
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

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > > > > > > > > > +     priv->can.clock.freq =3D can_clk;
> > > > > > > > > > +     priv->can.bittiming_const =3D &nct6694_can_bittim=
ing_nominal_const;
> > > > > > > > > > +     priv->can.data_bittiming_const =3D &nct6694_can_b=
ittiming_data_const;
> > > > > > > > > > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > > > > > > > > > +     priv->can.do_get_berr_counter =3D nct6694_can_get=
_berr_counter;
> > > > > > > > > > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOO=
PBACK |
> > > > > > > > > > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BE=
RR_REPORTING |
> > > > > > > > > > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO=
;
> > > > > > > > >
> > > > > > > > > Does your device run in CAN-FD mode all the time? If so, =
please use
> > > > > > > > > can_set_static_ctrlmode() to set it after priv->can.ctrlm=
ode_supported
> > > > > > > > > and remove CAN_CTRLMODE_FD from ctrlmode_supported.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Our device is designed to allow users to dynamically switch=
 between
> > > > > > > > Classical CAN and CAN-FD mode via ip link set ... fd on/off=
.
> > > > > > > > Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_supp=
orted, and
> > > > > > > > can_set_static_ctrlmode() is not suitable in this case.
> > > > > > > > Please let me know if you have any concerns about this appr=
oach.
> > > > > > >
> > > > > > > Where do you evaluate if the user has configured CAN_CTRLMODE=
_FD or not?
> > > > > > >
> > > > > >
> > > > > > Sorry, I was previously confused about our device's control mod=
e. I
> > > > > > will use can_set_static_ctrlmode() to set CAN_FD mode in the ne=
xt
> > > > > > patch.
> > > > >
> > > > > Does your device support CAN-CC only mode? Does your device suppo=
rt to
> > > > > switch between CAN-CC only and CAN-FD mode?
> > > > >
> > > >
> > > > Our device supports both CAN-CC and CAN-FD mode.
> > >
> > > This doesn't answer my question:
> > >
> > > Does your device support CAN-CC only mode?
> >
> > It can dynamically switch between CAN-CC and CAN-FD mode when
> > trasmitting or receiving, depending on whether the nct6694_can_frame
> > passs the flag with NCT6694_CAN_FRAME_FLAG_FD.
>
> Ok, but what about the receive path? Does the device support CAN-CC only
> mode? Will it throw an error, if it receives a CAN-FD frame?
>

No, it can receive both CAN-CC and CAN-FD frames, if the hardware
receives a CAN-FD frame, the firmware will set the
NCT6694_CAN_FRAME_FLAG_FD flag.


Return-Path: <linux-i2c+bounces-9374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B973A31C7B
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 03:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21B8C188ACCD
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 02:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA991D8A10;
	Wed, 12 Feb 2025 02:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahTuZaHh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7BA1D79A0;
	Wed, 12 Feb 2025 02:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739329174; cv=none; b=lGTLQOxx1ad+4DCT8j6s0kChEsRpzx0ihJV4quqKI8lfq61/vPlqgxH/cFdrn7PDCD6bkfpyH4SPwweT8y5ACr0iLM3/CjY4Vgu3NwGDAUOi1rEOFR9vtQtsI2SVUr/HMNe/Rw558MgiE4rfT2+IPTb7dqrbY+FSopUpCX8jkno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739329174; c=relaxed/simple;
	bh=DooFRktCEVvA6ei7DrdVf0d7v1fgelgEfdO5aKcqTDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjDV4Kp7yFCeROoTJ0v8eRqvAwD+Be01DJlIEAgceLHuP4AzA5hHVZuFgtrC97yZpwbjv3hOymEgi1Vjd62VY7HHIIgeOdWuslQAdWMX0SvzIinA4AutMpVhlPe2ZZ9izHB5UUOGvch5T37JVt7VV2pUa/IIQ7VAcu/CuokkEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahTuZaHh; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f972c031efso3614467b3.1;
        Tue, 11 Feb 2025 18:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739329171; x=1739933971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFr81poCk30co8Z6rUcjrZ/vaw48HOEFaFkI76fkyJc=;
        b=ahTuZaHhgBht2YLJHM+JHOGjrQX3MYf0ZgEq0CqXS3suSQMY9idO0xn0ZcYyGD69Pu
         6ZeFqj/tJlfRpDBWqYGwBQJFTRY7DttKUsGYBekG7QeQFwafAmVLg1LQYAkcHahclBrH
         N4LHFT8XB4My3wcFsHgu3256+SubaBxH/0JxwKBBfVUOeI6ZqcUm8cGFpFVsoNLaGm9n
         XQKglwaiF25WMtWNA9qt+x55jMMeGiLUkotg81o/eCEViiJr91BFvQZ/ywGBOen14fl4
         u09r0JKXci8fEaiEAoN4wck31IOg2aoaY2v3R1IE+X7drlFK0lL/473tZnKLfzpk76dP
         4/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739329171; x=1739933971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFr81poCk30co8Z6rUcjrZ/vaw48HOEFaFkI76fkyJc=;
        b=BD6rLZrQK70FhrVK3/3T19gS8auyk3quoQXHbN/w1Ui0Ppcj4LX47+ydBS7PwSSXjk
         sPYXkFZxU3kY0W3SgOT7wF5KgUDaU/bNugeXpl+BW6SzxUsQ1dIdVnRoG6TDteRQwbfl
         5pWLenew031rJkDGtQrFhtdLXXZ6jSCO5Rtc0Co+IXt5ZkWoAL4Ddx2ERWgr5IvC7TCz
         fqke+GBDz6bX8fo+ce4qYgbEdtit1+1g2zmeBjsHM7JQEcbQNbx3K6le625iwmU8GGWa
         2Ae/CQhYBXuc1oW9baGpzWWfKlrMm9gj8v/E2+F7inAfVn753AtiSDRcbCmtLcV7+zWJ
         YhlA==
X-Forwarded-Encrypted: i=1; AJvYcCUh4OI3Dzt0ey7mFqpC1zLfK7NfV7xoA0Nkuv2SpvLN51+DkINssiZmanwnre99gCT8o+0Vue4ZD/8=@vger.kernel.org, AJvYcCUlPqYB+LqnYo0L+gmYkIMlSB0gJCLQ9gHs6Tjz5O2983ClxD1j6wtq3FKru85+GlvBmbK2JQ5O@vger.kernel.org, AJvYcCVGK2WM0Gd8O2KV/ggfY5my+kchSTW01Jcp4FpL7ebwvJYn5aWgXXdgajNtTrPQIlJbnC83WXXK6/nc@vger.kernel.org, AJvYcCWawiVqSlZ843MTNpZwXUkdG9PwRwuY/hqf2Jn+ZY4SWSHqxGOiF/0FYxNbxyVk9b9+SHvPkD6uEi6F@vger.kernel.org, AJvYcCWc41cql8FYlVh0dLU2rGiV7OGM7rqAHQpShOzEDDYE3sqzSqGz4Mdzvca4bAjHCPCVrVcVJ6uKacmh@vger.kernel.org, AJvYcCWehDpp4nb/F8EQo3qCrnGCshWvkDnANbi8tCnsUGVsHXmDM7G9GxUb9uWZiPU4c4SfHRVuIlxURy17RHk=@vger.kernel.org, AJvYcCWnXdKPVmcjHCP8ap1s2YdKniGoskvAC43C8WA3PgkWAO3hROxp8n5GODyex7UFRpJ3aZEWk7VOjjYzYEjfI3U=@vger.kernel.org, AJvYcCWzO+MXdJTCHumWhMz5NmkCELZ/pMfBf2ZrF8uQ1e0SnolEVQzu5ZQiNn0gmC6ds2TDxOR0iLztohuitP2W@vger.kernel.org, AJvYcCXi1/0JgWBXGzs8TnyduKD1uZRHyZGyq7OyARTE80RwMJHryd+it/P+Swe3Fl13VzfQeD2zzIIFNpYlvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9LH8w9CSIz6XleCnBtjz1tWYiBHMqvAAtiyZ8ecoDrx6naCSj
	WYsVAShiWCA7EjO00hQS6IdW2b/te4IwNpCRREPjZjXeA+yiSfZCaDI1dzbfB641mkgQ6JlKVsE
	gO2IrU+H2/oN3YpipVnnv/3pX1y8=
X-Gm-Gg: ASbGnctqdGJr/xiXqg/xV3NIJBYnkUXc+oNEq06uAHFU8C60NRkUUOkwRKNBuaiBePk
	3qNKlE9xS/WmSwI0WBzxK7ywyoMbaIkERnkK78qfFvlNk0u4O1Lby6zNMdzWwOeTSXnNHg987mZ
	oXgAmlnt/pKOxGGz0wnI3Z1xarR3ksZ6o=
X-Google-Smtp-Source: AGHT+IGAAjKu3ijuvkklPj1UHUI20qu2CCBoL8o01Rki7jfm8ulRSwOxj+9C0sqtYuH7rLF8eGtDo4a4fre+pXEsE2k=
X-Received: by 2002:a05:690c:c01:b0:6f9:4f93:c80f with SMTP id
 00721157ae682-6fb208b8e92mr12977497b3.6.1739329171475; Tue, 11 Feb 2025
 18:59:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com> <c714463f-e027-470d-82d8-3905f5107d6c@wanadoo.fr>
In-Reply-To: <c714463f-e027-470d-82d8-3905f5107d6c@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 12 Feb 2025 10:59:20 +0800
X-Gm-Features: AWEUYZlq8C-6fOlQaMyUi7TbWeoU_-OcuCn2P7TSMwOHCZmUYpYmx6cJl4mufqA
Message-ID: <CAOoeyxUu+RuLsuctC-swDWmNi1WTVrVv26FuDOUmibaL7njXzw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christophe,

Thank you for reviewing,
I will make the change in the next patch.


Best regards,
Ming

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E6=96=BC 2025=E5=B9=B42=
=E6=9C=888=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:18=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Le 07/02/2025 =C3=A0 08:44, Ming Yu a =C3=A9crit :
> > This driver supports Socket CANFD functionality for NCT6694 MFD
> > device based on USB interface.
>
> ...
>
> > +static int nct6694_can_start(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_setting *setting;
>
> Could be:
> struct nct6694_can_setting *setting __free(kfree) =3D NULL;
>
> to slightly simplify code below.
>
>
> > +     struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_SETTING,
> > +             .sel =3D priv->can_idx,
> > +             .len =3D cpu_to_le16(sizeof(*setting))
> > +     };
>
> ...
>
> > +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> > +{
> > +     struct nct6694_can_information *info;
>
> Could be:
> struct nct6694_can_information *info __free(kfree) =3D NULL;
>
> to slightly simplify code below.
>
> > +     static const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_INFORMATION,
> > +             .sel =3D NCT6694_CAN_INFORMATION_SEL,
> > +             .len =3D cpu_to_le16(sizeof(*info))
> > +     };
> > +     int ret, can_clk;
> > +
> > +     info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
>
> ...
>
> CJ
>


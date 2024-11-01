Return-Path: <linux-i2c+bounces-7700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E329B88A2
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 02:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A13BEB217FB
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 01:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04E276034;
	Fri,  1 Nov 2024 01:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhh8Bb/f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8187711F;
	Fri,  1 Nov 2024 01:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730425076; cv=none; b=q69UR8mhJq1rn/BzH2hw2yHSzCQWz7nl/M4bt9IjB17des/dzg6yK9aY6aLNfuXfQFLjgczlaPWHWeBkLyWA5wvFxAM9lrjmzdVwudcgK8AdLqhG5YvNXg4aS9SBfmXLOHXEPykc/5xNlRBS9uukVeFn9csQppkSiGFI4of94vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730425076; c=relaxed/simple;
	bh=3OAYULfp98mPfTYoSG7P+xyokyLv+MDuyg6w9vj+u8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhQJyOqb3PhKKtWmIuEJsAoR4boKdiqx76fJ7HyBtXvXHipQkMB5hYOvOxp7O8Z8Hd20yCoF3eh0p7Spdx38kQtRnsn9p6yKe6oSWsJIfuUe9UsIal/ftmy8ODgi7aVZsZFxd/ogfoPG8D1hXr4hQxDLO6ZeH39TyQafcEAgt3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhh8Bb/f; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e290e857d56so1442200276.1;
        Thu, 31 Oct 2024 18:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730425070; x=1731029870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lmlvJeeA7f+8fFGrXM3GeA8saPwvYrRvzv4KSfHdsH0=;
        b=dhh8Bb/fPgR3PxvDavHCom/aMjgi4uBafJrQ0BiZ9hVdLGxU0zdxQIuPwreDt7XRbi
         5YC5r/1wNWTGbBwe+BbupvfCdLkYH3kSdtrsrNVtxbY8Dex8X4g3FM8EdyFtYZrMDz3+
         ewifm7Uw6hsJbOAYWZDWahTyJdX76gsFrqUuMgk82hDPBFSmuXVLKvtvRgMttL2J8y3R
         +ocZr+3NkFR8q/Zmi6p2wXhybkK2mW9/BUArAKEiLymmrdqs3dSJy1Ao7s0JlfLsYo0U
         BxOkw7s6EUbbCO/GDcfea9LwTfBHiVYGLutLEgp+O9M4qfsTPHPSOV3btSvs9SOR7TWQ
         Pwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730425070; x=1731029870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmlvJeeA7f+8fFGrXM3GeA8saPwvYrRvzv4KSfHdsH0=;
        b=fcGonGu1IcgLquiCqrT1ilh5XKmmme6s9XfznKaF1TK1JNI84a34L/ZmmY3jFjcTdW
         yZDrgUWMTp8mDhtjtqpvdQDT2GaaO9xYtQj628ppWumCDVRFxRevIpwngvLRB+2fvGNq
         WLPkD0G7Q5wevxSfyxhK4TR+16PADh96f3JrqlckxZqGGX7rPmIgI47UVRtF1lNarsWO
         qbb9S9thGH9r6j2M+vLUCBI14zJPDMKiG1MEGW+7utURTIPnZNdFok39OUc6Zlvn9ZEE
         mDXJ3RPqVwSBP+MDGnP7Lz8o1+6X3UdMwbsp6Vp9kim8TxoUdK2CFYsz2At6zYTTPaNc
         7Ipw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Zc1Y7AfA3WrUQCz6/aot+73UeXL0orZfDaSQbpLWXSCOM2Qyn22o2m6rcUWQ+bLS7YxxjfX/T6Y9b+Y=@vger.kernel.org, AJvYcCUP2BG6RCJHDG/h9ef4h7C7j7AnBPKmpxWV7r2A7AOSgBORa+sTvaOnY1NwmGuvr9KVq/Sgga8njNhh@vger.kernel.org, AJvYcCUdc4h1Ay8b069Wvsmd1inhCVvI3ELXMzqcTTQxNw1uoA/PWbQHz97uyc9TTOHHQlA46l2c4cxVL2BB@vger.kernel.org, AJvYcCVyjQ9tPVDFEPSLyyjnxAdA56r346a/mRyGUKKAZH12pZpLpMe/bzzV0WFVO0FcgBWa37GK/c8u84o8gd9YaTw=@vger.kernel.org, AJvYcCX+9bZc4qdhx0bCO20nwsWW0g9lj3YG9OGSX053ervM5IuPbDlGJG2NAT3DkQXwUhD1w+FoVIHneATVO4Pw@vger.kernel.org, AJvYcCX202FdVYhxppFwOSWDvs9T8O0qfcm8baXxjvYoIEU+1WOEVYV8DbrP+/nGGuNkIDqIqlCQ7iZJt9uY@vger.kernel.org, AJvYcCXW9YQB7vptsK5EemAaOZN3XGjbMB0QPHN91thWaLmIHRBrXSWLtFJnfc1uXx0xLZy+AbFvjsKpg90=@vger.kernel.org, AJvYcCXXyZGuwftHPaItE5Kc+MM1PfIcya2OwbL5mYzV7J7vFdWfgCYdzv9IF8A9DT+EBeMW6kU0JTdZ@vger.kernel.org, AJvYcCXcCZKa5wu66IQQeZZpJF9VkiLhPMyMPqNWMUPaHiFT4odF7pbh4iTdyU2kd1Z84dU/NKr6RFj3V4jSHQ==@vger.kernel.org, AJvYcCXg0sPOyqrGPJr3AKG+ga5zFJMJPwwm
 BPAm8UYRDosKP4+GxlWRinP9MO+J4cEjgbaimUSJtDa4BR+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4MSf/6188/GMKwq7R5V95onJXgk58aZF4j+lo0az0/9HdkrWq
	3gtmyNvhUiyKl06GY0LDV8Q7z5OF9Crs18TBcP3wvX7pEj2/pTRY9L4EczWWByEP3t3RdQO7h64
	SFMSI1orhbsxgQB5qUB8EuIAYb0U=
X-Google-Smtp-Source: AGHT+IGUCFRCbOABKarC+7/IZgd0y9bKHTlvWQq1cBwZjmdD+cAjLmqd2MBJvCw7CLHhYxbwbCQuHhy48gGHRVd5dNQ=
X-Received: by 2002:a05:690c:6807:b0:6e2:43ea:54e with SMTP id
 00721157ae682-6e9d8996ecemr242741927b3.21.1730425069827; Thu, 31 Oct 2024
 18:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-5-tmyu0@nuvoton.com>
 <20241024-poetic-offbeat-alligator-d6b9fe-mkl@pengutronix.de>
In-Reply-To: <20241024-poetic-offbeat-alligator-d6b9fe-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 1 Nov 2024 09:37:38 +0800
Message-ID: <CAOoeyxXp+2SSV06Zk_6roYeGNyCcRo+26CejJahR1j03v45DqA@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >  MAINTAINERS                     |   1 +
> >  drivers/net/can/Kconfig         |  10 +
> >  drivers/net/can/Makefile        |   1 +
> >  drivers/net/can/nct6694_canfd.c | 843 ++++++++++++++++++++++++++++++++
>
> FTBFS:
>
> | make[5]: *** No rule to make target 'drivers/net/can/nct6604_canfd.o', needed by 'drivers/net/can/'.  Stop.
>
> [...]
>
> > diff --git a/drivers/net/can/Makefile b/drivers/net/can/Makefile
> > index a71db2cfe990..825c011aead5 100644
> > --- a/drivers/net/can/Makefile
> > +++ b/drivers/net/can/Makefile
> > @@ -28,6 +28,7 @@ obj-$(CONFIG_CAN_JANZ_ICAN3)        += janz-ican3.o
> >  obj-$(CONFIG_CAN_KVASER_PCIEFD)      += kvaser_pciefd.o
> >  obj-$(CONFIG_CAN_MSCAN)              += mscan/
> >  obj-$(CONFIG_CAN_M_CAN)              += m_can/
> > +obj-$(CONFIG_CAN_NCT6694)    += nct6604_canfd.o
>                                    ^^^^^^^^^^^^^^^

^^^^^^^^^^^^^^^^
> >  obj-$(CONFIG_CAN_PEAK_PCIEFD)        += peak_canfd/
> >  obj-$(CONFIG_CAN_SJA1000)    += sja1000/
> >  obj-$(CONFIG_CAN_SUN4I)              += sun4i_can.o
> > diff --git a/drivers/net/can/nct6694_canfd.c b/drivers/net/can/nct6694_canfd.c
> > new file mode 100644
> > index 000000000000..d873a9fd656d
> > --- /dev/null
> > +++ b/drivers/net/can/nct6694_canfd.c
>                         ^^^^^^^^^^^^^^^
>
> This doesn't compile :(
>

Sorry for the typo, it should be nct6694_canfd.o in the Makefile,
I will modify it in the next patch,

Thanks,
Ming


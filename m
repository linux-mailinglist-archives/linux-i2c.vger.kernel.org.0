Return-Path: <linux-i2c+bounces-7572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0819AFC6A
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 812C0283484
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 08:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A5A1D2716;
	Fri, 25 Oct 2024 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQYhnB4o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8AA1CEEB8;
	Fri, 25 Oct 2024 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729844535; cv=none; b=oCS0QTUQcYbyTf88sI6z8IMQSVv0kQv8EZEITpwF+RpsMPrfyzDqBvwOncLAepls1qJ+Ncnw0X2fgLbBOMNel+gQMTAwFHWQ38mJ9blm/TwP94r3OEZOumlFnUOHLxv/lPihiosZJN9wL4F+5D/GQ1NeTezUwfReKAkMJdDfd6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729844535; c=relaxed/simple;
	bh=x8rZodnf8ac0ZpEWU2b8KZAV0PQi91+L5iJHdiYtySo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDr0KZJ3b/Yj/C29KvyH/fErdJo+kXoaOWEsfeROZKGqqmoDZk312ij+9WFBneWUF4jRihuNifQs6w4bYdawca8x6BVPtyKQiQpuXC/9YdD1MkiSA7itEvT2oJILOWmXtwx48E+58ZsKqOtyZNc7uLQfG3m1L3cHm9S0bdAJQug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQYhnB4o; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e29047bec8fso2367882276.0;
        Fri, 25 Oct 2024 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729844532; x=1730449332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lL2oS0YktvrsPrRrJIeMnN8NVRP/4oerPn2G6Of3l+4=;
        b=eQYhnB4o6+7uxjiKH6+3beHm0ItS14c2wk+McYzOsvW/TkZCm4EwAnqMaYTQe1GDDF
         t0wcoOpVrMoygWGs2SfGw9NYeIc4Gx0+vyHJgFZf3CRmL19UMogK6OE4qCgXa0UlUzZP
         AoeVRFjZLM4PpkwP0zDQl/QvDweGObvOCWAoBjZ6jobeJ2swcxw3Ujvg7jtEpZVnu5rg
         goTXcRYLmm+BdN4kCwtn1j4fUkexE63BLAMoEYdg27wZdjUCXYZm3cFEQPqQ9YPOFaJI
         Ydf0cGJD2xmuSbDdJsNkTupL7p0DkKAiINNgTtuwsppJfCGosqn4oy1GrjKG53Jlyla5
         5Q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729844532; x=1730449332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lL2oS0YktvrsPrRrJIeMnN8NVRP/4oerPn2G6Of3l+4=;
        b=h6chT5Rv38/CtJX2fH2FNV0O/BPOu01fWXSjx89tPZiTadSzZ4lL0GMtPlaa6Lkhq4
         lO9rV8MPlWHW7MfcuU6GgWf+py11NqasCJHJzZCS4A0FvdvSgD+VPsjIoMnQcm2G6tHe
         nqaiZf3oYjJMRgD/A+HDqD9PHrAPOC5TJ1i7pqXAw/mHh9J/0a1yDAQHUTetHskmX5sv
         h8pWBzGLpDchEQ2Us9fElxadrR7qP4mBRKEO8YxflGyOQI7i4srxXWMOI3fmdib5UP3Q
         4M2vHOgoOW0XoB3lxphwlhaQFACTaondkXKVjmSMCwgfJGY3iVlfjC0Kqo1N3I+f/eGD
         xD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh4k2PIh8x8Sbk71pdXsIPtHpW2n9O0m4+9Y5aYYysh/9QLwOM4jrUO/D+A15fQX3axYuMmH7TL0Wj@vger.kernel.org, AJvYcCUiCIarmEyiCDaXNJqNzzhiWzjNpe+yUmexPvXrKVSNI8FFfGr9pPr8bIZO35X4k/mFdnRZkQUpDfHL5zLj@vger.kernel.org, AJvYcCUkSz0/NhKt73nakDq+HR0PCzRU7Y8XqDq4EAnT8q41WB6qm1ZJ/y6/EnKuLWSv8uUIrBp/25Af@vger.kernel.org, AJvYcCVC81WJ9UZlbprCmzy+YC09lJIRnmLAjSjCxtIngvCAc/adoIuSEaJKRVLpbNOhyTs2btnukYAu5a6X@vger.kernel.org, AJvYcCVh2DnWAApZqyJuWatTxJ4sl+9Kbwruz8XkCDnzVDNNvv7jf866TuZUWUSdILcGeFpk+KjCaMARATo=@vger.kernel.org, AJvYcCW3OxEaQvqhSDBsMrwo5/y1g87a7XowdnhXbu1nAS3KJP1ELpFkJH2hcDO+wzW1lzARSoOdm2NMJd+fLg==@vger.kernel.org, AJvYcCWKHthdLV29VrY9eevUrkx4oAwmAKr5tk0JQH19t/i5pbXoYlfc869XSZpubUCazCRg098s8vOxQMfE+nx9AoY=@vger.kernel.org, AJvYcCWh5su91xfsD1/2uRkOyLz/6qOvm0rfnyjRPkeTHAYxDIxvzwv2/EkYED7sje3DhZF/1x9sdtCWsUgt@vger.kernel.org, AJvYcCWj0yXr+vB7Mj+Ex+VaGDciG0MOF6yWsQFGl+Vze5c3vI5jkAhx0MB36tIGAlrF47hkBjpPeWZ3BLHT@vger.kernel.org, AJvYcCXmBJ0jHCnm7osQQoE8SYaEE+OaIQGErFk1
 YUMx3yMMB6qGJ+te7NOLmGyGcTkhbn7PhrDFOsfkAYcQSmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxraOD1XTosJxbXDYdaVB1SnZ35wqghyBBOPnGYkhiCyhkKl/GM
	ndd3BJY+kzpQ1nM8tDk7JWExZZtBBg1sTPg/l4Jcev8Qu9DA9QKlC/r5VNL7CX0MBbVIFz2lOli
	n2ai+0Olprb20vVFdZxTAffaeG0k=
X-Google-Smtp-Source: AGHT+IGswWLtmTH2YZsqayr1ackkkF40ut5Lz5EUzWoFXyNGEnqBEMH07NaaK55v6Pgq3zgx07E6YGfxRTIviZtiysk=
X-Received: by 2002:a05:6902:1785:b0:e29:3359:e127 with SMTP id
 3f1490d57ef6-e2eb38fe011mr3541344276.4.1729844532190; Fri, 25 Oct 2024
 01:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024-eminent-dancing-narwhal-8f25dd-mkl@pengutronix.de>
In-Reply-To: <20241024-eminent-dancing-narwhal-8f25dd-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 16:22:01 +0800
Message-ID: <CAOoeyxV4K=jR+tofeQtsMB7+smuu+Ghas5Tqfx4JvhuVK8dXrA@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Add Nuvoton NCT6694 MFD devices
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
Content-Transfer-Encoding: quoted-printable

Hi Marc,

I think the currently planned IRQ process meets expectations.
Is there anything that needs improvement?

Thanks,
Ming

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:57=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 24.10.2024 16:59:13, Ming Yu wrote:
> > This patch series introduces support for Nuvoton NCT6694, a peripheral
> > expander based on USB interface. It models the chip as an MFD driver
> > (1/9), GPIO driver(2/9), I2C Adapter driver(3/9), CANfd driver(4/9),
> > WDT driver(5/9), HWMON driver(6/9), IIO driver(7/9), PWM driver(8/9),
> > and RTC driver(9/9).
> >
> > The MFD driver implements USB device functionality to issue
> > custom-define USB bulk pipe packets for NCT6694. Each child device can
> > use the USB functions nct6694_read_msg() and nct6694_write_msg() to iss=
ue
> > a command. They can also register a handler function that will be calle=
d
> > when the USB device receives its interrupt pipe.
>
> What about implementing a proper IRQ demux handler instead?
>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |


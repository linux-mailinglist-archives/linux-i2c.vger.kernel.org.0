Return-Path: <linux-i2c+bounces-8666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 665CF9F9275
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 13:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DA497A33BA
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 12:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E08D2153D0;
	Fri, 20 Dec 2024 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eonzgd44"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF4F1C3F3B
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698754; cv=none; b=qYfdAibryUjzNDiR+2pNBeDsR3UBDEBZeryZNcEqNnHs1yvXlGN8PYakeOsQu6WMLuH9784CL+1OIBsNq4XE2d8UYMANmIj77Em/Q5c5JN8RGo/96n8Pq3hkVmTPDAAs0CsfzK6+JqfXXDUqQGz9g1ediY0dVlMdZHS6IqHsQYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698754; c=relaxed/simple;
	bh=eIvJgkvy6HRuXmDaqsB7MX3E+E+alDS9//+kZ9m0t6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9qk6Qceo8qEHStZeLhRva6GHwe9MiwEANDzVaLw30ZvQ8Q7Gu2wKUQ7SRZFzpxw2WhYg9z8LNbQHQD7PRD3uwACy8Fx7S/6UrS0CchaFfRn5+oRlkqQfrcF3Lkb+Ijo+GQF2eZmy39Kq/5mZ55h6wadN52kw/GAfO4PGiNryiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eonzgd44; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-540201cfedbso1765820e87.3
        for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 04:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698751; x=1735303551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+v+f0F+ggXM/pkSaGIpemMgLpckgFL+0mqDxCkmiPc=;
        b=eonzgd44hq3ryZG4G65d3usc9iXHmng4QZBz+h6huIRQtPiVzd8RqWpA+IvNyM+afe
         YSWw9pW+g9evbv7WQDtxPQL1j4xjpZvknXtudiwsU6vptgsEq5T45djbDMx9oq08Z5Pb
         wHpiDNUwSNMr2BRGWYATXXMgeuXmIYcaq8l8MWI7JKjIuyAS3BHXB4u2TJMn1nGUaFrS
         DkeTwG3ALTAeLR+y2oWzvNSO6XeFlCYbWXxthmz21GuYLFIN5Rthn2jPyzdNlQfyi1AK
         3Lz6v5eEoF+S0jKzSXWxiUSGNiDGB4I5CH1bDAQzsNjwuup9MQmUM2QI5e7yELEGw6fY
         rXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698751; x=1735303551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+v+f0F+ggXM/pkSaGIpemMgLpckgFL+0mqDxCkmiPc=;
        b=Q/qsY94H7LNnzD+C4AeAAMFdQ9tSH+3r/nQ9NTpnmVVZ96shQRPfcon+i9J3zM7k9P
         OkH4vcZU2KENoPE9hN9cqOG5RL6NtgzIhPZO0DhS0pcoyiAwmQp52rbnzNx1fwz3poXN
         n0KrKFukF3+mxdsSlzYvKpXRbvcDn04tqhgPu0IlscScmmkQc5unBnJq5p7PFq1wsHtf
         1Bvujn4owCvO1fimPtN7EmRtam6hgiAmxkyawXOamJrPkHxcjNQii5KbjFX/KRkkOFbi
         IsYTFDs65e79YuBDGMNk6GXygO1aJ4iF5DJZ6fVv6I8gUXqUTfatMN5ooqUaXrOVlcJX
         A1rw==
X-Forwarded-Encrypted: i=1; AJvYcCWoTQ2DH+qyz5O153Ed7n9oqYzAx3AYsJiAcbOG7pXxgCqc+cGyyGbjj7tsU3bLBSonKBCqwCmQafY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTYb81SQdIIgzPX1tBueXwFzM1bkurHZ4CqoIJhSyt/ELi6g3l
	DtYE2RbcDQwtrDDWah3P1oeNM29pX2dLZY+IyLIqQ3PybnH/2LHVCpJA5txH03rGYWUUqPqWXG+
	zx1wybOYG2Os5wVOoTcnIU8N+Q3/2zhFmoQhGMw==
X-Gm-Gg: ASbGncsghQA4utIaIpiD7AoEDCzfAZuw9GXFGnXmqh14gLf8F6N71zlFGkMdZCDJ9GQ
	pUoNUollbBQYcPJZbB07M4668yncWYIcLIfg0ig==
X-Google-Smtp-Source: AGHT+IFQLxoTvDBhmmMtrluimmMG49UjGriPLeDS3/xO9K0D1RUiifqIPS/6LdImELHSoCVS/nonG7W60F+gutNSGmY=
X-Received: by 2002:a05:6512:3f25:b0:540:1be6:f15f with SMTP id
 2adb3069b0e04-542294aceebmr908589e87.0.1734698751140; Fri, 20 Dec 2024
 04:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-2-tmyu0@nuvoton.com>
In-Reply-To: <20241210104524.2466586-2-tmyu0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:45:39 +0100
Message-ID: <CACRpkdZh4hCvBN=7beFEgm-mmdwSTW1fd8OZhQO3kr6Cy7P=dA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

thanks for your patch!

On Tue, Dec 10, 2024 at 11:45=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:

> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
>
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
>
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
(...)
> +       while (*int_status) {
> +               int irq =3D __ffs(*int_status);
> +
> +               if (*int_status & (1 << irq))
> +                       generic_handle_irq_safe(irq_find_mapping(nct6694-=
>domain, irq));
> +
> +               *int_status &=3D ~(1 << irq);

What about doing what you do in the GPIO driver and
#include <linux/bits.h>

And search and replace "(1 << irq)" with BIT(irq)?

PS the main reason we do this is because

int a =3D (1 << 31);

becomes a negative number on 32bit machines, and
can lead to confusing side effects. BIT() always work
on unsigned.

Yours,
Linus Walleij


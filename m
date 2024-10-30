Return-Path: <linux-i2c+bounces-7669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1799B65A0
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 15:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B03821C24886
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 14:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96551F12EE;
	Wed, 30 Oct 2024 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZRfhihB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A6C13C;
	Wed, 30 Oct 2024 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730298084; cv=none; b=kKWRR/HOtxtFigYpTVFpyYti8tLbZOJzzwld3YH16mJXQMWEvDLskKg/Tip5OAeTk5Xu9RCGUZ2EW9F1NlORAKyEmVc/lcHJOkMG9Lh8LT2dffGHlmHyEbDmpxgDuNAock7jgDHwvRhpGCedj6PkG8nbIcTyIpjHIfe1QVXSz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730298084; c=relaxed/simple;
	bh=bgOvNyxM1biWcyfhRvIlKkBu8+hSrIZJM9KA7N8pO9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpnRGxs1Bd97AwOUAi6nm3ZLdzf9ueXSxfg+ZWHkBKNe9305hQjxP7htb1/Tka3QGPJSVnDc3k4Tewz7qv8KCnS42PADGQ2g81g3Gkc5cN0HNC0xDuSLj3mAZxyoE0a8/9spWg6uKspRl8u3cu/YFNpZBUeXh5V09PMHUrbcT3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZRfhihB; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e290e857d56so6273141276.1;
        Wed, 30 Oct 2024 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730298081; x=1730902881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHmWJLAn/9laEJxekdnxjm8UsDMhYqG1tJ/wt9SJ9OU=;
        b=OZRfhihB1RSFRiQZIYCRpM+xQwtPAw8+ag3cxQPvjFlIsuEST4eQM5ctBi4SiY92fV
         +TP5C3Ll7MM21/TOkewjYvrNtJmL9fvpDqBZwTuHDfhR3xifjcnzIjeA05uL3oRrJucR
         hPi1LIsz2c4kkrYxMqFsAM39OQBsnLiZE+KmkT979UXT0MGTxJWFYUdrkGsaJQy6PhfS
         gx+waNAI1UkQQ+axm6GWr23yhNTE7VfyV3wsbFyeYCHL7iq2Uhjds7VnPViiS0a1PTZh
         QZiZp1YKdB7utIFkehqOLzGJQK1dBGFT867ThBTd7vw8cPHpwkLUjV3xFED1/CyB+9et
         QqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730298081; x=1730902881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHmWJLAn/9laEJxekdnxjm8UsDMhYqG1tJ/wt9SJ9OU=;
        b=mdbXyxq7IuG9D5H+iOEVZpH1wVM9wwV2+udq0Y8SyTZo5ngTgl/DlR1t9C5RPpc9bG
         UVrnRIxhqfVMVRzoh0tcFtf3SlMXZGY+Y1uomu1tR7nE2vxEN/mkZ5THOSzS2Zl4wOry
         N9Hja4wzJ8CwfGpNGg5m/lv53Wg1OSooizK9Y+S6x0gtjywlT0Q6EorsO3/uZqhiXhnE
         dXAhssopgQARqpHQQPuwSKLjKxk7IG10tH4LlhEg+gFLEvbY063VXC1FMEinrySUoSyx
         Cv/HQOz/hUmy9gMKnK6uj3DUZt2P9KEYwPTKnbhGXqqcy0+QETJQkcyjPiSTydAXSRyE
         gxiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdmjxWA5HaRz9eOBWnJwBvbikO3ijEkjrT9S5vcJw3f7uWgT/VjfbKnBlZDaFMGKRFHh/EZVUHnI38ew==@vger.kernel.org, AJvYcCUyme4PEsCO+7fM+2oQ8C4KnVj9Djtbfi2L+c+26AIc8G3xqubTJlNdnS6W71cAalEpKJ7D5yw8PqEa@vger.kernel.org, AJvYcCV0BeRSyuKjNekrJ+pvjF4EHv6PE0rXNw682geKf0TgOyTxyvLy04v/PfdTZEC6sN9WUST6/awI+CR+@vger.kernel.org, AJvYcCVCE8FIzPk6Gp5GH7n3+W4KehWfmJVkd5w8nuQ9zkX6H5QSV5ZcAcXgcGcRb2rl6BP3od5dR5k8lGjc@vger.kernel.org, AJvYcCWHdGZnO1uoEI+8PcfYVqo8jP6kleNRvU0O6eh+M+k61/4EzZXMje8klVkWMXLfG00Wwyqiunf97L4=@vger.kernel.org, AJvYcCWxomMWOISYgN/oljYLCdEQNjBgk8MVClwWl8s+i+lsCpzKGyNeDziAN6BPWq0czFxNdsgJJUcPQrFCHOQkzbM=@vger.kernel.org, AJvYcCXD6NYzciX1DThfUJlygTHZ+YJwt4AHZnABpUiO4uPhk/lcm23t/mL46p4HdkUCPcSidfnEyWCZbIOewWiH@vger.kernel.org, AJvYcCXQMleB2sakRCeoVoau1nbftjjXuOaA4mlPflJQaTvUob9G0dDfJBPc/YgmJ1eZryo/GfJV+gbUBtnJ@vger.kernel.org, AJvYcCXc3wFUTw7chbWZvoRpspylZbazFRP7grt9Sn8q+M3YZXoCDIYrs3l6DBUIdTXgL9ppVTONKT/pO8Yo+2s=@vger.kernel.org, AJvYcCXg7lBdSrWD00Rqk5I7GpHJ1nnK
 eWcJX5BoCezDuLQVUmGxYgAwG0WU+H9z74PG1lSaA5XBLSDf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9taKdlZ7n38xhsxTiz4wWdpWcXnrUpOqZiApuF6kHv1GHps5C
	2ePChBf+5KjTbxZjkHohBF5yNWmfxcc/54+Ys5845QClfU4T03Bu+b9uwGRYMpsZ7eDAo/19xNE
	IxIBAKX2vkyXEmMykO1USuOtgygk=
X-Google-Smtp-Source: AGHT+IGKheT7lugnX8JlgJMn7QT/nmS4FJcCiGvJE3Pk7raMagj1Ij4TOsIejWemk17tl9iiaN1879b2lAZo9ua6oSM=
X-Received: by 2002:a05:6902:c10:b0:e24:a0da:f89c with SMTP id
 3f1490d57ef6-e3087b7c21bmr15483239276.30.1730298081498; Wed, 30 Oct 2024
 07:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024-eminent-dancing-narwhal-8f25dd-mkl@pengutronix.de>
 <CAOoeyxV4K=jR+tofeQtsMB7+smuu+Ghas5Tqfx4JvhuVK8dXrA@mail.gmail.com>
 <20241025-modest-hasty-angelfish-1e9193-mkl@pengutronix.de>
 <CAOoeyxU9VwsM=mRZy5AtjH=V3iSGQxkKw18qL+yeUxkh1OVHgQ@mail.gmail.com> <20241030-industrious-sidewinder-of-strength-efbe4a-mkl@pengutronix.de>
In-Reply-To: <20241030-industrious-sidewinder-of-strength-efbe4a-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 30 Oct 2024 22:21:07 +0800
Message-ID: <CAOoeyxUiFoU6hdj96ih4x_rUCBSzSCQ+vvab45=woZ3wLhNE7g@mail.gmail.com>
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

okay, I will implement it in the next patch,
thank you very much!

Best regards
Ming

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:12=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 30.10.2024 16:30:37, Ming Yu wrote:
> > I am trying to register interrupt controller for the MFD deivce.
> > I need to queue work to call handle_nested_irq() in the callback
> > of the interrupt pipe, right?
>
> I think you can directly demux the IRQ from the interrupt endpoint
> callback. But handle_nested_irq() only works from threaded IRQ context,
> so you have to use something like generic_handle_domain_irq_safe().
>
> Have a look for how to setup the IRQ domain:
>
> | drivers/net/usb/lan78xx.c
> | drivers/net/usb/smsc95xx.c
>
> But the IRQ demux in the lan78xx only handles the PHY IRQ. The ksz
> driver does proper IRQ demux:
>
> | net/dsa/microchip/ksz_common.c
>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |


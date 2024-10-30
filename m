Return-Path: <linux-i2c+bounces-7666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D8D9B5DEA
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 09:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88043B223D7
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 08:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134851E104F;
	Wed, 30 Oct 2024 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHjwf91M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA65114F90;
	Wed, 30 Oct 2024 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730277051; cv=none; b=YINPAZRjdZgjj3IRQMZ53I7xi6iXJAzBsdy6Pbrlm6T4K54n7tKQz3ReTcBLOShXH+X8MkLgSqs+/kQAddSbfrRzE30frJ7bdZYqFMWSkQbnaDJHz3hzSA+bPAWXTYbOF88Fmt20DdkCplSi+GbiWdiD9qiaRw4aE/6SjQHjrl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730277051; c=relaxed/simple;
	bh=kaltN+RuaBtKA+njTIOTqNhKc1ILmMjKsnquuYPjYb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiaQn1oBnWypIBAYv7bwtGgGZRYK++KWXbxS/H80wgn3ksfYaliJMw/2/hIaAxrZ6g6fhBUbJkg3x3NGFKBlthedW+bfgI5EWAzIZglfnJB3mbOMQCn5vDJG9tSjORQwX1QbK1H3PJMxJT43VYbv5zt7lX6F+Bq9b332c4EpXT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHjwf91M; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2972abc807so6172157276.3;
        Wed, 30 Oct 2024 01:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730277049; x=1730881849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83QsD+0SmOIU2ZSbEm0g75qhVVIQnebcpG7P/LY0U3o=;
        b=EHjwf91MtE6JMHX9Ebi1m61WjVZvdJmB+3zHLskYVQNrOGDil7hZiAcc4GVHAd6Pas
         5eaO0lQQfdtj859uCfrCCDDmSUGOtAkOAWgxeTQ1SdE/V6nQ2ZzGGNiGrNNYoKpXGHfQ
         j1BEoVLl5NPI/D1dHI5jqvUClIJ3GQeL5y/ZLD+p7tCxMvySDcxhSCkk8rO7FPjdbRTJ
         BGAQAvwjWrkefaxJOmse/N2R0OIJys79ttCbgFBZ7qB+SlLOkoXPUQoK3VVnKAxs2peu
         /K13ysnTZIV0m1BpipkM02pLVHBFA0w8iWjHwlpeNll3kSdAAWUJg66O/wkUGV4omBVh
         Rqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730277049; x=1730881849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83QsD+0SmOIU2ZSbEm0g75qhVVIQnebcpG7P/LY0U3o=;
        b=jhtqIFe3mbzqvtbJKl2ld8fna/N2XxDbd9VnWsry+6TrHVaRunbg3mb1/c6cTx6EJv
         szk6j8Hk6nqR3NnoyuqsBEulggWL8W70MFlOh1UYLWsU4EDZeamCxu1JexPMWnxpgz8E
         gB+CzoSzlT5iGS8fmyyt5CtcuSBUz0nF9wcNPLk/nDIk8xpxOCOomQLTw+cyrIIpmNur
         c+xf9+OAVjoAMH0Cmg/DbUzbc+S8PK1vLFhJlany1Z+q9UxQAFo8nbuFaoDtavXucnrX
         cTI74MpSSy6SVpoul9nCbMyo4FX26d7ENxYBtQKFHDHM/ooa/pdPzE7ngDTvPtqAKqY5
         PZrg==
X-Forwarded-Encrypted: i=1; AJvYcCU7xnoX3QHKM8BfrdZQ6kCyMmpV9XORVR5Z5nw8lMaUjUcTyP0ksCUTVVNGWGsrvqpmlbHadnpqE8pL@vger.kernel.org, AJvYcCUKOQRmyBco+TUNRLB9/5HncvM9JrzY9GpfLf6Cz/tUFVcwsZjGM2A0hmq7+FBZICPtOwR1pdmuuF8jF6hY1qY=@vger.kernel.org, AJvYcCUiH6SOhc9QxVCoQfcSqfZXcTtBqGblOoZT/hRAhrBaF0Mi4+KbxndZF4R+WLSuecxx/KNvdKC63T+v@vger.kernel.org, AJvYcCVRndUBZx4ULbzi5/XKSIfXl4+GX6PiY496AWkySkIUNFTmByL5UWo8LlKfXY9Yti0qJbYS2JC2ziVJ@vger.kernel.org, AJvYcCVYo5kZOQ6kHg6XYmYEcLz+7sSixrg49qf3vcFfNMTaJ2/aNtRd6PQXP9NpkF69pTG1+3dbBp0v1qw=@vger.kernel.org, AJvYcCVfdg/TcpLk+2+Y4VJbciae/J88tpWANkysluUaOFdL1K27ddq+pux7dGldq5pZwn+xsAZVILN2N6+zXw==@vger.kernel.org, AJvYcCW1eJc578bgGWqhk9N987kqvapowvrwrYAZXjqPRo1PjxqfecQ7sYrs6pCByS7D+mLhQdxM0QOyewxVWp8=@vger.kernel.org, AJvYcCWhMVHWaA3z8CAB2jKAUiBC/I9BqnVzCzmjGb0gvi8wD/PQMqRddAeFpPVtVMFFn39o6gnPdJv0@vger.kernel.org, AJvYcCWqEbZxVo+obMyLaNjQFvKfxb+g+ZKNaAGTDXk+HhrLu75NizClGuKuHaqXcEYnvvHFNrlDcyJ67i9P@vger.kernel.org, AJvYcCXRBQ1u0uqMoro+5Q9nmYeRPumVVfUJp7KM
 w5A6EHLfWbylMuWkmx3PS8z+Bakm0H9Ea/ZSJiTrqjbyXT5W@vger.kernel.org
X-Gm-Message-State: AOJu0YzK2JYi9nzaEbVbDnfg7hcEIE+NclBxRic87I2vcJ5u0YRYe+k/
	MhtxdOBC8Pffqqyq2weB2MyuE4aR5VWir9japz4jThdLfycmFhByb42PoVt+q9SDM4igTvX1OFo
	Gbb7NVpxfObYXN/1+2j8sMApt/mk=
X-Google-Smtp-Source: AGHT+IGXNYy381QkNndFOp7Kep7v+AsfnJYrtU85o86EwyuP7sESCo7RFZ/IU1mfbniSwKfrtjlalqvrFol9fGaaTOU=
X-Received: by 2002:a05:6902:1144:b0:e30:da6f:ccb4 with SMTP id
 3f1490d57ef6-e30da6fce98mr354099276.43.1730277048550; Wed, 30 Oct 2024
 01:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024-eminent-dancing-narwhal-8f25dd-mkl@pengutronix.de>
 <CAOoeyxV4K=jR+tofeQtsMB7+smuu+Ghas5Tqfx4JvhuVK8dXrA@mail.gmail.com> <20241025-modest-hasty-angelfish-1e9193-mkl@pengutronix.de>
In-Reply-To: <20241025-modest-hasty-angelfish-1e9193-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 30 Oct 2024 16:30:37 +0800
Message-ID: <CAOoeyxU9VwsM=mRZy5AtjH=V3iSGQxkKw18qL+yeUxkh1OVHgQ@mail.gmail.com>
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

Dear Marc,

I am trying to register interrupt controller for the MFD deivce.
I need to queue work to call handle_nested_irq() in the callback
of the interrupt pipe, right?

Best regards,
Ming

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:33=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 25.10.2024 16:22:01, Ming Yu wrote:
> > Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=
=8824=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:57=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > On 24.10.2024 16:59:13, Ming Yu wrote:
> > > > This patch series introduces support for Nuvoton NCT6694, a periphe=
ral
> > > > expander based on USB interface. It models the chip as an MFD drive=
r
> > > > (1/9), GPIO driver(2/9), I2C Adapter driver(3/9), CANfd driver(4/9)=
,
> > > > WDT driver(5/9), HWMON driver(6/9), IIO driver(7/9), PWM driver(8/9=
),
> > > > and RTC driver(9/9).
> > > >
> > > > The MFD driver implements USB device functionality to issue
> > > > custom-define USB bulk pipe packets for NCT6694. Each child device =
can
> > > > use the USB functions nct6694_read_msg() and nct6694_write_msg() to=
 issue
> > > > a command. They can also register a handler function that will be c=
alled
> > > > when the USB device receives its interrupt pipe.
> > >
> > > What about implementing a proper IRQ demux handler instead?
>
> > I think the currently planned IRQ process meets expectations.
> > Is there anything that needs improvement?
>
> You can register the IRQs of the MFD device with the Linux kernel. This
> way the devices can request a threaded IRQ handler directly via the
> kernel function, instead of registering the callback.
>
> With a threaded IRQ handler you can directly call the
> nct6694_read_msg(), nct6694_write_msg() without the need to start a
> workqueue from the callback.
>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |


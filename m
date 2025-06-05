Return-Path: <linux-i2c+bounces-11253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B64ACEB31
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 09:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7B4C18964C8
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 07:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1848E1FECAD;
	Thu,  5 Jun 2025 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0TT3FFQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551191ACEDC;
	Thu,  5 Jun 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109809; cv=none; b=nAkN6PaIuhGykr1PPnFCx5XIjmJhvuo8/s5Gg3lW67+TJ0/CH2jQtLzXIHSufSGDXmqseyIVAx7XQFiSH8IGLg5+fRLBTNhCuTo/1+Q+He9IXwRzNQlKAgtX2GBBuoOZA+aYlJ1NNICXtWyphqpyLuqRNCyvCb9E+r9jFjRIZYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109809; c=relaxed/simple;
	bh=NFEt3ikujWPaJWewthF9QhICJ+AtUtfzhLL2sKi7ryI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5s7bf1g9ydh/CMW2mugiiCU4xDAMl/Q9BgCIgIe9CsFBLUFbKOdXIY/MDxtKvvrmltkLQGxvHT1r6gjxJ7t6mzfH415iC57Xhpd3EGMOBGd7/fmIiIRTii/n51F4+s5Gy29UkdOzqpVmDJi9yZDNxpUfwVh4/bu9luOGbE6Asc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0TT3FFQ; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e78e04e48so5958897b3.1;
        Thu, 05 Jun 2025 00:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749109807; x=1749714607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv9G32NpLFaX25gDQw1bEAmle7ctnzmIrCsVohjdytg=;
        b=d0TT3FFQ9L0UjrOI9uQ0IpfkdfBOVGaZ8q2KiNXe90zr9nuWdzyrrpQK0JsxzKHdkg
         BC0rXcYk85uTSXcSNwSXnd+TngZlyVwEpOFRh6O+uhvaARl/OCTqoDP+eIo0ZpijiRRA
         jzj0LDQcZK7KapKj2q1s+K2xiL/2OutpjMm1YngynTzH7ex2tMjtFFiMFb4b73TU77c+
         X8AtIjatpPhFStZ3BBhH3z7+jYnZ5EX6seNKWOs7Trh4qO8fpmNJq/4srE5g1N1EFUgB
         6vDcmNVD5FWTbQy6CAVDzHTNRV65RRvAgCFs+G5TQclZ/4RgPY8/PawCcH0t6v2nP4yV
         y8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749109807; x=1749714607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vv9G32NpLFaX25gDQw1bEAmle7ctnzmIrCsVohjdytg=;
        b=V/RQF0Yk16ZSSaAXu9Hjyi5+iLqIAwgL1PUBT0txtiOeHIwy3V70w7t1XU+Tqe0Fda
         KpumFxnIFv3urbCg78xaAKJniC7R6FUD62TLZfO96Sl1ruP3oY2HA5k79iLuGxzbJF+u
         Sw4DuSiRcmae7s0RYQLVEBgQGNhLNvbCUW072Bv4BCK2RP34+St97I0GoicDjNmHuee3
         2TCdO5CQfCNg1eW/H33bGArjx1NSzqXNC7YrhN3pWYERRSq4i5y2m7ux/sm+0g1p5too
         IEWKxqG41au6kTgc+G2gVJEOsdTlVSAwYMExAVNLtsf0dfIpMh/SX30TX/Rk3syUDqsg
         iiRw==
X-Forwarded-Encrypted: i=1; AJvYcCULNg/s+xqpiYe0Fo3Am6YtvnjjFcVCig2niSG3sJwEZ4EZLU3EQpiu7piHxQZRS0lQ3Q3cIXFDP8v8@vger.kernel.org, AJvYcCUX7qcoH4rORxjumwnBf+1mZDv5lc5O822j6oRbkI9yW4bJ6dcpB03P99FtXUam1qese5HUCT6kDA4=@vger.kernel.org, AJvYcCUk95mmQNOQqssOq4nJSNtSqqsJxomB0BZn4AUr7Wnq1HjdCi6QUj5Nh+i1zTmiqehu/AMG8qD77ZYm@vger.kernel.org, AJvYcCVZcBQIJBjXeyZwyyxdOH4GohjFMgtlgJ12f5kbO4YL0V9dVmIiiTzQAHwN3EYhBUlIxzOXKwCfW+3bPMXy0AE=@vger.kernel.org, AJvYcCX7Vq4BCuB5ZYvxUkLg/7f2Ag5TOQ47oP/mXj5QDJqsw5yc+WpGy5UkUlJW2mVkNEagFdvZ93eQ9gt7TZ0d@vger.kernel.org, AJvYcCXEzolLmyyZeWCTJuWSsNPxP2/7oKlHtFb4a+fnJueBv5eL9106kqKE73EkwN5fEoPQWRPVEIEBA19w@vger.kernel.org, AJvYcCXHpRMLMVr9jnwsjiFmtK5NBX8rDUr+JQh56dpmoxYMUvmDwosx/mbf1VIaatzEMT/R/LNDEF7KX4ZvzA==@vger.kernel.org, AJvYcCXj/dgT7m6xrSIKoHWhyf8Dmk6MwawqgkdTDWyCxTsgSbycvrCyAfjxU/HN+bkdAByfGPiAqUoBqtN2iKQ=@vger.kernel.org, AJvYcCXykNscGC+DQvPq4u31nTxmMjbpu173KrP9G8VdQ/WtXgnl1B5adt2DQz1gSOyuAmfmu+OdNfsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/vlr2KxemO+/HofwlrSINMSOyjrSgRZ92QVAiVdWbI401m0fw
	q99vrrlJoN972JTY+32j34ADZZp8XEAbDAnp1bTLobInY0MEUC+v7xd3FkJqS5BfVQAhoQQl4HK
	0RXTSixtN4WF4j5h1su3s33fwd0KKOQE=
X-Gm-Gg: ASbGnct90y+wmuRklmDfo+MzCK1822qzjMTv53zAyNfm9FfMu/m+8cIsxEfr70VeBJF
	AM1xRQZfeySUeUER1nfXspR0IvP10tg+BqOTf4pqtY0A59wayf6UwEtUysK01g3R0uK3Tpc0C6N
	MA3BYE4vCLRvWJQjV5AR3jvuiv5SxAojF2KhrCss1GyWdpkG0qhHqoJw3ao6wqTj95wtfENcdoK
	JXKpg==
X-Google-Smtp-Source: AGHT+IEKl7dOmjqUWqH25+XmsY5+Z8Pbe84hzqNlaHy8+eh2tbFgL93ikeyaEq28vtyB7pfuEhhqZi96LHD/oy0/HzM=
X-Received: by 2002:a05:6902:10c3:b0:e7f:7d5f:f2f6 with SMTP id
 3f1490d57ef6-e8179d77130mr7100063276.30.1749109807043; Thu, 05 Jun 2025
 00:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604041418.1188792-1-tmyu0@nuvoton.com> <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <b4c15a6b-0906-4fea-b218-4467afdd8345@suse.com> <12098259-32c4-4524-813e-38aeced837a0@roeck-us.net>
In-Reply-To: <12098259-32c4-4524-813e-38aeced837a0@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 5 Jun 2025 15:49:55 +0800
X-Gm-Features: AX0GCFuUxMlMU_KMxBpnhMPmDDfld3GWVUhukFRMKc6rmekAAGk7TR-a7l1-mUA
Message-ID: <CAOoeyxWd29OWvmp2cHVmit5kJpngYWUJ2Xfdt7C9hOv4iZvArg@mail.gmail.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Guenter Roeck <linux@roeck-us.net>
Cc: Oliver Neukum <oneukum@suse.com>, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de, 
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter,

Thank you for reviewing,

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2025=E5=B9=B46=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> >> +static void usb_int_callback(struct urb *urb)
> >> +{
> >> +    struct nct6694 *nct6694 =3D urb->context;
> >> +    unsigned int *int_status =3D urb->transfer_buffer;
> >> +    int ret;
> >> +
> >> +    switch (urb->status) {
> >> +    case 0:
> >> +        break;
> >> +    case -ECONNRESET:
> >> +    case -ENOENT:
> >> +    case -ESHUTDOWN:
> >> +        return;
> >> +    default:
> >> +        goto resubmit;
> >> +    }
> >> +
> >> +    while (*int_status) {
> >> +        int irq =3D __ffs(*int_status);
> >> +
> >> +        generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq=
));
> >> +        *int_status &=3D ~BIT(irq);
> >> +    }
> >
> > Does modifying the byte have any benefit?
> >
>
> Not sure if I understand the question, and assuming your question is rega=
rding
> *int_status: *int_status!=3D0 is the loop invariant, so, yes, modifying i=
t does
> have a benefit.
>
> I'd be more concerned that transfer_buffer is the raw buffer, and that da=
ta
> read from it is not endianness converted. That makes me wonder if and how=
 the
> code would work on a big endian system.
>

I will update the code in the next patch to use __le32 for the
variable to ensure proper endianness handling across architectures.


Best regards,
Ming


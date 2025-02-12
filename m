Return-Path: <linux-i2c+bounces-9369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE6A31BE2
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 03:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0EBF167EA3
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 02:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2539B1925A2;
	Wed, 12 Feb 2025 02:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoCH0xs4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894B78F4E;
	Wed, 12 Feb 2025 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739326839; cv=none; b=rDo0wjM14EvB+N2uuFAEXdM+GPWT07RgUkKx9AavsVs+u61ueWWcbw/r8pK3Sg4xR8esJkcbXFLlqnflVEUZrIrDGkm6lqF4Q19GYRhqqMRBxo5pvtYWiyKhFVBqjqdyzBKr482tG4Q0tJ2ZaDovN/j10PjU+mSY2+qLhPhvbi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739326839; c=relaxed/simple;
	bh=BGF4WgRFYes+wXFKDiff8lSB4cxf0V4m7cSG+sh0234=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K154mY3x0vTwNDNl5/IQdCsw5vK/95r++ZuMLnt3Wg7eSbLkz0bYsDA3Q//leYdmzniLoufDIDGeAg9JbwDzFtZuGKTRf230WNg7WPSj0GWTbTyTZvGX5sskWVllFLu0lsHReRJlStE71J67yS7aRA6jmpjRWOeuwspXHaS3YTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoCH0xs4; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f9b8291c49so37446507b3.1;
        Tue, 11 Feb 2025 18:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739326837; x=1739931637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGF4WgRFYes+wXFKDiff8lSB4cxf0V4m7cSG+sh0234=;
        b=MoCH0xs47Oufjn9oslv7MF59r/clAlbm/A38hhpc5XBd9klopVBnmDKOi7szex/0c+
         e3zvOf8G9auXKVjjrZxDvXk3TRjkeDpH3+ECT5z3imEOzK2I8orFX0W0Pms6iO8EzFm/
         paHha4KTNNdCPqmlKj/N677cmRbIdeWQrRSs+XVWb3b5vTGALIFEwsELdKOwMTjGex9U
         sVv3t1KNyHOqgYinWdebs2oaO7vjr3rQDmX2qAT72CvZLsutjIOmjth3HNNElySR/IP7
         SVm++FZUF4wyOJVto3G42jGbTOb+My0ug9/GN2F2nTExMHKNKjWyCW9iRoUgtGBlU3J/
         mk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739326837; x=1739931637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGF4WgRFYes+wXFKDiff8lSB4cxf0V4m7cSG+sh0234=;
        b=Vmce9+IvquEaC3gRTyou0OD8QwgAdmpOFE8VH8yVFpErZmiJSWy9tQ3yeZwWfGE1Kw
         zrDlygOyN1xjYeyiSD0rr2g5cZz5TNje/UHD8yEoZCsiClP6caUFezG8fZY8mQBAvOCm
         HKOGNMv//prVP63rLW5MdFN2stwnFAy6P7CPLiHqCQJwDKml3TvD3NA8US3FlgkmOAub
         Z7OmwfrKfwJJK6Aeptha/nCxpY81PhocIewjOuDBluaufB0UDAXV9IaM+5RcRiF0Wrin
         YvTNumXBKANRh9WycFmyO48XpCv5x+s3jK+wrs9rqSJb9tPGbIWcGRl3pEWoWMqkHBZ8
         LyVw==
X-Forwarded-Encrypted: i=1; AJvYcCU3/RfjS8j4hO+tj/utkMXvhi8D51kOKyn6kxDTGfsIwJaXHdH0tpFX4zaf4VTGj0tSpbmyGX/tkqFCHwDANAU=@vger.kernel.org, AJvYcCUCS8qPEJiFXH8gUZaenfpHBUBvncH23prSEr/ppzCLGQKI9DK0NE2XqjuGukHlj9vwW1YqpkxUaJv9@vger.kernel.org, AJvYcCUhlJ1j3DZvJvRybAMWJ6qh1vjI1pxF5v+8Vtzf1c6H0cns6NuoVYdvWnO9PYK6B4o7K+bIhbfC4cE=@vger.kernel.org, AJvYcCVGZQfdreBJDj/zl/Kzf42VXic1IAorRmkK1yrTw4np3ujFjI5oy6ccBr9xAPXtRdMCkBhlMrSmLnrxPQ==@vger.kernel.org, AJvYcCW8cERn8w1aRtCbl4jtTam7Z7yBRyS94ZJOHnzj0ef/I511ED5L4S1F91uysqyeKOrn9+IQnmwrW0f2@vger.kernel.org, AJvYcCWJrh00gxBxBJMaxyhNSaiP3q1OlKXt3FLgzugsJJHUIkg00gtuHtxTH4yljrzEU6VAK6ICOX/GBaooaX3b@vger.kernel.org, AJvYcCWoloS8fg3dSEXyJOq9SZM9mWhJgUMhDNEI6y6mdMVF31gelqt7CniLtOkjg6FMQDi9dhtRZxiWS2TqQXQ=@vger.kernel.org, AJvYcCWtLSP9qRTt0OYqk6Gi4fGavkSPgIQk2ID3AdklMQAYFeiGGT/dGv6v2mGKehWoYtbHeMPUm8Dr@vger.kernel.org, AJvYcCXO7MotSiF0Bsb2goPvVuxF8f6CBJOU32cxpkB3u97zOkelaVQd5WsnyrNDXrl50p1MjnD08oJUje6T@vger.kernel.org
X-Gm-Message-State: AOJu0YxVSMJqCNkrbzyHMEaTQHB1rVYpe48Wzk5KklgR2vtVZVvV7OIj
	RWjztbiNChd++deA0N1CiqisoYevGSzk3e/MIMuDV6Nw9BsyGnwuRsXwi5alNJMzgElBfxaz/cG
	OBX0hRWnEGtS+/by+nlQ7SHvl8+lnFg==
X-Gm-Gg: ASbGncu/lHuLWlgRLhtRokGP0QSzvFo7QYBpk9D3dK/9JQLgB6w8f3OwuhnUORkgX4C
	5GqaPq+kOtFDolD4NgTm52JwNTmfW6fSRzC5VlqI7cnK0v9+A43+PUPP54wU6PToNlJb75YVOMs
	KUYFalNkfQL0iuxB7hFiYA5j4919gtjLU=
X-Google-Smtp-Source: AGHT+IF+oFBT4/eJC7fxrqCxEqFTUuytLV8FG9XSBDtcVlHz7Ohthj7nFqSBcKDND+KZxt4lh4ibh6h6TvJDsK+a7jk=
X-Received: by 2002:a05:690c:6811:b0:6f9:8845:cfbf with SMTP id
 00721157ae682-6fb1f1e638emr16843557b3.22.1739326837122; Tue, 11 Feb 2025
 18:20:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-2-a0282524688@gmail.com> <1ee664ec-f912-467e-aedb-81208987ea2a@wanadoo.fr>
In-Reply-To: <1ee664ec-f912-467e-aedb-81208987ea2a@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 12 Feb 2025 10:20:26 +0800
X-Gm-Features: AWEUYZk7swZO7fFhHB97EG7zyv5Dg2IiX0RdzYvso9G14rlwE4a_llIRTcKsa5A
Message-ID: <CAOoeyxVUN9A3gKB_vMH_d2gzRSznF_DVifJ3ie7BgKhZU+P6Pg@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] mfd: Add core driver for Nuvoton NCT6694
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E6=96=BC 2025=E5=B9=B42=
=E6=9C=888=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=882:37=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Le 07/02/2025 =C3=A0 08:44, Ming Yu a =C3=A9crit :
> > The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> > 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> > PWM, and RTC.
> >
> > This driver implements USB device functionality and shares the
> > chip's peripherals as a child device.
> >
> > Each child device can use the USB functions nct6694_read_msg()
> > and nct6694_write_msg() to issue a command. They can also request
> > interrupt that will be called when the USB device receives its
> > interrupt pipe.
>
> ...
>
> > +static struct irq_chip nct6694_irq_chip =3D {
>
> This could be const.
>
> (I'm working on a serie that should constify struct irq_chip, so this
> one would already be done)
>
Okay, I will fix it in the next patch.


Best regards,
Ming


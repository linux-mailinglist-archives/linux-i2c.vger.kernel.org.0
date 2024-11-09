Return-Path: <linux-i2c+bounces-7907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80339C2B07
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2024 08:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FBDB282BEE
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2024 07:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E5B13D504;
	Sat,  9 Nov 2024 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9vIkVg2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760792B9BF;
	Sat,  9 Nov 2024 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731137544; cv=none; b=CgR0aCiF3TzX6zdw43vSqZ3s+kLxRda0qBMkt2+xaYqXOMhzMHTlssl3sBPD5nxtVrZS5qB/UD5VBq2ML+F2HLpt5ZI6SFUXDx/RjLhxiNvxG447kMI8+VtpCQukbPEqMykjXQI+TTgDOwSY1uhc2xvt6vt451iQJOiLmtYpa3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731137544; c=relaxed/simple;
	bh=BubkefP/PLSG5oJ+CoIyGUHXx6Ojnw8ELiAMMXhAtLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uvz4ckykctfVoTgr1F45EkvsTI6gaNvNsibkcfx9+uO1fALbJAkPvJUf6wlrFgNb56Anh8FJY1PnwCC7c2t1gVVQew2ow1YTOVa8xnp3n2zOtudSXSh0tYFYe+K7LFPAMKkBz9xojDIwsY3Mm8gRQQEor39wIDYVKtcN62U8LOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9vIkVg2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so2298236a12.0;
        Fri, 08 Nov 2024 23:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731137543; x=1731742343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Yvsf1/Rp4Kad1l94AE2rAK6dROTiwkU3pll3PPeTNk=;
        b=M9vIkVg2tIxILdYxbBd6e4U1gQFiExjskQj1RwmuavbRaanmcUUrBYwlGKBgEWi/t/
         PGlpHXC3DaNekc9iGqYuqbRTEeHRu+qRxPsNiL9DZJXfDrxV6BP5L+ieS2Zrnb2GaJKD
         EuuKqRyBpimZ1hq82xYHum5J1niPmSgYNeuMUAvI9kbIytTj72bI8QZrUTt3upQk5qE4
         7ymYEeXqDBcC2GJoh2bbs3iZE58tuy/R8z/zoVBs9fkmOK/FuPxnc12nPjqtFr1yLSHX
         fp+vuVWuAJ2iqATeem8MmnuyzChF0RaUqkP/lOntoMSvfOlLL9gQedchSnkFawWdj44w
         El5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731137543; x=1731742343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Yvsf1/Rp4Kad1l94AE2rAK6dROTiwkU3pll3PPeTNk=;
        b=Lhs+m6NCG5WvQbPEG57UcMzHouNld19WDZL2XpuQ9LOsEIAGVjV37IXyIzAXs4dukP
         hk9EguHF9gBf4a6YoQNdPtNRdpaByTBvap3nyBYPeKLVKWi8Xg9cut8zrHsgjnK4NHYW
         6pwBx+bE4NT8lMDqKmdlixR9n/5JX+xL6ivlniqbKLAO0eAWZtw8K52RWseMUjTaR0a+
         34j/oXX0rCw5qz2JDw95/k++PEKveluJxsADrA2OOagYT0Zqsnp1+n+1UpmdsZTvvpLN
         p+xIO3DvLd/0XYqPqeNphunRDxmoJdVzEbU/mBkiltG+Oe4P1rdavkUZeDQiQ8zcO4uA
         FCSA==
X-Forwarded-Encrypted: i=1; AJvYcCUEBh0vfMuMXmBOL8qCnnWknJ1wg8gjLfucw3HQUnpFFUekyeF9/u1eL22DrNV0TKdJt97/BPF+mVv1yOMc@vger.kernel.org, AJvYcCUX0hIW6Seg3OjRQUkijSTLDdtW2WflLIsFp/wb+opuuP+ycR5AD+lQWoLSKoD4EiMuFT00wWVIs5/+@vger.kernel.org, AJvYcCVcfD5XbbfsWus2TKy8wCwie3Yy6d8ggcWOAfgA00gvtDZaBIELngPckzPYnxnAiVNg6W8URjo6Qryk@vger.kernel.org, AJvYcCW79TrxPIrPd20+/dlB6m6q/I8HcPFVjT+naX7qg+pvIXJIPWA9Gy7vJcK4eIr/ujYGu5dHmRIbgd1K@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4ihzx2llnDkVoRZtAABF0SBHzMutTHsI/URWlKqplMZaix0q
	2R6McMutpouxe/jLOBNzzCMXbeRFNUxW5ij0MWqVhTxuvlod0tFBTyEuAeMEDOF3kyvS44CsgDj
	RH0Fi8QlRngu2aIqyzKoEJBPLSenZ4fuV4Eo=
X-Google-Smtp-Source: AGHT+IEYopClguJXTaEDehLf9kd7YspCn3tBVhwDCjIQ2Pt+JKFeb/vCnVJsJCli/BBVPJ1e1wtS0BmE7R2n3ueVnhg=
X-Received: by 2002:a17:902:e803:b0:20c:9936:f0ab with SMTP id
 d9443c01a7336-21183d9d20bmr70911695ad.47.1731137542635; Fri, 08 Nov 2024
 23:32:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220616013747.126051-1-frank@zago.net> <cf32d676-831c-4c3f-8965-c9be3abd5300@gmail.com>
 <e052d872-6de2-42f4-8b36-d1e2f8359624@zago.net>
In-Reply-To: <e052d872-6de2-42f4-8b36-d1e2f8359624@zago.net>
From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Date: Sat, 9 Nov 2024 10:32:11 +0300
Message-ID: <CAJs94EYpxxpOvxEtuL0Vcv9XYunw=+SnHyHcKeYqdVhYiEyr2Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] add driver for the WCH CH341 in I2C/GPIO mode
To: Frank Zago <frank@zago.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Wolfram Sang <wsa@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
	Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2024=E2=80=AF=D0=B3. =D0=B2 02:15=
, Frank Zago <frank@zago.net>:
>
> On 11/8/24 9:58 AM, Matwey V. Kornilov wrote:
> >
> > Hi Frank,
> >
> >
> > Are you going to further proceed with this patch set? As far as I can s=
ee, there were no updates since 2022.
> >
>
> Hi Matwey,

Hi Frank,

>
> I've been maintaining it at https://github.com/frank-zago/ch341-i2c-spi-g=
pio, but I have had no desire to try again to upstream it.

Thank you for the response and for the code.

> Feel free to do it if you'd like.

Just to make it clear for other people who will find this discussion
while looking for a CH341 I2C driver: currently I don't have
motivation to make this kind of contribution.

>
> Also there's been an SPI only driver that was upstreamed a couple revisio=
ns ago, which is incompatible with this driver.
>
> Regards,
>   Frank.
>
>


--=20
With best regards,
Matwey V. Kornilov


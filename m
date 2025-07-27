Return-Path: <linux-i2c+bounces-12049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BD3B12F98
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 14:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E17D177B21
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 12:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA38D217733;
	Sun, 27 Jul 2025 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="c0uvMYtE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CF91F7580
	for <linux-i2c@vger.kernel.org>; Sun, 27 Jul 2025 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753620934; cv=none; b=E+S9AkDxnwj35hvHj214CR+s3Ej+0vzQh/LjTUhf1tsFtDTgfRCkEABUgiMDFsUsd7yqu0GAc4wknfmTH5P3rookBm7Hu8a+KZ+BgZyMhtO1UwSAEiX+JWXItfFhxcEoqOkYDEyQc4BOaV+M8+bF9FRni+9CDh+NP4R/7wVh3ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753620934; c=relaxed/simple;
	bh=BQ/JpxXpuSy7PbBgcydNfVF2w4td5TfhH0Fzlc5REsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfU/DKc3e2ouGBxt0hqBypvWFMQSiL9OBHUKTgjFVNjEMGAwTWHkN65TwtUGHQ5N6KR4GygoaqG+FOpSqQ2JNoFnXByYi3srVwYQs8FQDjd/BuEiWLLtvL8NlqxKP/3bD0HXwgFYRrdVwYzHzztmTCZoytA3z928ER5tFkNq2HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=c0uvMYtE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so741821366b.0
        for <linux-i2c@vger.kernel.org>; Sun, 27 Jul 2025 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1753620931; x=1754225731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMxifAIqWO9udZ2NZ9E8Ene5GRXydyVi9Idk6pBIlxA=;
        b=c0uvMYtEJFdVp+74ymehaYZDUS3V+nzKzazfRjmJE/+EjM/hG0j+ExWD5KtIVAt4q8
         WpIU1wLnfTY9d6P1VCdHTl72WRScOnUW06Oa9K2VQ2YkVRWOsHkHu/l2ayLPgvHOp1jE
         Z43U+D9AzbHIwn58Yw1mJfIgYZjM8O7z7pQENFkXfsyVgJoaiBp4+cgM0LX9S36ykbjx
         D7vQwOPooQhha+KSrhae+b76IU8DJME/6pehdSOtQacsxeYuvK66Pc6gs9V2C8A3yPY8
         MmDhdskiPqiQ2ao0Gw1vJq4x8kRY13jiIYoVu5ihckQrjba6bM7Lq3ND51FZgPP5Btbj
         lvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753620931; x=1754225731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMxifAIqWO9udZ2NZ9E8Ene5GRXydyVi9Idk6pBIlxA=;
        b=RXlHeGCbrhAoAd50BX4kBjMnlI1cZJhLgY6YgWh9jAh3kbh0kMWR6IxS3T3656FwtU
         Yv5gr21K6wTfLC6HXy+2Dmvh8RfzC7xXzc+UE51FoqMogNAIxrXZYUj1MJ7tUEQLAS+c
         0LZGus2lDSqKrJQtuKFV8dcPjrS1p852wGcYD6DoQzdIz4B/7wx+zLU/BYU4RU/Dm6Fo
         uyo4T0TbsB1XOPj5ak1YAp4Qhhoc+GiveqVjxa19Yc/pFSwONRyjAfG6OKzPm2LNcy2L
         WWHwNJXvYO658M6y34O3+sv91hxir6fSDGhIkIu8OgU0ASlGN4lUqx9cPwgzVjWZk6Am
         vOCw==
X-Forwarded-Encrypted: i=1; AJvYcCWLh4NUyx4BX3rNmusFS9pMOxTG8i97VCGxWun9WaF8gRLrxMZzMm3vomrMrtujus4H8EWLNet2jNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhYjPeBRflcyBFIo+RasMXaEj767u4zpAsRVemllf6lcNO/rrp
	kqleyP9rj/FGLBxVSpfYH7izFT1nt/cH30Jn+AS0h9q2uc5SCymNIhmSemd/pDBRxWdzWMAVIJp
	DAwNPbW3GP+ie7HfsYeuJZ7GeTZyWkR02upZXqAdR/w==
X-Gm-Gg: ASbGnctWhgOrhE+jwdPIX/Uc2BFpuW57xJzY0w4IWiZQxSs11KWSEen3jbKR/+sb8MS
	1FSAUsmPHBBMy9wJA4sRdpAr81PlO/DPZ7mpV0KLzgOEvpQdhbyce0YS5PUP0/3+vmbFMKFBy8h
	QQd0keFzZZb92zFkvuzJAqZVKqUHkIwJtRxetUEy3bDYNIoNhE0s0MVdElyNLwn+EXTzhV5jaCT
	CyhiQ==
X-Google-Smtp-Source: AGHT+IFVYv/O72cHjaH5k5VUlfobYK4W+S80N+a/c4/0HwzwQr74guF3QvQjE4eDoMLi3m7pid4RHeYV0xM1EOGkTOc=
X-Received: by 2002:a17:907:3d12:b0:ae6:eff6:165c with SMTP id
 a640c23a62f3a-af619601218mr939373066b.48.1753620930791; Sun, 27 Jul 2025
 05:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702183856.1727275-5-robert.marko@sartura.hr>
 <175325995961.1695705.8338983998485530536.b4-ty@kernel.org> <20250724100442.GX11056@google.com>
In-Reply-To: <20250724100442.GX11056@google.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sun, 27 Jul 2025 14:55:19 +0200
X-Gm-Features: Ac12FXzmHtBtU7jmLL2NxVGb2Ntptau88LQnJUIPvAdvZ644oi9yAP7lpOAawqY
Message-ID: <CA+HBbNGscSseYHT36FqazfH_BXZi9zKdbPkroJGby7Vd+=ZJSA@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
To: Lee Jones <lee@kernel.org>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	andi.shyti@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, arnd@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	o.rempel@pengutronix.de, daniel.machon@microchip.com, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 12:04=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 23 Jul 2025, Lee Jones wrote:
>
> > On Wed, 02 Jul 2025 20:36:02 +0200, Robert Marko wrote:
> > > LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHI=
P to
> > > avoid needing to update depends in future if other Microchip SoC-s us=
e it
> > > as well.
> > >
> > >
> >
> > Applied, thanks!
> >
> > [04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
> >         commit: ef37a1e2485724f5287db1584d8aba48e8ba3f41
>
> Reverted as it caused issues in -next.
>
> https://lore.kernel.org/all/20250724115409.030d0d08@canb.auug.org.au/

Hi Lee,
This patch depends on the first 3 patches in the series, which have
not yet been merged.

Regards,
Robert
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


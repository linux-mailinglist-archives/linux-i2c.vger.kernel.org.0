Return-Path: <linux-i2c+bounces-11704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B1AEDED5
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 15:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 358CA7A2E6E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1D2283FCE;
	Mon, 30 Jun 2025 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ZQTv4zdI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1212701D2
	for <linux-i2c@vger.kernel.org>; Mon, 30 Jun 2025 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289694; cv=none; b=TgKtPvZCaHUJRV3PWIW8v81MCJIOITaEwEd2bxFrl8Xns9oGaaFeJgwZ7mdDYX4dpOoUedwopF8Ghzg9IxDUbmk3iyZIN1xVmMqROPlvHG7IsaUEIIeKKWQooVNhsrVCZ7zGf3c3XVToZ+x93uwHId0f4pcozywYP/CTVeac10g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289694; c=relaxed/simple;
	bh=wYSk7fxInjdJNOHqBT3fau/40lgp1kFco8w401sE950=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzoL6uRAyEa9h5Q/XPaDoI7mQKgwjrzk0pFyqy+yKYwx2whpxgqZW3iyKtYgdbntYig8s2/3+ANAN8dGn2ekBvELrknizcF7y4ye5orclJGYUkrSWR9oXwGmA0xJyu7Ew5WtyB6eAzayWemr1wzxov5W50GGyRnMHthhYn61W+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ZQTv4zdI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae36e88a5daso409156466b.1
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jun 2025 06:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751289691; x=1751894491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I8CsrHjtRtD5BaYjtdOSFNgRck9IxhroTpwRBGBREc=;
        b=ZQTv4zdIh7dZ1Lg/rGgUPmWqnPT5GKG51d2hj3rr+Iar5/ZdgH8ostY0HGD9nH98oF
         eLRWZgiyAITEb6Z/oyXegjB/VS4cCK9L3P7t7+tyEjFsfjg/dygDensV6bQF1hvoGx5c
         d5gRhGF+PhBCLXbX2rAInJUHXRKouIPD2NBcwh2jGNn8Ih3bqVNq0Kam+RtqQB4QBVAC
         Ngn7WKq6Tz+uOwudmI+78VjSWRXZYyztWpu1dVtyMw7dWEIFzV0AgVniYKzRoxHVCH97
         SFmR0ZISn2FInckrd0R5ptTd95F6m1/KV+sUy6BAideGWb3nEgqWSKIFtN8pT9Jhp1zB
         9CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289691; x=1751894491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I8CsrHjtRtD5BaYjtdOSFNgRck9IxhroTpwRBGBREc=;
        b=Qa7fj5YdCpk6cyK1lsvmZH8xIPKshOSdmwNTqlYGWfYSVBSiI12C5TEt0HUsd/Ap9Q
         FSI6l2s6eII2AtQ6yNV2k4mRUAOFTQCMPwUcPsV2hmh36hrWGJiWDU+pfZdURQLRyHHV
         2OVgN/nxPG6aaFvfpIk2PQaae2vCAbP2w6ZDoRxa/2VH+cQZUd++t6vNvMu3Pt4eGz3X
         rHH8r+KLtadudU7qsV4U29qpbkYMlUdVRxz+OEDO/NqXwpCQYZQUsjXawN0yNUrctSF+
         U5ez2MdqLb451RXFOeHp9rDTLfpgmTO9LwDxsBqO9auR7qOMuN6p9DuUicMxmBxbz2mi
         WR+A==
X-Forwarded-Encrypted: i=1; AJvYcCXeTN0vTzug0eJDkyhzBlyapA3+GnCwgQ+qu++YomKl5AsQZI+9LH+2GD3jsTQfhSwunLzlQdHz86Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5pwTcQKDQBV2D+4V0ApkofumLJ3Y+Sha8dtw+qHfncsvD1dVe
	SxlzkuMwBaO0girl9Pg1Nzp3JmXmeUykJoZay+DRt+hW4LmWg9yY9gBh8M2OPHuvEpGktv7IUDU
	7kr4bdbzq6XQtm6eVjcAwd17bj4+/RTl7h5E6Wn/Jww==
X-Gm-Gg: ASbGncvfNF0F7Q++c6VuCH7yJsmdb+msdgbESIER3IYL70gKD0rAoXyMaSMPZC3kqZb
	68SPFm6GySGQiBm41g5OSv26uGlEGmwM2OC1qFHrsoEJvxEh+ztNfYZgZyOBDlrnQuJOyZR7bPz
	Lxze8wBBW0U1eHfOEzVQ8AQtT/UuEbdIWnQbGZAaegj7AkuO8z/foe
X-Google-Smtp-Source: AGHT+IExvta/iWzBmIlIztBuCgl2cUU6u80HBaLHyHvJJXhxVNxMY8nK4KaXwhnRKNkDAhQ4ZeG0igRs73XqWwJLjCE=
X-Received: by 2002:a17:906:df08:b0:ae0:a88e:6f20 with SMTP id
 a640c23a62f3a-ae34fd88f8cmr778815366b.15.1751289691157; Mon, 30 Jun 2025
 06:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613114148.1943267-1-robert.marko@sartura.hr> <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com>
In-Reply-To: <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 30 Jun 2025 15:21:19 +0200
X-Gm-Features: Ac12FXxhA2Gp9rwQDhKKgV4ARb8lKQ6I8YMqCzExRny5q7pcafJNPwE_zl3e6I4
Message-ID: <CA+HBbNFd5hCKqUZY25Sws-o-0QALLue-JROyze_9biyuZZv4mg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
To: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, ore@pengutronix.de, luka.perkov@sartura.hr, 
	Daniel Machon <daniel.machon@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 8:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Jun 13, 2025, at 13:39, Robert Marko wrote:
> > This patch series adds basic support for Microchip LAN969x SoC.
> >
> > It introduces the SoC ARCH symbol itself and allows basic peripheral
> > drivers that are currently marked only for AT91 to be also selected for
> > LAN969x.
> >
> > DTS and further driver will be added in follow-up series.
> >
> > Robert Marko (6):
> >   arm64: lan969x: Add support for Microchip LAN969x SoC
> >   spi: atmel: make it selectable for ARCH_LAN969X
> >   i2c: at91: make it selectable for ARCH_LAN969X
> >   dma: xdmac: make it selectable for ARCH_LAN969X
> >   char: hw_random: atmel: make it selectable for ARCH_LAN969X
> >   crypto: atmel-aes: make it selectable for ARCH_LAN969X
>
> If the drivers on ARCH_LAN969X are largely shared with those on
> ARCH_AT91, should they perhaps depend on a common symbol?
>
> That could be either the existing ARCH_AT91 as we do with LAN966,
> or perhaps ARCH_MICROCHIP, which is already used for riscv/polarfire.

Hi Arnd, I thought about this, but I am not sure whether its worth it
since we need
LAN969x arch anyway for other drivers that currently depend on LAN966x
or SparX-5
but will be extended for LAN969x (I have this already queued locally
but need this to
land first).

I hope this makes sense

Regards,
Robert
>
>     Arnd



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


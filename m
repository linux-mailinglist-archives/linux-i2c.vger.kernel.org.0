Return-Path: <linux-i2c+bounces-11839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B04AF99D2
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 19:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A1C11CC0A8D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 17:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A39309DC5;
	Fri,  4 Jul 2025 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JG/aj/Wp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7FA2E62AC
	for <linux-i2c@vger.kernel.org>; Fri,  4 Jul 2025 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650582; cv=none; b=lwbWV6GUm65nRLy/hZggx0O7TXVAbc5/7Jiianc3RzFpb7Trai3tUg5/TWV/4lyG895FS+E4CxM/s0+pz51yscueEW3kX2UqWTSTtWUDFc1OUnM6ToU/ZoZ7DxczSC4HsOTxhXdss1lSHvEUQaix/3TDotDJqbBYb/I0X1tdEz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650582; c=relaxed/simple;
	bh=GmYJZP6Xc+LYEezxq1PksUUUJoTuFJ2anrOieQhfEiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2iPIcR64iCUsi3loeekP943+cYkQKsJUS1Q18PJ+cHLvvS2UVfgJXKd/1rzfwgNLTlkLeErFkBdCgMIMhsSm+/g90Lll89kc8QfEm0dwgsqSHJc/wRxzzWztDK4KZUJIydWdA3eY52iTkq+j8OM6C2Iyb3N7fgidlFg5B+R/BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JG/aj/Wp; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso195172266b.1
        for <linux-i2c@vger.kernel.org>; Fri, 04 Jul 2025 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751650578; x=1752255378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gMVsSx3VDJCjM0/V6JS1Ju4gdqnvsZW/tG6WKrnPP0=;
        b=JG/aj/Wp8joH3ZjJdiHbBsx1j8PFAMMtHCadbJigMjkx7zR8Gk6iBuEJjyoDpD/qwy
         GdMb+BI7R9vUZXFs6BaMVceR0cAfe6h2GL6N/iZMivqTlIOLe6yzyRJXrqynFJT4m+z4
         ETmICqjLPUqVpxx++E2nSKvTvWmBQRbZTJSA50yHeLjU2DQEp8f1CHn9Bp00r+bewLYA
         UHyW6tYJ5d/6R4hexxDqpuSBPf1b5jENlbdTrWDimoChpYoAlx0SLiW1Qse+GqeEdazM
         Hh6VK25RWbcHYbor7cJmJ+hk1HNxjrps8qn3wwvAKAoFB0jFb3ZxfLPGu2uiChBhvlKh
         ee4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751650578; x=1752255378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gMVsSx3VDJCjM0/V6JS1Ju4gdqnvsZW/tG6WKrnPP0=;
        b=BthzGA8aCN1zfrg2irAAC5jM4fKICaZ8VnGAMfR8pSE3bh8bJJHZwvBs1dzzGhqj/5
         D5ns50Kt8dN6SRAisnUWpsAyRJv6jzyVKXkpzp2g5iewzLN1vK/BBw04Ft8cDnD+8Ier
         b96fOKEQhOEu/IHeTOEJ/HjNHqoKavkpdf7QXNETeIIrGy8E+gNyCnBH15oUyxWXbFcK
         BVTr/ykovlQzjI3k8FTXdf+c9+a0e4Fj+opNAFJ4l3RqJHfZtoDcEJcwgMJPsMjqXQwA
         8He4Y7n0MJaMDrcxP/6RdA721uXdC6+IQPOQOqAYv9K5vhOWEjYylVlcQK3UykTctB+8
         FcjA==
X-Forwarded-Encrypted: i=1; AJvYcCUP1n2ymEl9eIyj9RdZx0IwO+gQv4JO1Z8MEBBwng9SXy+hbT7POeqEYP45qWEhzbMY2e6QSnNzN8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE86uRMUO1htGSh89vZd77+eiceBz3XwTenx9oQeR6enYp1jVi
	LMbaS8lY52uRcIWP947GrX2Ctkj8DId1UQa2dFk/hUUDTsTMCkPDYuyn3BsS7TcghhLmgKi7poS
	A7+QHAtcU5XADOX652qGc0YqKWQE5IjX8RR56U55kWw==
X-Gm-Gg: ASbGnculQSz4m65qu+x6kwzINocs77eB0oxc79XRKIX2fUoJ7X/aNDXmEhi/3yod/s9
	RxQOkKozHHsZdjrPWdD2HpkvLHXh9hItsT7U25SNQAq5VxGFIa4wAkVlf0MzvlZyxTa9Ht5iGrL
	LXhfPLkQZgFTCYjEVHHLRnqIwgXsqwU4tEdLH6H0CC+LVV
X-Google-Smtp-Source: AGHT+IHeJ1Z6kLI9F18nPlTXJDs+kXmK3fscjH5F6AOkcbqCoHLdbo6tfPeiaHhkgOp4rTxkpu1/up/L9rb3ERUcPTE=
X-Received: by 2002:a17:907:9629:b0:ae0:628a:5093 with SMTP id
 a640c23a62f3a-ae3fe4581b0mr339627066b.3.1751650577806; Fri, 04 Jul 2025
 10:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr> <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
 <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com> <421d61db-27eb-4ad2-bd98-eb187fd14b1e@microchip.com>
In-Reply-To: <421d61db-27eb-4ad2-bd98-eb187fd14b1e@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 4 Jul 2025 19:36:06 +0200
X-Gm-Features: Ac12FXwPCk_M7U49drkBOHMtvL2YaDYQKpMa88sHXtdMqEAGjR9SQcLiyG85r7Q
Message-ID: <CA+HBbNEiKWS71jtF_jqV9bdX9HVroaZSGMaeD-xFM8sm0kLtCw@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Daniel Machon <daniel.machon@microchip.com>, luka.perkov@sartura.hr, 
	Conor Dooley <Conor.Dooley@microchip.com>, 
	Lars Povlsen - M31675 <Lars.Povlsen@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 3:56=E2=80=AFPM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
>
> Robert, Arnd,
>
> On 03/07/2025 at 14:25, Robert Marko wrote:
> > On Wed, Jul 2, 2025 at 9:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
> >>
> >> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> >>> Currently, Microchip SparX-5 SoC is supported and it has its own symb=
ol.
> >>>
> >>> However, this means that new Microchip platforms that share drivers n=
eed
> >>> to constantly keep updating depends on various drivers.
> >>>
> >>> So, to try and reduce this lets add ARCH_MICROCHIP symbol that driver=
s
> >>> could instead depend on.
> >>
> >> Thanks for updating the series to my suggestion!
> >>
> >>> @@ -174,6 +160,27 @@ config ARCH_MESON
> >>>          This enables support for the arm64 based Amlogic SoCs
> >>>          such as the s905, S905X/D, S912, A113X/D or S905X/D2
> >>>
> >>> +menuconfig ARCH_MICROCHIP
> >>> +     bool "Microchip SoC support"
> >>> +
> >>> +if ARCH_MICROCHIP
> >>> +
> >>> +config ARCH_SPARX5
> >>> +     bool "Microchip Sparx5 SoC family"
> >>
> >> This part is the one bit I'm not sure about: The user-visible
> >> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
> >> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
> >> here, or more generally speaking any of the nested ARCH_*
> >> symbols.
>
> Well, having a look at arch/arm64/Kconfig.platforms, I like how NXP is
> organized.
>
> SPARX5, LAN969x or other MPU platforms, even if they share some common
> IPs, are fairly different in terms of internal architecture or feature se=
t.
> So, to me, different ARCH_SPARX5, ARCH_LAN969X (as Robert proposed) or
> future ones make a lot sense.
> It will help in selecting not only different device drivers but
> different PM architectures, cores or TrustZone implementation...
>
> >> This version of your patch is going to be slightly annoying
> >> to existing sparx5 users because updating an old .config
> >> breaks when ARCH_MICROCHIP is not enabled.
>
> Oh, yeah, indeed. Even if I find Robert's proposal ideal.
>
> Alexandre, Lars, can you evaluate this level of annoyance?
>
> >> The two options that I would prefer here are
> >>
> >> a) make ARCH_SPARX5 a hidden symbol in order to keep the
> >>     series bisectable, remove it entirely once all references
> >>     are moved over to ARCH_MICROCHIP
> >>
> >> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
> >>     ARCH_SPARX5 but keep the menu unchanged.
> >
> > Hi Arnd,
> > Ok, I see the issue, and I would prefer to go with option b and do
> > what I did for
> > AT91 with the hidden ARCH_MICROCHIP symbol to avoid breaking current co=
nfigs.
>
> Yep, but at the cost of multiple entries for Microchip arm64 SoCs at the
> "Platform selection" menu level. Nuvoton or Cavium have this already, so
> it's probably fine.

Yes, this is why I went with a menu instead, to me it is much cleaner.

So, how would you guys want me to proceed?

a) Keep the menu-based config symbol
or
b) Like for AT91, add a hidden symbol and keep the individual SoC-s in
the top level
platform menu?

Regards,
Robert

>
> >> Let's see what the sparx5 and at91 maintainers think about
> >> these options.
> >
> > Sounds good, let's give them some time before I respin this series.
>
> Thanks to both of you. Best regards,
>    Nicolas



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


Return-Path: <linux-i2c+bounces-11811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DE0AF7406
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 14:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352DD3A572A
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 12:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3731D5142;
	Thu,  3 Jul 2025 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="0ph2alOI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA7A299924
	for <linux-i2c@vger.kernel.org>; Thu,  3 Jul 2025 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545567; cv=none; b=G3EOIpcSWmq3jOo9kJbn6eCVpzTz3zsGf+/7+tfG+xP7iaOh3CTgLX9KDp4uP7dlJuaNtxUs1zXx1bFmJuyO5jLTZTlcKmQxe1FTUxelZFHvjaRvPUCfy3JtBtoE1tpjbsEKlbmF8OBN6uY/eSj/zfJ/EBM1WRD7Sri0qmey0vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545567; c=relaxed/simple;
	bh=xsHVzhy9sxS1+Yu3Y3Hn/VCKn8LRiyWwMmN5vGs+6YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mymNPg220G7HU6H05JR635twc0e+Yrsac5gs9Ci+C4dPkf/0BHEffOXLSrQxFjJhsCpYttC/t2n7JwghC8OEc39qDfmEMZr9r6qQuvRTDsml5TdhDFPih2UhqNXG3vm/cHi4ZRExDAC4MgBKtSsM8KBLnkPdj/yCFeF12idbZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=0ph2alOI; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9311965a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 03 Jul 2025 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751545563; x=1752150363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nObl+SYcIa3QW/piwikKudB5bjd1HimTQxS37KWupiE=;
        b=0ph2alOIDnUdDxyGI0N55UnsDPiWsccgdo657pw4tSifz4aFf2qYzWwNJ66HvjQYPg
         P9hLIcINI3/I13YyzcVxD3LIeRDD5lo6aqKlDATR14yJmmNb1rICuLTZbqG8Jj5rQ8y1
         21weVM+c+DYPtVt1b9FbFA56JgCxm6gemqPc6CVDX1zcpbfuI3BHTXNNEu6TNoca8cgq
         VR8+4jjvAIr0agxWNOfXt5pbkh4aWzCokOXr4qTjswmXjTHZEC3M1cgetNnjbBzc09L4
         FEyf5WFNig2f6N5QBS6c/O1spGl3AMXYIqQ16h4WO+k6z+4RItNT9tLrtxEN1UragL81
         wQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545563; x=1752150363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nObl+SYcIa3QW/piwikKudB5bjd1HimTQxS37KWupiE=;
        b=nDsndXdB6vOoM5pXmFHzscKVCXbFhEe/9im85EpMlUlw/cZzic3aL/kGjGf8P7qocT
         Q/fBkhj+XFsWUY/tjasj2PSHlNXjGKG7xLOFM5fLKC5Vyyz+JTtE+gMM/anWQagSVHY2
         0JGJDd4UbJi6wWm1kqshB1z8vTo0AXzBuugW8eMSnx0vTx/ASSjT21/lp0+NWyBgsq73
         OA1+RC0j8HA0sqnAqOqJPt7wa2LDSAudG4V2JWwZyJIjUBK07IEUKuCz5g/m2F5HT7Rj
         jZ1zW1kg4W5m/BmoZbsTKuGx7x31Ewf6YBAne6G6w1UiSWbXz2nOFYQ7Xk2uBJYCGyfE
         dTgw==
X-Forwarded-Encrypted: i=1; AJvYcCUAOgTkrQU2KFFAR/F9U/DUkmu9ZDh9Ztpv3cEXxCt3uuUt8gJV5p0hB3rlRZO8sR59iiYDzE5PKOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6pi1DNImoaPJPe1NuVLHHsE9E91g1u5C8a5ArSyQzPpECINu
	CTbdn0f9QtDIxWInRq2IjgMGohdsCRDveL2Qlxmy8acuvE4eJ6Dt8Z0bTVg8SeHNsQTxN8HpfH1
	HGL57zcvFv5U7DB+vgwz3GDjn/pPQpylxcX2Vt9+yIQ==
X-Gm-Gg: ASbGnctgHhh9cZaa8fmBVDpRA2uTHyxPKhavURfsE3fDG2oe3UH5CJJG0KpEqRiPNHA
	SXl8UtZ24vLyl4YNdY6/NcDjJV9WFHY11ywdLCb5yH5I2vfG28LK4keRdy8s4R9Wc55egjuF9H3
	XsJPRgF2qCo05YWXXGo9BJtPs/uo2Zdi8B/hJmRIqXrwH0kTpluND0otw=
X-Google-Smtp-Source: AGHT+IEQsYSlWMf3Q9ENbLYf0hzYQ7kNTdCoTK8bDuxoivKIYAt9JBafQ0ZP5WqZFwf5XmjzV9WjVxRtGoE8EwoykYw=
X-Received: by 2002:a17:906:6dc2:b0:ade:2e4b:50d1 with SMTP id
 a640c23a62f3a-ae3c2bb9a30mr525010866b.29.1751545562485; Thu, 03 Jul 2025
 05:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr> <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
In-Reply-To: <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 3 Jul 2025 14:25:51 +0200
X-Gm-Features: Ac12FXyEmDCCZ2eYF1-BFnQ2rb5Xpv9SlBj8TpVb-TJbG9_3w-Q9dIeIUPPsPkE
Message-ID: <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Daniel Machon <daniel.machon@microchip.com>, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 9:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> > Currently, Microchip SparX-5 SoC is supported and it has its own symbol=
.
> >
> > However, this means that new Microchip platforms that share drivers nee=
d
> > to constantly keep updating depends on various drivers.
> >
> > So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> > could instead depend on.
>
> Thanks for updating the series to my suggestion!
>
> > @@ -174,6 +160,27 @@ config ARCH_MESON
> >         This enables support for the arm64 based Amlogic SoCs
> >         such as the s905, S905X/D, S912, A113X/D or S905X/D2
> >
> > +menuconfig ARCH_MICROCHIP
> > +     bool "Microchip SoC support"
> > +
> > +if ARCH_MICROCHIP
> > +
> > +config ARCH_SPARX5
> > +     bool "Microchip Sparx5 SoC family"
>
> This part is the one bit I'm not sure about: The user-visible
> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
> here, or more generally speaking any of the nested ARCH_*
> symbols.
>
> This version of your patch is going to be slightly annoying
> to existing sparx5 users because updating an old .config
> breaks when ARCH_MICROCHIP is not enabled.
>
> The two options that I would prefer here are
>
> a) make ARCH_SPARX5 a hidden symbol in order to keep the
>    series bisectable, remove it entirely once all references
>    are moved over to ARCH_MICROCHIP
>
> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
>    ARCH_SPARX5 but keep the menu unchanged.

Hi Arnd,
Ok, I see the issue, and I would prefer to go with option b and do
what I did for
AT91 with the hidden ARCH_MICROCHIP symbol to avoid breaking current config=
s.

>
> Let's see what the sparx5 and at91 maintainers think about
> these options.

Sounds good, let's give them some time before I respin this series.

Regards,
Robert
>
> The other patches all look fine to me.
>
>      Arnd



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


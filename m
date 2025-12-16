Return-Path: <linux-i2c+bounces-14589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B00FECC4871
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE52D30DC534
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 16:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E503A324703;
	Tue, 16 Dec 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Bci519GM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26B4C6D
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904198; cv=none; b=MUAv1issjvX1LgCFeSbQRPR+eo3rgasx5eq+K9qBiN1UFLIcctN8tv7SXHI+I0MA1R1QgVjyqu/v7hQJuGBL3vpkfpJUQto3YklDWvYiURfiVpVSC2avg3OJhohlp20qXz4dni1wUdtcFUNGCGyPZXsVEmEf2Jl+PCgfrH+aK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904198; c=relaxed/simple;
	bh=Q8UWsSe4myl6JsHqQXZQYvioe1R/IQ7hZDIpoW4Rb/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdqsEaeNMmw+21Wq+IlotDcucIsYw3DLd34Mu9+E4bF0xnxyGJWRg7PS4iEd8HC1mdARfMV67UtJnaZ8SrTjDe2dsUjsh6Gvl9vHhTQV03ALC2rnjZ7ZTdr/tm+xM2IG4B2+m4CQbnCZFAx2ap/WBvxngWdLqvdlLF1yza/iCC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Bci519GM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso6814530a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904193; x=1766508993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Do5MSIsK8H3vJghWudLeWsp2L3mzUT53/Ta2p6+bLc=;
        b=Bci519GMSOtC6TeCoUDyOlRLAMpK1+Q2VT7ZhSiNkVq/sylIitjnbfNXgSikndxl/A
         cd7NgVtjDoigrZ2hgv+nG6NUMdj4xZwAP7+aJX3C9nC+hC33rShtz/CMMALFyJaKN4gP
         47aeAH66w7rPn+An+lPnjgC8UK1y82k7RjHk0Laz0mRiKds6qMvdk1ypUkRe4iMFyIa2
         nURMkz/iL08EItn8+Gi9lzHxP24ZMohsictJ6bIc5meWCnwuCZiRYclWZ+JfO0qLN2T8
         mz84elWoDZq4kj7Opb6xh5i7WKc8WHHSRMg2pmXihuWhxphd7yhSNHxGPZ2wqxioow8E
         hjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904193; x=1766508993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Do5MSIsK8H3vJghWudLeWsp2L3mzUT53/Ta2p6+bLc=;
        b=ecoZ9n2FlAukB0oEKuB/XTTPx9zWu3oeUh+Nvwg4HQMQQtOEk8x+xmW9Wq1BeNXoCQ
         sZYoJ7ills/d/sUCL8L8tvcqyzxoU9dqpJ3V2aaCdARdGa0IfgGsJ2QhMmPiUP05MHBQ
         lgN+fgt5TELefJU/5iEKfucJaGKevy/t+AGSULBePs8cLxXwmgPC4nXV9x6c/dYgGLf7
         tdakJxNHT6+lnDNq7uW0MCjJkgRfWyZIurutoNPZjB5n0AfXaD0fIPUCn46F1bnpYmAK
         hQnef+bC+uMrUZbHYO2OO/enTMCiwUrVzIN8gd3qkxvbvWgqOtQwMeiR0ANY2JALxH2R
         Yafg==
X-Forwarded-Encrypted: i=1; AJvYcCUrjni45yAyM9UZYk6SPOpAZ73pdQ9dEdESoU2PyOfTNTOYKyVBxejnJ/bUgY4sWIb57i3GBXp+6Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjuZ593BK3dFfKFNaRPl9ux8G/yIxVkDMQfNcKlAgtGUk3/qJi
	5qf55MLdJDEMFmolcwSTC3X2RAJj2zC6vp0gXd8TT/ZaYFNFanuhCAfgNnn4PCkxynf4NjXQ4Kt
	6D/UyVDMMKHMB/zorwt+Xgk8wAPan4EFlb3rJNtLzPg==
X-Gm-Gg: AY/fxX7CwUHDlCpxygkqo/yh4ERdhd32rXKd+j2/42PTtLuDfTyydRPYJb4ytEPPwX9
	D02pXRN6LbbJdXgOsjNimwo7wWkGWGn7zCjgD7TuPXxYxSab216Wbn8uyMnDireGjkjYs2FI9A0
	XbZ8IBBeq007cMkUMe9heuvq8qWMu1Hr97d0mnfhU4wYfIbQvA9VUEeFsfohygx9vmWuJuk+xXg
	vt/Tz2Gfwlkd6Gje3qN7qTGFkdGr0BM1PZ7bEkiwBGxp/Ny62i1rHZoubb0DMg7p00IV+61
X-Google-Smtp-Source: AGHT+IEe8IRzlnpv6us5Kh+xr3yaMQ8uOrd9bT9YETlEwP5WNPrUGdjkFlMhzeEA5DOez3HUYl6RwAjZzXtLufIttIA=
X-Received: by 2002:a17:907:2d28:b0:b72:9961:dc04 with SMTP id
 a640c23a62f3a-b7d236ff5fbmr1632649866b.28.1765904192972; Tue, 16 Dec 2025
 08:56:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr> <202512161628415e9896d1@mail.local>
In-Reply-To: <202512161628415e9896d1@mail.local>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:56:20 +0100
X-Gm-Features: AQt7F2rO9yn5Ak9EU9SF12LWH7YDPd4rf09lvsuy-j2tIJy7_yg0e1grszJzZqk
Message-ID: <CA+HBbNFG+xNokn5VY5G6Cgh41NZ=KteRi0D9c0B15xb77mzv8w@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic Microchip binding
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, vkoul@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 5:29=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 15/12/2025 17:35:21+0100, Robert Marko wrote:
> > Create a new binding file named microchip.yaml, to which all Microchip
> > based devices will be moved to.
> >
> > Start by moving AT91, next will be SparX-5.
>
> Both lines of SoCs are designed by different business units and are
> wildly different and while both business units are currently owned by
> the same company, there are no guarantees this will stay this way so I
> would simply avoid merging both.

Hi Alexandre,

The merge was requested by Conor instead of adding a new binding for LAN969=
x [1]

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/

Regards,
Robert

>
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/arm/{atmel-at91.yaml =3D> microchip.yaml}       | 7 ++---=
--
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >  rename Documentation/devicetree/bindings/arm/{atmel-at91.yaml =3D> mic=
rochip.yaml} (98%)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Do=
cumentation/devicetree/bindings/arm/microchip.yaml
> > similarity index 98%
> > rename from Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > rename to Documentation/devicetree/bindings/arm/microchip.yaml
> > index 88edca9b84d2..3c76f5b585fc 100644
> > --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> > @@ -1,19 +1,16 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
> > +$id: http://devicetree.org/schemas/arm/microchip.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Atmel AT91.
> > +title: Microchip platforms
> >
> >  maintainers:
> >    - Alexandre Belloni <alexandre.belloni@bootlin.com>
> >    - Claudiu Beznea <claudiu.beznea@microchip.com>
> >    - Nicolas Ferre <nicolas.ferre@microchip.com>
> >
> > -description: |
> > -  Boards with a SoC of the Atmel AT91 or SMART family shall have the f=
ollowing
> > -
> >  properties:
> >    $nodename:
> >      const: '/'
> > --
> > 2.52.0
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


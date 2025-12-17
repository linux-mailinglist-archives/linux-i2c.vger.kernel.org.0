Return-Path: <linux-i2c+bounces-14628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E2CCC7D8C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 14:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9A53303B670
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 13:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7306B3659E7;
	Wed, 17 Dec 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="G3TZwRs8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A663659EA
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978386; cv=none; b=VP7aqIrxgQUAtGl6q2vYJjZyoRTnlo8Kzzk2Pp85VYVyKChF17VFmDso81juXm8pU0UMAE3PBTIPKIRHGmCO/XONF1FgLDrTGSJciiX5zQsZSCnhoWObIJczxWQVF8dcAbnoxNTFeULEyY9KsZOXzZKESyOm3jc752CJfXEhNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978386; c=relaxed/simple;
	bh=3NxV/sdr2BZyW6Fp6jeGvfWxTA5ctLtFaPPYKmOmWzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUB0bZ8j8An/lYOfMAJlupCvqbNf2Qax9b7QBG2ADpSDq1G33XFmb3JrM3RHOoLnbO20ijVbO6bYfH7zffqXFM9RyCmddOKKRh9RbezejqQS41N4C2LFTVWJZ7+q6/VTv/Qcm3d5JBNJZcsvP5r4c2/AnzzIgnBjuhMGRDXl5yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=G3TZwRs8; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so10281602a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 05:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765978382; x=1766583182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NxV/sdr2BZyW6Fp6jeGvfWxTA5ctLtFaPPYKmOmWzs=;
        b=G3TZwRs8slika+uM8zA2b/tbxbmR9UD4zQjKjHTYFdQgFKQIvb5WcOE963ZZ02V0Mc
         qP0y3gHvcLeM0uzdbqcjgz/OUiak06hFqxxk2bqy9JyIuV+hWAOR+yfQT3/puygEdmcZ
         mSOwl2czqg7bWviUHQvoqfL2VNr6lSNSEKluYXqSdbSaAHT1yuKd6fpzL1rD93FYSdgq
         nGfR/UWTLwfs3EF6NQKalofoEucjD9bsNEEN4J8bADznJikY/0q8pziBBNcl66wb0YW6
         VefrjPLW58syX/GbFPK5ltyANGRw4PSWy3W4rvQNgVF5nVe6Cj7L6F0oCvRlAt9PVq8m
         SAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978382; x=1766583182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3NxV/sdr2BZyW6Fp6jeGvfWxTA5ctLtFaPPYKmOmWzs=;
        b=WanIjR9bBQdEFhcq0dlRFxozxKAdZZCtzLdHHetAqCE6G0imIIO4tGaYGQCyIA2dOw
         zkmIzheq9On7cOCuz63C9kg0IoOkXAeSaXMEjPLswbfxder8JpMOS2FnprWeXFpsbFiE
         aCj09F05I1FYfqytKGniADd1Ltl7FD4seHHMkUc5Al0lDf3AS2gGOX45/Pdtlm73FxSB
         uhlRNezU5wh7BX0SjG/4yO2QvYVtgiRcnVO2Y4ZiEvjsoprQP+NHsui/NXKTOr7uIcA7
         b081yFofKB4YHyjU8Lbu/il1H8YaPW0URAIBQt2rq+FxN5gB2jOwaWwt+tpsWIJ6OPjr
         yD4g==
X-Forwarded-Encrypted: i=1; AJvYcCWn90BYgMyzz7GHSBHT4373nY/S/UuL5jcEHeRaiivoXQo3/iIy70zN0Y1Afnb1b47ZK8t/UbTPB/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0kytlF0LkLfFxqS+D4uiZQwKpsC6f18GcaR++B3zCuiZ0qkw4
	Ke6iaNhK2gkYXyG3Wj+yZIGNsJ+4prY9mOHllVAUCAadA8tf96vjXC+aJ6cAEzwUda6z07kbSNR
	yJTQ17R7jA2xUivfdbYpKTOmrfRHcrKSxr3Ltiu8Bfw==
X-Gm-Gg: AY/fxX44ckQ+xwo7d6mkNAeise6XXkStJMcC5HC4T1JINkeF42QtfYaJi0PqCXpmqFI
	If6rxr434JHXcXXikeGB5mETIPhwmuJineEqmUDi5SsGuPLal2+mzxdsmBo4BgOjKi5TbT2oK0J
	Qd0QucezRC+oLPgJmI7LFchtaGi5UCXvA56EXiHY84k6eGULnoZVkM/g8IOZUxBSD0TFgMgcojv
	Hcf74Ua7cCyVYoapXrf4e3U2rgKdKtH4jx38MfD8NDcF6p83iD0nke05CFGFUWuOq8w9Sll26xQ
	XeJixPkJc8XTDqp9vgmBgGFxLU01U6Swx8PNGZXIdp1RkAjn+cb8
X-Google-Smtp-Source: AGHT+IHQBmS2mrQa3fgyiBBuz2kWHV24zlBwa/1NFFHKPKgWTqO46GlqIXXFCMupFuoXyMzVWH1kl/6iZAAmZg0kVsk=
X-Received: by 2002:a17:906:c39e:b0:b7f:e709:d447 with SMTP id
 a640c23a62f3a-b7fe709d458mr591500066b.33.1765978382116; Wed, 17 Dec 2025
 05:33:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-5-robert.marko@sartura.hr> <fe15fcce-865a-4969-9b6f-95920fcaa5c7@kernel.org>
 <CA+HBbNGNMGRL11kdg14LwkiTazXJYXOZeVCKsmW6-XF6k5+sVA@mail.gmail.com> <3d6f254c-d53f-47d9-8081-8506d202bf9d@kernel.org>
In-Reply-To: <3d6f254c-d53f-47d9-8081-8506d202bf9d@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 17 Dec 2025 14:32:49 +0100
X-Gm-Features: AQt7F2p7AtghDvAyv4NK8Ascs8BHBx___HwB1JF-DX23awYiIEMyiUo7jk7sWyI
Message-ID: <CA+HBbNEKJ2qG4s51Gq9dh0uGuSwyPDfsq+mb5w6Kry6e9N0VSg@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] dt-bindings: arm: microchip: move SparX-5 to
 generic Microchip binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	kavyasree.kotagiri@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, mwalle@kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 2:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/12/2025 18:01, Robert Marko wrote:
> > On Tue, Dec 16, 2025 at 4:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 15/12/2025 17:35, Robert Marko wrote:
> >>> Now that we have a generic Microchip binding, lets move SparX-5 as we=
ll as
> >>> there is no reason to have specific binding file for each SoC series.
> >>>
> >>> The check for AXI node was dropped.
> >>
> >> Why?
> >
> > According to Conor, it is pointless [1]
>
> You have entire commit msg to explain this. It's basically my third
> question where reasoning behind changes is not explained.
>
> When you send v3, you will get the same questions...

Hi Krzysztof,
Considering that instead of merging the bindings LAN969x will be added
to Atmel instead,
this will be dropped in v3.
Sorry for the inconvenience.

Regards,
Robert
>
>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


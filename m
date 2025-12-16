Return-Path: <linux-i2c+bounces-14590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F73CC49A0
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 755D2302EF68
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C977B325702;
	Tue, 16 Dec 2025 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="uLbYzMri"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD629B224
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904414; cv=none; b=R215esriUBhhbzev5qcfopfhgXx9Go3yruM0Uq8QX6y6GaEN/eJ1WqkGQ+pmG9L8+mNg5ukgn0Q6pZbJHcvGleZ7p2Ojlnd5bgabpFTn2VKLWQa3zp/D5ygXn8Bjy0biQKR9mw9JRVmtarNjeEpszCsfdW2oetEaXTGTQAQn+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904414; c=relaxed/simple;
	bh=3IYSY9PEuKyOHfJY9QUPzKffXbog8qESM1aHD/icEQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RiyOrCJPDbhmK2G7h9ICqZpj8j0LqOz4VUPS0DdQAy7B9BqXPgLwUqu0LIyaSWQBjAAOdk7NUIEH+1EuJSblBz4LywVs+EWKTsxA4iAA7F9GycCBy+yusYsK6eHfd0dhvSFChiSEgpKQT7JPZI2M8AxD/EcHpEkKB1iFHNIIlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=uLbYzMri; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b713c7096f9so808911266b.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904409; x=1766509209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IYSY9PEuKyOHfJY9QUPzKffXbog8qESM1aHD/icEQI=;
        b=uLbYzMrikJbXrolr+nmd8GSQvVajEW2UEgZcKqPe98hLq6969czHgw88r2gKgv9n5u
         ixZqm5Wo6D1T8G67PuoT1Pimw9a9H8Gng18B+7E8HTMjw56nSu1yz7gDHw+g+vmRSKLr
         gk0/g8Y+x/aWaCUqxrwE9zDC5PD8LV9bGzo87ea8hL8QgKCjEm4k2rA4fDNMuZjdh67E
         Lox7A5otoQz5W1IywzHMQiIHGRqUiI9nJtEW8Cx4k4A/B/guEyElge9f6iEfVJEdC0ux
         j6abMKT6eZjDeqEBa22QNXgQVQsab+JFiVeCrui/Jnd8iWbRdR6hnfFf4cCZMy5cI6ar
         P1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904409; x=1766509209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3IYSY9PEuKyOHfJY9QUPzKffXbog8qESM1aHD/icEQI=;
        b=PYcCFfu8GUtbgYH4HVrESk+l7Nu9Y5TiJfHP2gAAvODpmOyQ3lnxNwFmMfQbm6p8aH
         fiQOMkigrjL2DRJUfXhltCXbQALdly/qz5ljE9gAfNtm99QmtyLqpL5WoxqR5CXojxhz
         2PZ4cgqLIRgV97WXg4Ik4NKsZCsx3BNxP7cS52psY4pYfYlZsJ29r65yjqpYlNwlyogL
         ytK1mZyM72T+5oHuW17cuD3T4uG0Ci+eXMs24tRiiIZCGlTu/owOlTrdW70duZLYP6kl
         bvCA0rQghbE855qJgbaA2/DrLxNVI3FcQ38CHAaaxMYIwcy+wuQtQgxFJkMdseiWcIer
         hcOg==
X-Forwarded-Encrypted: i=1; AJvYcCWQO447Tb646sOOB9KgB9lvZpSiSZ/qYEBXJwH9mf2+wq7mbCQf5ApaQyCZsl/naTJJ4ggwCe9KMV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyaQGWkQhK+ERriElq2oiXUmxDwMPY5Wd08OdB+nrGoiEiv7cg
	4WodbhtG/y/h170Ep9CUACVQatCU+8dXarfqH1mXWQGrj7fjfYyxQ9z6TzzRPFei93+8jjWSLf4
	c6DW7R2jviWABV7m/O3X/PnnQy0x3FiwegWkoDhSo8w==
X-Gm-Gg: AY/fxX7NoFpVTATsuMZKV5A6UyAcKYmX3om++JGeQiPEQXuD9We8AOQ6Q4flMVaxzKX
	Sz8R16GVRi7dNqspcdmM8xJNekJ0VhKqC7lHSnWY8GTT6UHXduf63SzA4VtsgAwE4XJI3y6UEUi
	Emm9FYYQWKyHBtmo/1OvvPtLuxuc2SInRvE6qmgEBVehbwCh8S1BLH1O4hnP1xqEVCtTS+dxExR
	j9o7V81B7CwYRAFzhzUtsssVkr1dABERdQxvXFpjpQauTcYSDznTjrG5mKJZsmATI8h9tno
X-Google-Smtp-Source: AGHT+IFwk4Ao673gGD7fsG2ghKfE+CBJxlDalRvkjfP0dfzZsUtUavnidDCo43zIGnGvG5i0aqfY+tiPySp8HUjss5M=
X-Received: by 2002:a17:907:3e1f:b0:b76:f090:7779 with SMTP id
 a640c23a62f3a-b7d238bb030mr1612478166b.33.1765904408497; Tue, 16 Dec 2025
 09:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr> <23e02efa-bb94-48ba-9b6c-acee5d8f6576@kernel.org>
In-Reply-To: <23e02efa-bb94-48ba-9b6c-acee5d8f6576@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:59:57 +0100
X-Gm-Features: AQt7F2oKQzHSEY0k9JattjchuSq-s1wqnAD6k9L-CshDVUNdGCLvRtWCtUFfTxw
Message-ID: <CA+HBbNG9wcDTPD8GAPVECecUN8maSvTyahkxaXsHqzLY_8aM3A@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] include: dt-bindings: add LAN969x clock bindings
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

On Tue, Dec 16, 2025 at 4:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 17:35, Robert Marko wrote:
> > Add the required LAN969x clock bindings.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
>
>
> Where is cover letter for this patch bomb explaining previous history,
> giving lore link and providing any background/rationale for making it
> one huge patchset?

Hi Krzysztof,
I should have made a cover letter indeed as it is quite confusing.

I did not plan to add all of the new compatibles, but it was requested in v=
1 by
Conor [1], Nicolas [2] and Claudiu [3].

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-4-robert.marko@sartura.hr/#26687201
[2]https://patchwork.kernel.org/project/linux-arm-kernel/patch/202512031223=
13.1287950-4-robert.marko@sartura.hr/#26698565
[3] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-4-robert.marko@sartura.hr/#26690625

Regards,
Robert
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


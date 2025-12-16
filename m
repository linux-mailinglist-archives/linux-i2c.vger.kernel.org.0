Return-Path: <linux-i2c+bounces-14591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 207CFCC4879
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DEC5302EE48
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D92324B0C;
	Tue, 16 Dec 2025 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="N6pxMkEd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039A5319857
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 17:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904478; cv=none; b=In8ZVdFPvLZ6g74CjtuHMdiCnDHnNE+mRqMmxlz1Almh038kjw0I+oHOsh9DZDZgLYTG6EC/BuRIcjs6zv/9WAvQ7guKuxinZTB7SJELIYduvnRzj8kAN2B4iK/VsF5qP8IAPmjD5+0WzcbAbLG5sRAJaYJTgiYcN8y6db276a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904478; c=relaxed/simple;
	bh=FwQQU5q3mw9YrloIZOuHcsfzqU/fokbOnsPKngY00gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ka8Td9Hm2dCwvcfOg6wNH/9uQJZnx/WtQL7TkCwW8PPa3XbhWP/46oPCSm7hQJM0HXMzL/NdTWpQko2Q77rQ+znmdBQf3x1ra7VU1vSV+rbtPRDJKOMrQJE5K+8DStG4g1LPMnkKMxRvKsSTx0v6iwKSJXI13VUQQ1uYLs4S/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=N6pxMkEd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so849547366b.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 09:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904474; x=1766509274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4BVhGwuqRhR0h5Wvfr3twMpRndihHjDu8cj/PGuiBM=;
        b=N6pxMkEdCE0zY7b8qXrbJEKlw/BdW8A6uV0nIShekTo1OJUHTIjkrgZEannuSYp4iD
         e4qkQOSmjfWADxiRkmXy96eLZp7PPAMSbWW706pULdpF3hdR86gFrdVNe14lwhyDrIM5
         JLCQyN5Fr97W3mXlw6qrmrUKtExVoLgzPigg9cZri0jlrIbZRluWsp2Zyd4Z6s/a5QOb
         C/82TmhhKHa1Nr3dLmXjnHDcory67KfhO8yAX92h6NJamErUr6XHFF4sJPZuo4+625Db
         XPmEPl+1VdMm3tDvSlaFgKS5KWihV3PvA4DPbxkdVsvVtVyjR9XTjpemrRuZGNl00nBL
         5hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904474; x=1766509274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j4BVhGwuqRhR0h5Wvfr3twMpRndihHjDu8cj/PGuiBM=;
        b=rFbVNWxIvQYZGkRno9+fx1/eO/YZPWAJjZfJDGZDGPxnBhdiDZDmAk5H1Z7mQ45w/j
         o5Pz1CIPmIp3o6COwvbDBWhTZrVS6rhHnfb6NKqlzVN9JJENfEeJPv3f+BeQFpc8sXV8
         jqpxwAYDJlO9nXO9QBu/al6JPTdNzRkRd8wKtum5c0EEtJflXiWqk6AhAQzqfQSq/XGi
         8leqUCBfrKtBYWNYyxdgA0cdTWpwdWRwtDuffrHgvAkvYyDtt1WMSeAHmVT9XxaBUs+y
         rHr6FutKmbZ5wd4JaA5pbUg1p3e9DZZsCnY9+wRlmXafXmva8QkkqIzmtJEEyq/z+a+D
         0E9A==
X-Forwarded-Encrypted: i=1; AJvYcCW8RU5pazNQj5Oltk33YFNQZZKar9tl8WF4cz2ljlaxD5/m+HxN2JSgIchQvOkanhBAAYAmKZDGCX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuCfKoKr9qoyPNYn2E7276IwVy9o0/iS5/Dos+RL1Lq1fWa9OG
	CNa6ls0SNLOTS60RPKq7Sq38teAuWdLyRtPd/x30hZEKK7JIZuNBUshDevn4jXTLzoJbhQpAs0R
	tVKTiaKmOjbirZnU1ZVe+Dj+wNVB+0f1WAKlP+P7YNw==
X-Gm-Gg: AY/fxX6W4MWm0/XsnvwjSVP4b71kZRJNcwbjHdAEPMzHtHdc12ulz120wSQChEG9zpl
	o0hfEJIOZBSawbtNWWWR7HMjn88uhknKvvnH0YH1ZODerrKiXh9GruXiNihCCOTDOuP2Fi0A9eQ
	Ic5LDkc9Nj87uQHFNkdCNMpkLD6cyYybVk30Nh6hOpW4cScivOiwVdPOGxaTtK2mx8BHXNyp40Z
	Qzi/FctULoQ6nUwmHDQSQBATwXFOD/b65TpUsY2hqZQ33ej9tuvR3BRXgvyAoe2fxpZZVeN
X-Google-Smtp-Source: AGHT+IFgWHsN8Jt+GNNh/GtbzMrps7YuiUN4HCSjrLSYBUNl98CacMkEeJqhHxiowRyslb2rMUAVRC886sKdRRnuksE=
X-Received: by 2002:a17:907:608c:b0:b74:352d:6dc1 with SMTP id
 a640c23a62f3a-b7d236b61b4mr1684820166b.28.1765904473954; Tue, 16 Dec 2025
 09:01:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-5-robert.marko@sartura.hr> <fe15fcce-865a-4969-9b6f-95920fcaa5c7@kernel.org>
In-Reply-To: <fe15fcce-865a-4969-9b6f-95920fcaa5c7@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 18:01:02 +0100
X-Gm-Features: AQt7F2oP6MyGEflW0Nvuzwrgr5iXWpqv_VRgduC1yuFaCXQ7imivVtKDExK377E
Message-ID: <CA+HBbNGNMGRL11kdg14LwkiTazXJYXOZeVCKsmW6-XF6k5+sVA@mail.gmail.com>
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

On Tue, Dec 16, 2025 at 4:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 17:35, Robert Marko wrote:
> > Now that we have a generic Microchip binding, lets move SparX-5 as well=
 as
> > there is no reason to have specific binding file for each SoC series.
> >
> > The check for AXI node was dropped.
>
> Why?

According to Conor, it is pointless [1]

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/#26691879

Regards,
Robert

>
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/arm/microchip,sparx5.yaml        | 67 -------------------
> >  .../devicetree/bindings/arm/microchip.yaml    | 22 ++++++
> >  2 files changed, 22 insertions(+), 67 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/microchip,spa=
rx5.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yam=
l b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> > deleted file mode 100644
> > index 9a0d54e9799c..000000000000
> > --- a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> > +++ /dev/null
> > @@ -1,67 +0,0 @@
> > -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > -%YAML 1.2
> > ----
> > -$id: http://devicetree.org/schemas/arm/microchip,sparx5.yaml#
> > -$schema: http://devicetree.org/meta-schemas/core.yaml#
> > -
> > -title: Microchip Sparx5 Boards
> > -
> > -maintainers:
> > -  - Lars Povlsen <lars.povlsen@microchip.com>
> > -
> > -description: |+
> > -   The Microchip Sparx5 SoC is a ARMv8-based used in a family of
> > -   gigabit TSN-capable gigabit switches.
> > -
> > -   The SparX-5 Ethernet switch family provides a rich set of switching
> > -   features such as advanced TCAM-based VLAN and QoS processing
> > -   enabling delivery of differentiated services, and security through
> > -   TCAM-based frame processing using versatile content aware processor
> > -   (VCAP)
> > -
> > -properties:
> > -  $nodename:
> > -    const: '/'
> > -  compatible:
> > -    oneOf:
> > -      - description: The Sparx5 pcb125 board is a modular board,
> > -          which has both spi-nor and eMMC storage. The modular design
> > -          allows for connection of different network ports.
> > -        items:
> > -          - const: microchip,sparx5-pcb125
> > -          - const: microchip,sparx5
> > -
> > -      - description: The Sparx5 pcb134 is a pizzabox form factor
> > -          gigabit switch with 20 SFP ports. It features spi-nor and
> > -          either spi-nand or eMMC storage (mount option).
> > -        items:
> > -          - const: microchip,sparx5-pcb134
> > -          - const: microchip,sparx5
> > -
> > -      - description: The Sparx5 pcb135 is a pizzabox form factor
> > -          gigabit switch with 48+4 Cu ports. It features spi-nor and
> > -          either spi-nand or eMMC storage (mount option).
> > -        items:
> > -          - const: microchip,sparx5-pcb135
> > -          - const: microchip,sparx5
> > -
> > -  axi@600000000:
> > -    type: object
> > -    description: the root node in the Sparx5 platforms must contain
> > -      an axi bus child node. They are always at physical address
> > -      0x600000000 in all the Sparx5 variants.
> > -    properties:
> > -      compatible:
> > -        items:
> > -          - const: simple-bus
> > -
> > -    required:
> > -      - compatible
> > -
> > -required:
> > -  - compatible
> > -  - axi@600000000
>
> Nothing explains the rationale for doing this.
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


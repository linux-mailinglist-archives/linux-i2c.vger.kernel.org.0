Return-Path: <linux-i2c+bounces-14587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A6FCC453E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1BB430966A0
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 16:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6782DA76F;
	Tue, 16 Dec 2025 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JdmxJGyQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5839929BD88;
	Tue, 16 Dec 2025 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765902547; cv=none; b=QL0G7Q6f0pjTUU+3XfhxbiJESv9FugmqKSIYd/uq6e6BuRVXMxv0L0D6cX2SuMPNUohixuo0kVxihxFuOYqsgqixs4Sm7lspUp2pTE2fDFJOlhk5kW8HgSGCz76JUfbC2dbbwGEWvkze+uyFFmRo6PbjcoIKgy39rCoWM0z9OdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765902547; c=relaxed/simple;
	bh=2Q+qK2NqcPX9cbzhyXO64+yCRyf/DbYINlYSrayO9q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYjGxfWm6uLfREkpzCUdAhW4dtPFh81MzIjEXyqueu4TWs8+HdTxQKDqpDhr6x4vNQBKVr5g7hE6/QvQ3UXGxkbCLssanjZsWz7Q5OdftqCiiBdO99G+fTIVXwbgMtJKEE+g47Dmgx136Ul7w5WdAwUW1SWVay8D/jM+2Q790pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JdmxJGyQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5877C1A223D;
	Tue, 16 Dec 2025 16:29:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 150F96071C;
	Tue, 16 Dec 2025 16:29:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6A63119A9036;
	Tue, 16 Dec 2025 17:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765902535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=WDH8v49meu1cbdbqCsHVd8Ol6TU4lh3FhMKZUYOzIyw=;
	b=JdmxJGyQPl89ZvAe+i5sgqoeA7jQmxJWnBAIHwZxcehomzVI9qb40ttSy9cx0wRqbThzlq
	lHAyEaQZl2k3DPsEQjC65K+IuLFg7sKNjqiBePyTq7VviJcrRHiM9bN2eMTapQXooL3Lmu
	joBBSrhkICZtvT6a/2rKkS5eNphmHSGwgOESA/7qal3nmlbmOmLz+W6tugpU9vkYI95Zr+
	oxUYy7GXXT1YkRVynXnWByxfKZ94QxEpAfuHNh8d9Ac3oWCQsqX4988ORYKqvM0U/YQqfL
	3mBQCk3ssFunMThFAA4+VRHjyfUtDGefOn2sRBJLRZ0Frk8p1CsW+dFfmlCeIg==
Date: Tue, 16 Dec 2025 17:28:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, vkoul@kernel.org, linux@roeck-us.net,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, mwalle@kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic
 Microchip binding
Message-ID: <202512161628415e9896d1@mail.local>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-4-robert.marko@sartura.hr>
X-Last-TLS-Session-Version: TLSv1.3

On 15/12/2025 17:35:21+0100, Robert Marko wrote:
> Create a new binding file named microchip.yaml, to which all Microchip
> based devices will be moved to.
> 
> Start by moving AT91, next will be SparX-5.

Both lines of SoCs are designed by different business units and are
wildly different and while both business units are currently owned by
the same company, there are no guarantees this will stay this way so I
would simply avoid merging both.

> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/arm/{atmel-at91.yaml => microchip.yaml}       | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/arm/{atmel-at91.yaml => microchip.yaml} (98%)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/microchip.yaml
> similarity index 98%
> rename from Documentation/devicetree/bindings/arm/atmel-at91.yaml
> rename to Documentation/devicetree/bindings/arm/microchip.yaml
> index 88edca9b84d2..3c76f5b585fc 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> @@ -1,19 +1,16 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
> +$id: http://devicetree.org/schemas/arm/microchip.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Atmel AT91.
> +title: Microchip platforms
>  
>  maintainers:
>    - Alexandre Belloni <alexandre.belloni@bootlin.com>
>    - Claudiu Beznea <claudiu.beznea@microchip.com>
>    - Nicolas Ferre <nicolas.ferre@microchip.com>
>  
> -description: |
> -  Boards with a SoC of the Atmel AT91 or SMART family shall have the following
> -
>  properties:
>    $nodename:
>      const: '/'
> -- 
> 2.52.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


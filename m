Return-Path: <linux-i2c+bounces-14770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D5CDDEFE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 17:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D79633012BE9
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 16:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C35E26B755;
	Thu, 25 Dec 2025 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w2oWrB/L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A21026F289;
	Thu, 25 Dec 2025 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766681125; cv=none; b=ieuB23YmqrmtgAxNJEjX4/MtyfagtM3YfuFod/Rqof0gksDoLxeslHBVjGOpYSZhCXItxH5QNc2lgqDYiaV3zYnvMeXnI9yBlp+iJwaHvPokuxOj0EJfZZ6Eqv/GHDokBSt9UYZRRv1wckVKUUGCszM8Y66Nte0xW11Icq8AQhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766681125; c=relaxed/simple;
	bh=F1jhIpkPigW3NGIX9mflaV75Z1dCaWVNIHmhw5WRobg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNO4rVOchX2/kJG9HVXRfcQ1aQJATLlG4WGLVqd5lehC5Wsa6eF8kBUVxsSJhHSwBHqO4HGh3A8i+fon5yhjEhny5UvMVhVhfyZyOoSAYCaQfs9yWmWuAyjyCtbAZeGvNFSjkqj+lv1vxF+8Z7nKTzIJWh0iFMEARvjijAfNXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w2oWrB/L; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D6A71A241B;
	Thu, 25 Dec 2025 16:45:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4ABC60742;
	Thu, 25 Dec 2025 16:45:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE071103C8CAF;
	Thu, 25 Dec 2025 17:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766681118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y+IbK0Z2/OU5lKK1OsobvgQQxvg8i2YYJKuwcQL/IaE=;
	b=w2oWrB/Lvj0ilqa74OxdNWZZ5v5bZKDMsOwNdTw98nCTYRmHJf0e8HPP4xrul/ajIIWaG6
	t+8YBXYcFixu06CqgdbC5v32jcQub6bcSngIGegihqteqFa3sT2OygBAntd7puzJ5JuOLc
	yrAN1lGgPUzv5ggcWybFYL0ATjFVbfwCFzSN99Xyolep1YR7P1d+HA4V2jYmfT5EpNkjGj
	taMJ9+3ELee1EwOn0NwVvTxts78Sk4we6hcqZom9KxJwUndXFo9dk4NPmJ/VIt4ktwNOtg
	Jix8U3vz8F7vK0JiOUBb9DweiouM32UX42UK5WVXYkIP4EzjlXnlyHNZTEZLSg==
Date: Thu, 25 Dec 2025 17:45:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, broonie@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, lars.povlsen@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Message-ID: <20251225164512525907d8@mail.local>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr>
 <20251224-berserk-mackerel-of-snow-4cae54@quoll>
 <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com>
 <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
 <CA+HBbNG+ZVD6grGDp32Ninx7H1AyEbGvP0nwc0zUv94tOV8hYg@mail.gmail.com>
 <d210552f-c8bf-4084-9317-b743075d9946@kernel.org>
 <2025122516245554f59e2e@mail.local>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025122516245554f59e2e@mail.local>
X-Last-TLS-Session-Version: TLSv1.3

On 25/12/2025 17:25:07+0100, Alexandre Belloni wrote:
> On 25/12/2025 09:47:34+0100, Krzysztof Kozlowski wrote:
> > On 24/12/2025 15:01, Robert Marko wrote:
> > > On Wed, Dec 24, 2025 at 2:05 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>
> > >> On 24/12/2025 11:30, Robert Marko wrote:
> > >>> On Wed, Dec 24, 2025 at 11:21 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>>>
> > >>>> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> > >>>>> Add the required LAN969x clock bindings.
> > >>>>
> > >>>> I do not see clock bindings actually here. Where is the actual binding?
> > >>>> Commit msg does not help me at all to understand why you are doing this
> > >>>> without actual required bindings.
> > >>>
> > >>> I guess it is a bit confusing, there is no schema here, these are the
> > >>> clock indexes that
> > >>> reside in dt-bindings and are used by the SoC DTSI.
> > >>
> > >> I understand as not used by drivers? Then no ABI and there is no point
> > >> in putting them into bindings.
> > > 
> > > It is not included by the driver directly, but it requires these exact
> > > indexes to be passed
> > > so its effectively ABI.
> > 
> > How it requires the exact index? In what way? I do not see anything in
> > the gck driver using/relying on these values. Nothing. Please point me
> > to the line which directly uses these values.... or how many times I
> > will need to write this is not ABI?
> > 
> 
> The index here is the exact id that needs to be set in the PMC_PCR
> register and so it is dictated by the hardware.

This is the line you are looking for:
https://elixir.bootlin.com/linux/v6.18.2/source/drivers/clk/at91/clk-generated.c#L44

	regmap_write(gck->regmap, gck->layout->offset,
		     (gck->id & gck->layout->pid_mask));

> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


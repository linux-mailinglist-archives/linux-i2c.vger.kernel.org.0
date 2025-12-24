Return-Path: <linux-i2c+bounces-14760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 309BDCDBFB9
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Dec 2025 11:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C75030B3045
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Dec 2025 10:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EDF3161A9;
	Wed, 24 Dec 2025 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvP9FiFE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA64313550;
	Wed, 24 Dec 2025 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571673; cv=none; b=UPAdtUyyWDAUiQPcBKPKO6POHEUBIPzFJC+LNJLaeOWg2L3OFgqW2lws9aVAR2phweHX8jzOnUnW5OAu/ODB5ACmZxeSquaxJ2NRmZJa9xY44cnWo7itDR2uX9JHBJz9NPlVkAnBYJMGc13ckVFTaS1kdH4oBXGkiy3jnizNMNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571673; c=relaxed/simple;
	bh=ku5OdGWYGavTvfxthybhfXDigWzMuc6sN9BkMdAsfOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEp+RddQexxeh9dVVnCEV9OH8CLD6J+71KRH++4QcVq5AgWkYVhmFDNPBOYZVtHSCr1h+GX55P9v7PEJ+UzonDz1x7ual8nTWwEj9srkXCCs9RVQD1St7W64tutX47QYQSA2xaUpiiT1rRLUinTwgjYsoxBy8iWfkbfwp366RPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvP9FiFE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36715C4CEFB;
	Wed, 24 Dec 2025 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766571672;
	bh=ku5OdGWYGavTvfxthybhfXDigWzMuc6sN9BkMdAsfOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvP9FiFEieaUa1XZkBvydCFVeXBtEYpa6DJ+ofow0D2KGuEiCDJfspiM8q+Q40K3y
	 eSDwRjQg9p2bSWhf1ucxxVm9RqXzPHKXu+Xyi5Ikobwz8lJP9jGhL/bWgOFuuMA0Bq
	 mswKTP8/X1DaDVr0SU4nwVFGvaIQedho/Vn2XyPet9o50eCPEfS/ftk9vVncZ44s2E
	 a0H9rvBPgFTMctPWtC229fOJvL40X09lUTmg3IGpRpn1WQqfclPA1sjtubbkWzgMHR
	 QKrz3dMbtBbD6DHTD/6CebYw3e68dtKxHY/h8rVQH4eO9zaMymAhTinziyeRibTQVQ
	 29GtdaKscLlrg==
Date: Wed, 24 Dec 2025 11:21:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org, 
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	lars.povlsen@microchip.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Message-ID: <20251224-berserk-mackerel-of-snow-4cae54@quoll>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223201921.1332786-2-robert.marko@sartura.hr>

On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> Add the required LAN969x clock bindings.

I do not see clock bindings actually here. Where is the actual binding?
Commit msg does not help me at all to understand why you are doing this
without actual required bindings.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
Bindings never have a "include" prefix.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof



Return-Path: <linux-i2c+bounces-12379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B19E1B313AB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 11:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581F01D23067
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 09:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BAA2F4A13;
	Fri, 22 Aug 2025 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="NDpts+Ow"
X-Original-To: linux-i2c@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDEC2F4A06;
	Fri, 22 Aug 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855161; cv=none; b=nRIEj5WNMYVW28pEhCaGWaV/yzqyx5ivnTNQ/Bqyz7oq9qeO6geISngLqZTJ9dwOMsW/fmhnXn1u5XlTcKsl3DSsWF+81/iIU7dlB8xvx0gD0JdJZh9arJP4dcdmTSkJoSYAQh+qhJfrT9ZrO4m5e/t9x2ohVT9oS2TsvXDx3EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855161; c=relaxed/simple;
	bh=RiagEh0Bk+y3updUtKIZi6iOs63EGBVmarkyFpIMF2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZa08m6fwk0vsRE2p74G0EWkze6dPDMkGXr0+GiB89t9O+5FP5anmRJvzY3VJslIOqm/iqsu4f8D8f0gGeJFenMTofXY8zY87VMwokLVlclcHdCSqAM0tQwADTLZp99HAtSNU3kn0ktOBJg01xylaHU5w988NrtvvNepCpZa/hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=NDpts+Ow; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ROyhNrncK658haLq5ZO1KaSMWsOIBPy61dygEVqQzjI=; b=NDpts+OwAboF+KyuG/H4pnt6oh
	iuRtXo9XDXGe+OfbggYWMcs5wqkvX7DD7WGxp6I4TyR8HYrz78DZtyap5jsHK/NQcKx5shh9HNNaA
	XssYw/DTXB8s1cz7OY3R9SC00qM0/s4pECmSmdhnJmVxvo9qlcPjnGWuIYc30RWH2BUyVduIBcakO
	PiKfZWkwnt5A50tFwKlRPpETvsD6V2VQMXPzxwsa0BswpvonV13JBONP+0ZND15ZgZnu54y1omZA0
	3X8LLGhsu29+d71RPg/fscTk4hlYh0wgvzpw1VH4IUPNPSrloZ7yxd76dY1wOvvKto+kPpGpJjKdA
	1vd6DHTQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1upNsW-00GN2t-1r;
	Fri, 22 Aug 2025 17:32:05 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 Aug 2025 17:32:04 +0800
Date: Fri, 22 Aug 2025 17:32:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	davem@davemloft.net, andi.shyti@kernel.org, lee@kernel.org,
	broonie@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 9/9] crypto: atmel-aes: make it selectable for
 ARCH_MICROCHIP
Message-ID: <aKg5FKzlF_AABz9Q@gondor.apana.org.au>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-10-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-10-robert.marko@sartura.hr>

On Wed, Aug 13, 2025 at 07:44:45PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel crypto, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v8:
> * Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
> Microchip SoC-s
> 
>  drivers/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


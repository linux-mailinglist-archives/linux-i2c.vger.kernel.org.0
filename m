Return-Path: <linux-i2c+bounces-11552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09167AE352A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jun 2025 07:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ACA83B13CB
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jun 2025 05:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D101D54FE;
	Mon, 23 Jun 2025 05:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="UhL7QmOY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1D642065;
	Mon, 23 Jun 2025 05:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750657778; cv=none; b=hDUx/8oxey1jXJo+f/ezE6uVc3fOfuGfKAclmY6i/+xCm3F4etxAh/3FrN+uWoUiwfxrMKnfCnsPzrNpP/657+TX82tFCvjjH/CFLUYSc7Cs71e1k+wO9E6zhStR4GoEaxjo7SgXWLrMQGFwi0KjpJLFnhe/wMkzqCrNH6x8NA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750657778; c=relaxed/simple;
	bh=94VgTjMU6PiVQFaYN73bwAfslp6WOu3wpqg2T5I3uNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+yL6WFu4UolW4lKWrnetq2fBvV5OvJ3frRQ2xkDzQyOfWiWuF50FjaFGeH6Apq5kR/TCe//MVYyXzRybm4QqeiwT+psCkDvuo085Og2Lw7+6BtGhYsmf+HWn5c+pLwqbyzmxFq57D/BY+KBkr4dgm+9OCAg5tlLjmOPkn4qsRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=UhL7QmOY; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Gc8ST05/lU4vkA1b2+jaw3Ej+aipM8BwFYTtBem1TFQ=; b=UhL7QmOY09cYp0raNZkdvXbms0
	GMOKiPj+ZfCfhAhtkyR2fk0uMDxy3w+2aZIkBdsMECrog9d2vW5V2SYTaGmS0fPuovWnsJApzV5SG
	9vaMKVrfSIjJNMEyMq6eUzdSNAXPmBIlKzEVj6H79ZZJpyvIKFWZAru/hIW5FzTt+a8HOCZHitbSq
	tLnUBgzYJ8NS8RLxoWkWAowUDEYmNHlitYnpd8Q7QpGwgJRA5MfBiwKfWHdRyUbOKD7F8A4qvYTdZ
	IYNPdzP0JtLo2rkBkkkx2cvFp7CAdUoDjeVSFYLt2sA82oLZVlx2pfHMIf37eK1G1aLvdHkQZO7Vh
	6L8R5ZCQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uTZnn-000CoY-2v;
	Mon, 23 Jun 2025 13:49:05 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 23 Jun 2025 13:49:04 +0800
Date: Mon, 23 Jun 2025 13:49:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Robert Marko <robert.marko@sartura.hr>
Cc: catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
	broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, kernel@pengutronix.de,
	ore@pengutronix.de, luka.perkov@sartura.hr, arnd@arndb.de,
	daniel.machon@microchip.com
Subject: Re: [PATCH v7 6/6] crypto: atmel-aes: make it selectable for
 ARCH_LAN969X
Message-ID: <aFjq0EO0Uj3MGcqU@gondor.apana.org.au>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-7-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-7-robert.marko@sartura.hr>

On Fri, Jun 13, 2025 at 01:39:41PM +0200, Robert Marko wrote:
> LAN969x uses the same crypto engine, make it selectable for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


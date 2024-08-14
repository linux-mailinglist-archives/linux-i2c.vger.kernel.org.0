Return-Path: <linux-i2c+bounces-5412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267BF952353
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 22:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59B281C214F9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7F11BC065;
	Wed, 14 Aug 2024 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G8yPZP44"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F01139CE3
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723667143; cv=none; b=pzmcft4vxrI4FY1YIDa8x/kme5TwlmUB/sSVv32fAppTxvTF8PX9PTnUxYGC2VM979KLTPiVTrxaCYyX2f3NEA5P2EsYm3q4NbyyvLcsmDjXkVvj42NdBVEm9eIQj1fkmZyweH+Y5PqA/OwvRpQSI1/FeVxJaTgQLLVWIS9WGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723667143; c=relaxed/simple;
	bh=0x6fJne5sZWOPgx3yzuneBqydxj/XMiZh9CKMpx86fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEEsaiE0A00clfuaujBBy76MT0UDjuqOHr0nHcPUXFYFqwXwjdxSDtq/0mAU1Ybl7KSIDCgx/FQd8RDeVkCpTyjH6thmRqlTCV0QFrI4Hkl4pkbMwa7Uv3j9oSwPHX99iUZxphxlujnFrJxql5NcvUXBddfIwL6NRe1XlNXIEiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G8yPZP44; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SsdU
	uDqm6qSTJQ9f47EBNiu4v1VtRxy+MUTmKBKM+E4=; b=G8yPZP44NTW0AR6jECJL
	WmqIv2xc4p+iT08cj/lkGbMIjlQlUmVusKSxbxWZDdk1tPI4cOABsQ27M+pP3qct
	CJdI5neZzxsb8psqTZHSoI719VRFLdHWr7QOr5fKHb1/iEGNVJPMoYIJIdUlPC6F
	VmiPHU33VMerWbg0nQhJmNAhnuogj4qVC8bNFg2ypw8ms0MjpT3jGBlTM4k82E6B
	FheIaXdOAIP9YppZRIbCe8yhjxOpufh5IeWe+gIzgI0lEN3DMozB0kN+8HWEVaxj
	IN03VKLFYzuw6sd4laOnqUeRo6xj7AbqXzb1HyHcRoNDHxbYeAevDBfO1RqqD8dJ
	rg==
Received: (qmail 2090323 invoked from network); 14 Aug 2024 22:25:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 22:25:28 +0200
X-UD-Smtp-Session: l3s3148p1@b/rehqof+N5ehhrc
Date: Wed, 14 Aug 2024 22:25:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
Subject: Re: [PATCH] i2c: core: Lock address during client device
 instantiation
Message-ID: <Zr0St49sB8L67B6U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
References: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>
 <ZryRqVexisiS-SGp@shikoro>
 <7163e4f8-d25b-4a3e-8c9b-fba5ad648302@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dxMO6rMLyjlIQ6F4"
Content-Disposition: inline
In-Reply-To: <7163e4f8-d25b-4a3e-8c9b-fba5ad648302@gmail.com>


--dxMO6rMLyjlIQ6F4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Heiner,

> i2c_check_addr_busy(). Apart from requiring an unlocked version of
> i2c_new_client_device(), this would include calls where separate arguments
> are better.

OK. If that is already on the horizon, then we can leave it.

> We could include slave addresses in the address locking, but still
> exclude 10bit addresses. Then the bitmap has only 16 bytes.

That sounds feasible to me! Let's do it this way.

Thanks,

   Wolfram


--dxMO6rMLyjlIQ6F4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma9ErMACgkQFA3kzBSg
KbZsaBAAtL82orXpdr8/7VjvJgmIgcswalSf/Ch1Rw+9LUL4FAegRNaUd4mOzthk
7+Y+WchBOpXGLqfIrWBe3gD4w1kQMxumt50/3boDvG6ebSw0V3zIOtz48L/MKPu/
vQOuJONgcUXml24+VPJx4lBAvMREz8a9L1ICR3bzj2cYDwoUvCHdW7mg98RIkpfO
34RLyXGDZ2h+Lod3lWMk3gdXCRuAFim57llBccikCZS7QhHz7hdJ3oDm8I/SeFy3
kok/Qh0aGQd5egA6hh4g8VTWBb2tX7GUGwsFUY6nSIWBMshzRjq8uBSrSl0moqOm
GaoeNhWkczXl3Ze3501pCR0KZYAfXjo+aoETxT70tq1Pago4GNYbCIEh0JXg0xq3
nNUCv2xs5+XHC8HOBqyU2Yh5w/HYdQH82nsojH/X6l/0DXDKDjKgjFBSbsJxusZX
N1qiMex/5itWUGFdGJUZThncuBwcyctiKNRoVcH9+14soX9vL0s972x2hFBmCTfZ
4eGtTai+6Kvg8TpqDPYYS+OuwzDQFCaOcVPL5CltnOI/4PkmRmRuaxJSkcjfh2DE
gdp5ncgGTZ70osCGvUv7fjkWqmirwt3QFTeBZiqpf4sEuMjXtH9phgMH07IYfEsB
rnWo/54TRThW6txjll1c1fJmZ9pUdyDGOgcyMYBn+YIg5efyivA=
=3PKe
-----END PGP SIGNATURE-----

--dxMO6rMLyjlIQ6F4--


Return-Path: <linux-i2c+bounces-3249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C1E8B4758
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6F33281E1A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 18:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F6F143C7B;
	Sat, 27 Apr 2024 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bzq+JO3y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDDE4EB39
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 18:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714241027; cv=none; b=pY7th0gVd7HE+zCE3ZPVmreBz0wB93rYcloEprCdm/Sk4XvjOmKsROgQmp6WnFdJ9Z5vIpPS9C3aKakRzjXSfrJVFdNMYblnWHNXbcvkwdK3gAKb1wZFwEwrzwxDEJoB4Ul7+uefOo/cjDaRPhkrzIEbuKW/GzcHu2/JxP0vwek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714241027; c=relaxed/simple;
	bh=8iVei5xGXrW0hT05cj2YRsXH6i/FR3dHY8M9IRQFA5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xska1bxLN8NEGeaigYJuBxu730jQUFgBiFsR4fIZb1WSl+dxv12gXEJzfORACitE5K3JUzMX75rTcu7hbUBsS5xf8UBOUzSYSBkz2hU5+paBCqeHWfr7EgrRrFo9UOqwEodORvdwbW4/7fgTxrjWs2zJN9Yd+ORluKo0sLgoskE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bzq+JO3y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8iVe
	i5xGXrW0hT05cj2YRsXH6i/FR3dHY8M9IRQFA5k=; b=bzq+JO3yD1dPLPi+NSMn
	wjBeeB9a4vObiSjdv8wTBBq1Oronttl+/1OiymDH7cSgKu3V24uyOxSELEuIdFb7
	j1gmM6MYI1Z91i4h+6Z3sPg9KOgII60hFQt9G7hC9dW56UE7Ht5Iaxqsx0HTE8ER
	yzSkrdMknbSd+EuEGj4GgrFkcEltadfP5xXn2EocSaZsOmMRFHW266/fBuNVpDga
	t60yWRzXkIhZpSUoUkwnkgvJQBdDeC228q1+8ClvgHUbr+/NLqplRJSRYzm+Q4gs
	VQxx7rPe5VE6pnb+2SSR/z7tkLrhTPtyNnSrZhHIjMKdELfGbYoyKj7keuXhZpLz
	Hg==
Received: (qmail 1744437 invoked from network); 27 Apr 2024 20:03:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 20:03:37 +0200
X-UD-Smtp-Session: l3s3148p1@HHbi1hcX9Jxehh9l
Date: Sat, 27 Apr 2024 20:03:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/18] i2c: remove printout on handled timeouts
Message-ID: <dizevhnog7moz5qajkdkghwurza6ewobo5htavlbizqxlgnqwx@7f53mbpwu7o6>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <ZihNbtiVDkxgUDGk@surfacebook.localdomain>
 <sbkymvjmrufouqqscpmrui5kcd466gj6yn2bqwf3lhfk55mjos@n4ydx6wzyq4k>
 <CAHp75VfEvifLjPRQ+xsKipjwXA-APR7m_au6OJjafeXp6Wiyxg@mail.gmail.com>
 <CAHp75VdqcYn9RDVf63N7HL=nQLvFRt8cSO3EfbzAxLKNkwF-Kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ur2627yprz3xmq7n"
Content-Disposition: inline
In-Reply-To: <CAHp75VdqcYn9RDVf63N7HL=nQLvFRt8cSO3EfbzAxLKNkwF-Kg@mail.gmail.com>


--ur2627yprz3xmq7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> about a problem without expecting it to happen. Is that -ETIMEDOUT
> being converted to some message somewhere?

As said initially, the place for that is the client driver, I'd say.


--ur2627yprz3xmq7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYtPfQACgkQFA3kzBSg
KbZazxAAlDDyQT8XTqNFoRYUjr2e6FAw93vAgrmRIjaq7YDf1MjoVF5i9k4F1+7S
zQXcXT9O65VNBaxvzkhNJVODcSUxdTuuGGRtABpkHHE9e0u5LezU2GbbJA/NE+im
sQP1Sr13FAcNQxc/Fj7Nkr+9NmzFQh6UruPTqITcV/tx0tukhGJlr1WT9HhJQOH8
z3vFdrZBZ+gRJ0luT8NWI+o8gYV4wY1q+nMvtOthOHyjHh68fvk83oXSTKEES6ip
8XKSzBfV6ZhPLNF8kaQIcZzzvhlMpEiiRVxmJV8qrYDN/+NeOLImVWxF0+oBwZSi
FnD+W5ueMM7hsVE+vVy2UkpsY3JQOHaTYHAIGGk6RVnrjjl7VysK7qFV2KO9Edb2
guyjzypfaL9IWTogLaznXxJt5oSvLfBNqv7ev400HhCRxKLrmm2OOihe5G76fZOn
v5/cEk4SmoA61+sW7PuaEkIahQLNpDlr/VzzBg/HqEZ5maGPYxedZ2E+afDF3TNT
hQvH4ycoe4+PLB256GmrNh5PZWZmYYdNvcwjW6nUTr/8ZjKfzsuIzqthQJqxztcA
e8EUYo4Gby5hW+V2A8xBXOmFHrcW88+5nXTfv9XNoFCIfZ1hKLuwoG1d4td0dZ1Y
IIj3nxl0MdHqFhXdoLvHWjBbErwzl0blkA/5zPNW3QanuolJstE=
=fHd8
-----END PGP SIGNATURE-----

--ur2627yprz3xmq7n--


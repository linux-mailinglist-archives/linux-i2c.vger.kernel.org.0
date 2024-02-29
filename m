Return-Path: <linux-i2c+bounces-2053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 319AF86C4FF
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 10:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D732F28D9FF
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 09:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EFB5D732;
	Thu, 29 Feb 2024 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuIyx1oa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206495D729;
	Thu, 29 Feb 2024 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198707; cv=none; b=Ji9kqsUH89CPDl3JEq3FEmE9h4hN8KMvvTvnIDBIx1MZ4gCxPwmy4o2R9uLzwBMmM2qGC/Icrdm9vPd1SN5g6fy55NjQ+ALzzu3qQ3UfaVuVMVHtgPTnjZwdY0x059OvzozkalVt291iMUa8HqTUfwDGiCu5dsZHzXr/hzipDw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198707; c=relaxed/simple;
	bh=6DWhAaMQWrHxTHYBefaDQZ7F3e0IjkJgpBP1vHTzp2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TS8/xI0tN75RpQrMH3JXCe3D6qBHeUg+H3iQm1lS52m+ChXKzNW5n2/kN4fBsfCWc5ECzw7+DxkzWTSl34/mW0KsCElqQd/FggVrErkylfwNzF33Ol0pZgE0brJwg+tIi6bXcjcGSEWIKHD6As6s8yODapkC2X1vzyw2+nz7Y74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuIyx1oa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22588C433C7;
	Thu, 29 Feb 2024 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709198706;
	bh=6DWhAaMQWrHxTHYBefaDQZ7F3e0IjkJgpBP1vHTzp2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuIyx1oaoAMIHMr3YwxXBfmfNEjluW7YcKw+tA8JJi+BNGrbqTZadHOxSxyUf6UUa
	 aWVCloGgRvkq0HxSZVV2FESTOwLB2x4jHRXhvzaKsqKzHpFtV2EQLDf9Z2YAk1IQHE
	 e68mdJ7qOsxCQnRx/6O6rtmJZHfOKJlMg0xCYEUop2jOrtIPgE3FxrF2x/3tcQYyl2
	 G/MHEUwIJYybFOt5Bv6NpDQKyoyYCq695iTm3jDorXlpiD03vRuramnKAgOVL4pIZJ
	 vNpGKWdvPvJekSY8wD1oMK+EgrHJoOdYjeSkmC0CCDLrz5EF+IHvbDUMWrCeSj+Nst
	 FjOw6WNW8WxjQ==
Date: Thu, 29 Feb 2024 10:25:03 +0100
From: Wolfram Sang <wsa@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 09/13] i2c: nomadik: fetch timeout-usecs property from
 devicetree
Message-ID: <ZeBNbx6PDGk8xqGX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-9-19a336e91dca@bootlin.com>
 <Zd3SJMBp23ybgdsJ@shikoro>
 <CZFWIJE9978P.G3TZC2YIUST9@bootlin.com>
 <Zd8PtLsUc0G8KR97@shikoro>
 <CZGR61YHK1DJ.SVRE78BJ9WB4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i3H+SuXuRpenTtPB"
Content-Disposition: inline
In-Reply-To: <CZGR61YHK1DJ.SVRE78BJ9WB4@bootlin.com>


--i3H+SuXuRpenTtPB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The alternative is that I keep going with a new revision of i2c-nomadik
> that manually parses the prop. It'll be refactored if/when the I2C core
> provides a better way to access the value. Is that OK?

That wouldn't have helped because there is still no user in-kernel of
that property, i.e. no DTS file with that property. But I just realized
that I need to convert i2c-mpc to avoid a deprecated binding, so we have
a user there. Lucky you ;)

I'll try to get the series done today.


--i3H+SuXuRpenTtPB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXgTWsACgkQFA3kzBSg
KbY+zxAArdvvBeUnsfR4WGLIcBrr1o8rbsQx4N7QGu/B8sbTcuVlxRTEihCElpiG
sYAYMEA1d6BKJjXLWqBZiif88hd0qSghKwMz86zJFqCeXDBNcJHNMvWCFnLJNGxT
0aCi9A+QgXS+WmNh9HenQjO57GxEN+NFKdHODXKe0gUFWjAGi0vHf2mvK+bBxmdF
YdRF2P5ZHMCoFPBIiAsG50uwosgRySA0rqW9Mr+C8T5ovu+Iw62oI1F9g3re+WCM
IUKkal/DnYGR4+ryHNGtbPAo9K9kWcFjZIpoMbMwMAoDWmtBm0moMTinYc3fLm4o
mJbva5GOdK68J/WilYM/fZVkJ2VIK8Z3JiFUxM26BbMT1Y89fCoyhwyFzdi6req4
pvfdpFwDAM9KCRAf6Yvx1jAqb/WTQ+h9TzATfbf3vKdnTyN/ylLndeAoxjZkG2nw
4fPXfrygj2P6Thp82a0SvZlk7OKLFwt4l7nHXsRKs8zppva0JVld+g41kc3XHkOU
Tnykz2AdrgAmdlBVrkz9XykWunIaF2tMNpTN0gU3KR2REAjxQSbM+bQEnW4WOI75
4koX9rhW/gimTFIkGwurgNviTB0Ka35ef3TbTW9yms8jlaerB+Tqi4Yd+gw8kmW1
qzG7GOXgRrdv/HY9hGMFS3p/HKJwXUNkKiVhrWPTWtGhZ0EYDgs=
=SUiE
-----END PGP SIGNATURE-----

--i3H+SuXuRpenTtPB--


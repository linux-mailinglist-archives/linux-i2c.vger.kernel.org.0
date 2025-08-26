Return-Path: <linux-i2c+bounces-12433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C253EB3681A
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 16:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5731C413BE
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 14:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909993568F6;
	Tue, 26 Aug 2025 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LG8WFeHg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E1335335B
	for <linux-i2c@vger.kernel.org>; Tue, 26 Aug 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756217037; cv=none; b=PdPEhETWu6D1iWE44ofpQ8UCblDETIi6z2dvPn76S2LJfiP/c1kYUjaXUP4U7yaGR6Q4qYkJm6lwKagaYcV8I3MtBlEh2zotRYyLHZWezFUA5gjPUPrBtDD8p8iHpLcvQXUJ+kbOoCHpSUoBKL6Rn4n1qNS0laGKk+oI4HoA5UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756217037; c=relaxed/simple;
	bh=vmiGt2oLOAQ2EkJCMQq5eKKZ2YXVoazQmkjqPo7+1v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBHdBRbH35Ib+nw0y4cYodcKA2K48adz40gX5g7G5AiyIW9JqiQcwY1nW6ZZeHUNmzvdU7zAlhvaqGCUPST/PtKhdB2HMcWh+YMr3SG80j/mEE39Z/NCfYzDivO2VkcKTJ33OwaUM9TqFJ+TXyuYIdkPq32xNX8nApBC5yJPmYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LG8WFeHg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Hsxc
	dOmDTitwBV/EN/G/esK9+ojaaBogHKD6Pzvdqss=; b=LG8WFeHgduxVVdY1NzBg
	gL+xEAx4GOoJo1gcSq7y731UQFstFAPmfaEnNlMUdynChh8Hga+nAxQLDax8OiIj
	SYlvPa2jtcHxKTi0hkcFN9aVJE42Cg+0MMEo+IbfnRrgNzc32HMB0LYK1N2+Jv+N
	v/exCgTgiMbWDKVdq5fHZPqB9m3AmT+cWjOEk1y1946p97Ijj6Rsh7QE+xLk4Usf
	uM27vRYSkE/CnaseIX42ZlG3j0MlJeha90GKggx5klDKIaptTRw4zjmqO0BLgxmP
	yebIkqXCdj9mDlC/WGgsD2jwKjqj5xNq1HzMN57KL7FXje5YwqGPA6keLJW7w++j
	oQ==
Received: (qmail 293092 invoked from network); 26 Aug 2025 16:03:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2025 16:03:45 +0200
X-UD-Smtp-Session: l3s3148p1@ggr2I0U9bssgAwDPXw2iAG43AYdOknD3
Date: Tue, 26 Aug 2025 16:03:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/1] schemas: i2c: Introduce I2C bus extensions
Message-ID: <aK2-we94b-x2fgW_@shikoro>
References: <20250618082313.549140-1-herve.codina@bootlin.com>
 <20250618082313.549140-2-herve.codina@bootlin.com>
 <CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
 <20250808180746.6fa6a6f9@booty>
 <CAL_JsqLxsfpaaCvV3AcniMYxAYVir7ddL4umCNY3u-ggVTiZcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TljrWgeWi1hzBORA"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLxsfpaaCvV3AcniMYxAYVir7ddL4umCNY3u-ggVTiZcg@mail.gmail.com>


--TljrWgeWi1hzBORA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> > A different option is to only have the "i2c-parent" phandle in the
> > extension node and nothing else in DT (no bidirectional link, no
> > compatible string), without any full-tree searches.
> >
> > On the implementation side, the connector driver when probing would
> > register the extension nodes at the I2C core, which would maintain a
> > list of extension nodes. This is important when the connector probes
> > first. Then when any adapter probes the core would iterate over the
> > list to check whether the newly-probed adapter is pointed to by one of
> > the registered bus extensions, and then start populating the devices on
> > the matching bus extension(s).
> >
> > A lot of care would have to be put in the disconnection path and while
> > removing any bus extension from the global list, which could race with
> > the I2C core using the list itself. The drive core wouldn't do it for
> > us for free.
>=20
> I'll defer to Wolfram on I2C core implementation...

One input already before we dive into the unconference. I don't want to
maintain the above solution, i.e. handling lists with sublte race issues
which could be (and should be IMO) handled by the driver core anyhow.

See you soon, may the A/V-setup be with us,

   Wolfram


--TljrWgeWi1hzBORA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmitvr0ACgkQFA3kzBSg
KbY+kBAArEuWI/gI2tH728hajgwE6SaBTsw2N1wDmZ/n/Rqgppd8KoLNWQgbp+YR
6Q5M2URiRfvo7N+7aqH5cZBw5b301nYpfROzIQ1WOzqG7gIMiHeJItXzpBh/8Xo4
7fpYuysJnq1HoCgagKiVeskZYLFhp0F9MsoDwt50i6xdh33OnGgCTKMWo1588tYj
JSYo+dtMoemChXpFUpmwkUTpH/3rxgNiCIzbc+Yj7FgpWeRm5yRb54v6IMnVv1Fq
MWWOVhSYfH2AVAegI4kbclyt7Um5Mu2GzGSHzNtIj7wO8SEJd9yonjCVDIL/sOg4
1JYAxPBsJuI/hqfcwO7ZFg2WRNtfmyyt4Er6kW2MxJKbDOYcLK30xteRzBb6+aEM
QW3Putx7tsDsuPMKPkc1M8o1wY8Ingv2nIZS570XvmriEJxYKb8iIAYzeECdLdIf
lW3xt6l7RAIaCCoDetXK3jTxgGFRNCUVPTOmEHb2OFUms3sca2xE+KHe97UQcMg8
T83bO+nK30a9d8t9xfkIkvsPuXwCcXd9RdPA3LdciDxyHhtp/HGCMCsku2y0kEhJ
xXj2TlYHdZtLVVjR+rSkn4QJRzHKhVej/+/9dD4tfyA1KTwBSw8SBxyPJ/aE1Pqt
JSQoJv5md1SOHBFJpOfmGqxIhc/ry+kkQ0xMc2LlCCQzNSJN/hE=
=Xz3E
-----END PGP SIGNATURE-----

--TljrWgeWi1hzBORA--


Return-Path: <linux-i2c+bounces-2030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66E869032
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 13:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288382835E0
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 12:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3320313AA55;
	Tue, 27 Feb 2024 12:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jd6qTlbe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45A813957E;
	Tue, 27 Feb 2024 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709036072; cv=none; b=I+nSjS46lL9wB/af9FiHOr2IpW/Jy7lLyQareCPWjxlH1okuY9UE2naq3fB7uCqm2qDh9+3JRHiR8Z+GVPoRx8ZOHGXRy1uTKaSCy7y8zJ42nD435X01esCbsNB+fufS+GpU7L+mPCOYpJUiXCd3PlRGi6j4IYOU4x7nY92nqL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709036072; c=relaxed/simple;
	bh=MNBdJ8ynd91q3yNgGWy7eWN2H5Og6NctVsNLSrm0mDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOKNIqdDvUjhGdZRAJME9auz2WhpMeEJTsEPfTMgeeNL1tVyKDBtqrSg4Wp9PKLU642qVaO5qHpxPd5j2lyr4Y+9vT+a2ZoJtw0n0lhnBBPRX/4XsfmOc1slBLs778neBmPMziY/25tG0dcxJh9l6+IhCPEGzppbpJ8hx3HLvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jd6qTlbe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E7CC433C7;
	Tue, 27 Feb 2024 12:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709036071;
	bh=MNBdJ8ynd91q3yNgGWy7eWN2H5Og6NctVsNLSrm0mDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jd6qTlberk/kGxBOED8pcbAmtgSvDFQzjM6u+xO5Oq//PaNH6aIBCVAreCSUhgTr7
	 hKlpPsooyoAfhJ4p5NgipQRMYF2WSvhVw/i2hMK9IBVEG71zDvfTqtES6wI8sp+X4J
	 4vI5vq1ZOImg0yKS83SO4LCOJpGG1UA/pCPN2en/t9JvkDJoraQG+9xIwhpg+4vJud
	 On5Q0sJw8+BKci0a2NAsMsVFcYDfPu6Y5DplkRX1CzmCd3wfI6aFN6Xp5WuOIg4Zkv
	 kUEfwrv6wEezf0T0AFJLUxyqThh0r7I5mzANUlpvU7tDN/AgLxXURvAx8S+yepZuIE
	 RaKrcbJNp1tLg==
Date: Tue, 27 Feb 2024 13:14:28 +0100
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
Message-ID: <Zd3SJMBp23ybgdsJ@shikoro>
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
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l9/qv/BPwfFxGsXr"
Content-Disposition: inline
In-Reply-To: <20240215-mbly-i2c-v1-9-19a336e91dca@bootlin.com>


--l9/qv/BPwfFxGsXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/* Slave response timeout */
> +	if (!of_property_read_u32(np, "timeout-usecs", &timeout_usecs))
> +		priv->timeout_usecs = timeout_usecs;
> +	else
> +		priv->timeout_usecs = 200 * USEC_PER_MSEC;

I could imagine to add 'transfer_timeout_us' to struct i2c_timings.
Then, you could use 'i2c_parse_fw_timings' to obtain the value. What
values/value range do you use here? I can't find them in the DTS
additions.


--l9/qv/BPwfFxGsXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXd0iAACgkQFA3kzBSg
KbZx1A/9Hn3nig9zw0s6qvC2FrKzAOepBjzkFqAjpqgK4uUcsXVZ0Gfhk0lVkYtx
XOjWnyYadJYToHFj97q/Ruabu2HhE/XZktuWhenAFOla7UbYMAUzxKSCrnJrT+l5
SmmSaco3Tvje0tGv3yHbqNX12ge9EqkbO8Y+qv4ftbiKOcMGuUoIavZvyQ6GTWM+
ZBdocOy77UwFXru/oirdRxKj99M8CKIMaQ1QsPUxr3H4hTADgjRv60GhiQVfZKUn
vdaoEiRVe8VAxj6oTEmIm6zZSw4zls4QH2vSXTEDufU6VeAKS+Xrqh7XLC8K9T/V
qgcYANSP+6sKVP8eWcaWwaAP1px/zE2oZ9SmTJKqkELEwpahagaWxQ6Hxgb1xCLa
r3vukZ8+cNGKXBAQeaucmiYbSvILfuTBniJsAkuhz7ex9N6M3ervF2xUpsI3jBm0
uvok3LtFqBxtIlxwMSV/nelJmO4R5sYHojtkuri/rxuDQ6lSCFvh40hWeb5ereE2
r7VRqrNrRbz0Gyi/6XJqTKSXPtz8YF3efTzuI1JydYlvtaRtyK0UGCceQfL4brZJ
DYW2s6hGM7ZKEgZ4wI3aW/Vz1QA3vxkmi2KyXZaWlzBLTQ/chlx+L2jB5N4LaTob
kJEXKchldbVmVf43xyzr36PNySUiIC8xumknTEskp2+aetFHRD0=
=7Ca2
-----END PGP SIGNATURE-----

--l9/qv/BPwfFxGsXr--


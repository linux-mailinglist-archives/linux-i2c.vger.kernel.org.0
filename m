Return-Path: <linux-i2c+bounces-2045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 129CA86AC60
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 11:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4451D1C22346
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 10:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D00A12A149;
	Wed, 28 Feb 2024 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ampoXZVW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E4E7FBD7;
	Wed, 28 Feb 2024 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709117368; cv=none; b=di/Q0/F3Bepy74vbOq6qRR6t7tjaG4VIrvUr+mgMjuFNwJFNpI3viHvPg7F16IfCA5YWHBx3GfRBam77h0Yor5fV76gvt5e+pwOWcNkllmv2wthm1xQ18ztPxlQh6FjmnIuy3PkvHtwEnFK89hC7anE2mfCMHUBaNqd9W5E8kls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709117368; c=relaxed/simple;
	bh=NReh0r1OOkJ/WPAnBLnxEVaYYz6tyBjSchjL2TDVkOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjKF1vaC38ajXnkTzRGkngujadESZuxcQkXwAVfsxrctlZZbz7xthOC8xl177Ytb46jUCqYGIKuMFB4VH3YXueeyiXlD7iRcyhuY7YvJBGPW1C7M4sz7cWiHPtkQMEZgYRJ6sFaMK5fCwsT4rOHuFd0KbsFxtKGY0P+PHRAGlI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ampoXZVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF263C433C7;
	Wed, 28 Feb 2024 10:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709117367;
	bh=NReh0r1OOkJ/WPAnBLnxEVaYYz6tyBjSchjL2TDVkOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ampoXZVWcdsJDzSiPecqBZ+IfULM6TLhs+9C8H4SnTBekIvwYvHd0QBTNVwtYqOXL
	 bn2ncUcxLhMaGPhE6+66ypcI1ExIuESsfSIE0RtfPYlVsMlatqODU6OvjEi+BvgpS0
	 2EqhL/g/7Q0skBNyRT31JSA6EcToPgB6XISQy3EHmhqBR8g2cOGFNBybEzvVBbNyUs
	 lZsaCp1TC1Y71rkwAUxsYPnbY1RgQ8fUamNqIqoaXsFsxZLv8oDdkxPsMYSMCsdOTw
	 tNL7SfL50A7+7WfNCZAH+AqZyPKle1r8/h5Mpu4t0+vSeTfDXLA1pVVIDZqiyojCE8
	 HmK67aoOrsptA==
Date: Wed, 28 Feb 2024 11:49:24 +0100
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
Message-ID: <Zd8PtLsUc0G8KR97@shikoro>
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
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FC1UhtSW8OWBZjC4"
Content-Disposition: inline
In-Reply-To: <CZFWIJE9978P.G3TZC2YIUST9@bootlin.com>


--FC1UhtSW8OWBZjC4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Th=C3=A9o,

> That sounds good. I have not used this prop in the DTS as it does not
> make much sense for an eval board. The target is production boards.

=2E..

> My upcoming question is how to move forward on this series. I can do the
> patch to i2c_parse_fw_timings() in the next revision. That way it gets
> added alongside the first user of this feature. Would it work for you?

Hmmm, to be honest I have a bit of an issue with the 'no user' problem.
There is a driver which uses this feature, okay. But there is no
upstream hardware which uses this driver with this new feature. This
makes maintaining harder ("Who uses this feature?" - "Someone" - "How do
they use it? Can we modify it?" - "Dunno").

Kind regards,

   Wolfram


--FC1UhtSW8OWBZjC4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXfD7AACgkQFA3kzBSg
KbZNpRAAplZcmoN+v+398lrwCBrPt7fW87i3u0pGvvs36OOmYI47d+qOyYjBaEdN
M52Dr0jkq4NrpXVgxXk2ty2m3Tv7F6pnPwKU5+e7TzVeUoCQgJwq/vJV1ppgBY+O
1iNfCKh6ZtzNrhuC6X+Rjxt0dZ/qc0zjjjQP4yUEYDCs5AHqc3gd5YopbJ1N0eGd
YMKEPrY9FntcE5argMTXW1OZ/jlRMhrRziD9d+a3odezohS5kITrTuwg9b+Yckm0
/3paBaWYXFFeAgwYPkg5vEIJHq39Y2ljKG5VhpKfMEdg2F2OWkWgxvOiRxEhlFua
rvHkb3UFHoFx4kyheWXEjx79i5KwP/wiCrMv/gxu1Gz4l6HanCMZfoRSUhsOscbH
0qiQBXust4YSa9BEpJD3CYOf5Z1SrWdACRgYwAmb7yUmIQLqlLbBPjxWfyvCKk5d
nDfz34EdiE8Sc5RWJrzwFv1JOZLwg/L0m0i++8GnqKL5jvTgj0+dcg6ScetIINKW
nayMd+ZqNBoA9g738JhlU/Xycy/CNxRda96mCbnFLZWXsEPX3bv4pyQRKapgkZxt
UIxVw3xtwpifhg7/3EwmV5xKDi3m+OuOM+E8sA0VloVNxnpscANrQVC9V5G3YDr1
GNpgoNp1XnZOTcCBGi1gdUUZDQnwybWDNMn+cdAlUZAM/N3WQe4=
=fDeJ
-----END PGP SIGNATURE-----

--FC1UhtSW8OWBZjC4--


Return-Path: <linux-i2c+bounces-1927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE098602AB
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 20:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74CC928E1BB
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 19:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C410548F5;
	Thu, 22 Feb 2024 19:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDpluMk4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4153138FB2;
	Thu, 22 Feb 2024 19:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630099; cv=none; b=SrAw2i6OBMEx8IB19hP/sN5mcRO6cy+atU48qAB0DLYyEMRCajSS8UE+L48kH7YzL1mcsZMHGLaJ1kRICZKs6x1ozHbiSINcEIp9Gp6doKkq2vcZnK9hi5INnRbHCkBKJguBmEJRhsjB//CpJPFwZSqVOQeDwoEUyqNhmLxMyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630099; c=relaxed/simple;
	bh=Uyg9dSHslJ9qxNU6tRv4iTy9tiKqRQ5uql4e8bT0C1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMbOjVqqSNyakepglTtiouynIl6W7Wjz6EkodnAA+p/yOkAxrFRwbvCL0J8CxCq1IAiYtTJlGk2ZUxPol0EvtNGGQ4hME1nEMgjbJ8rzSxDcQ+VUfK+V8vajIfrgni0VBMncrg4BJE4ZY5BBmdLPmNDOwc9fQh0Bg5EL+oejjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDpluMk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E51C433C7;
	Thu, 22 Feb 2024 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708630098;
	bh=Uyg9dSHslJ9qxNU6tRv4iTy9tiKqRQ5uql4e8bT0C1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDpluMk4aQFS7LOckKKih/hJjwFlidVqRlOBOHcdSHa8UWxfkWdubrFH6Ft1BbyD4
	 MhZDasLvf1hEybHeMvyAatR+qF1ij1dwZGfvIsbySRMnnt1RWDDfCRlDT4qFqUiCfH
	 wOpl6RnHuM84V/aFa1n2aepM8o+JqkLRT/paS6f0lEj2M5v0ULwoyUFU8w9t5gt4ZJ
	 +P3U30FZlDWy+e+oYWK1HRfey0b743s6y5BPTMV6AexyGTTXDlTSig7sZ6zBYB1PiV
	 /c0rcqc5pjAjfbkBY5SEf5W1Oqc5JABjiC1/HCXeTZoLdhTo88nYW9mix4FaVaj69l
	 0b1UW608HxSBQ==
Date: Thu, 22 Feb 2024 20:28:14 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
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
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
Message-ID: <ZdegTjJpDJGEgdvo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
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
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
 <20240216022704.GB850600-robh@kernel.org>
 <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
 <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
 <CZ94LGRSF9KN.15ZO1VRMIQVR8@bootlin.com>
 <CZAX02IL1N1J.2GQR9D73GLRZB@bootlin.com>
 <ZdY2WzKbElloXC4-@shikoro>
 <20240222171404.GA3334332-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B6WJG40ec9FdGRUS"
Content-Disposition: inline
In-Reply-To: <20240222171404.GA3334332-robh@kernel.org>


--B6WJG40ec9FdGRUS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > @Rob: My memory fails a little bit about these two schemas: we have the
> > github one for generic bindings, not strictly related to Linux, right?
>=20
> Well, NONE of the bindings are strictly related to linux unless they say=
=20
> 'linux,' prefix.

Ok, right, of course. What I meant was probably: why do we have
controller bindings in the kernel and schema bindings in a github tree?

For me, this is a tad more difficult to maintain. Like
i2c-controller.yaml file has the "no-detect" binding which IMO is wrong
in many ways. I rejected the supporting code for Linux.

> We need to remove i2c.txt. Often that hasn't happened because we need to=
=20
> relicense the text from GPL only to dual licensed. From a quick look,=20
> i2c/i2c-controller.yaml appears to have everything in i2c.txt, so I=20
> think we can go ahead and remove it. There's only a few references to=20
> i2c.txt to update with that. I'll send a patch, but please double check=
=20
> whether you think i2c-controller.yaml is missing anything.

Will do, thanks!


--B6WJG40ec9FdGRUS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXXoEoACgkQFA3kzBSg
Kbb2EA/9Hi0Zf/si4mO1ASJ8MJ4l6Dhz+zE2/Yd6c62lF3Ql+W2/kDCn7Y9ian2Y
wgrMfigGHubXEDf4q4mlgm3MFMVbbxK0LM5nZCb4+PsS7KsjEIyr5quniPt+iK8Y
qzvmuq31oleVoO/q+UTNkWlQ9ofVS+gGEfm8YcArndDhTUdYeTfi9AwwVjsyjPgO
wuuokHdGrS4w3GjlKtZN+osms1ldGa5F7AOgD050/l7qPxImpTYWpoQOXquq7WxW
6SoHgVu+KP90/ybjX36lfMSg3nfnNP6wALqpoUVvJyzxEt7ukEsMXDlUTZX45BUT
uEFWL6T+b6b6ZXxvS0uGGZetayd2GKKh1sPPLbBq4Fw5UbkV6pOH4o2Y2so/UeqK
Px1G23l3jQw7HLUOYuB9qyRVj9hSeby1nJ/nIqTMKMieGUIYx9ixs6M8WgCGBcXj
yZMrgW+yRxlD0s8P/whrhX7Nt0x7t5ySTGIt8GpuqVymGqOexQP3jHYRbvyGbvWE
F9TtNLW47Nw1aK9igfbi4yOzy9hJ5w82sH+Ol9m5J9YxLbDeMHB6dwIKE7WOpPWs
NWLkFRUVJk0+wdUcgO2gH5QBLpRgnQXT7rWX+dcp6XuiG/mUDVYjUuaC0WZOXdf/
FLp434f9gcj3hQh+5zZCcTaN0jEe/X1HPKZgGZWXgIyhfkT5ciE=
=d0aY
-----END PGP SIGNATURE-----

--B6WJG40ec9FdGRUS--


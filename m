Return-Path: <linux-i2c+bounces-7749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E59BB2A9
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 12:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC20C1C216E7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 11:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851BA1C8788;
	Mon,  4 Nov 2024 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HzD1tjJl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899251B4F1C
	for <linux-i2c@vger.kernel.org>; Mon,  4 Nov 2024 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717822; cv=none; b=DNY8+6Mfjov6snnnDZoQLNk55veCpq4jcwTeHsVHId0tlZ4PQM8QRr0/MsWtaboHNkuSZYxelLqWgGhECkTPUPnNRhv+uP/dk+MvPu7p92jccLYpAmyZewhHtFRkkFTGJqbn36N/NYktt3m1qPk5lCZrvVhtQvAfnwoGadQzwpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717822; c=relaxed/simple;
	bh=yWd2KtmsOvojXVk5fIpWMGQ1X+wMVTzTRmdwOge/WAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/3DOrw4Jzv1th2g2OFm4GTGPsSMHn53vQllx7tRAnu1Yi6n+pe5O7xXD8fw4G4hV9xZ6oAw43ORvcFF6hspXUTGfbzIfrLpxh94cTnXRdW0MoivXAKIlkZbUu6b1+/4MeobvVqBFONq/E4ihqJr8GZUijnWZ9g+C3mrpiL26l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HzD1tjJl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yWd2
	KtmsOvojXVk5fIpWMGQ1X+wMVTzTRmdwOge/WAE=; b=HzD1tjJlAY9AHnkivBmx
	bdHIBbcJBcU7zb/aP+OotwraynCrzJr5z7VYfdtEHxCsUzIlTxlXEKBrmoHDNzKV
	P/gplYRkuErXppx5EkyNq1u09bHmPzNhGSje22AOhHialKA+/wN1oIeAhK35h+R4
	9SmEdD+Q+XeFI98sthUsi6kpkcTDg3ysnRmAD0lPTcBzUoJtmutoqmEgDfK2mNnt
	HT0eAR7ypXqgwHSwCxtHEv4J1iDdJZxYUyfGZJRfUO+pS9O+e8jrXVqggy7sA5ry
	LyGTVjDFd0VruJttQRw97k/JBlYDchYabx4GoGlzW8KKaFqHJmS5a7W0hVQvTs+w
	bw==
Received: (qmail 354982 invoked from network); 4 Nov 2024 11:56:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2024 11:56:52 +0100
X-UD-Smtp-Session: l3s3148p1@l9VnJBQmHaXVHA60
Date: Mon, 4 Nov 2024 12:56:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Yang Yingliang <yangyingliang@huaweicloud.com>, peda@axentia.se,
	farouk.bouabid@cherry.de, linux-i2c@vger.kernel.org,
	yangyingliang@huawei.com, bobo.shaobowang@huawei.com
Subject: Re: [PATCH] i2c: muxes: Fix return value check in
 mule_i2c_mux_probe()
Message-ID: <ZyiodI3tFe9xbLVv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Yang Yingliang <yangyingliang@huaweicloud.com>, peda@axentia.se,
	farouk.bouabid@cherry.de, linux-i2c@vger.kernel.org,
	yangyingliang@huawei.com, bobo.shaobowang@huawei.com
References: <20241026030942.1484-1-yangyingliang@huaweicloud.com>
 <yq3ncphzoexlecxqqo5y4qhepc6u7sks4glb4n6jzlytynuylk@ndxwo3twzl3j>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a31C6E1zCevL3HWC"
Content-Disposition: inline
In-Reply-To: <yq3ncphzoexlecxqqo5y4qhepc6u7sks4glb4n6jzlytynuylk@ndxwo3twzl3j>


--a31C6E1zCevL3HWC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 01:09:17PM +0100, Andi Shyti wrote:
> Hi Yang,
>=20
> On Sat, Oct 26, 2024 at 11:09:42AM +0800, Yang Yingliang wrote:
> > From: Yang Yingliang <yangyingliang@huawei.com>
> >=20
> > If dev_get_regmap() fails, it returns NULL pointer not ERR_PTR(),
> > replace IS_ERR() with NULL pointer check, and return -ENODEV.
> >=20
> > Fixes: d0f8e97866bf ("i2c: muxes: add support for tsd,mule-i2c multiple=
xer")
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>=20
> merged to i2c/i2c-host-fixes.

I'd like an ack from Farouk here. In general, -ENODEV makes the driver
core sliently fail (ok, we have a printout but still). But not getting
the regmap sounds like a real error to me. I'd suggest -ENOENT or
something. But maybe this mux is a special case, Farouk should know.


--a31C6E1zCevL3HWC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcoqHAACgkQFA3kzBSg
KbbSHA/+NPynOvVuI7E3F04ntBSC/6ndFlfQNEXaTxbddUSG+bWpMUizlB+kni+7
B7R4TBa5cJbMvG7HoGRdJZdoVSWyHKJGRVFC7fNbFFU+jL1rVnnJgk4LlzbwvoH3
bpGSSw+qshIUl5blru16mitlwPhkLhcFqXkJC9btvSSJ2FyF8ZagTU9ECK4p0cFl
+92ckhmIw+7mHEiZ2HX229FWc4FwqCCrGzLkMwlZ/pXSVE4knLCrjpOVi3OVFYEE
ts08qyx/Uvfbyo1wWFKUghqFihU8d1Uj3q6FeQqEyU3Vv6piAQGihZ/yoQumHF4D
OigACbCMBV7ogPpdW/Wcj9JrXw0TbIXDTGimd+b/EuYL54jDnxZ8Ky/cp4r2OJ64
UPZw48B7pRl7LhzttIOQlh087gF2TJuYswv5Fj/z8tYE0Ev73wUliPWLgOqRMy7q
r/D311mqPRljHYZgH8c5kXCoV8Dc6sRGcAsMWp0+M//Ko5EAoaEzF7dw5DEYb0Z1
HkOLynFyzdM3w/tLdOBicJ7d5Uu0QAQowbPxYxn0mz9UIe55AW5IRpNm+xD4A6Yj
ZhE4Ys0+vLOfhCjmStDbZklFgnpcGqYn763a4Fjhy0m4dMdToQxqJD082ChE2Ver
MG8K5JkxeXCbd8as1MxkzYOtAB+UM7KaC1GWZ1ktVKwES92Upt4=
=clsc
-----END PGP SIGNATURE-----

--a31C6E1zCevL3HWC--


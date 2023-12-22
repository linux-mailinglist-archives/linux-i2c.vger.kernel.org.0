Return-Path: <linux-i2c+bounces-949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4FF81C806
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18F601F26329
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD241D694;
	Fri, 22 Dec 2023 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6bQWTP3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A61D68F
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 10:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0656FC433C8;
	Fri, 22 Dec 2023 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703240110;
	bh=i3G/dkmMksJeTfyUi2oWxjm5Yg6fPyOIHfgngajh6Ag=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=M6bQWTP3K0gZ2T9frBKMGffBi+L6Yoj8S4a6SMRvptWpVrgBPOaahv/wQEqz8DLiH
	 Y+DVfrA/oi/W4LNSjzrJQf3tPjergBug+VFUHbqVWQ/FOQWCoQ+rIG/FnH6F2tazKz
	 0KoaMwGTWiwRlJZDmy+GjLWbeG6vD79homvGW60sTaenC7a3AYFmTLbve+VTt/6grH
	 kI6HGfaxhlxe4D+pUqGPbQeZNrMyhh3X/3gHzG3svZpA1LSHOs+w6nl/hpft8HRyU3
	 Bji7lqoMkSscYM/knXXRtUSNN00vXwX/utQLNL4pltHwQTh4RXeI004+ahiGNBp5kf
	 c/uJqbt6QRw4Q==
Date: Fri, 22 Dec 2023 11:15:07 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 04/12] i2c: wmt: Reduce redundant: REG_CR setting
Message-ID: <ZYVhq4OVTPyoKV0P@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <0fce410bbf7c3d5e01cf679fd435fa0065e55e53.1698889581.git.hanshu-oc@zhaoxin.com>
 <ZYVZFam6zzIp++N3@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iTKUvvJhdBJZmIf2"
Content-Disposition: inline
In-Reply-To: <ZYVZFam6zzIp++N3@shikoro>


--iTKUvvJhdBJZmIf2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 10:38:29AM +0100, Wolfram Sang wrote:
> On Thu, Nov 02, 2023 at 10:53:54AM +0800, Hans Hu wrote:
> > These Settings for the same register, REG_CR,=20
> > can be put together to reduce code redundancy.
> >=20
> > Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
>=20
> Some registers require that you first write a certain value, and only
> then can write another value. Have you double checked with datasheets
> that these register writes can safely be aggregated?

I found a WM8505 datasheet and it doesn't say anything about consecutive
writes. And it works on your hardware.

Applied to for-next, thanks!


--iTKUvvJhdBJZmIf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFYacACgkQFA3kzBSg
KbaK/hAAqCURtRLXRaMKRujqvJbEPqIPw8Poshkn8eMJ8h3IqsTTjyajZIvbrxPh
jTa4uZ1z4rJAcfWmrfLuulqGr22XEuD0BSG47bpjYSKjZ/u1p1QQkhZKjYq+eULm
IArXPg3Ko1BN9FMKZ1gtYTsTgaUDdGmmr6McMU9WXwjQ8Gxb1AHK3mk/SUyUV1dX
3NY+z4efLd1VHT7Uy8ev7G9BKwtgxjl9ekm5HaxsFlPLNM/Pk96oFuBwkUC5m4mT
ZOzpmylsCU+bpSP9laRwlooqTb1NdN7okMv+5jIIKfZz249S8FYwwm4yPtx/lzf2
qa/+G9Qdei1ggeMqDU7lELcMWIJQYB1wqH4wqzjYRL4r63gbApsGxmNuKIORD5O3
p+F+r19k5qHyq7FjU+k8/U7ONagI5ndyE63mL5nxj8euVIErN+3oYlWTpKeooZ1T
9GwT6fYYrD3FrUDnH1tCZiJ+m2f1IlwPloVXAUlPRc42xD3NJldDOIyguBaic7hf
M4q9JnS6umkIruff28GvGSDYfHBmPVYe88gReA9zyAyQLmCR3vHTSOTtScfWSO1K
1F8lFPGXxx00IlaJ2vERi575ghmZsTpXfTxM+AoMRUiI0WyGw2a5rzveO/YTVfWz
G5YJMxWr2LswW/bpaeglSUPbRGbqTqk+UV5PQOvBi+1V/L77VM0=
=4AZ1
-----END PGP SIGNATURE-----

--iTKUvvJhdBJZmIf2--


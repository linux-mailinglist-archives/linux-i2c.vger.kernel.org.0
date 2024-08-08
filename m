Return-Path: <linux-i2c+bounces-5217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219B94C069
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 16:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B803286BD0
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 14:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1921218EFEB;
	Thu,  8 Aug 2024 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BAgGdpoI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2888418C912
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723129156; cv=none; b=gQB6eiP4nUbPX85MUiyhpGso6sAXe22SBTokP5jz7e1HMaX5BvKTyCYT39JCBbQ2fskoWVX3nOH0upIFuUeF8R4O24Ix6uiz/NGgC8sYoYZ7REfuZNz9N2t5Spzrzs+BhPEc7o4taaQUM48lEX21PxYAiJM1cuDrzt7vzuGTpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723129156; c=relaxed/simple;
	bh=gIrobRG6cp9epmRS0lXlVeQtskaNnwNFxb/z6eMhSqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFtfblbc1Bio/Bi++6tsyCLOLnVmuSgszcm0/nXyNkwi11wrpCPIWcIvQk8km1W7qN6qfKHXe+tUFtlC9zTA5jQV/DoT2EsMggznoZenfsGn0xMOjevsSVE9pJyeQKUfMnige04spnuwY0SU4FCkxpqlW7aX7JX3Imjs6oLr4/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BAgGdpoI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gIro
	bRG6cp9epmRS0lXlVeQtskaNnwNFxb/z6eMhSqc=; b=BAgGdpoISHuS0a7gwFNO
	Xx+yqDEpNIRseTkSLLWB8W9kG5YCY3AAaSek3JQaN8YsqmOfP2BWQccslwhIje7e
	Fan93urothc01k9DmGi+hTkWEynFN1xS+SRIGK5HCS1MhbO1YlnXeU+VC7TXxC2Z
	Re1v5jLJEpvsDmsbv8ZG7/z+UVf+194uSNoQwyTuR673PxSUwNXTljAPchoiAjCJ
	DgLEcd7eHiOCPsPEIViBeeM5ry1Eb9ZNCVAxJJj/VmYIKagymvHACQ0nVhunes2p
	rsoUW11mm6sOkoXT43qDdK3s2bQt0l14dIb1M5cgw5lZvbLydcNkh+A/CG9hMeti
	8A==
Received: (qmail 348998 invoked from network); 8 Aug 2024 16:59:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 16:59:03 +0200
X-UD-Smtp-Session: l3s3148p1@5/l1RC0fFCptKPBr
Date: Thu, 8 Aug 2024 16:59:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 01/11] i2c: riic: Use temporary variable for struct
 device
Message-ID: <ZrTdNiFLYoZecmjX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d06YuoTTMO2glfO+"
Content-Disposition: inline
In-Reply-To: <20240711115207.2843133-2-claudiu.beznea.uj@bp.renesas.com>


--d06YuoTTMO2glfO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 02:51:57PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Use a temporary variable for the struct device pointers to avoid
> dereferencing.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Looks good, builds fine:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--d06YuoTTMO2glfO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma03TIACgkQFA3kzBSg
Kbay/w//db6OvA9ALA6AXjG8d2g4xuBaL8F0n4jECB/2eNvFnl1qJImwbDvESf/y
Eg2lJTu0Ut3eDdXyf69YElC9oi+zrMrxKaWNkYSPc8UgyNKr0gKyGyVK+GheqH5t
1wyc3YFr7faAiDSl8zF8MILdqNdQNvtxsYzD4hr/lSLZnowBouseMFSIRNHHX8NE
I9TPaB9w7M2a/VOcFPbjGWWsjgEfSmL27KMvLC0BSQU4wxr+cn1POMVkX4ajew82
ZxLWEeC8xvgQTmm+EC2UZXMdtQQyilWlRz/Su7vuMVlgYd4beQhlzhOIbgr4n/Ww
r6kzQ4LV6PFppuXkm/d1KHo1j2IsOclpJQru5Ax645/mVDAVUSg1npPq/iuLg8AZ
1UhGCQ+tsOkna1whSCruH9yUMw9t9JNzSnw3TF9wmnI7KicqCFWZEnCTlni8Ua0M
8YExrVfMTKFny4IeluPFhEccs7+yJ/o0ixgsdE2j1vOdGIux558iwLioSlKCApCr
BV8izvVHxjyRGY3QcHqHfb7aay7YyuN23MetSI8Tuyd/7OoL5OpYEO8erpiT92jY
IqoHTc2C+/K07EFxrZ3dlzICC4iSf0o/cvGBqymRcXhPpEbfqThBw6AzuAkQmvDd
/YmwNKb/ApVTn/8cVs0+zt2ZQOWlpPrrCruEjYYKw6fUX8tXz+0=
=b6nv
-----END PGP SIGNATURE-----

--d06YuoTTMO2glfO+--


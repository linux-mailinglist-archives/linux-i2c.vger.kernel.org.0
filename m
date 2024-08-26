Return-Path: <linux-i2c+bounces-5791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D6D95ECDD
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 11:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BEB61F2200D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 09:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5AB8172A;
	Mon, 26 Aug 2024 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CkrIopJR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0856E142E67
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663765; cv=none; b=VDyJ/bH+rLRgwudEi3D8LaxpR+MNPl26V5V/tuvB1vIir9fYe5EfxjoBJycP3PTWkZ2ZdU8641+FcLYknzyuWFzucsA0ci+llR9Qfi7GHeOtSCk9Xx8L0607FGCuDfz3qLviFPbmh1LRYpdfLB3ghLB0GKksgoNirAjcNoRoYMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663765; c=relaxed/simple;
	bh=K0ePHJHSuul5y3bsWp3mOBJT5h0AY8uuwLn8hFDUiq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSp8PGhaiFGLsVynYn9IyfftzSSpkF5KI8BoqCGhCATyRB8fsH4TwXYTkgMJrYv2PXPuhmExb/jYPAvk3rNdM8a1NoXdYuu9s00C6Rvb7gC5SDnWalOdn/86L6+w0y//6AdiQrKO9EbGQ4FCBrnCSW3QRYZSV+XMDyt/GcFAiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CkrIopJR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=K0eP
	HJHSuul5y3bsWp3mOBJT5h0AY8uuwLn8hFDUiq0=; b=CkrIopJRG3isFkgYx+Fz
	VsD8l2djumyu4rOilgyIDdoH/pxoTYTNb4e9WMPfh3F4IBk8lO/JfIqH7tdALopI
	Ea52mx+S67vDmPwejpnA/SHXErgZGFh7Iq6HIdO+v2ceeGwGP73uZKPGN0AQ5fuv
	/1wl+WhHPeVBEGqahLKzzEvT2Qr/cquMOB1ovEVaewm8K9smCN/T9tPP+AFMQHmk
	EOBihaqhlFq7z+sw9rOcxau+QLthYMUQWlcaodq347GXQeerT+pzxg2fxacHtTaS
	mji0C9rXb7937hFLAcLTSwM2Z/m+JC9a8JyJk1W3W5wKUQZgCZm65fVUGRWNaS2O
	7w==
Received: (qmail 1931663 invoked from network); 26 Aug 2024 11:09:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 11:09:20 +0200
X-UD-Smtp-Session: l3s3148p1@R33sepIg7IBehhrU
Date: Mon, 26 Aug 2024 11:09:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: biju.das.jz@bp.renesas.com, Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v3 2/4] i2c: emev2: drop sclk from struct em_i2c_device
Message-ID: <ZsxGP6HKQnBuEE7_@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rong Qianfeng <rongqianfeng@vivo.com>, biju.das.jz@bp.renesas.com,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-3-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GzVTah3YJcw5sKqN"
Content-Disposition: inline
In-Reply-To: <20240823035116.21590-3-rongqianfeng@vivo.com>


--GzVTah3YJcw5sKqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 11:51:14AM +0800, Rong Qianfeng wrote:
> For no need to save clk pointer, drop sclk from struct em_i2c_device.
>=20
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Should be folded into patch 1 IMO.


--GzVTah3YJcw5sKqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbMRj8ACgkQFA3kzBSg
Kbaa4A//QRGxIflqtho+uXF6Bvym6CoHccm4nUUu4tjLRLtWsjsIT2mggNsr4KFW
UwKinEPvouGc0EXeuq8zlmLiPvps42rhwlMok2yYNcf9+/QjnTe2Xlw2TgwqFpT5
dXSDQqtF/bnXaE+jWEYESddXMCqiiMZxn81bXKKenYXdUSsYzZFGsQlBhOp33if0
UlIH+GlJhivzRDVdYTZcdiFTK+hvSvLMRuHYLHst/Dnhko5kRjfxxIry10VOeWuX
i7bt/0nGQNa5veXnpVhYYhuHRwTCPGifIWMNGErHAJ5t7PWGqf/Ch7m89F+HyiqT
Qw+KGodk0FI2ebYwQrUXG4PGzV/nxXLc7R/1FtdfxUNm3+IYK9M3Kr34v+u1C9Bm
ABeL+4CrCoTi6jIHFsICsOGwxfgiFZA5EUK1r60biqqXz+5TrvQte3iv52GctDf8
SveEzZnkWGLmZr2Ef5ubQ5nCecAVhQ4bt3cUYF+QrvUWAH61X3a0v5yK5w4lPdB6
Pzan4WfNyeNKn8Xg8RRiyGSsm+pEANO61reyaPn6cp9I6Cl8sqQZJ/HpLLPPI4gF
l2s8LlpFYryAEUQ2JixIP66fCoMuGm0+W/iHujDvdCsv9Ggy+5xFkPKv05KrtMAh
W3lp+Cy33PgJ6YdA6x2xt3kZYNlpY3+oWLeEM86Nt05JEaB2eK4=
=cjT8
-----END PGP SIGNATURE-----

--GzVTah3YJcw5sKqN--


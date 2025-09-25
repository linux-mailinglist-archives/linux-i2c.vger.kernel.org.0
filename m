Return-Path: <linux-i2c+bounces-13150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CC9B9EB93
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 12:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 610D87BA04E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 10:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FD52F5A3B;
	Thu, 25 Sep 2025 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cWxaRGpn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459792EBBB3
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 10:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796545; cv=none; b=pzgeBXBfa8SB1tUTqIeu5sRr6zh7J73pxF1lSs8NGfymVPlKYrrVPOJbKSJt1PhcIyL74jWYvmIrU/LDgAmYxRfP/4HfKHc7XXpF5R700CixUdoYYDX7U4KjTlU/aUKfbQnulI6Qo5jTMtBi6SMpkBigbV9QU/XnvGd90ioZ5rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796545; c=relaxed/simple;
	bh=C7Kms716L15yeICD+Y0oh+QcxT23xRoDpbqg44/mzrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoZYLZyAqxI8T7jnSFf2GsR2fGAix1FRtBsD2uM/rGgZiM1qPg15zu8mhzbAkRzoPpZc/O3ANNju1RZu8khi56f9wbO+rSMF33Ri1IiG3jzEWBh1pQM1KUsU25pHF9m9vLR8+YnymQwYyHX1Y0P3yT6heZGB/K26DU+MAWVlv/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cWxaRGpn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZP+t
	SssFMNsBghtgEvVzHd0KyUQluBq+bKnPBY2/0IM=; b=cWxaRGpnQL1I8H6GK5Ew
	qENQdBCmlsrurZO6KG+dkdISkqfJBiuGat2OAF6aWBojq6JvPkNnQ6LO0NiOQIT2
	qOs8fw4PJiCbV9QSUH1U0HxQldN/xtKMwgB6LsiuyUSnWhSL+jW/MQQow6LH43fk
	1ZI29Zq9DLsryf8WTpEyrfegfZM7j6ClIiww/uAVBHswsg6BBS/ScLr+7/5vCrrg
	ewTCDoKZvDo9gaCBBAQ+RAMuvIcTc51rHIWP4GEJW1fdvzLv+wwdvxur0LJ3K1j2
	MwOuU+EqvZAEDdpc4BRfilnw1kegIgxzYzWLw/jOsCPJh8+QgTLHFYzoprlVNwpl
	mw==
Received: (qmail 1830363 invoked from network); 25 Sep 2025 12:35:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 12:35:40 +0200
X-UD-Smtp-Session: l3s3148p1@nd0Au50/ot8gAwDPXwQHAL/S9V79e5yL
Date: Thu, 25 Sep 2025 12:35:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] i2c: pcf8584: Fix debug macros defines of if
 statements
Message-ID: <aNUa-9HcQzyjZkvE@shikoro>
References: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-2-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RfrRtQUhPwm/DxVw"
Content-Disposition: inline
In-Reply-To: <20250917133524.85063-2-chiru.cezar.89@gmail.com>


--RfrRtQUhPwm/DxVw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 17, 2025 at 04:35:22PM +0300, Cezar Chiru wrote:
> Enclose 'if' statements debug macros defines in do - while loops.
> Fix inconsistent macro usage ending ';', which caused build errors in some
> cases. Enforce errors fixing based on checkpatch.pl output on file.

Thank you for the patch.

> Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
> ---
>  drivers/i2c/algos/i2c-algo-pcf.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-alg=
o-pcf.c
> index fd563e845d4b..3fc4b5080a32 100644
> --- a/drivers/i2c/algos/i2c-algo-pcf.c
> +++ b/drivers/i2c/algos/i2c-algo-pcf.c
> @@ -23,10 +23,19 @@
>  #include "i2c-algo-pcf.h"
> =20
> =20
> -#define DEB2(x) if (i2c_debug >=3D 2) x
> -#define DEB3(x) if (i2c_debug >=3D 3) x /* print several statistical val=
ues */
> -#define DEBPROTO(x) if (i2c_debug >=3D 9) x;

Given that nobody updated the code in the last 16 years, I think it is
safe to simply remove these debug macros. Are you open to do that?

Happy hacking,

   Wolfram

--RfrRtQUhPwm/DxVw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVGvgACgkQFA3kzBSg
KbZodA/9FKwrM19qqiwEA8z2dXu+8P34Kw6TCfq0S6j3zQcQNDrPhapRQ858Ms2Z
2x6FgBkMY7cBpW/YqeqNede5JaNjscagUWotNtB+r1EUcJg4cTojRn9C2J6Vl9xH
X/bIn2YEH4iuMXqUHoZAdBOVTFGuiQ2onQWID7+8Crqr+2qNyMLDGbbIXZ4co1oX
131zevaSafHRalMBE2OmsUQSzvL8krvyK9DxOhcUVe9dWmxeEou5woSZBATHdqLM
RVMQ1dWzVyN6UpWi6BjAQsu71v8OHqaGyaTSclYHg7jTU7TMhKQai/2KiFJAatoH
sv2Ry82HWIftx9cr9IOtM6kUix8F8b34Q2q8tMbuaZog42I/pjtEczgFSrK7PpPj
1r8Y1nfy+YLVku1gXQ3OBRTbtbgNsQD16etxkRAilOPJz3jC9DcWogAQpDrqwPpZ
YHv+CbQbqjGiowuybkxrxfB803yaWc8wj2B04RUaPVMW+PzwSH9Qe6jWB3FeIo2S
p7qsKqE/uLexTBWC2pno/PjVIYJVp8YrZHRoYRg2+ELHHeZ3wcOKYSWbz5JelbVQ
bzp4NyYxI9H+9S5PoAzrt3zo1eoCYjSZAqHd1WsBTcQySI2QSS8lBtIwFm7pK4LA
XuHvJbV1Xiq+/M1vCF+NT/ezed6Zp0DKJICBQttLMsP7l2xnB+4=
=DXYs
-----END PGP SIGNATURE-----

--RfrRtQUhPwm/DxVw--


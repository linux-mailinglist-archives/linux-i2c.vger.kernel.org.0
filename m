Return-Path: <linux-i2c+bounces-7996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4AF9C8D81
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 16:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47D4AB2BFCF
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 14:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90AB136658;
	Thu, 14 Nov 2024 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TPg2wrns"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5EB6F307
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731596242; cv=none; b=Q2N++dVPMj5dQCxptx/h4xSL1tamz/KQkMAeG4GUEvBM1AH8N/Rz/UkxGmdQX42S7opCYLFA/lYEAZ1p/cLfSXxIGE/Y3FucWRMOb4JtPyD+OhHOUFy2SEv/R7ygr4qoaFuCJr6uznLxJGjymFzW8izAleKtoZchoM5/Tb+A79M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731596242; c=relaxed/simple;
	bh=dRsJqeYZfBgIesQfn/MHcP7T/a2QWpqLVvkqC7gdriE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkCbrwMJlFJ2XZqf8bsHrprq+g+YA4nMBaLRR4oK17/MRxYjzaN88LndWxk0T3pUUqIj8wLjbMpR195Nj420OJS7tk+VDuBwod5PgmIbwUaCabmnNQyVbe4WystNPKy2p2Q2M7WtLhWQl3qrfAep/gIopFYORYaAHBC76z4761c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TPg2wrns; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dRsJ
	qeYZfBgIesQfn/MHcP7T/a2QWpqLVvkqC7gdriE=; b=TPg2wrnsiZu1NYDo0UWQ
	WWGaj67MS0s9qoeBXwcUmvL6YpuoQuDzh409d61LeLTl02dCuil29KbG0ReeCImf
	P9vm6WmT4lHb1ArPYSJL2G4kbgTB9kaknO+ZhDjpwn1PTO0KyPQADDYyrvAxBnqb
	eCgDHKrpqdAnkswYs4xbS6IZxfwXImZrg4MfcX8wB+JbsoDI42pK7QfUlrFX1h8r
	cC2qFgUG3JVv2bExD0BeLSbVGmm0A4P7cuxQ6r9/s/3vAxV8gi2+aKcXCZe0OYz1
	2Tvcv1v5UWcNuO6oMtOXOuBshikV0regki5T0UFd/WPDZ44w4u/rNN8dsjiSxqpn
	Pw==
Received: (qmail 3195118 invoked from network); 14 Nov 2024 15:57:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Nov 2024 15:57:08 +0100
X-UD-Smtp-Session: l3s3148p1@nFYUquAmstJehhtH
Date: Thu, 14 Nov 2024 15:57:08 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de,
	Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [RFC PATCH 09/10] i2c: Remove I2C_HYDRA
Message-ID: <ZzYPxBvZ44pMzeJN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	arnd@arndb.de, Linux I2C <linux-i2c@vger.kernel.org>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241114131114.602234-9-mpe@ellerman.id.au>
 <CAMuHMdXLM-eeAa9=YwkU6gcwmD60Wba5v=F6PU20QMqzxRbM4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b3oYDcQCh8M8X+Z5"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXLM-eeAa9=YwkU6gcwmD60Wba5v=F6PU20QMqzxRbM4w@mail.gmail.com>


--b3oYDcQCh8M8X+Z5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 03:37:15PM +0100, Geert Uytterhoeven wrote:
> CC linux-i2c
>=20
> On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
=2Eau> wrote:
> > The i2c-hydra driver depends on PPC_CHRP which has now been removed,
> > remove the driver also.
> >
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>=20
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> > ---

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--b3oYDcQCh8M8X+Z5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc2D8AACgkQFA3kzBSg
KbYpqQ//cTHdKtv+OT5iUTvVPKKtfZLUlFRc3Sf4Y0Ui+JFxjueaUVzQ16CzDyy8
VcRTIJHL2t4AjIpp1LSAVp8Tcc7xJTEiksfx6ycdnIXgnvvgk/RaCz5gwMH+1W+j
U6QMG1b1tVoFZF69zHn7G6XU84cvqPO8JdUuZB0WGbzAKZcbsIKoagg2LykuZa5h
BWC21WX9Ze+Vkao46dtUKvrkWA63u89a3xlv4yoFjlkEVwCd1fXYqoLMFEjiVtk+
2ouXqCX73imUI66OWlBnoNGuhwuh+RAnuHlnu8eskko6ggILkRUZ87SZWd1WR4x2
fkduX62y8/B+qVFuKPqmWV+2lR38fwEU2CY72Ild4XtgPaBX5wyFAAdVDGaE14er
94saEMP2pHWJXNTa/AuH/PV4cSZcRUVzDm5kcRaEj2hQkn4u8YTPlCCIvyJ8Dnjr
TpxKl4PxmSYaVGYlyLwbD8oM5JsTiyOcZNBshLCvJE1IHdgKsJZiIMSiBs6Itazl
/mRksfIhshodHSS/ebydCbHQTWp1LAKTJDeqxvw2fuq2W0ZAigtkc67qisWJEQ53
p7r0iccjMim8QrhGROyxZCE+50JxuqVoKRgsgTuG53jIYjETzGcumqrqAVhskxWR
vZljCognLV9cSah+JDPKZ9oovcJ2pfxSjyL314DQF4hvkMgGmIQ=
=t0n4
-----END PGP SIGNATURE-----

--b3oYDcQCh8M8X+Z5--


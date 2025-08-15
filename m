Return-Path: <linux-i2c+bounces-12307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C4EB27B16
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 10:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC48C188FA67
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 08:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726B0155CBD;
	Fri, 15 Aug 2025 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NWzdE3iX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361D114EC62
	for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755246695; cv=none; b=kWjOj0Dacb4+c1DaW4ouN9JQ2956e5o5GyYvljd8NvW5wxe6LnM7HeW3bAEg7XvbOwKRArk92cmmofaEf2OaE+MRteW0/O8no5PAWsDgXYksjVYAbloLYZ55xMOsGKtvRNtj05JcYoqJD8e35TSBEXTIOe57Um9wDBBZGiJXaug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755246695; c=relaxed/simple;
	bh=F7TgtDIVeJHmJbdmhVsLQz8ZXqh8PmvpMqqRRdkM3Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBDulH5of78351CrZHgWqvhOJk7Fbn2t8tP7GebwyPwMxqDj+N2C63q4ati4VXmy8r1oEP9MH3NTJPajNwbOCZWm9Nni33eAxO3uYgd18ytrw5w8zSTU7EpDnEkDtkh3j/UO+hRuunFlhfLCK9+dZQX3MKJuJbO7UZ0Hi/+6K8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NWzdE3iX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hr2q
	1UFu4n5c+NUsYTOIsmm+4qw3eig0S8Zk3qsF2Qo=; b=NWzdE3iXg9eNG8b5vB41
	E/wcyWSlko7QcPzDFSSQ2kUn2lUfw7i1xfOmpe501mGG6ylioIqQTvM4nMNUspFh
	9AplZT9ZCBTfvs1AU1Ww6FZmeD/sxciigvdwVHb0PyzCnZLQetnvV5pwEVer74HO
	rC+c9UgIqJ+FYCTWon4Auyw1kiFHQ0pB23QWj2cbK66FBChyHLuzZLA1pe+a7yae
	K59Iy4YY26YWdJEGHJfQxZR6kZ0N01UaepbWBTJkYq9Fr2ySglOchyi3kekGB0aF
	teC7y+iWkyhlaRvxdnGhJXpk/L+6FSdwgPZsumv5wPhIxtV+ZLLr+cH25E4dhtNF
	EA==
Received: (qmail 1330456 invoked from network); 15 Aug 2025 10:31:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2025 10:31:22 +0200
X-UD-Smtp-Session: l3s3148p1@TOH1NmM8Rs9tKLK5
Date: Fri, 15 Aug 2025 10:31:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] i2c: qcom-cci: Add msm8953 compatible
Message-ID: <aJ7wWDejA0KDarIE@shikoro>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-2-e83f104cabfc@lucaweiss.eu>
 <aJnefpETGJm_cuRY@shikoro>
 <f956eccec6b8ae2737b1e758b8357051@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TQXPwgYOVAqGLFm1"
Content-Disposition: inline
In-Reply-To: <f956eccec6b8ae2737b1e758b8357051@lucaweiss.eu>


--TQXPwgYOVAqGLFm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> I'm also not sure what these parameters depend on, if it's CCI HW version,
> or
> something else. So naming it after the SoC should be a safer bet. Also the
> msm8974-cci was only named 'v1.5' because it's an inbetween mix of the v1
> and
> v2 that were already upstream so arguably that one shouldn't have been
> called
> v1.5 in the first place either.
>=20
> Let me know what you think. Maybe also someone from Qualcomm/Linaro can j=
ump
> in and share their thoughts, if someone knows more what these params depe=
nd
> on.

Thanks for the heads up. I agree that it needs someone from Qualcomm for
definite answers. But if nobody chimes in, your patch is good as is from
my side.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks,

   Wolfram


--TQXPwgYOVAqGLFm1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmie8FUACgkQFA3kzBSg
KbbvTQ/9ElCikIoyrJsjc7KJ2KX/PRWCsQmCcW6yAyFK/XmNcw4I7XspRIHrTJ6K
h80bO5zcB0ki4bTyFxIKcDgVF6txxg2/x4nXm9bQW+sbb+RtuHo28EeodxakO44a
YqbACbIZ+KQj0dGWp8PB0iaSeTJnxdhhgmx03UU3nMDs/C09EXSQS8xyjgRlcWI6
nrWSfxhKBxkYpii91HNrv4QPZx+slvJKN0vGIWcjMopXvEfn42fkQ52K94aRH4Dz
u0HE90AGKjOITswJunyt4grA8hPzXiGZC+fgenrC/a5kJUarrjGJb72BX27dKOa1
CNAucY/bPhlaWWI4ZEh2e0M1FRVLXWfZPBgX3MX98aGZEdWJO0DGK/2d332d3NYS
KFp1g1SR23x0Z2lLbFBmtpCMusMVSYslirF/4nESLCiQV804Y7jUd0koMbI7rQuf
54mHAGpZTouQHBx1ITYquBu9VFfxWneLU78hN+Ja29eGe2tRiOzmPWkXso+h/E0i
JB5KZ87W0L6tvbCCHbvz3pO95zeS4E5q82XHYITqTJSrjgmNWuFQyRtnc3XW3Pj5
qQ1i74WTPu3CJRhHBgOZJeE1bDc/dcWS0ZlDhJxL4h3dI62432o1kPYaCLqEMTjx
J11Wj3/4i54MbuCRi9cTqStmWUYJM8f5NiEQYfbDEhKfqWTnOGs=
=9FHa
-----END PGP SIGNATURE-----

--TQXPwgYOVAqGLFm1--


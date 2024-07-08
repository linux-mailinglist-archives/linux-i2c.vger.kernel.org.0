Return-Path: <linux-i2c+bounces-4753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B43DA929F8D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 11:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AFE4B28E21
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 09:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A34A6F30E;
	Mon,  8 Jul 2024 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XX//OLbs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE81F16B
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jul 2024 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432273; cv=none; b=I0kExeuleQW+CdsCtN1/H1idHWJ1JHC50E2r/alM4aHjUkwOusDUDfFZW2KZCW11NGiNoxBQB8mCsKOJQY2Af4WySd1w2KDRheuFMUs3gFOQz6jrGqwuHVjwhba/tunkGwJAz3GxLVgMqt0KsH2pU3tlVtdtoeXuOdUsZmYhK8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432273; c=relaxed/simple;
	bh=xZaxQwZW3afrWtIbOq6gRgeDuU+ePZAUvrJGw24YybQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uekx7Qa4wMZOLYd0nKq8nH3xNVS8phQLUMp+8+roUNLEx7Hh4yk53kcRZgsc9LWDKsG3gIAKBLKoMVoXrO1IWAoLzb0UMDJ81cCOTt8he3IwixpGI88S3skVQyHkSscpr4+NwiTavvdhBBRxIs2/VzqftpGWCRSEF++Q6nifVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XX//OLbs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xZax
	QwZW3afrWtIbOq6gRgeDuU+ePZAUvrJGw24YybQ=; b=XX//OLbsQfjjWmu1H+/s
	0nzr+DI3Rcj1/kyOURFxtdsq3ikcan+akvTlqmgstCUbC9whH2p6BP7gI/DVz+B+
	vPiNvzmNBPEtk84IcNWYwXuEShGwkWPw2Csw1wilGWfCH4vhchcV7OPIy+SevjZ4
	EnuC7aeIXVc60rW1ihDUrZ1zD75DE7EtRluWgJkW4Vjk/e4uftWPCjN+ksxzAcQz
	MKY4YLti/UF9AMxjwYGI05OO9yDA6cGor78nbWePAS//L62G0lc65g1w8CeWAf3k
	P+2GpWvOsg+aRmnS+HaKt4QmYSgglJUXqCr4FXSMJeh6/wjj1R4eoax1g4UXYPM8
	OA==
Received: (qmail 243978 invoked from network); 8 Jul 2024 11:51:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jul 2024 11:51:00 +0200
X-UD-Smtp-Session: l3s3148p1@5AS5WbkcWIYujnsa
Date: Mon, 8 Jul 2024 11:50:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: rcar: minor changes to adhere to coding style
Message-ID: <Zou2g8nGBD7Pv8kR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
References: <20240707082848.5424-4-wsa+renesas@sang-engineering.com>
 <f93eda7e-e65f-42e9-b96d-e88290201ca0@web.de>
 <Zop2vNCrzDmEKKiO@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DWDGslbNGnZ/FKHY"
Content-Disposition: inline
In-Reply-To: <Zop2vNCrzDmEKKiO@shikoro>


--DWDGslbNGnZ/FKHY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > -};
> > > +}
> > =E2=80=A6
> >=20
> > How do you think about to omit any blank lines at such source code plac=
es?
>=20
> Oh yes, that newline should go as well. Thanks!

Andi, is it okay if I only resend this patch?


--DWDGslbNGnZ/FKHY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaLtoAACgkQFA3kzBSg
KbYnvg/8DFNitYbbDyt/nomANzaC6FdEuS6B+NqJz2IlA5NPQqpItOqW8hZjYbd3
tgBlH7dqhDW/ST2tKXte+LTYiqU7nehjZJE0vcD/O6vcypW8UioIqQGyL59ZEpDk
IbWKZ4sb33SEJurZmZp0YTiAXs4GQP91pOa6zt40Qg9Eer9p0V1ojdK/5o8LL6xh
npdNBDoRDovlhYDIQYcTA+LjZnNxrCDZGiosjpkrtKYaWnR39Xs+iGxgGvkWwhf9
h1mooQHi50COJYzx1WaVaH5KV4inAe+dANvKEvEkVBpHJD8XDdkb0nma51FBE/rl
6NMLHKDVN7PhBh7RqVXynkj/8lsqwTf5myiQWhS3Nz/4NDt0+8HCBTiXV9cVwnW7
0Sj91EFTV/aUcSbSWRM4Ck3uo+7j2mdubPlpuSqeVbKss/zFpkE86KovqftE/RRl
WRH2aD/q5+hoXKKH3fIPyCU8QizmGz5l0TnJrcu0Wi4iDKeW7ZHgH1CRQyDkaIlV
dyLonyVbj5ZSBkxK8cD7k/6yb8BdRIbcMPTzSip+AZpgBAhzwnHMD+GuzTdvik5g
a0b2pk0nCCdBtDn1z8D6Ti4GMuhbs56YSniJMoNfTpN7e5Of2NIQf2G+ggK1tQlx
jsrchRiL/ocztuY5HG5+Xyq1nhAwHWz0W3IsNnBMH4f77SPgX9Q=
=cmcS
-----END PGP SIGNATURE-----

--DWDGslbNGnZ/FKHY--


Return-Path: <linux-i2c+bounces-13536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3ADBDE263
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 13:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5723D484B26
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 10:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A527D31D39C;
	Wed, 15 Oct 2025 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EWIzUQL2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926F41A9FB4
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525820; cv=none; b=bVYWRnywq8v5lLunSmp/00bu/2OYvmL0ORNW1BE01FDQmae8mB0IN8YBXl98Zv27Kg+mU8lzwbsQOKu8Ousr2/TLSKNAzq7GsYgDHfkYL0l4ASUwNlFYudeft09VXOSOXHYiQ5isv30XEPrb3zcbCu19jHciLEA8DiVaYkWCN28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525820; c=relaxed/simple;
	bh=AVMg7hXcDyXimfEntKOVvSONrziIEwaWOQJMK6UwXyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwc9zSpPy0+eeGJoSbJ3YdSBFRox5pcLb2//hzMjcjIn039lWTKnhhDJRmdqu3TAc1S8F1eC0xSrB/Gu7IDLOxqlP3q1FfldB4QTuzLE8Hjms00QlfsVBaksKSardtJ3aXr9nDqu1xw1CDtnZv/dM3IqRV0RpF1qcXTy37ulVkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EWIzUQL2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pZ6Z
	xA5XH6cYewJDTTpBnEkJkPE0FjPtXW7Ptd/dv80=; b=EWIzUQL2NQDoKpjkbXjG
	6lXRdYmpKZJ5RuE9oiObS8MziMvspMmOXLtWGiGs3JR449IabYswOfPxkXky7zYB
	gvzxSabp5uQcrV+nXSrCmV9Ds/JTrpyvlKWdx+X3sTm18fTIXjuo9/R8vx7VtLB4
	BxDps2FkNf6cJxLQGny36ytY4hki4kgtcYlOJkvsajdF4dv5eYC8F5TQNzjFYDIb
	Xv9WVwC4mv+ANVeo0SSc+21jEuKvgpIaVn66IVqNfpYmsGraQ4/l5eB7ZcBegtpo
	blcCuOiKHsdFPA5FiC3+PLPfxraz7tKipp9I/M2fw0IyE626ryIFPkiMgRKlbvSn
	dg==
Received: (qmail 3360373 invoked from network); 15 Oct 2025 12:56:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Oct 2025 12:56:49 +0200
X-UD-Smtp-Session: l3s3148p1@RDx0WzBBUNEujnsG
Date: Wed, 15 Oct 2025 12:56:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wojciech Siudy <wojciech.siudy@nokia.com>, linux-i2c@vger.kernel.org
Subject: Re: [Bug report]: "i2c: muxes: pca954x: Use reset controller only"
 makes I2C break
Message-ID: <aO998KSukVoMuWYU@ninjato>
References: <87a51um1y1.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PdRQgnifxlqYbTiQ"
Content-Disposition: inline
In-Reply-To: <87a51um1y1.wl-kuninori.morimoto.gx@renesas.com>


--PdRQgnifxlqYbTiQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> I noticed that this commit breaks Renesas ULCB board Sound which is using=
 I2C.
>=20
> 	690de2902dca98aec96de004428c020ca902f047 (HEAD)
> 	("i2c: muxes: pca954x: Use reset controller only")
>=20
> Before this patch, sound works correctly, but after this patch, sound can=
n't
> work.

Confirmed. You need to enable CONFIG_RESET_GPIO in your .config. The
reset-framework won't do the fallback without the driver. I will discuss
this issue with them.

Thanks for the report!

   Wolfram


--PdRQgnifxlqYbTiQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjvffAACgkQFA3kzBSg
KbZP3w//Yx5QKP0TZ3P3wABd6yXdrEniMvJee1lqnwg8+Rxdy2GNzMJmNWdPFLSf
wVmw4gp5dwgfLAjdckSSK10B0xi4u94Z84aw08VjU/enVYkiLkzP8M7IVh8WStMZ
l/UV3kfSUw0f5ts7lqGiEt5t/edC739tEiJ/Viz8WPEGJwUR1hkEWOcb7Mmn6pGO
aVk8M2unMP1QXQELT5sqBHfoniGiajZFokgxO40+3SgPe1MmV5qjl8v2uxKD7wip
tgFkoo0LO7rQZ1b2ldclnMBc/xnnzoH/Bf9uRCyxKoIwyM7dAVdSzXn8eEjvKI1G
UNyvdGXcfSv4PZnqYKIkJgRlDTmnHOZ7uQm55Pya8z9Hx1ZE8/Pk4hSOlPyYb6KW
jvJW+L/60wqzrRMVIbtAYAlCGVnY5Ksbuh3w3BP36Ol2+wGyiYZ5W8V4ucLt6aPZ
RYQRTzOvCXkEXG5PEQRkDtuaUll2OiTTZKCBAfG3E8uaPoS1nF+08xVeaU9BjBIg
ZY+85azwQ9vnejow4G6VhS98Tk4KqcstG+32Vc4Rx5CfVyaD8B3oLWgwlMXZQdE2
8IIGejrNtJB3czp+Ss+t1qXCohgOf8nA6IhmE6+ejmEPJG7bR88h0wWZ4qGXB2qD
2Eg55KRXhf/RCmOtck049csiOmtG56Gm1Jx/iyXOip1TVo1Ljrg=
=Nsti
-----END PGP SIGNATURE-----

--PdRQgnifxlqYbTiQ--


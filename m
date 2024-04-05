Return-Path: <linux-i2c+bounces-2778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 509F7899AF1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 12:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0659E1F219B6
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 10:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA36161326;
	Fri,  5 Apr 2024 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I7n5aCtd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B628E34
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712313193; cv=none; b=eqVMeymyyPd2smWtVg7BpP2Xz4c6E/Jah7RjL8zLuORV8dVCAfIWHE3recA90IbVV0sCE+0xZcEfb2uvDE/2Otk/McT45Fl5nUxg8Yg8QfEnGUEf7UCn5iA7BANbO6Zr2u1sMmoAZUHF5r6PWDwJe3Nfx0RhDdqSZ92FfB6A6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712313193; c=relaxed/simple;
	bh=QKju591WM/78pOJY/z3mVvYwKeTJ8Xv3if4mLIFxYT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BClnK2Or2xgBqLowteqwSGvU5qr+vnhpat8Ju4FpnajmL7qJ3/COq5yhbIHML/FZaastsweha99r43GRlAWKy8CAnHTEzhS7N3WVWtcK1G4bEkLQV3STBKB49OgYtbIMEwp3S1CxN926VbEXUZqnz4utqcfGHM+GXwDa2STA2jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I7n5aCtd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QKju
	591WM/78pOJY/z3mVvYwKeTJ8Xv3if4mLIFxYT0=; b=I7n5aCtd2OqroXjEMsOd
	ExJnjL1MvWIajbsEV0h6ZNxhJytiAAc3AD6HLbs0QcTV8yBV8rGNmB6ErpxXtZzh
	QNZeZ0ehu1Z4bzKPUsZlDq2UfhS2cU+0aT7PEbQospm5GWJR2ZXu0nWioHVkWg5H
	wax0CFSisjbrmGZEMbctncmlPMVOuW0x1DTaeZo809mUBS70vKWjcNIxaeKa60pU
	f+PA2W6wXrmyeTsF5SQ0flT/dWrcQMaSFaXKmc72OhBlwQG8qKXdGFjqtmkPkLn1
	DPtQ5ZLkg01UeK1MUVQL6cmHqVuAzgZ99dn0Umdp6GHHx7e5P+c/L2jT/Ki7ZM9K
	nA==
Received: (qmail 4076362 invoked from network); 5 Apr 2024 12:33:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 12:33:09 +0200
X-UD-Smtp-Session: l3s3148p1@pkRj+1YVxNMgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 12:33:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: add HAS_IOPORT dependencies
Message-ID: <gwmdlcbfkqtbtfwot7edltbvwy5wfj2gsrnjp6kyve2jhwqa4v@j3ucmwj7r4ci>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20240404143351.3950179-1-schnelle@linux.ibm.com>
 <20240404143351.3950179-2-schnelle@linux.ibm.com>
 <osgkd7mfd5jhl622hvybsbuaqp7awxcm474zzzlbpxkvxh57l7@hpm37bjuandj>
 <c86b17eb173f21214b6bf765114af79f20c91718.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhlkcr2sk5dkca4w"
Content-Disposition: inline
In-Reply-To: <c86b17eb173f21214b6bf765114af79f20c91718.camel@linux.ibm.com>


--bhlkcr2sk5dkca4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Only reasons seems to be that I'm bad at juggling large patch series.
> i2c-partport.c builds fine with HAS_IOPORT=3Dn and I don't see a reason
> why it wouldn't work with MMIO based parallel port drivers.
>=20
> Will send a v2 shortly.

Thanks for the update and thanks for doing this!


--bhlkcr2sk5dkca4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYP02UACgkQFA3kzBSg
KbYd6g//T1RE6Ri47rwA27Amh/NMQzL654nSfGAWSf4ilxFnrgwtAjTm8iZejAPr
J/wg1RJfCQmGWZNA5WmAlsOfzRYSRit4qC5mniuBwc7Ev7ECxTMIT7oaQL8OJQcx
wlWadwHm2GT0+eAGjJCB/WMm619b16vczLSzKg4YbY0T01eHQc6gJTcnmIPR3iWX
Tkm+gCn9BQFGvbUFEggRjk0tyF2xlVhMe23dN77qPyQEtFfSloqh5n62KbcXcVo2
hE2kfV+QQZoqIhQaNNsEjvCJiNspQ6VulgpoIHOQozMO9aRUD6S1T31/F8Oz1aKx
/f904FYDC2KYm8tAdbYJuF1DY9omj5hroScpK9PmVwAghHG6pAFDvTEPv6UQfkcq
4kfPpaE27ultaUVMpRh5LSn8BFTCrLFmFOBELMCJYllDKXgdpC/VlUCqjahSYFwm
DdBpK4DgBg6tOSejygmRk+4cpEk2tcBJEJi4Q8x37HRCZxv9DdpdxZVuTkiWLuZi
Kkbzkju42XuyY7IcI3o3MooFWqAnHP+rsgvaOZbuM3TDpC0Sahy4FGyzfagKbJyI
0JvMBN2fXCBudJeO2w2qaUZfdY+aQnE/g5rHBWjF54Pa74oXhWkmvu2Bypy7lRhv
JWvue1Jc/F/I33i72Anc+aqTref7BlG7J6eWZmqg+pF4ZOWNMLE=
=jcWg
-----END PGP SIGNATURE-----

--bhlkcr2sk5dkca4w--


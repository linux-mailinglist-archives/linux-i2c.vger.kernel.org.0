Return-Path: <linux-i2c+bounces-5398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E329521C8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B09E4283268
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFA91BBBDC;
	Wed, 14 Aug 2024 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L3WJxrzc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602FE1B373D
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658648; cv=none; b=Nvvjt9gwQX6MGyA3s66AJNVc14Rd1lQZst5QFH5BMgPgfr0c45IhVR/2ITCoiYVqi/qeUB4XhuYHM0/85vGm9xhfmIV+UJBb3xRCeaa7azkxz2UpToVg5nRNfayaAG2HkNUIL7vDYtucTbyx+qOOaTzFtOoGnfuCiUCcdRxes58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658648; c=relaxed/simple;
	bh=nSxAndjZK6rgdX7HkR3hzq5E0z4md413dQnkbdKeUlU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8Nuz/DJRvCpSuXdQ9/mmtFlwa7umiaX3u0qI4HbJO/3uCXOCvtePE8h6ELaXga2SR/1u+zmRCVmwTbZIOrAtAcYRngqwgujp72i0yEJk/VEJIDl1R7/OaBN4NSCpGIPKVUP00jKBBsSv0t9woBPpI9GbgOrBnSXUz3qKK2wWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L3WJxrzc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nSxA
	ndjZK6rgdX7HkR3hzq5E0z4md413dQnkbdKeUlU=; b=L3WJxrzcAuqxnW2QZGWH
	ReVE6gbpZqQBitvVj8wywJ+/M8IbhfYr/TiCydnJ3wyrLVj9SUEYBlY7ICxLw0GW
	KQlr/3KpwNYV2zsnd1v+X+4mkdcvDFBHgn8IHd4BvEaOIPintiP4qTpMyzXAlNBJ
	Ts/395AVNQHPe3Zf0ha+TCZTPwuHd/wSH56+SpaN3NeXkGotN8LRPI+TqjHwkMtE
	DPQeFmX7w/XnnVTcsxC7EYrCKxdLAyLN3s6iCxVC26iVFR34Shy7m2i6bXMTfJcs
	kpiulWF9cEr9lKt2+xN0gS8xZv2if6WUl72PXDns0cP6VBbaQAeA4KFtX1ZUdX+B
	pQ==
Received: (qmail 2061671 invoked from network); 14 Aug 2024 20:04:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:04:04 +0200
X-UD-Smtp-Session: l3s3148p1@M9UyjagfxKkgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 20:04:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools 2/2] i2cset: printing help is not an error
Message-ID: <ZrzxlOnirVmkxixq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
References: <20240811093411.5694-1-wsa+renesas@sang-engineering.com>
 <20240811093411.5694-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S2AY1z7+6txXYrhk"
Content-Disposition: inline
In-Reply-To: <20240811093411.5694-2-wsa+renesas@sang-engineering.com>


--S2AY1z7+6txXYrhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 11:34:11AM +0200, Wolfram Sang wrote:
> The check distinguishing the 'h' and '?' parameters is dead code. Found
> by cppcheck:
>=20
> i2cset.c:177:4: warning: Statements following noreturn function 'help()' =
will never be executed. [unreachableCode]
>=20
> Add a parameter to help saying how it should exit. Remove a forward
> declaration while here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Pushed to master.


--S2AY1z7+6txXYrhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma88ZQACgkQFA3kzBSg
KbYHEg/+Pl+JTIGIEQWk+yaxIxbgK3w5FWrda2+k7CGGsYV1GBU2PAErv5LGtk4J
DYJCa4omFSdX9ibWCTzYoXDmTwa28kS3qWmBOZOo6nrwpwUZqtiTaBGHlhtGxjel
RVbZKNG06eRmT8e5eQM+QBcTIhnLma7u+jS2Bc5FeQavah2EAceiQ6ACEVt3TNNn
QG1di6xho1/Quc8jjg7+in+G++42TDZlfxMYyPGtvY45UVnCfxtKNSL6l+iijsWN
HfEx7Zb98qAN47dm+IXF983/9KqCrv7le77co+dsovvU3I1EpUz4K+O1cgpU3mj5
5NMPAAs4VdRdfjINlti0iCKlTQ6u8zJptwFa55NRBNBnA5VdLogC3s+aBUROdRrV
JpRsZbdP5a9kqKThR1toPsXO4c/rfEKYkNI9KBxzLLeZVqkMxvFDaLYYhus6xO2P
irqOwKnqx6+YH5jKPdznuTxMbAIkfOAAZT/m3dHg1TVKZRzdPdNOm6RTb/v97Tu5
Ynju26SD1dKPEwwaMXNje8iVXfrKigiE298gsqaRLy5H1mvFhi0nh11Jx3ELQ0Qn
q4efTwPypWQC1fLHrALQWq/bftsL8G+PDqgeuTgZuvIdG7p9aAKMYMMbKYuUFs89
MDgWoXcCyYSKRf+5rzFOFox4u87vkZhfrbgzyx5FZLpuibZVMNw=
=WocV
-----END PGP SIGNATURE-----

--S2AY1z7+6txXYrhk--


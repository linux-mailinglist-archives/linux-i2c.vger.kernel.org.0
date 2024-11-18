Return-Path: <linux-i2c+bounces-8015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E824A9D0A67
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 08:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C42281004
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 07:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8AF14AD29;
	Mon, 18 Nov 2024 07:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IyfrLNX5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9DB41E4E
	for <linux-i2c@vger.kernel.org>; Mon, 18 Nov 2024 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731916239; cv=none; b=gEtsr9MvaOYd7R3qK3Cjd3RbiqfNBZ/Ruyx4X8Gishox6sULi/ab6JhIkitL1ul66YrQBbdV6EPqX2Ji1A/EPDpo3mg9dttwg8m4CWPJC1HkbXukY1Oq49hl+V9R2Z1UBAmiYFlXyaYPLvnV0ejcKQ1dhPkAe+UWOwXA3DXTIWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731916239; c=relaxed/simple;
	bh=uzYCkJEBfS7S7Ayd4uzQ4TW6B5bkJFihkhx9fNAhPRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnFqGJVRTYtAfIwP0tbzzpQU1AzDx71PoxYx9rxxbYA4HFxjEH/k0a7WmDCnwuEjquJoLQqK2i0Ifl8e4m8T0vV4XsaFP5nMhfNYQY54yhXOdoBVP8YDxBwpX/eNiJ0atIqY9x7ulaZMxYkJymgEGo2DAPrWUa4CnmJZCvK84z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IyfrLNX5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=orEo
	xae73GU9PfO4gslJUZ+AzeOAagaiC467BDDgSd4=; b=IyfrLNX5jliU1sBdm9kR
	3FmoYiu72cNGDh0dikdiCQBJgO70xl8/1Gog4gzblviPY375wJRQAiTA6VJYQ1hC
	h5yPDlT48og7Ln4BasRGOF0ESg8Iclk6r2w3Jrn+9auYHFb6XTQvCONKl99rEkja
	8LrOvnAjiX5RpRpeFGmj6ifm9ZrfKeOkEH4FLEDvJVO7M4rg4n25xjV/oauymAVc
	0pfmLVX/dRvH9LgMx6WUa54DQH5+K4Eek9z29peY6nIxdG/4ZMBN3RIw6G8etT90
	axMIWpOJ5hTjRupgwUJo4xJl5Qoz5785plM0WX/HwTIcgtnGtbh6ANEgnt132zZw
	/Q==
Received: (qmail 119053 invoked from network); 18 Nov 2024 08:50:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:50:36 +0100
X-UD-Smtp-Session: l3s3148p1@BEsELCsnjtsujntT
Date: Mon, 18 Nov 2024 08:50:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.13, part 1
Message-ID: <Zzrxy6Bjt73OU-Qo@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <bzixz2b4zkjl2szbrvt7hz2y6txoyhi2wveh7fcprhwnx4rujr@3yqp6aumrjr7>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XvndDtdWAbJpPXR7"
Content-Disposition: inline
In-Reply-To: <bzixz2b4zkjl2szbrvt7hz2y6txoyhi2wveh7fcprhwnx4rujr@3yqp6aumrjr7>


--XvndDtdWAbJpPXR7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

> I'm a bit late with this pull request as I've been extremely
> busy over the last couple of weeks.

Well, the pull request looks like you spent some time on I2C
nonetheless. Thanks for that!

> I've checked the tag description multiple times to ensure it
> won't upset our big boss :-) I hope I've struck the right
> balance =E2=80=94 descriptive but not overly so. Please feel free to
> suggest or recommend any changes.

My feeling was that it was still a tad too long. Please have a look at
my shortened version that I just pushed out and let's discuss it.

> In the meantime, if anyone needs me to take a closer look at
> anything I've missed, don't hesitate to ping me on those or
> reach out privately.

I sent you a mail with some patches I suggested. I assume you got it?

> The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae54566=
23:
>=20
>   Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-6.13-p1
>=20
> for you to fetch changes up to 1922bc245541bd08e3282d8199c8ac703e366111:
>=20
>   docs: i2c: piix4: Add ACPI section (2024-11-17 11:58:57 +0100)

Thanks a lot, pulled!

Happy hacking,

   Wolfram


--XvndDtdWAbJpPXR7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc68cgACgkQFA3kzBSg
KbZPCg/4pHNWuhKUdvlfvlZm6f0XTWo1OyowuVJo00Mc4662hWlpXsb0oBfefZEg
7NhTDZ+D+agvZ/iMx18H/cj/rNvXeKmPZLw87r+lVMUG3bLh22e9SXLUg6cUjDmx
ZWl/slJn/Ns2t4SxO1EcrODCuhOLWCpxAh/2LeawUOIHkT/vtV7Pw26H2svgo24y
pi7sGf7YeALr/w91Pgk8FD4jRoJTYavHyfi6dH8Ky3CC+E4f0ongQJuXG4Y3FyXi
mYDukC06Ykqg7FFXMo/ZEjX6HtBJWL8CNlGs7MG/kfJvURDPQcveBtZHTdIOz4sl
uroD1HQa0GpEv+yYyX9XIfdd1sFi3t6n/0UoL2iH/l1WqfiOdaqtSyzuO/T/WaMT
xi4QDUJg8i+F1OoKJS5XK1VwoIIwwzIW/Q5KJSg7UTv2YK8X7RsQXWHnxH8u3okJ
72TVnNXzulIJt99N7YwqgXxWJPZ9CIZzzqTYz3I8yCTBROnbSWP6R8zevSktHIYd
nIlDP4HMDWIob5lHeNQKR5GxSbJx/02w36szNduEBVCr4zuxx5hM8Zp7hu0X7phe
cQBPajNMQarWKZZ4dQ08of7mJILM4ai8gpassIVrG4ELb/3TcsrAI7aAdQua6NJt
ykBN31xQKSmvwkvfe5mXzTKvaTSL7Xq2KmrvhnRkm9EJP/2K4w==
=pGgH
-----END PGP SIGNATURE-----

--XvndDtdWAbJpPXR7--


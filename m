Return-Path: <linux-i2c+bounces-1923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EDB85FF4B
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 18:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23EDD2866B2
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 17:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476C11552E7;
	Thu, 22 Feb 2024 17:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FwLFMXbw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF6153BD6
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 17:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708622925; cv=none; b=sD9Hhk1TdS3pTC3PKIbpn9fCPaG6ZZI6xH214iePG0B04DIN7Jehh9RoNPc6aFpam3hZabty/5YXvX196rvHpytItLnR+6KuHSaIDtllNYf7Osljs5pqKNotAQnxLQZ0wn0oEQKp99CcH3QCxQ4vvHjb/osqI3o40U5It7ZPlKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708622925; c=relaxed/simple;
	bh=gpoh3erL1P/JlN3g1pqaRkvrasIx4zSwJr515KnNTCU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S87zAvi+D5Gd62uiCqsCla/ImQpfhHR8TTYnCv53ppWLnTd3cWVQdnzVEgdvXT0IMD0/eYmjoGR8hzJLCufzHcy5tJ9Gv3UhuhwdxeGCwoB3N6Wtsk0Tt6k1qBNTiODDqkX9j2bHUSc2yF2CuVJpHqqnCTyq+1qD55uPcuR6TYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FwLFMXbw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=x6nZ
	KXNiM/QeU/XAeH44iVPPCEbejCNzQrwhhgsoo5I=; b=FwLFMXbwzSdzeAYhchdU
	04jj69wbpT1Ije0X4IZzEMXx+FkiAO1IAu2FasV8fs7dA+GqLl2ag31vDI+Q7chv
	MfVl9TF1oF5m21ZHpxp7tCKbF9d/P33HqeGJ/KLehUZmV5fSCvkGOkaKVyNwj8k0
	E39K0U9ZN/ZiSaFhgPADX3OSzoO8z6UGv7ySPBbtVxQwnivxMIP9o3vrvmeIziTd
	YlGf+yiaYMrUSu01A+5YY7MZ2lZewTvvpuHxc9vYKLmzCEPY1ked4lnnJco8PcPI
	1DHa0/TA7DaggKlpugjCsx9FipQs900oE8fS7hHJAbwzQB51U0dx2PSqsPCC7et8
	xA==
Received: (qmail 4051148 invoked from network); 22 Feb 2024 18:28:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Feb 2024 18:28:37 +0100
X-UD-Smtp-Session: l3s3148p1@kPAKxvsR8LAujnsZ
Date: Thu, 22 Feb 2024 18:28:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4
Message-ID: <ZdeERStL9kkGV5zg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be>
 <Zb6l4PbN3l4SPvRN@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ibtrWN6mtrjuBOsY"
Content-Disposition: inline
In-Reply-To: <Zb6l4PbN3l4SPvRN@shikoro>


--ibtrWN6mtrjuBOsY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 03, 2024 at 09:45:20PM +0100, Wolfram Sang wrote:
> On Mon, Jan 08, 2024 at 03:24:20PM +0100, Geert Uytterhoeven wrote:
> > Currently, all Kconfig symbols for R-Car Gen4 SoCs select
> > ARCH_RCAR_GEN3, which might confuse the casual reader.  Prepare for the
> > advent of ARCH_RCAR_GEN4 by extending the dependency for auto-selecting
> > reset controller support.
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Andi, can we have this simple patch in 6.9 pretty please?


--ibtrWN6mtrjuBOsY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXXhEUACgkQFA3kzBSg
KbZhtQ/+NtahH95zKrk7GrYLJmokrtv7eOuKguxvkmzZW1ckFGr9O+QfGdzWPtMW
Euf26ISN+zOfYTsRv1E3PAV3XVs3a+e8ofOVXcXYatfPXG/zOkl8NDLZITNM/fSm
frLNESYgSiJdVXBdefhXeT++Gl0MDftI/zAYCMXXbSKCwRER2zeibvaKVtAr0HOk
ZV3aIWyehasMfCvCZ1dfpPPH4SQIArDIFC1rW+Ttop+DAM6DZBMvGOs91vEnhYxd
jCiAP32bFUCw4xsOwKa3o9iv4zntwX0eEOkhrHLN/bnXwp4+qZBpSuJ4132J9ovy
tmk60AIiSfT6cqMNPPxejFZ4qvG0UmOwIZ/i1q9d2Gujo9pQeiqJaqNHR+VEV04H
ObvWJiOX52Hr02QNG6CbOILqDvQ8nB66EIEhijHLdGPCItz4r/M2ac/zFhBqBrRt
hJUkd1HNWdllzkYzWs6pLXkEdHhPIhRulBeM2yFaGSRvHAZ2nRzm70j6lY7Sob+5
d2a7mHveInyAQRixlH0Tj5nvp4cMPKVIxM1hS7iyKl4nemFNn0IyiR+JSd3OoT/u
Jp6MG6NBAfY/zVGnmUwpcGwrr0jQt++tLA2ORgFyaeZpqFc6dj1WKSo/LGqCqmbY
TlxyAUEpDe9hzZa/aOABNz3WMe+kGlbgh7Rl0Z/t4TuHybQUvPM=
=SIy3
-----END PGP SIGNATURE-----

--ibtrWN6mtrjuBOsY--


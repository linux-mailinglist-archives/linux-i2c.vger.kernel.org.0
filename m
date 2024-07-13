Return-Path: <linux-i2c+bounces-4972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438C59304AA
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 11:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2B63B229D8
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 09:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB984AEC6;
	Sat, 13 Jul 2024 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GaRyj04l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB841B960
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jul 2024 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720861968; cv=none; b=kHIgG0qRSu1eA8Evn/B9z0U7LHUrXtjBJcv45l9Y3r0dxls2TG4RFpk6J5TMBnw/Tw6GXBjgUddjBOVHmQeHHbZpTZhhlGG9S2UQVTcDMCfygjXXTppzqVyY7VR+MFKExfqYcyZXPaChDMZS3eyZCTc3e/ATjC8YgsO3bi+1ejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720861968; c=relaxed/simple;
	bh=6pPFEgSAaEpj4a0f4CB1UkJ7Ri072cAizXQ2IOWTDCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lp+MmNH5zn7FBkI5quTFOCBYUJVBtVyDvY+5TZ1DekjCfE9j3thHkSWJC+zjIXBDP+oT5M+dwP1yvY61S6Fr8UJFyBnnJrx6KQXLTcDzzRQIwXscUBvh4xcT0xcxdFAEonjrLzLNcUGsVq4zg49tVC+1VCwlD1nMVoSxrGIbNco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GaRyj04l; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6pPF
	EgSAaEpj4a0f4CB1UkJ7Ri072cAizXQ2IOWTDCE=; b=GaRyj04ltVmRVLtTjkh/
	RnM5fG0xNfHiBC3cRhiv1o9vYq103Ih1Cr/m9jwWmS2z1PS9N1EYSeOAp83USYlE
	ioUcJ39JhyQR1bdqQWLv6HN4wTEIssNUxSCSEsS5QUxknvRhEFPpG82BYQm/G/iQ
	zT3RQnNi/S3jL0ql7y81JG6dMWmxZKReDuOypMCrWUdNhOzp9TFCUeAzDpmRw0za
	85rv/e9FSC7t6kC+U+0q16lj8hSrr1SJG05R7ynAWlJAvl9YiwbCqsV5NFR32kLp
	np3iXQTfT42ZoRt7UV2Jnnkk4UDKTa+MrSUqbWmxg1DvKk5CnN6AUrXOmEchHRLj
	5w==
Received: (qmail 1388248 invoked from network); 13 Jul 2024 11:12:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2024 11:12:43 +0200
X-UD-Smtp-Session: l3s3148p1@+fwLZh0d3K9ehhtW
Date: Sat, 13 Jul 2024 11:12:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: document new callbacks in i2c_algorithm
Message-ID: <ZpJFC7NIsqWj3yXw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
References: <20240712095453.11440-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0O3ODi0lby7/2WmP"
Content-Disposition: inline
In-Reply-To: <20240712095453.11440-2-wsa+renesas@sang-engineering.com>


--0O3ODi0lby7/2WmP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 11:52:40AM +0200, Wolfram Sang wrote:
> When updating the callbacks, adding their kernel-doc was forgotten. Add
> it now.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20240712165527.75e4ddc9@canb.auug.org.au
> Fixes: a93c2e5fe766 ("i2c: reword i2c_algorithm according to newest speci=
fication")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--0O3ODi0lby7/2WmP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaSRQsACgkQFA3kzBSg
KbY0NA/8CzYY/bw3jbv65ifAZdaGsW9dYVc5O2caiVdMx83raWjhzaGEiDg6SvV1
7lZhYeiaaJzc3ZxAUkmpNDnIu/0/c0u8e1Kelc+8XsBNus6rGcRpY59JxAW2wrr1
EF4jNoc6E0vzrAXNy2N80FZHzHdA0Xw20DBd67p1bok4od06/4yK8Igss/7XwKp6
Vu+zJLW3rFbYCfSteli4l8ROu6Rp8WCxMoX2B4hQ5L5uyYDxXFcUIkWiATu4eVF0
RRsyIMs2GyxyZSo2PiHUILQIHkp6EUiphkwHPCaVR+ZHAyxvTiRP34608w1ZilOO
aEG+vpuck7SFvK3t3X5hvNy3o/VbyYZepCvdc1DHdmH87jRp4YBjrhJ/ta0vMPge
e4WkNoWCpPyVycnv5fkq94vzJyIRqqFBIFihWJvqmu7yfoIy8IsGVbo7FTcUCTgR
zQHK4gcF61lEoYTFabyJ9wkqAdQn3bGbAGUnVsnQtMXSbHDMxbBEjdPh/zyrTszw
yY1Z+Zr1yy3+RSL1K0j9qTC9ocKD/uk+MHcWn+PAnfJrehCCzEHI+9iu2fRCp1SU
ml7cO5dI5RkeM/hXVSHwnQ6hP+IiOz+qBKBULiubAIiH7038Qb/WyOW75sBEwE6s
CYKgyGEsAuRMp5wS0ddilw7NyqiPDESrt/FXv73KdVrpVF7qQ1I=
=Dowj
-----END PGP SIGNATURE-----

--0O3ODi0lby7/2WmP--


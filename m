Return-Path: <linux-i2c+bounces-5399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 686749521D4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E59F1F217DB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5D61BD038;
	Wed, 14 Aug 2024 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DsqrWVYV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B31B32A6
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658975; cv=none; b=MeDLbjTtzv40PvJqps9SZomUgY1Y3FknpTkYKAX0CvlIHGnJa+2Z6IMuDROeUT1qBBf95huZ2WD69MgO4H5ZnGYkryZS8Iov4747f/0DL+iFuhH8s4Mu8slHa4csNf/b1QnXNAX/+wFoMpnqPr6EI6uUIRiCQYkNMT12Dzsh5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658975; c=relaxed/simple;
	bh=k3n4Sag+KL6JsykpbKCzS4XRto+CAG9x6X1FwVbw+Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+L6bB8RRmzFQTZPnXXyZiG9H0prHZ8jQzFVMAch6KBOh+tMMe+gVaGxcXpIJaiD2rcOsVyg01xN2EiWChwF5B2CIovN4RI+vbIHqw/dRY8uUyZc71nJxDg7+votgG4muQWxJPBfLWySpFC4fyvAFqV0Wfss9nOCDwn/648Tw4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DsqrWVYV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4ESO
	CEQSljiZ7ghFTFUweH4hYY+CxoiR3ruZXfvrXb4=; b=DsqrWVYVDOOYoY8YIS6y
	bXOljEn8vYqli/ecYOWRchCNSsQjez/d1Wdnp9w8xBS6yM/fALvFR8/EXd7uwz3f
	n33307y9hfIploMi1BwIwnBPqXIhSbystZ+GuuzkfQkDsmfohKqCRrmkDGwhrbKp
	G/gjA9+R/y+mhdx7q2q6A7iwntZU5cASpVx/X7kgrGsxTAhc9fTYR71Ons/uw6z0
	xIkSPSywPMho7O0B9DFDvzd5gZHTUQbMJm4cQNJd2ZmuB7o7ts9Fet6ofJb55zmB
	3eU4xJBkc8l459adsQxun7joAXUXXi1uccS0c6/2Leepxa3ULV4diUK1AjIjv48j
	mA==
Received: (qmail 2062777 invoked from network); 14 Aug 2024 20:09:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:09:31 +0200
X-UD-Smtp-Session: l3s3148p1@qhC3oKgfopggAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 20:09:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools v2] README: ask for DCO in contributions
Message-ID: <Zrzy2zW8zXTGyphQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
References: <20240807112835.14346-1-wsa+renesas@sang-engineering.com>
 <20240808112746.42fa8590@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hFzUv2NA/8ByZldU"
Content-Disposition: inline
In-Reply-To: <20240808112746.42fa8590@endymion.delvare>


--hFzUv2NA/8ByZldU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

> > the 'i2ctransfer' improvements I just sent out, I think we could aim for
> > a 4.4 release soon, or? It's been 3 years and the updates are small but
> > still neat, I think.
>=20
> OK!

I just pushed the 3 commits I had pending for 4.4. From my side, we are
ready to go. Do you still have something to be included for 4.4.?

All the best,

   Wolfram


--hFzUv2NA/8ByZldU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma88tsACgkQFA3kzBSg
Kbap9BAAtmEslyuy+2IX7hBIXTyq4T6DL81PZppcCUuLaA95jVw74trk9u7IARbP
THskOcCGoNTdS3QxxpFxRYZfPqSkjxTFtq8jv+ox8+uyKMwSO4Tol4SMslBcdcE6
R08d784ikV/26H4R3jRvjCWfeWCMA4F30lTRvPSZlbt1B/Q5UOS65KW5pDx47vPW
vnFPLhMIjicjE+2TDULg5k89vLG0BWaidZcDD869Hkw2M3irffvrmkHjS8sIyX+m
N9/B4SFcopNAkkF2GTvbkRa6C34aXoqtndwUQMJ6VWpF3fdzun+ykdXwJt0S/1Iv
3rKeSHH1AHEdCBEIuHO/m0QkNttquoJl1WzWFjggpR2A6rgYzedFaosE+a7vp7Zs
aHCbhYchUwJCoDAJiII9WGu0pQlcrMND17Bt17i/jvVLLfKNmEK1MTQRuRX6Mfpi
ZYA7kRoO120QgvkkDGR/mHbE54U6sk14BBr9RXifvafRbEmYlsZVwRH2Zv8DeHyE
q2ac9N/v4ZdCgVZ/shyYS9fOk9qbREJzX6hSyFEMFlshT7a/y1QTqFjPklHBc1Ct
kOUqM0jRiq8+zs7mZ2YEPcKypBivM7JfvHwm5D0b4leuOSzlILROrzrKTPFCljTX
oflrdG1W9QrP6Jh/foUcDGxDHiDZASJ+8ErEFiM6ntUSEBfInjs=
=KVus
-----END PGP SIGNATURE-----

--hFzUv2NA/8ByZldU--


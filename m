Return-Path: <linux-i2c+bounces-8891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4492A00937
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 13:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D825E3A432C
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509A61F9F72;
	Fri,  3 Jan 2025 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WWDlanK5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317961F9F5A
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907293; cv=none; b=hJmus5StbczTLt7oGtB2mnCoahsLa6OGrWcrVETI0br5c+yMO5Kp+L+XZc2EED4TOwkUD/LAXfc8VhP6a+vTu/fAY0/oVsAEhBniZiCGpZjNG94FISvfg4baoUmF9A5U1zajp+H7EkqTQ2KP+03jYT1rjPquNpajr4RhiDmUPsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907293; c=relaxed/simple;
	bh=nHDCP6oWCjZl0cM35WuZQBv8b90kddl1ryguXnGMCLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+5FaKEOKk7rZQkRDJNoSJhPr9tfHjTgKk3GfXW5qKiObbeiKQoXcJ0uL7m8VTNHjHixHqOQF8fsyxFSVotEI5Zq5Hgpu/ug1NxnFtZSgsXFRiIFNsM+W7QnEB/X8+i9zcy+phZ0oauxCPcrO66dukhok5Czuj50z1ItsdT2YOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WWDlanK5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Auni
	jGDBCaDbH6IFXg8rqvoFVYZAcFJ1l3TlROVZ2Ek=; b=WWDlanK57U+KdRw1ombu
	VnNUtjLNVD4AQBfWGCd/E8AQrrF1bgOuGKJRF3G3xOS2U4u6WrVO64ya/VNMb4G7
	zkDPYWmqumYg0bA72bw1VYmRyriZArslvZRBroV2u6ka23eJL9I+Ct/ZDufFTXGI
	1c2Vxr8x9TvGbi7PDbN1xOX5Dd9TiXMUcB8rLYClebAZoFHqELkaIwUnlYtGe5hl
	5lT+E7cx25Xf5FUdhU3ZpAIvvMUKLS7HlK7spmofv8mnjNlqcwgA/I7Utcy0IgD3
	zs8I1OlSwjeUBF77epJ4dPGiOjrY0mKL0BkP/2LbtPmUTh1hqlOK8ArAfE+yP1Qq
	Ow==
Received: (qmail 899172 invoked from network); 3 Jan 2025 13:28:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 13:28:05 +0100
X-UD-Smtp-Session: l3s3148p1@pQYaacwqGoQgAwDPXw20AOMQ2KO98fSH
Date: Fri, 3 Jan 2025 13:28:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 1/4] ALSA: ppc: Remove i2c client removal hack
Message-ID: <Z3fX1KYaXssUpxY6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
 <7f8156b6-b4fd-44f2-915a-5519f780bfdd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZAzK38I4Ig9UzgxP"
Content-Disposition: inline
In-Reply-To: <7f8156b6-b4fd-44f2-915a-5519f780bfdd@gmail.com>


--ZAzK38I4Ig9UzgxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 11:07:14PM +0100, Heiner Kallweit wrote:
> The i2c_driver.clients list is internal to I2C core and is going
> to be removed.  No driver should access it. Unregister the
> i2c client explicitly before deleting the i2c driver.
>=20
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--ZAzK38I4Ig9UzgxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd319QACgkQFA3kzBSg
KbangA//bmOunitP4h29WknBmhDz7OeQ39vFrtixJ+JJO/hMffU+1RdnwrSgziMG
PzKrC+IdjqENJMInIueUgWa6zhPhxozThuquUQQXgIZms2l8jIG5oNBssXd4Tia6
Xw/DsoGBYbTMXhHoS2eFyooRqNakgh3XWUNOuP85P2XAQYMiKBcN/8bWc1mUb2lT
oJAv+8/y1WdazCGls/4bKMAHdXk/w7muSmcDpEgTy7Sb2ZFnJ0lSIH3moS7/apzG
oapcN3x8sEE7CSBkgzsz8mLHXKukm6o+JsCzEpSu/M/mb1mbNGlE7QMWrLhYLWj3
eBJhW0VB8wOTMuHC5TLj/3oADQXQjZbNaNVxTDHcARIF6ilFZ8iTjNN7VtbQbfUm
/oyJSqDpIrM9VYiphhJJIBXrBoIylj9xD3w2kM0OEbx5EyIJquHO/T89IOiJfppq
i375vmIdhCQEFq1U//V6mb7fdM2dPDU6QN0gt66iaKnf7gzzpkgpOIC4xZHAjxDr
CSF6cdGj7ckM6U0uvFbzm5D3vkitYl7C2a6NyE11tB+Dj81n3xTWYnsVfOo2M8XO
3r3GuDv8bymcSWxt2Ete7TyBjmfmSlFKZtlaBcxppAfm0ONdIrzl3AmSr4f3K85f
DqWJQXgEYsurnAwgyXW8ncB3pD/yCWzLQtLyc+UfqWP0AP/NGII=
=zBc2
-----END PGP SIGNATURE-----

--ZAzK38I4Ig9UzgxP--


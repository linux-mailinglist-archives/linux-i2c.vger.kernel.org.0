Return-Path: <linux-i2c+bounces-9123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE640A140CA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 18:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C8F3AC2E7
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 17:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0F12309B2;
	Thu, 16 Jan 2025 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QuxwhbZq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FD22FE00
	for <linux-i2c@vger.kernel.org>; Thu, 16 Jan 2025 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737048038; cv=none; b=JAy+Q/4CimvvC0dfZSUwxxZcKSkJD5deGLKVbYxaWRHVx+DHylgM3oujmgKdkuy6ICANYYLaeQdbZmyKYT6W91sr1wnUWh8ZXoWsKO1UApuvNe4OxImrQ7SuVUfHL6dhSohmBK4KacinrpvM2bcH8xH8OGgZg4BBCMMhglM6Ckk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737048038; c=relaxed/simple;
	bh=19mvgyUghInfYn5VxdpPMMcOSijR3bYKv8pcUyor1cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiBVDntUkxtGyqhFN7X/a+zXAHfffL5WKo3EeoX1ZYrUqK2ZN6AtlKuv81/zGB1Yw6kWDOSyIN01CNz2jcakZam3w/n685cvJrXGbvxyoAmpNmncDjkomWXirwr0vDMl+xWawRQ21FwLxHcS2lC3lCJozkeTZkYA74Bgf+MN+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QuxwhbZq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=19mv
	gyUghInfYn5VxdpPMMcOSijR3bYKv8pcUyor1cM=; b=QuxwhbZqtigigno2q/qv
	aJlLkh/JTuoVE5/sUGRjeQE2HBb0Tj33vpbzBAYlmJNAKKr9IUO04eonOnjET7rl
	DIg6uIGZLLE7cCRPri3Aw/rDOL1NTMnHwWfyYIkzdAjL3XrTPWFOmjUNrYvx5P1V
	EVoSR1vOiO2r8qTHQZg67W8J/Lrde0m0ckngFWklX8xEecOVa4J7CzlZmvarL7gw
	DHI7qm/xRafl4opFBQc/2YyLmylB0roGfrgJ4gPbQ/lnRJrKjCewDUl+xJPt404B
	NZoe+1xb177/rhvEazq4WiMa7rt8K4kY5m4nCdX1Vs3heQXIiB7XJoDOKUKnE+yS
	CA==
Received: (qmail 970057 invoked from network); 16 Jan 2025 18:20:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jan 2025 18:20:28 +0100
X-UD-Smtp-Session: l3s3148p1@mEGuAtYrkr0gAQnoAGFKABs35iVLDC7C
Date: Thu, 16 Jan 2025 18:20:28 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: correct comment
Message-ID: <Z4k_3DSQcARFa9PQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>
References: <20250114204516.10093-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Yd2uI7HHfpUPcO8"
Content-Disposition: inline
In-Reply-To: <20250114204516.10093-2-wsa+renesas@sang-engineering.com>


--1Yd2uI7HHfpUPcO8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 09:45:16PM +0100, Wolfram Sang wrote:
> Two characters flipped, fix them.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--1Yd2uI7HHfpUPcO8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeJP9sACgkQFA3kzBSg
KbbLtQ//QVXV/2ok7Qm5RwAiXnRaJU/QIGGQg19KxwM5kzMtpzQbJy1CyQ656Xg/
iwWBWRgVPNREW5D60Om1d2yT6Rda0Q+Jd+SKdm+bYFP5G6c575uLFFmFeXYc/4AC
ZAr4G4sJe110lDbJyjf7TwW2MtiITtmQahLiYIXY4aRTkqRilQmXts0XMSL67aLU
8lnkwa/2yPME+3u49UnxvoEZxfyjEjaSWh25hmQY0crIa9PiggkQEF0cDgV14W/5
H7Vd9d5cXtMs88wegcRnId4bMwLwbVBrQquSz5ru9nvkTt1mUg0BXLALJc3ah3dB
LWN0UUTpqcn9iVJQFOUJHscjvB1j8LgoaLhvp73hhHSTXuQkPdFCRMXulSBt1XzR
b29lO782QRJARlk1M/dF0MpbNr4eGU2sigDDw9l1JIRB31nXk/Pb398mIVZTcgta
qO7Va/2DWyqdn3e4lrRTmuLzJQ4TxLPmr+OrHYKzz27No5se0MLG8A5uIwbDHtTQ
xMlfnt1KooQOj+9r+B3cZshzSTYmb5jzMtlwMCIDq5JLRWoiIqPTQJiaZLTXkLZD
LarxQkbmHXm0L0iabkrZWf+YsAL7IcxWHO5SA1foqSSb7Sl5uq3dfQc5q1SZh7PD
8i5qBplPg+LrdygyeS9mYUC9VGuXPYKkFGAcPy6QbYn2FVXEyM4=
=naRP
-----END PGP SIGNATURE-----

--1Yd2uI7HHfpUPcO8--


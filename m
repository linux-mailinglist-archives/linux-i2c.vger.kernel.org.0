Return-Path: <linux-i2c+bounces-5803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D795F2A4
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 15:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14CAA283861
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A79183CDA;
	Mon, 26 Aug 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j5sJ8eyD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58895184525
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678257; cv=none; b=VsXXQWFEegsWQJTWGuqSg1A7O2tUw3ltrwKVSK76CcPtDwyf7ku1e3z9QGOa3rTfcaVxG0XMumlnMW1sw/QCCevCm4sgzG1rICwTEKOq2j6GsbQtj/gH4c0kQaW7dnoughjCD2xKshyRj48CUSeB5GkPSLkAiRifJatbHLQ1Lo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678257; c=relaxed/simple;
	bh=LUNndesnzTKjx9UFQQznx/kraju95eLh67yaY04ocOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKIL+T/L8mrDrDDttzvdrbY7mkGQhwAOi+/z6XefFzMoPd0Oj6dtzWUKYsQakq5N2p9SzLpQ4DY3O98essj//34gxi5Q8Pv86665VhgRwqTQIQ2cmKgOSqndma2pI1TFUna51tIh4FB0/zxp56EA8s5P8NVSCkziJzMCNmq6YY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j5sJ8eyD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LUNn
	desnzTKjx9UFQQznx/kraju95eLh67yaY04ocOs=; b=j5sJ8eyDArPMNiS74XAv
	xHHn1wUsd/wDvPGxoYiep0JJcGSrfwx3L6YMOOk0Gs/AW+8ytuOodLjISvdoG2lJ
	qYtQY000moaqERIDkzUZi5h0rSldmunKr4+2t+elLZj/RN8Y9Psiv8Hs40dBkVBJ
	DikWQoRKQtdaKy/5ubCvBhskp8kmx/MFJ3UanPub4S98PHUtTmjYuv7E866oe5cl
	c1KAnH44oBKr+pqGIdR27oDTUaa++Yv3BHlLo19fhCf8INhcrIZBOEqS5KxgFca1
	cCVqc3ve4rtGVBzC8of4WPT3hmhwOTRJPY2bys1uaPTWQZtr0VAQ6mNEeWBhhO27
	rg==
Received: (qmail 2001604 invoked from network); 26 Aug 2024 15:17:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 15:17:27 +0200
X-UD-Smtp-Session: l3s3148p1@0OhJ8pUgqMkgAwDPXwdRANgvu6DX4+2c
Date: Mon, 26 Aug 2024 15:17:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: testunit: describe fwnode based instantiation
Message-ID: <ZsyAZ87O803ko6dK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
 <20240814182210.15382-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YMfXPBnibnAJtZLJ"
Content-Disposition: inline
In-Reply-To: <20240814182210.15382-2-wsa+renesas@sang-engineering.com>


--YMfXPBnibnAJtZLJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 08:22:07PM +0200, Wolfram Sang wrote:
> The testunit can also be instantiated via firmware nodes. Give a
> devicetree node as an example.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--YMfXPBnibnAJtZLJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbMgGMACgkQFA3kzBSg
KbbKXg//dLb7MK3qcgtNYLjuYpiSjNc8WMeQ8eg6JuRVqyeKgS4zWnDQsCaUQW2e
sR6zxk7oKK7gcyDDglUsOn7QLDGSRBLPHwtuF21AoGm2uRSzR7jwrIl5beC8ODe3
r6oL1Ih2D5TOGyZlxEmXf+ZTk6heJhdpP0ut2GCcgweM5G71SdcTaAGb+oACTU5v
2kvIry7XkIcbryYVIZLy8eMOsTRdDXSeK6jnFlGm1XzHu7b+hDYdYmDkVhcH+hKi
HLuNaSTcaSefMjqy9OaYgMBh2hk4ps7PklqC70k9l6jfizPzXn6r+vhn9OUGLwrv
YK64ykrQJxrqfwLT3GplgglJzfO/2NwUAfPg4B/edEJRVHcR1CmrbFEa/DnwGOcO
ViY6mKzBMcUc1P6cM7vZCfi/pHd2902fyLogf2gNCkaVYBhPFTFh/CStrubGq06/
gIZWKzAMavQam5kdQVxtHktW8zhFe32+zWHFbkeQbhmoKatog0Az+hpBXoAeAN7Q
v5WuUEnlz1WbexlYCy7Z4qAsKVMnsqyPXr8SbvXiPkOE9SWhB+xmBmYN0MnTPWax
vnvNyG7C9FrcEFj4r3iUQ2rkUR9eig9PnF0T5fem1PsXUAiuaqhJCLdWeLVPIw0x
OX5BNFlXyUldbPyoJAtb0LEvjlWcTHN1WmudsbWpO82ocl0He4w=
=C4X5
-----END PGP SIGNATURE-----

--YMfXPBnibnAJtZLJ--


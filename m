Return-Path: <linux-i2c+bounces-10716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C8AA5B9D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 09:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62CF79C33A9
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 07:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3948F270EAC;
	Thu,  1 May 2025 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VIiPvImm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D51F270565
	for <linux-i2c@vger.kernel.org>; Thu,  1 May 2025 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746085925; cv=none; b=DNvsUfChzdMk51vg3rnI0v/duXU1DSlq4naZuz673bqM8P2dw2zO6NFI7qWV5QzVjPKVI76GrrxMhIhnjRL7ft19QMPaFoAyl4fzZSlbixfosDzDsW7R1Dqb2kaVrHGXVTqMkgTNSeSloiMugsOhhHpV2Ny6J0GaK2WpyH38iCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746085925; c=relaxed/simple;
	bh=RYrfcBn6bwSuscQ7eGMhE71CnAk+Cjw4sPM/hJA1Lvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXrukQTYUnpVxyW52IW4KvOXXTC3KjQlNGKTSBstnSSo9ZbeqzEJntu6GTWWKPb2diocfLEv0MMLAiqx+C9gShqOdcCR2n9dzB2Q9XnZc1YrdnhYDsRNPRWHTKLpHMkp4UYtXQSnD3L6Ulhud0sCaB4fk/5xH6BRRhS3GwJIyOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VIiPvImm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RYrf
	cBn6bwSuscQ7eGMhE71CnAk+Cjw4sPM/hJA1Lvk=; b=VIiPvImmFVdj3w1urimV
	yHX6XjFruwMx1XN3yj8ee93CPwmKObJwf1AX4GDcb5sCG5NyF1fptIJAntgipZNp
	piGdQOXugNZ0d7oKURlUVGXfGqcKXrDRmF07wlDWGdfUifCRxxhAkirRcHAanAmP
	81g//1i+v2XTyba7+TF4rgebOKScQfQC+br8Mp7KL16whPsVxJFYOJ4n7ofUzhl+
	JyyKHOIVnkWExkHLCn/HEHdCPtZXYCgrp8C7eshmZgjbHjfV5luuY6kYcBISq4Vp
	dDgEhBd51cax/CFA+Nd2pyRcYAm3sLNNE2sJgGzUXPSpHr1kIeLni3ZOxY6tmBoJ
	Xg==
Received: (qmail 978370 invoked from network); 1 May 2025 09:51:58 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 09:51:58 +0200
X-UD-Smtp-Session: l3s3148p1@cXfmTg40FL0gAwDPXxyAAIlRla1HkD11
Date: Thu, 1 May 2025 09:51:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v9 1/2] i2c: riic: Implement bus recovery
Message-ID: <aBMoHST5o-H4BvkO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430194647.332553-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xKjuJX1DCffYbtLH"
Content-Disposition: inline
In-Reply-To: <20250430194647.332553-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--xKjuJX1DCffYbtLH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 08:46:46PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Implement I2C bus recovery support for the RIIC controller by making use
> of software-controlled SCL and SDA line manipulation. The controller allo=
ws
> forcing SCL and SDA levels through control bits, which enables generation
> of manual clock pulses and a stop condition to free a stuck bus.
>=20
> This implementation wires up the bus recovery mechanism using
> i2c_generic_scl_recovery and provides get/set operations for SCL and SDA.
>=20
> This allows the RIIC driver to recover from bus hang scenarios where SDA
> is held low by a slave.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--xKjuJX1DCffYbtLH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgTKBoACgkQFA3kzBSg
KbbfwQ/+N6mNRwrLqA5m7Eo4cF+AGhkMcrrHE032M7A1zkCwXt6YKhO/M14uIPjS
i5x799kmSjYWPhGCerVlLmjjGB+94NzK73nHQUPT9nI3+V37MKPRTWPq16wEX3Tp
qrq8tkjfF4J0zfYZzuuQg2ukxtTyc0iUnEdJlJhPEs8aWJALU8AAnNXRQuN9d+MF
YrZMnk1uLlKfbEOtJpDvABSFYZfJcHKYdXyh8hYxzCi6sSU8p0kWpPC6AZhX4Oa6
b5YlEQqDKUeEI89UAgJhx5VFCZNmFQUhkyd2y9hA2UtRPXH2qqnufDXWHySYRsDe
fgqKQrYa1+KyBMb0pYpRabdrrpPNLkd4VLnWF0C8/dhPnX15HDdHpvRINC4iHcdw
0ymbL8aO3xil8EEO4sIih8YS8AoRTfqrk+tp28e57Ba42aprnNiVsNFWDYXdtOrf
8JhoDzYBYG1G6jiqx/Xd7jN3sj5gJzBhzoSenz3bTPe9S1zLRqW3lCFnaiGms/PJ
U0KL4boX+qKrQXHep+DmfJMXd1nZi1nUrpKycqQc9DtekEg7YYEobrl5SHuatuGS
56FxUEl9xrifgC3I9dlvwyoV7YCruJkgyuYBesv5oZpVzXr5mb0eMT+817TwyJY8
LfgMhCwCjWePBWl8kfweal7YrE1yil1ewxJPraLCuJkTiAw6tnU=
=nDl4
-----END PGP SIGNATURE-----

--xKjuJX1DCffYbtLH--


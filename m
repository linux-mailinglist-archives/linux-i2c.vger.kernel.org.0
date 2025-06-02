Return-Path: <linux-i2c+bounces-11194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB721ACACDA
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 12:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49ADB7ABB40
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 10:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4675020B20A;
	Mon,  2 Jun 2025 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I3RhqkJx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10920B7EE
	for <linux-i2c@vger.kernel.org>; Mon,  2 Jun 2025 10:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861772; cv=none; b=r9jOtJAyPe4/DDajLhuYqq8DnMHnAwA8QM/5M4OYW+CszXSeuaKjSFHicxx1Q7RuZ/cy+V5KCQ9UobGbcXEmXM5k3IfSeeeexZiwUxiip6qZrMrbzMlP1tWZj4Gl8wBt6ET02pBhaSnjiB8Cu322PezocpGANBvGYej1FR97KpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861772; c=relaxed/simple;
	bh=eoBQWGSPhDQ06VuUqOEBFPXva3bXfqRE/b+pxFJqCqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXPf9FWouoV4I+Y8oYcsVec5A+6vAW4WqW84e6H1z17kSWoDSnzABe43y5fZfnRXcuR6pEYBzB5WSyO8fOqVwRSkjrB9SMYxbJ9tdATTqI8VYW8SF/ibeZsE8SR8eRRkYoSWuTj9y0+xTJTmgqOZmTmPQfuYE5CvW87Q8og5lN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I3RhqkJx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eoBQ
	WGSPhDQ06VuUqOEBFPXva3bXfqRE/b+pxFJqCqE=; b=I3RhqkJxv244+yjJGjGx
	yUB4jXh8HqyNAJKGft+mix/dS5WSt+t4595x/mljoLnAwAJWZpLP17XOWx4KkLSU
	T+EeUJ0XdPd3/ky8UkXjvFnX2sZUqIeMknpZVhCGrFOFl+0OXzMR6CIOjKDuPUS1
	ghwnSuOVDdein/hnirkyC9xRpMUH2bUzjwwqw/tpYRDCsSzV7h2y+eIzXn6Pi28I
	ogCBVjEw2O7MnVP+xc4AuVY3C4ldcda4yJ117G41s8spLiUULh/ATrrnDEZ5X78b
	F/ZcM3hEYE969vf1QuHKWJ9rwy97WBeuPUn1NAozygCWVZbuqJ3OdoxG574tVlLJ
	ag==
Received: (qmail 3354705 invoked from network); 2 Jun 2025 12:56:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2025 12:56:07 +0200
X-UD-Smtp-Session: l3s3148p1@ne5mnJQ2WldtKPMO
Date: Mon, 2 Jun 2025 12:56:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/6] i2c: riic: Move generic compatible string to end of
 array
Message-ID: <aD2DRw_2rGgbCv0T@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L2AYAhJurVE6eo9d"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-6-prabhakar.mahadev-lad.rj@bp.renesas.com>


--L2AYAhJurVE6eo9d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 03:31:34PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Reorder the entry in `riic_i2c_dt_ids` to place the generic compatible
> string `renesas,riic-rz` at the end of the array, following the
> convention used in other Renesas drivers.
>=20
> Also, drop the unnecessary comma after the sentinel entry, as it is
> not needed.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # on RZ/A1


--L2AYAhJurVE6eo9d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg9g0YACgkQFA3kzBSg
KbYXOA/+Kzi+tHEzLqkEnDufa82UbjgeQBfaVgTPOEW9q96CswPf/UweqHSQFMcV
Uzobsk7lMyBcupwBUGBeR2jpCxtKwdSG636NHMhZr2gY5Ea1Tz1P6v8E3jpRkgGh
4Q7sps5MUkhy85Nw2OZGSzAl4G/2TQ6y2AvKTDba9h6Jms/AglL+NdzO7/APgiMX
ElkiLJJawwPCNFzDnfj4D2Psow8VqJsLYEcLNoo9870ioa87hS13WlNeOG90PA2w
LA+q56pE3Nl08ruupo2jrTaOL/QfNfKvkOk80o4UJppd6WStQjvpeMKyzN2N9Ggh
tPuQMQFJAU33cgQ1tKvNCYMgxU8QYshnHJ0hr+WffV3skna7CdQQ+op0/YJ6prex
8gFjgZviF/azfOFljtFh+l/jIXgn1CScAYl31UIMnQ4RdK2wvc4+E8YUXCe3TWrB
mmR/9H07mKb/5eoUyzB+BOGtiENyQt00HoqrebZgpeEBEvpZdMSeAAAT9JpkiyYz
/vO7PXOAS/0k3U6EogtHi6HkqOT1aNkcHxD/KmSTBizleTo+1ivMIqwPasTvewmM
Ufi5vym1GJCsXoV6j95L7/G50shbzXyDwmztnz4Z8ONI6d23MoPIKVioh4N3ohzX
+g8pdHsBiJJ60DADerVHddR8r5rRwghFRGA6lsDA5EZqwRDJlUw=
=xy/q
-----END PGP SIGNATURE-----

--L2AYAhJurVE6eo9d--


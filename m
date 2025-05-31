Return-Path: <linux-i2c+bounces-11190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B3DAC9ADD
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 14:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57AF47A4318
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 12:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCFE23AE93;
	Sat, 31 May 2025 12:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DnDqj2mA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4747260A
	for <linux-i2c@vger.kernel.org>; Sat, 31 May 2025 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748693645; cv=none; b=KfojZxwOupyLLBw4rKFX4lmt04azw8pZkET8RZLvGJhQZSnF03BdOq4u6zAG5R/SrUMgOf/l0thHUY3PyPxLJyD9P5Rs9aaUKMbw0Bd5mthrN11oNwPMRt7l4R3+DzvjLHThcfR+ql24WSh9E+mUVxns6kHST6OTkSqI2qIPK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748693645; c=relaxed/simple;
	bh=HMl4PQWBoHWBRHh4XGArGsA8WjQ66lGtWVooYYSem0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZSjUOE1kCXJWQvC0V1gA3qzQ3ce+BAl64vW4RKw/wG42cqD2iZGfKoLWwP/v0ma2ZFTAXKbvLwtgMBuMsRpVEIvAXCsmWcqafG+nXoCIsSGMR3vBhVB0fmsopOUZBMM+hc6x8fYDx5JSf/JdZ75yOKRdNIqW+kvwYih7Y81lps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DnDqj2mA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HMl4
	PQWBoHWBRHh4XGArGsA8WjQ66lGtWVooYYSem0g=; b=DnDqj2mAaP30sduefalv
	xFAkYtCc+fovWh/FETm0ldveHwuu1GukF6Qn/hYuLDbbxhR3Rcc6HMY1kU4jgPL8
	24MLCk8WkMAIHvWJNF0gImsY/rhAyA5J4R6fkQZEOxUKtUZTqSp8FjdwoJcT2Pb/
	U0QDXwt0jAeSwfxToKs5g2c11Hos2IOZr7gCukfgK6X7DE38tY6EopRpMyHxKMbP
	Gr1u/f9P/pEzqu2poOu6Q60UjNKel2PuyyX//DoYURcpitLm7Z9o/n2Q20BWk6vw
	kD4jOw9CulNCE05Vz8AsoQ3VZ9dCxswgQrPeGk0Va4om6yHU8GXcAJ49ACPIiIp9
	mA==
Received: (qmail 2658966 invoked from network); 31 May 2025 14:13:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 May 2025 14:13:59 +0200
X-UD-Smtp-Session: l3s3148p1@6/sid202tGptKPEF
Date: Sat, 31 May 2025 14:13:58 +0200
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
Message-ID: <aDryhlkN0_Vtr9UD@shikoro>
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
	protocol="application/pgp-signature"; boundary="gbll7py7W20t0510"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-6-prabhakar.mahadev-lad.rj@bp.renesas.com>


--gbll7py7W20t0510
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

Well, why not...

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gbll7py7W20t0510
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg68oYACgkQFA3kzBSg
KbZ0bxAAngFf7yBjEOswiyYHqACvRFnoXeXM04KH1W8hzzyhA6H+pgvXeBbwtvaK
CUChYFl/A8t2wkKB80TJQqwh7hSs4Ht8f5OjwovRv+JncN3dpRMx8rJx1Q5JPAFJ
RzIveBEm2PCZkdUholYWvxB/N9Dsn+npaNm5kP8SCwid3lfRdQnLWwIDOMS9xCAr
0yh2ssaqe+pcievadu43HbtM6xoxgfZPJ6acqxTj9qSQNDUJ+euHA1H9v3FkzrGh
sSlKhY+fmBe8zka07LGjHCS2Mg2n4a/ECZEGqn4wJiYA6MC+RCWrzUjttlDt03k7
uh/uyQwikcKweLVivH0KymPeFsYVjEajCnV58D4r6reEzfY+WYaroImqsbE5ENAY
mbIsgt3hd8iV09yu279PsgqBu26GFVQHQPGvhxhA/diqOQMY7zqqrDxQabPL72B7
8zB7I5+E0a9VNHBM9+tFfLov2bCnaFm062AWuXg+wgrXmmoVJ7uUySPD2DL6KoDY
gDl3Ak1oUui83AWJQU6UwMvc+Jz5qeq7J5iR8pTsJNGdVmGlFQVkMOY+74ojTCM6
kIPBKt1YRQqS2TZTsjEL54qpifZcmO7IfkyGTHG+ZJN1kIPlGhLUP7HoMt29LIKJ
ZBUrJoAOd43zSTuTfW7DrsJ7XenRxycraMgW8XKE9FHIUK9P2Wg=
=C8el
-----END PGP SIGNATURE-----

--gbll7py7W20t0510--


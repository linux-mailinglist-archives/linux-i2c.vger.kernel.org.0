Return-Path: <linux-i2c+bounces-10470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95230A92C18
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 22:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D01C1B65E60
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 20:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3265620896A;
	Thu, 17 Apr 2025 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TaqDGEqI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E75207A34
	for <linux-i2c@vger.kernel.org>; Thu, 17 Apr 2025 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744920776; cv=none; b=rhTLfEds22jntuFmRChdfZ7HOXp/Ip5xI2UKeu11mYpCu5Y/Tvo0TPmYcJIiMIh04HO9KMknwzTI4g7N2WhvZueKyRWoKWvjczlKmzNSgMMsEXhhXtQ8itH/MRiOu7y4k/PEmaX0KFn8ckZw6vd7ui8NooDibJ8CD5jkaZZ5JeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744920776; c=relaxed/simple;
	bh=NrKgwSLuCCkgHYTIdhKjDFE2kSuN/3Ykvo+/g2NpNMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq7jJcX8Vvk3NxW7YcMdmarwo4AAbajvH9gE7+jv5qz/RO1PC98Gt3Uo16bD52gAXbVgzlK8xzSZdEzim1l9Rw+/vWA3pRh/jRZfvGj62hStMlsIqvSfkrlXPkuhb2ppft547z5tTDkx8wuXV3eDpxTUgATKLcrQOpRWyg3Cshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TaqDGEqI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nOE+
	3JH3URujgpllp83zvnGNfMGoC0rCPLcVFKW02Cs=; b=TaqDGEqI4qFkr/zdiN04
	xbDJtpq828AtElIKIw3bIe/SpYx656HzsSVvqaTw/5BDWWtm+1SwU5HgpuK6s28A
	PDp+k5E7J/ISsh44PdELYSMdhgkrTr/HfACv3RfrWfUffejaOShOUVKd9fFM+9In
	eeSGgrgbBqiXH9PyCK+H4UpyfvyP74j+RzKGUP3WMZ8auizT7fGhiHZP0bRd/JbK
	ljE4876g9cNOvnpGF7gmhSAGq7xDOFUxF6Nz+LE9nHI3Z66p9qvU14kgDL9XjgEV
	9S/La+hxf6THcCsOb3AEDUJB44g9kT3wFIFTRsjUkfSs3C211xEu3/4ZXvz6250Q
	iQ==
Received: (qmail 1216907 invoked from network); 17 Apr 2025 22:12:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2025 22:12:49 +0200
X-UD-Smtp-Session: l3s3148p1@aXiUBv8ymqUujnsE
Date: Thu, 17 Apr 2025 22:12:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v8] i2c: riic: Implement bus recovery
Message-ID: <aAFgwEB4SdgH-1fQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
References: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aAC8f0dAMERD8GjW@shikoro>
 <CA+V-a8sM2mFS--zLSZt28mOUDuO2FpW0TsaV50A_VxFZ-juP4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="APxw2ApbLQ7Pv4pN"
Content-Disposition: inline
In-Reply-To: <CA+V-a8sM2mFS--zLSZt28mOUDuO2FpW0TsaV50A_VxFZ-juP4Q@mail.gmail.com>


--APxw2ApbLQ7Pv4pN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> As suggested I have the below now, (are there any changes Ive missed?)

Well, get_sda should really only get SDA :)
>=20
> +static int riic_get_sda(struct i2c_adapter *adap)
> +{
> +       struct riic_dev *riic =3D i2c_get_adapdata(adap);
> +
> +       /* Check if the bus is busy or SDA is not high */
> +       if ((riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) ||
> +           !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI))
> +               return -EBUSY;
> +
> +       return 1;
> +}

I have

+static int riic_get_sda(struct i2c_adapter *adap)
+{
+       struct riic_dev *riic =3D i2c_get_adapdata(adap);
+
+       return !!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI);
+}

I believe the BBSY handling could be why it does not work.


--APxw2ApbLQ7Pv4pN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgBYLwACgkQFA3kzBSg
KbaDShAAnLQzb8Wn9NEVDYpMeNpkMFKPYnFFLJ/rrySAk4RWga3scD8v+hyozIPQ
l7N5bg34MPgtWj0J8I93y/ccOgqe8qbociju2WYJbR3IpvNL9kZhZPucelfCLkAx
gL21R5nARWMQA4gk7p3z60zn20OvAeW3S4h4vHiib8EvTqdPPu2mUQ2vYu8Q5AgN
z5Z8pgqu/e+HmkkmznUZHu6KqIxycoLZcPRGnO1qdOPBHDXzpbiE5b5GqKe49Usj
oa5gBoV/rdxE/OAjM6cNoJoQWbxgxo+fhsnVrbyAftsYaysazHQ03vVCdOw3keSH
+FPkZpY89JkPddd2VQhybMMS7d42TWAmSQgwGsS3RouXpud4M4Kkhgrsz/6JAh1l
xFvCwr1uR+guRwXZH97wRED15gW/QrtswstireqX56E+I+IAigxDxday0wQKiY3i
Gwfjaw1y9krvAQqe3GYcFt00JxpJ0ABKI+rqdqc2dQScjLQTYqol3xUNQ7yjLlLL
lxXk5tbxKRquyzLyvSzamRWaErHNWkQJQxrEzbjGAyHs0BBeI+fnPhD/tVbno3PQ
vOYpBDfoi1Xei3Yw1KVhnMQcDgKmgBSUoRa6GsYpGzE19fsx+1B+NcOYgFbhN07S
7T8nPQsnz+uGVf03uLb1PJ1RUIPIOjJKic8mIHx3ocRNy5ZLYXQ=
=WlAs
-----END PGP SIGNATURE-----

--APxw2ApbLQ7Pv4pN--


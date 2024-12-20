Return-Path: <linux-i2c+bounces-8675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457C9F9BD8
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EA3D7A5321
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E06222D5C;
	Fri, 20 Dec 2024 21:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DxQac1d3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5141C54BB
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729705; cv=none; b=a2u6ccHtxTKEsSZGCxxT1aT7wyRoEhg8AUBvakSJrJuCuiuXFY1VbL80RAA/TyfQYYk0mgEQBEz9GGnP8HHRoP/E7VUCJ8IJxdZZuFZWeMGWwA8G77MxqgTbNF6p2IR85uxTF/6F8zwkH0vam5T+ULbkQUieMDK29FjcdTN9J7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729705; c=relaxed/simple;
	bh=P3Nw8URPZEfNrfjTjS71/IWCRGRqTur/PRor35X6TOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZLFkYGY7sWn3ph1hR23G5eqBJ6zJNsY0g/e78XXIF89Tv33aDQjXXWWX80JzOpOMsV4aZc2wa4+h/sq2rAwXjqFz0p+jEBQ51t2t6qJo4T+GAfeZd5ilh77FqZeTn7MrErLBEPWn0T1WMTiF1Xm1q13a6S8rPdi5cGF7tVYOg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DxQac1d3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=P3Nw
	8URPZEfNrfjTjS71/IWCRGRqTur/PRor35X6TOU=; b=DxQac1d390aP3qvIncCX
	27e4JCMBre9zQSSiZ6tbNJlzKl/xyED9XQ+MOkaYMqAhhCia/osOW1+Z9h2fbYhq
	IFo2yvBh1HPK7IU6/Pb6emGBz/EJ2bphSoKNjYsJDHxua5UT+ps84K6FsbBBvohF
	j98/VMr4Pg4dGZ9z/tttZrfNGiqe0/hOa29vZKe3xVaYk/o8BqND6r4yXkwIT5fd
	OFw31Wy+OsJom4sKES45+Gx/AEQlqiXNGr2gwwgfBkvBqC87MheAHrivj34pCj7v
	gkycHeeqb3lHPETTW/1aHirwQ90c7OEM/tvmNV2dtdHdUZr8vyictrIsALyvWWWM
	qA==
Received: (qmail 1127345 invoked from network); 20 Dec 2024 22:21:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:21:41 +0100
X-UD-Smtp-Session: l3s3148p1@oI2fO7opUOcujnsY
Date: Fri, 20 Dec 2024 22:21:40 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/9] i2c: riic: Use GENMASK() macro for bitmask
 definitions
Message-ID: <Z2Xf5NPBi0X-aTZy@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t7cJ3ITwHKEDWXkH"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-5-prabhakar.mahadev-lad.rj@bp.renesas.com>


--t7cJ3ITwHKEDWXkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:16:13AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
> driver to improve readability and maintain consistency.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--t7cJ3ITwHKEDWXkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl3+QACgkQFA3kzBSg
KbavxQ//eSQ/BwHmGcYGIWy5JG7gZMcj2o0MFtOgUeJ22ujpix/Qe8ix3Cy03+sa
mvp2G0hXRf3fkB7yqoafb7QTEchzSrZmQjhdU40Cqt2Or9w0/Qgr/C+1jBHoVDN3
69I1X0UY7ff/tLK8o9nl7JrhIvqL7eCT0mv00umFP0fVkHCZZbwdz21ILPIHkpZj
wg0TYCRu5v6URLFvZEJUMqL8T8lhq8gslto9ztcNHjeGjMkB/msGaAm5ivDm9aRD
Pf2Cz11QAqAZmWhB1LV4dtp85JqUJgULXco8arZ17QlMkcakJcJ+ty/OVtSxdhS6
ttouEO2o4HCKZExK8P6Y1lQX8jmvtFGfNCfkDIZRvHoJ+ATAXJvIz8aYdoBMmQzr
ApSZR05ZWkKRLCJGqLUHd5SQHB+5j2UOB//2yLE45kVt5hu/Tml0lLY+GhxOU/+a
3g2JpDCUMS9wW2T8Wd8eLX3uLXtMMQxrJGeP/qMJbscl6tgv7EQ26L7sjJyBwsYp
GfpKdcW+c+xCeFLQUrfykVQAcaSZm97tedtRfGt1HQHHzJm14HgJODixTnsTpB1+
JQLx85JG6xRWm15Y9AXW0SY1Cm1nQf5A0cHhu3Jg92i+iE2vHyqYsEH4bOd7ZAlM
swII/gMV6vQ/MSOabv4fr1BepQLBBtYLiHWejuIEAGOU5acctNI=
=Mq7U
-----END PGP SIGNATURE-----

--t7cJ3ITwHKEDWXkH--


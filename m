Return-Path: <linux-i2c+bounces-4952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A360C92F5A0
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 08:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E1521F221AF
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 06:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3DF13D52F;
	Fri, 12 Jul 2024 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LhYur7Wu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE581339AB
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 06:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720766345; cv=none; b=QMbwkVAYnrDlzYIwBanA5IqovO2s8g6Rt/uU26r/wBNQ6Uw3EuSkQacLoq8zy3SVNCXLhNDEFRAJrYGNavJ8WaBy933woN3PEG0xtHBRnQUXiO46CbNM2j41vivfigvFlgekuowfxTM+3SRmgQbCa1aiBsQiaEN9CqgNK31H4ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720766345; c=relaxed/simple;
	bh=x488Wtcq5zPYAwkXhwY/JHOLgAwy4F7b2dlUsjXTKz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNW5ziCOYFFB5F9EimMPTGzX8LvEjcHRQd7eAIGlJQbqo00J+mgDZWfRIqCKQni0p5ecRyLmFJewldOngALP/shtmKnlgwo6HSvEt2d5zVf7+HsOo/N55DVL2CugTtZFsGqfYvaoKnFeX7NVt1HEOLvjar81O3Ft5MmmMzuozMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LhYur7Wu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CjDC
	E65YsXhpn+SyY8h01HblEI7JgW+CA8yxXy8DNTo=; b=LhYur7WuPQQy48UDqX7b
	xxN6g/+lC5RMxmCaR5nUFAj/K3q0VRluvBrwnF9RPhcQvuLaVzSqCNJd8jpIMFBu
	YFepy12/fIiP7uqsSl9G6ZKdv/5RG+ooA6BcZtkbTIPlKKsOpiS1Z5aj9qiu4d6H
	QXBr3OZFR3XTAQSfM44dReMFOloEOQWojTyl8Vtf1a6XEdy9rq/CJ3DqOn6K3/8q
	g6zDbFSxA0PoAbRu44XVh2jJ6xL1PN5PtK6bfY1qWXfG6Iu/x8pitPVzMMxhRcXi
	G8hq4XsSsKU1tFQjt17jk73rJSNzFSWrCf28vbkt4MyefYbh6Pf6fiTP1LIanpsV
	Cg==
Received: (qmail 1057127 invoked from network); 12 Jul 2024 08:39:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 08:39:01 +0200
X-UD-Smtp-Session: l3s3148p1@z5GEIgcdUIkgAwDPXwmZAIsFIv4n+Dpm
Date: Fri, 12 Jul 2024 08:39:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: smbus cleanups and SPD support for piix4
Message-ID: <ZpDPhRl8e59kN6u2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Heiner Kallweit <hkallweit1@gmail.com>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
 <sgeavkqhn2i2n7luiervclpibxyaroab5pmcdltmcrxvl5yaeh@ulp3clqgv3ix>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ktbLoUrjmqn8b/j4"
Content-Disposition: inline
In-Reply-To: <sgeavkqhn2i2n7luiervclpibxyaroab5pmcdltmcrxvl5yaeh@ulp3clqgv3ix>


--ktbLoUrjmqn8b/j4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 02:02:11AM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> > Thomas Wei=C3=9Fschuh (2):
> >       i2c: smbus: remove i801 assumptions from SPD probing
>=20
> this is yours...
>=20
> >       i2c: piix4: Register SPDs
>=20
> ... this is mine :-)
>=20
> Do you want me to pick them both up?

I'd  really like to have feedback here from Heiner and/or Jean before we
apply this...


--ktbLoUrjmqn8b/j4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaQz4UACgkQFA3kzBSg
KbZa9A//eC3EseiNBziFShZeZWI2HOdzmuHd6ICI77GzDFTrFNGOVJw2g/jppzY0
zlGStGiPBr0ggUdbMVcdRLkqnVyEim2RcXCMKUUrwWxCyTfj/vZMr/lyFbl16ziF
haJmnEa98ZLvYvs/RJvWLOzeDmYstuDR4yEQvIUOgtpZQI8js6AHhlUBD+9fwE6h
K4et02vKClVWPPp7jGYALCULzeCS7PkQjflXOUh9sNjdCQE/62d1Fa862DecI0cA
PKnk1Agok97Gm7ffD5/FLTpwXJ4FVVe9Gl8v+OPofMzj9c7cYNFhOvERcmaKJKUq
FabMgkKNrEWDuq1lkKXwpuQslh5lefcQnDzDlcSOE/Jxv5QR+9Swl+f1t0Jes+T7
X5dcWn0T+SizS9XAeK4mwGXfin4liCW+oNEMugauEg4hkhZcFtj2LXJ+H8iJWWKl
ONCOm2ytlpqwSJKIdDABkMCWxS62YP2Po0z6RG4Ot2Lljce0P9stk8dgQzygnS0w
5QBLBnLS2iQoYJ5BH8pMwJ8w0xMSnPA+5rXns+7OrqKwALjacfnKP+VL/j+JlD94
sz6W+Ol+5Z77/87YdpKDhi+v9hv6QJGxhv5QWRgZZzDB2aqAfIPISFyC1ib/jO2D
jV5q9P/Czh+Tn+/dFTt+JEU0cOMYffll6Bx4PoU1Hu6uz7I7SmU=
=RIc7
-----END PGP SIGNATURE-----

--ktbLoUrjmqn8b/j4--


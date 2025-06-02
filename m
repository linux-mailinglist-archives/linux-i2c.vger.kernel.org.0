Return-Path: <linux-i2c+bounces-11195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3298BACACDD
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 12:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9FD1960790
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 10:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B9E20A5E1;
	Mon,  2 Jun 2025 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UKirGOvU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A220C488
	for <linux-i2c@vger.kernel.org>; Mon,  2 Jun 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861786; cv=none; b=hWo0kRPNcAcL9Rc/gsFNhrOFKMkflolE5wM4nl9I8OzttiVsoRBeWKgCdLwdojJ1wJ0DH0VlueyIEbL4daaav4p68Tr9JiKXyIPc3l4AQLq9s2TlTyD31sG4nNe5BF31p+DAihrYIqjKieZkqmMErpp8tVeAePA9g8gIXLTYfQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861786; c=relaxed/simple;
	bh=0swPdWXbh3sZ/RC6CHXrgtp2m4M1uxqvIYmkeohPKvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hErNWuatJUA+EITV9Ewc6vn+MZscggpo3jvjjuskVZ2ORbmm7HrLvZ+TNRJLIVrYL+uOS202/t+Xk7zlPxPoAvINQTQfcRXEkJgAVLTN1aWNlUK0GAde1fi+WRCsJAAfd5LQA9cz9ukSCZYkxwSHYjnz5OMOsSdpCkDBXAsy4h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UKirGOvU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0swP
	dWXbh3sZ/RC6CHXrgtp2m4M1uxqvIYmkeohPKvw=; b=UKirGOvUVBKNQWZpkJGB
	vtIOQeok8vS71cWbq5XBpgC7ID+sCUmQpZ2ON0lwIt8szjyJZ/17AHkU6SQI1JOX
	KJ+Xkh6sYSqFBhoKtKlj1/kBupc6e2WU/luLvuSmVSMamQIJoSYuBHVuVOPKk6Kf
	YkzztpRy0ow9haiuLjGjYoBLeVbxalmipv4hqzy9xNW5TxUBboIXXYGZIN5i7p8T
	oVSEaKDi75ovCgliUQ20qe5ox0ugqVTSTTD8a4crlYJsZWdgKIeXFaGoGa3mZGEB
	2giOjNpD5tpifvKFSfDhn1y5zMjpyPdNYn4NmDSJJHD8qqbKH76OCOyVfTxbShci
	8w==
Received: (qmail 3354859 invoked from network); 2 Jun 2025 12:56:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2025 12:56:22 +0200
X-UD-Smtp-Session: l3s3148p1@sk9AnZQ2N1NtKPMO
Date: Mon, 2 Jun 2025 12:56:21 +0200
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
Subject: Re: [PATCH 6/6] i2c: riic: Add support for RZ/T2H SoC
Message-ID: <aD2DVSSPhoe4fb5h@shikoro>
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
 <20250530143135.366417-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="//J3Fvyv9YK2V0Hw"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-7-prabhakar.mahadev-lad.rj@bp.renesas.com>


--//J3Fvyv9YK2V0Hw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 03:31:35PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for the Renesas RZ/T2H (R9A09G077) SoC, which features a
> different interrupt layout for the RIIC controller. Unlike other SoCs
> with individual error interrupts, RZ/T2H uses a combined error interrupt
> (EEI).
>=20
> Introduce a new IRQ descriptor table for RZ/T2H, along with a custom
> ISR (`riic_eei_isr`) to handle STOP and NACK detection from the shared
> interrupt.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # on RZ/A1


--//J3Fvyv9YK2V0Hw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg9g1UACgkQFA3kzBSg
KbYQ2w//RRE275vTazkBT4CUs+j5+/an9Z4KNjvLPHG2f/SoO1loUsPkPa9fGTp5
NbKrUDRSEePjyKgJpPNu/4ODMe91aIjdM7IXSQPKsT5dCwIbewW7xpoGtVb3Gb2r
w5pubanTrdchNiIufQIlzl4fVxRoKORnHa5okir71ZRgcKzEYBk5nIIGJcngkSc3
7XajNl0pHhWkk2rjpIvMqlTOxoevQwYqmpMggqDEit+h5lbF3FH2Y0Tg8w7l0kFZ
blRp/f54LrU71zwyUN84ievqE75flvPVcd9dmA1RjnrUkTvxQyBvCGxhR+5q5Xou
0KaHlzz333NsQeJv6mL5kkAsqt1NcWKu5erV1/GMBWbpvgdKsP48iqfStYo/wTby
OJnPHQao+2tGhWmUb2f62cV7cxs5M8muPN+j3MX8qedFi9thC7GEOP59ipROal2T
oWjj5xKjqgLfkx7wanumxJLOHGClNvgkXwYXgjawyc9a3T2KPPdpgvt+m8MvjytL
8xln3ZHKvfTX47H44cXxNmqyGUv+YJr3HqUDM4Nhkkbt84WUNu5wI0iKnDTFbxIv
ngp7Zm2pfhQ2OFZCNjQpBjx8urK6CvueztrTkxuZZ1m6tOEzmJYecMCW7o4hr1Q/
/lgWsCZ6kN4sE0Mx7h2Ka2GdSzR8eLmiJlHZsgIaGCajlkvpRcQ=
=jeg9
-----END PGP SIGNATURE-----

--//J3Fvyv9YK2V0Hw--


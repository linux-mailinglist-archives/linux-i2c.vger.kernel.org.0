Return-Path: <linux-i2c+bounces-8676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577C9F9BDF
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EE0C16D450
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF032210C0;
	Fri, 20 Dec 2024 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y324Xts4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B221638F
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729835; cv=none; b=nfwzFIREsv6vVSIlaSJHknxxZ8JHGT3CSxQ/6KrLKl04QdgWE78TclrAYQe8AdRHzRD4vJ4sT6XjhjSwUit+xLYJ+MaZ8+Ozuk3hlANVfi9ytN9J+kcLrEoBKjAMIn8FXqRvanDHBCpJmp7SJG4MNG2srOhCo+tkZsZKeAFjyiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729835; c=relaxed/simple;
	bh=JyisjpYviaGFNHAVtO8dv/eepqCem/0PmronZSdhSC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwLDJ2VeeIJYnEVtwblfhozbxRPR5yyKkfoh6/6LTvDAZjJ2GOjHI5yjoxLuoiwWvqcBEKQUgs2mqQnQ/+oVa9FfPHzMDbqvDi5Py96gZ4oE0MPsj9T2166Jz4Nd2+rTaOk8p3o7+Rfk4qiE9UTHUXCWALmtPfTXon6k3SGHL0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y324Xts4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Jyis
	jpYviaGFNHAVtO8dv/eepqCem/0PmronZSdhSC8=; b=Y324Xts4zUNl9rDtrIlh
	/b7JhZjKnNKNpAUQqqILQRFPNtd2ceO9obVd27xRofxCiE5xL3dcgXrXv70YvTM/
	XkHzRoXSsaqPLBH3GpfPLIoe5O6r6r9jSQiaH9zzNezvepoPBo/xIRxIBsFQncDm
	EqB/jUWwGOHMomaeNIP+MEAA4ntJ+SxwfrPioWmFUcvLwlr2hoGpL6CTD9SuMUda
	gqtz5lv0KBQjd44ejvc0/5IOFVt7Mj8uTcWrX9hM9PyL8MPkP0Q/zTAzEPZ856/b
	1H9t1L6xbDcF7F1/1Ml7kNIMmZ/KquwoXSkSUr8Sl0h62/f4m6MQXxGw3mo7BA05
	7Q==
Received: (qmail 1127853 invoked from network); 20 Dec 2024 22:23:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:23:51 +0100
X-UD-Smtp-Session: l3s3148p1@rFNgQ7optpAujnsY
Date: Fri, 20 Dec 2024 22:23:50 +0100
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
Subject: Re: [PATCH v2 7/9] i2c: riic: Use predefined macro and simplify
 clock tick calculation
Message-ID: <Z2XgZiGAxFskkDfS@ninjato>
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
 <20241218001618.488946-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UZjxDlTROVlOwICj"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-8-prabhakar.mahadev-lad.rj@bp.renesas.com>


--UZjxDlTROVlOwICj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:16:16AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Replace the hardcoded `1000000000` with the predefined `NANO` macro for
> clarity. Simplify the code by introducing a `ns_per_tick` variable to
> store `NANO / rate`, reducing redundancy and improving readability.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yay, way better readable!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--UZjxDlTROVlOwICj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl4GYACgkQFA3kzBSg
KbaCWA/+JwsuM31bbbBz3bXH0PCKdzipDX/ux2BZ3Fg5etn58k7Bo+TtqYZyG19E
AuMRUjzD71TDPkztFkvnTrLZ1fG8/MTLBXUYu4aYnsIkFXJeT2lrqghE8DVEP9pM
Yu7+Nfua3peQAfYvij3paG8hRDTqSUApwwY9SmN3sDGUc5Uxep1yyViGnhLF6rHp
3fvf5O5MuGXX/izuMEGdi7fcxmZPB6WakoEgi2m77Ze/xijwIwMmTAtLNbTJxY8x
2PU3gErVU2IrSuc9UEyJMbvcmioHfubl+a0/s9kVhtG5GQNujKHHkDoB9VnjFoBU
60aujcbX9yCqbhn9loSEV+vVW04fCUkSjElx0eDOw/J9zpYoBTXSgJaPEoIFEjzq
BLF1jNRcpBYW36lIu1KuuQvnVD0fbxEk4/F2/dP9twiJR5qsm1WE/rkt04+zK9PY
kKC1csP/ozOFj2aqHIODUqvhVvJcHespmaznuTnjMNigAml05wisW4pAJ2TGlbgm
CuaTCjdtC7ynqg2VHexRMATjXsN8fbvMVpTC/tofSukkriiohzFFpCvhQeE8/NJL
wfbb36pOUTvahfcvUzL3vQ+LdnCSLVEwlkWTpzvmCxQ2lh3vRyLXio31tNSponGA
r237C231ZyLTTvlclkTtsY1EndHxA0VWCl/KdLInli+HZ8kCpdE=
=EyTd
-----END PGP SIGNATURE-----

--UZjxDlTROVlOwICj--


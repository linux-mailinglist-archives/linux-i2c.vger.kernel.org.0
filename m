Return-Path: <linux-i2c+bounces-8670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97979F9BC9
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 860DD7A4610
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD6A218E87;
	Fri, 20 Dec 2024 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EVFnpgOk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897F21638F
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729419; cv=none; b=gmTMiBg9/f1bv8/Q/uaH6B9yu6hmBTUFTqB1jRrXe2P90ay8/TmdpT/i8huQZSstrRKn1URmnhT6NXF4LQNQsvaTiTLytZi43ifDd897yC/6IUHyxpIqOjek3DZ5Qb01tvitqdFEehXuWPHMilhqhVaXvRyP2UTWFxdq1VqGo38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729419; c=relaxed/simple;
	bh=Vid58NU2njrfukl130EA9dTBH9ZqjN7eXA8tKTpvwY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKhpv2yI52AGIKNR8hHIe5nxLYgClZ+7j9sGokYeoGDc1d86Amti24TRLbp+nNwqdTVk5NMUzVYZj9kUyhWRAAVDelqYfiFxmeFv6VUtxVGdEGMeEFbi4KFK4VY5nZMDzeOW3UXgEB9wmlEg5ch6d+yKcfR2+xPZRpyrlPV83bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EVFnpgOk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Vid5
	8NU2njrfukl130EA9dTBH9ZqjN7eXA8tKTpvwY8=; b=EVFnpgOk6WyaCDS9839p
	hGWCKzNmznBpl/2o9j42ebXCpuTzLOPVW90SmZ5r0favO3ys4GaqSFMOEVkK0DXD
	TNT0yN4w43BG2ACbmuZwvTsOkIntgnkPAS0+04n2Nxtgp7nZEOlTBaDxfjbyOrNN
	hPU0MC5+F1E8BNRLHT+pzniGrMJomEnTO9ohlVF7kmctQJLOpomciFrsZEiV8PoR
	M+tW8cZGrls7fkB+wINdBxBxNAloY8AcBeRLmUf8rFojlIdKbypyJIS15u3jal/k
	VyM4d7IYcVqj8PO5BmSRUMsazwD/Kv504r100raItO1mXt1JlLvh8Cm+yVDhF9tb
	0Q==
Received: (qmail 1126032 invoked from network); 20 Dec 2024 22:16:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:16:51 +0100
X-UD-Smtp-Session: l3s3148p1@NzZUKropKrcujnsY
Date: Fri, 20 Dec 2024 22:16:50 +0100
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
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
Message-ID: <Z2XewglpALJFE1Ay@ninjato>
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
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u5ntdgLkrflbBeEz"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>


--u5ntdgLkrflbBeEz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:16:18AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Implement bus recovery by reinitializing the hardware to reset the bus
> state and generating 9 clock cycles (and a stop condition) to release
> the SDA line.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I need to ask a high level question first: why don't you use the general
scl_recovery algorithm? We have stuff like get/set_scl/sda as well as
(un)prepare_recovery. Won't that do?


--u5ntdgLkrflbBeEz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl3r0ACgkQFA3kzBSg
KbYu6A/7BIOf+SLO3Ke5uN20u+PHRlZ9Nn6TDPPwiXjl1LqfTjjK9V5EGTAnS8Cs
e2x9GFq8V3gbgHqyLm474v9TiUAxZm/TktJ5cPDdMO6BMunYDS4pswUinwD7frZQ
/dN+rzBz/sebi6IQJfReC25yM65BXkain6ZMQsS9m0ghE1CtrbJcVwHNdSXGNfUg
JrVSXeGEyK/LYpCjj2edaUidxa1FKL/1sPnt0XMjprrOTt+RDLTn2NaPB0FGERBq
M2J4JMu/ksaUHUZb9trTkUi3bQbmgS+K9bDUTGUXwIWmET+AgEEsAV3DTB52M3DB
nKLvku47FwtTOgOY3+SLV8xAsS7TqtfZriAIYuJBYSaLhd1q0HSnui4DFZrI5GHd
80lWmdEWpWRiecL2q037d5nmWnXbMFtYBJjtU5sAmFiEX9uSgPSA9xPciQhLTJc5
Sc/pHJG3u433PcBvO9Pmkmoq05t4q8MH/uewKE8MTuYxbKMxtMawDqA4LzzpwcUs
QHCyzJErJ8hqHcd1uAR9FzbrQMUU12u3f91k1y2tifGXh7V3RJoKpj8pKQis5Ntd
v0pFsx5Mm5+ttwzpu3kK56HJ2wewRNy/DnM62TKTCLFIt/nMWt+Zl2yFfhPSE2sB
WN0BomuLlazqJGhGemk7JxoNPHCKtMtdQja3weXHaeQZkWrrPOM=
=IQSi
-----END PGP SIGNATURE-----

--u5ntdgLkrflbBeEz--


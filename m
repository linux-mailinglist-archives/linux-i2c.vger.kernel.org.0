Return-Path: <linux-i2c+bounces-5219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B19C94C07F
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 17:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AED01C26406
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 15:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5965018F2F9;
	Thu,  8 Aug 2024 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KdzYmQmX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80318F2EA
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723129409; cv=none; b=BeauwUg5U+7WmG7kojKhfZ3FeZtrWZnFdW5Pkr3OQRCq6/g6JVQHvjs2q4AdiDsfzsDUokkMeknvv1SwoXdVfIT7IiGioGvcNaEn4LlOUo+eOF0TzuS6P7YlLA6qD3uI+Xtj9dahbmk5EVRI3IJQ6aP6lKVCnLNrvE0oAKIWbpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723129409; c=relaxed/simple;
	bh=SjSVxSPNg6gXfPmUVWJ2ez++3fToLx6+T2ZqUhkJgcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4ddiYBPtNW+F0Et5GdcCHJZAyik5pMp+HXlN00RBmhix8stKyAJzfSdCWC1aEO8O1eJvv8JNn4Q9lsgF1zf769CM5dQcdL3smzqxd9fLd2qC5uuZps6sjORFird6wdeJ2hKTlb4PJwwrw413qfJ1PYmcynvXtctzWpyuq4FlI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KdzYmQmX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SjSV
	xSPNg6gXfPmUVWJ2ez++3fToLx6+T2ZqUhkJgcM=; b=KdzYmQmXIWO0oNTwnjtf
	4EOtDdu7Sap9Jrru5WX3t5SAjEnF7/32Tntx5GsafLQTIHmQqcD3YE8gW+5redjH
	Lr2ivMAgQ9xikxfgSlQK+/beaOih7oAi/VeFcnVrMHETqJpQmwmz0GNQLOmxVGlG
	mE9wi6ynhqNW1VMt7IWHwZusrFrnsiOcgL251gv4QJad0GupRfFYubHPw3di4mGc
	/QNZpc6L58rQVlHZi655BE0CyCICtuQz0MPRFFP6nl/YP6yMgebbPyUH9Oc9qJGZ
	dZiB6LrJodpMGWfm/Ky3VyyrhKdbDACoEwqdbQV19xTTbvvFGzyr6fXV/cd34iKP
	yA==
Received: (qmail 350361 invoked from network); 8 Aug 2024 17:03:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 17:03:25 +0200
X-UD-Smtp-Session: l3s3148p1@DsoSVC0f+jxtKPBr
Date: Thu, 8 Aug 2024 17:03:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 03/11] i2c: riic: Use pm_runtime_resume_and_get()
Message-ID: <ZrTePJJcSssmXXa4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-4-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fBpy1sTNjYN8/eu3"
Content-Disposition: inline
In-Reply-To: <20240711115207.2843133-4-claudiu.beznea.uj@bp.renesas.com>


--fBpy1sTNjYN8/eu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 02:51:59PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> pm_runtime_get_sync() may return with error. In case it returns with error
> dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get=
()
> takes care of this. Thus use it.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Looks valid to me:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--fBpy1sTNjYN8/eu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma03jwACgkQFA3kzBSg
Kbb7sBAApOqY2362ZnU4mqDeiCP1kirXKGvmin/lCOag+1z82+2HEioZXSeE9bIu
9H3wQDU8ua7xuQSfVGC9Wa9X2W7LuKmp0rKGicDcxbv95BkGfKgX5NglygXoyJQ2
92z4eSLQL2fiD5oNq733FveEQu4ygrwyYCe1CA0yeVEwvE1WpxPsr+xnShAZz5xb
bnCVqFMfSaAQzmUrC2uwpHc6owbD5EX7j4hJOvMJlcVn6Y4eAuTYlPhVTGRmwPSp
unfHMAHXbQ/0QnMob8n2ut54rh+IhkxVdlJmPai5qjkN8L2MUOo3c1kvIZrDBwlS
kFN8uyX0AtRAAAlVQr5XyvV1z2qpviflbp5xsrPXdU+qVeoMnHZarpZKrdJRfvVU
8tkVvsYkplyv5wQL004N24eoB+fbgdC28FXmgfoTZF4eEjH9KejGm1sHr/EtpuEC
OEM2khcb4BDnK497yPtXjrL2WZLHGFOo1UjRHRL51TFaz9kuxZ4xlk5SUJMODO01
bt+bCMbkoC2jDoL04YGaM4Ik4pN7iC5TmvqqvIuNV5Nu4I3qxMPPdNqv4wtQARdQ
4phfJEYzNYEonAyRnq+mtg40BO7BX9GObXh5Ps+DlA7BCJn3SDnlIn+2DBEqZIIR
b9NRRFlnQvsEhGSlkPGTIbXOcYbOLDXD9+ZGX1ayL+eQooaji7M=
=CXZK
-----END PGP SIGNATURE-----

--fBpy1sTNjYN8/eu3--


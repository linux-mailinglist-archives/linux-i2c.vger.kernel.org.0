Return-Path: <linux-i2c+bounces-5790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D06BF95ECCE
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 11:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EFD21C21758
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 09:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A95213DDB6;
	Mon, 26 Aug 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IO4jZL2f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEAC13AD22
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 09:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663544; cv=none; b=SDjurbRh001FCbRyfrf3hBKMURu9epaQgsLYfDo4KVuv8DD3Tknhh1VmahH0/JHMsjs97dGG9wIkyM/t3EVrQH1d1eQi9iiX+PCxEP23C8R56CqUAArPE6wi03KlURpVHW3A9NTMtR3lestv8nqFOlnCgGNR1JLjM7P1CmIYF90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663544; c=relaxed/simple;
	bh=N/qDni5Xn3M9bMzbPruKh54SksQXwxZQa5JjdJAfnPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqHb+2V2YqAVGkAV5RvyciOz2R2ngV2V4qXlVrfGgY/ilrWWkY8XBEjYV0t33wGmi2DYnaf8mE+rCXU/TB4x6/uA2O3alwpR5b6kFxYiYh/DhIp0f3qswxv1EwdX5mYlMKciMLTgtXX1/i8XjRoqZB/K+53nAff8JKt4ccDwjIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IO4jZL2f; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=N/qD
	ni5Xn3M9bMzbPruKh54SksQXwxZQa5JjdJAfnPo=; b=IO4jZL2fVAIDA36Wp1hM
	aCu/9XuCS5E+/JHF6Tu8VHtYfIg4N9m2L02QEwTir4VFBoK89nuVLkM+6wrSYAgd
	JhsqBf2mTtl4/7FHvz/dhsWTg+CrdiBqK2eyEPgmDrNgijzElSLDVGsWgt02dT5N
	zzRe9+yg0x9PRijUl6NSaATkMB/zFDgp246gS465RqfUPH5/16AiVyMwuSYGCNfE
	dGbRTZIPGTuuaGjzjScokkaNwKgEBSl15F45ZWfAMR4qFtqUm+wWp68W8kumGURL
	YW4VHkQjvChS5SMqGvl/dZieMM0UVndvmMh22UdpkgCtONpybSYVW+Lw3R45ps89
	jA==
Received: (qmail 1932606 invoked from network); 26 Aug 2024 11:12:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 11:12:16 +0200
X-UD-Smtp-Session: l3s3148p1@eJN0hZIgCNtehhrU
Date: Mon, 26 Aug 2024 11:12:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Simplify unsupported bus speed handling
Message-ID: <ZsxG8GBMSWjc9VU1@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <dc6b10a56be9c90f580c50c55d829766fe2956a7.1724337807.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ckD8gVbLDARe3TpI"
Content-Disposition: inline
In-Reply-To: <dc6b10a56be9c90f580c50c55d829766fe2956a7.1724337807.git.geert+renesas@glider.be>


--ckD8gVbLDARe3TpI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 04:45:54PM +0200, Geert Uytterhoeven wrote:
> Simplify checking for unsupported bus speeds and reporting errors by
> factoring out the calculation of the maximum bus speed, and by using the
> dev_err_probe() helper.
>=20
> While at it, use "%u" for u32, and improve the error message.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Nice!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ckD8gVbLDARe3TpI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbMRvAACgkQFA3kzBSg
KbacDA/+KtUGcIp1GFRWEOHk5DuZ2CVr53GdRCVTNaI4Mfb4JTdu+78SrC4gj+jt
gxsZQ891siy2PH/A6alWepN1jfmOszQvPXmVzKUEf5QMdx5uWXpuOgtXi1DkjLiH
1GZClc4P3Y5A2MsbJyVTEQanXsTqgf6g0eezfHbDarMEjdkv6x4I1O84obyVE4d+
ytYP+UESx9dgMQTRCt2A1FCYXK4e0G8Kz/23W9cOc716Is/MkfSNMVUng5Nw04Bq
AswxdB/XAABN+4rU1g1EIbXTLnBnug7nhShdiuVTbbovDoBhn+Te5Xd6gwPs3ZOp
Is+fE237JAYobJzxMxJeLoBCg1yInCXi0geTj1i3L+KNfsQ4ZWcBxFLYPpJkIK6P
xNc5ydvakSu/jsdSKZ+ObLtFPPpf4frUiFAhs/YlF0KzKTKiZUXOmqdEitzvqCMn
R9XeBh3/bLZ5xvNc80/TZN1s+Cx17e9maAxUShhQ1m2JRBRgUwXGb0hcAc7BloCn
c+9/8hBJpUq+6GZW5LT5MHUggtLV3vvKGEBXYJX2Bs4pUcXRFDMshAjker5oAmg7
t3eayOPF4Y0jUPtO+BUGTkPjfvboFDp6sg9LcEZhvAf486I8mT6X7/Hr5mcgBRhd
8zKa+0zWDSWFoL6vKXj30ZbM3MpMWwzjESvFoygNfA20hFRh1oc=
=lQI+
-----END PGP SIGNATURE-----

--ckD8gVbLDARe3TpI--

